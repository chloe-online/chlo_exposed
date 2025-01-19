<script>
  import { onMount } from "svelte";
  import Calendar from "./Calendar.svelte";
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber, parseDiaryEntries } from "./utils.js";
  import Entry from "./Entry.svelte"; // Import the Entry component

  let entries = []; // Initialize entries as empty array
  let loading = true; // Add loading state
  let scrollDelta = 0; // Accumulate scroll delta
  const SCROLL_THRESHOLD = 200; // Define a threshold for scroll

  onMount(async () => {
    try {
      const diaryText = await fetch("/InjectionDiary.txt").then((r) =>
        r.text()
      );
      entries = await parseDiaryEntries(diaryText);

      // Sort entries in descending order (newest first)
      entries.sort((a, b) => b.date - a.date);

      // Set the initial selected week to the latest entry's week
      if (entries.length > 0) {
        const latestEntry = entries[0]; // Now the first entry is the latest
        const week = getWeekNumber(latestEntry.date);
        selectedWeek.set({
          week: week,
          year: latestEntry.date.getFullYear(),
        });
      }
    } finally {
      loading = false;
    }
  });

  function incrementDate() {}

  function handleKeyDown(event) {
    if (!$selectedWeek) return;

    let { week, year } = $selectedWeek;

    if (event.key === "ArrowUp") {
      if (
        !(
          year === entries[0].date.getFullYear() &&
          week === getWeekNumber(entries[0].date)
        )
      ) {
        week += 1;
        if (week > 52) {
          week = 1;
          year += 1;
        }
      }
    } else if (event.key === "ArrowDown") {
      if (
        !(
          year === entries[entries.length - 1].date.getFullYear() &&
          week === getWeekNumber(entries[entries.length - 1].date)
        )
      ) {
        week -= 1;
        if (week < 1) {
          week = 52;
          year -= 1;
        }
      }
    }

    selectedWeek.set({ year, week });
  }

  function handleScroll(event) {
    if (!$selectedWeek) return;

    scrollDelta += event.deltaY;

    if (Math.abs(scrollDelta) >= SCROLL_THRESHOLD) {
      let { week, year } = $selectedWeek;

      if (scrollDelta < 0) {
        // Scrolling up
        if (
          !(
            year === entries[0].date.getFullYear() &&
            week === getWeekNumber(entries[0].date)
          )
        ) {
          week += 1;
          if (week > 52) {
            week = 1;
            year += 1;
          }
          scrollDelta = 0; // Only reset when actually changing weeks
        }
      } else if (scrollDelta > 0) {
        // Scrolling down
        if (
          !(
            year === entries[entries.length - 1].date.getFullYear() &&
            week === getWeekNumber(entries[entries.length - 1].date)
          )
        ) {
          week -= 1;
          if (week < 1) {
            week = 52;
            year -= 1;
          }
          scrollDelta = 0; // Only reset when actually changing weeks
        }
      }

      selectedWeek.set({ year, week });
    }
  }

  $: transformValue = (entry) => {
    let scrollAmount = -(scrollDelta / SCROLL_THRESHOLD) * 20;

    // Check if we're at boundaries
    const isAtFirst =
      $selectedWeek.year === entries[0].date.getFullYear() &&
      $selectedWeek.week === getWeekNumber(entries[0].date);
    const isAtLast =
      $selectedWeek.year === entries[entries.length - 1].date.getFullYear() &&
      $selectedWeek.week === getWeekNumber(entries[entries.length - 1].date);

    // Apply exponential dampening at boundaries
    if (isAtFirst && scrollDelta < 0) {
      scrollAmount = -(Math.abs(scrollDelta / SCROLL_THRESHOLD) ** 0.5) * 10;
    } else if (isAtLast && scrollDelta > 0) {
      scrollAmount = Math.abs(scrollDelta / SCROLL_THRESHOLD) ** 0.5 * 10;
    }

    return `translateY(${scrollAmount}px)`;
  };

  // Add wheel end detection
  let wheelTimeout;
  function handleWheel(event) {
    // Clear existing timeout
    clearTimeout(wheelTimeout);

    handleScroll(event);

    // Set new timeout
    wheelTimeout = setTimeout(() => {
      scrollDelta = 0; // Reset scroll delta when wheel stops
    }, 100); // Reduced from 150ms to 100ms
  }

  onMount(() => {
    window.addEventListener("keydown", handleKeyDown);
    return () => {
      window.removeEventListener("keydown", handleKeyDown);
      clearTimeout(wheelTimeout);
    };
  });

  $: filteredEntries = $selectedWeek
    ? entries.filter((entry) => {
        const entryWeek = getWeekNumber(entry.date);
        const entryYear = entry.date.getFullYear();
        return (
          entryWeek === $selectedWeek.week && entryYear === $selectedWeek.year
        );
      })
    : entries;
</script>

<main>
  <!-- <div class="sidebar"></div> -->
  <div class="calendar-container">
    {#if loading}
      <p>Loading calendars...</p>
    {:else}
      {#each [2025, 2024, 2023] as year}
        <Calendar id={`cal${year}`} {year} {entries} />
      {/each}
    {/if}
  </div>

  <div class="content">
    <div class="entry-container" on:wheel={handleWheel}>
      {#each filteredEntries as entry}
        <Entry
          date={entry.date}
          site={entry.site}
          comment={entry.comment}
          {transformValue}
        />
      {/each}
    </div>
  </div>
</main>

<style>
  :global(:root) {
    --bg-color: #ffffff;
    --text-color: #333333;
    --accent-color: #333333;
    --square-color: #a89996;
    --selected-color: white;
  }

  @media (prefers-color-scheme: dark) {
    :global(:root) {
      --bg-color: #111111;
      --text-color: #ffffff;
      --square-color: #f0f0f0;
      --accent-color: #333333;
      --selected-color: #ff3e00;
    }
  }

  main {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 100vh;
    margin: 0;
    padding: 0;
    background-color: var(--bg-color);
    color: var(--text-color);
    overflow: hidden;
  }

  .sidebar {
    flex-shrink: 0;
    width: 200px;
    padding: 1em;
    display: flex;
    flex-direction: column;
    align-items: center;
    border-left: 1px solid #333;
  }

  .calendar-container {
    flex: 0 0 auto;
    display: flex;
    justify-content: flex-start;
    flex-direction: column;
    padding: 1em;
    padding-top: 3em;
    overflow: hidden;
    border-right: 1px solid #333;
  }

  .content {
    flex: 1;
    padding: 2em;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    width: 100%;
    min-height: 100%;
    position: relative;
  }

  .entry-container {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    overflow: hidden;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    padding-top: 2em;
  }
</style>
