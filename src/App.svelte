<script>
  import { onMount } from "svelte";
  import Calendar from "./Calendar.svelte";
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber, parseDiaryEntries } from "./utils.js";
  import Entry from "./Entry.svelte"; // Import the Entry component
  import { fade } from "svelte/transition";

  let entries = []; // Initialize entries as empty array
  let loading = true; // Add loading state
  let scrollDelta = 0; // Accumulate scroll delta
  const SCROLL_THRESHOLD = 200; // Define a threshold for scroll
  let isScrolling = false;
  let lastChangeWasScroll = false;
  let wheelTimeout;

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
    if (!$selectedWeek || entries.length === 0) return;

    let { week, year } = $selectedWeek;

    // Determine the first and last weeks in the entries
    const firstEntry = entries[entries.length - 1];
    const lastEntry = entries[0];
    const firstWeek = getWeekNumber(firstEntry.date);
    const firstYear = firstEntry.date.getFullYear();
    const lastWeek = getWeekNumber(lastEntry.date);
    const lastYear = lastEntry.date.getFullYear();

    if (event.key === "ArrowUp") {
      do {
        week += 1;
        if (week > 52) {
          week = 1;
          year += 1;
        }
        // Stop if we reach the last available week
        if (year > lastYear || (year === lastYear && week > lastWeek)) {
          return;
        }
      } while (
        !entries.some((entry) => {
          const entryWeek = getWeekNumber(entry.date);
          const entryYear = entry.date.getFullYear();
          return entryWeek === week && entryYear === year;
        })
      );
    } else if (event.key === "ArrowDown") {
      do {
        week -= 1;
        if (week < 1) {
          week = 52;
          year -= 1;
        }
        // Stop if we reach the first available week
        if (year < firstYear || (year === firstYear && week < firstWeek)) {
          return;
        }
      } while (
        !entries.some((entry) => {
          const entryWeek = getWeekNumber(entry.date);
          const entryYear = entry.date.getFullYear();
          return entryWeek === week && entryYear === year;
        })
      );
    }

    selectedWeek.set({ year, week });
  }

  function handleScroll(event) {
    if (!$selectedWeek || entries.length === 0) return;

    scrollDelta += event.deltaY;

    // Determine the first and last weeks in the entries
    const firstEntry = entries[entries.length - 1];
    const lastEntry = entries[0];
    const firstWeek = getWeekNumber(firstEntry.date);
    const firstYear = firstEntry.date.getFullYear();
    const lastWeek = getWeekNumber(lastEntry.date);
    const lastYear = lastEntry.date.getFullYear();

    if (Math.abs(scrollDelta) >= SCROLL_THRESHOLD) {
      let { week, year } = $selectedWeek;

      if (scrollDelta < 0) {
        // Scrolling up
        do {
          week += 1;
          if (week > 52) {
            week = 1;
            year += 1;
          }
          // Stop if we reach the last available week
          if (year > lastYear || (year === lastYear && week > lastWeek)) {
            scrollDelta = 0;
            return;
          }
        } while (
          !entries.some((entry) => {
            const entryWeek = getWeekNumber(entry.date);
            const entryYear = entry.date.getFullYear();
            return entryWeek === week && entryYear === year;
          })
        );
        scrollDelta = 0; // Only reset when actually changing weeks
      } else if (scrollDelta > 0) {
        // Scrolling down
        do {
          week -= 1;
          if (week < 1) {
            week = 52;
            year -= 1;
          }
          // Stop if we reach the first available week
          if (year < firstYear || (year === firstYear && week < firstWeek)) {
            scrollDelta = 0;
            return;
          }
        } while (
          !entries.some((entry) => {
            const entryWeek = getWeekNumber(entry.date);
            const entryYear = entry.date.getFullYear();
            return entryWeek === week && entryYear === year;
          })
        );
        scrollDelta = 0; // Only reset when actually changing weeks
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

  function handleWheel(event) {
    isScrolling = true;
    lastChangeWasScroll = true;
    clearTimeout(wheelTimeout);

    handleScroll(event);

    wheelTimeout = setTimeout(() => {
      scrollDelta = 0;
      isScrolling = false;
      lastChangeWasScroll = false;
    }, 100);
  }

  function handleCalendarClick() {
    lastChangeWasScroll = false;
    isScrolling = false;
    clearTimeout(wheelTimeout);
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
  <div class="container">
    <div class="calendar-container">
      {#if loading}
        <p>Loading calendars...</p>
      {:else}
        {#each [2025, 2024, 2023] as year}
          <Calendar
            id={`cal${year}`}
            {year}
            {entries}
            on:click={handleCalendarClick}
          />
        {/each}
      {/if}
    </div>

    <div class="content">
      <div class="entry-container" on:wheel={handleWheel}>
        {#each filteredEntries as entry (entry.date.getTime())}
          <div class:no-transition={isScrolling}>
            {#if !lastChangeWasScroll}
              <div in:fade={{ duration: 300 }}>
                <Entry
                  date={entry.date}
                  site={entry.site}
                  comment={entry.comment}
                  {transformValue}
                />
              </div>
            {:else}
              <Entry
                date={entry.date}
                site={entry.site}
                comment={entry.comment}
                {transformValue}
              />
            {/if}
          </div>
        {/each}
      </div>
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

  html,
  body {
    overflow: hidden;
    height: 100%;
    margin: 0;
    padding: 0;
  }

  main {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    width: 100%;
    height: 100vh;
    margin: 0;
    padding: 0;
    background-color: var(--bg-color);
    color: var(--text-color);
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  .container {
    display: flex;
    flex-direction: row;
    width: 100%;
    max-width: 1200px;
    height: 100vh;
    gap: 4em;
    padding: 0 2em;
    margin: 0 auto;
    justify-content: center;
  }

  .calendar-container {
    flex: 0 0 auto;
    display: flex;
    justify-content: flex-start;
    flex-direction: column;
    padding: 1em;
    padding-top: calc(33vh + 1em); /* Reduced from 3em to 1em */
    overflow: hidden;
    border-right: 1px solid #333;
    transition: padding-top 0.3s ease-in-out;
  }

  .content {
    flex: 1;
    padding: 2em;
    padding-top: 33vh;
    display: flex;
    flex-direction: column;
    min-height: 100%;
    position: relative;
    max-width: 700px;
    margin: 0 auto;
    transition: padding-top 0.3s ease-in-out;
  }

  .entry-container {
    position: absolute;
    top: 33vh;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    padding-top: 2em;
    transition: top 0.3s ease-in-out;
    overflow-y: auto; /* Allow vertical scrolling if needed */
  }

  @media (max-width: 1200px) {
    .container {
      max-width: none;
      gap: 2em;
      padding: 0;
      justify-content: flex-start;
    }

    .calendar-container {
      padding-top: 3em; /* Keep the original padding for small screens */
    }

    .content {
      padding-top: 2em; /* Reset padding on smaller screens */
      margin: 0;
    }

    .entry-container {
      top: 0;
    }
  }

  .entry-container > div {
    width: 100%;
  }

  .no-transition {
    transition: none !important;
  }
</style>
