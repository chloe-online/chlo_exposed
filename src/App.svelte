<script lang="ts">
  import { onMount } from "svelte";
  import Calendar from "./Calendar.svelte";
  import { selectedWeek, isCalendarVisible } from "./stores.ts";
  import { getWeekNumber, parseDiaryEntries } from "./utils.ts";
  import Entry from "./Entry.svelte"; // Import the Entry component
  import { fade } from "svelte/transition";
  import type { Entry } from "./Entry.svelte";
  import About from "./About.svelte";
  import { showAbout } from "./stores.ts";

  function handleAboutClick() {
    $showAbout = true;
    $isCalendarVisible = false;
  }

  function closeAbout() {
    $showAbout = false;
  }

  let entries: Entry[] = []; // Initialize entries as empty array
  let loading = true; // Add loading state
  let scrollDelta = 0; // Accumulate scroll delta
  const SCROLL_THRESHOLD = 400; // Define a threshold for scroll
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
      $showAbout = false;
      do {
        week += 1;
        if (week > 52) {
          week = 1;
          year += 1;
        }
        // Stop if we're at the last available week
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
      $showAbout = false;
      do {
        week -= 1;
        if (week < 1) {
          week = 52;
          year -= 1;
        }
        // Stop if we're at the first available week
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

  function handleSwipe(event) {
    const touch = event.changedTouches[0];
    const swipeDistance = touch.clientX - touchStartX;

    if (swipeDistance < -50) {
      // Swipe left
      $isCalendarVisible = false;
    } else if (swipeDistance > 50) {
      // Swipe right
      $isCalendarVisible = true;
    }
  }

  let touchStartX = 0;

  function handleTouchStart(event) {
    touchStartX = event.touches[0].clientX;
  }

  onMount(() => {
    const container = document.querySelector(".container");
    container.addEventListener("touchstart", handleTouchStart);
    container.addEventListener("touchend", handleSwipe);

    return () => {
      container.removeEventListener("touchstart", handleTouchStart);
      container.removeEventListener("touchend", handleSwipe);
    };
  });
</script>

<main>
  <div class="container">
    <div class="calendar-container {$isCalendarVisible ? 'visible' : 'hidden'}">
      <button class="about-button" on:click={handleAboutClick}>About</button>
      {#if !loading}
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

    <div class="content {$isCalendarVisible ? 'hidden' : 'visible'}">
      {#if $showAbout}
        <div class="about-container">
          <About />
        </div>
      {:else}
        <div class="entry-container">
          {#each filteredEntries as entry (entry.date.getTime())}
            <div class:no-transition={isScrolling}>
              {#if !lastChangeWasScroll}
                <div in:fade={{ duration: 300 }}>
                  <Entry
                    date={entry.date}
                    site={entry.site}
                    comment={entry.comment}
                    {transformValue}
                    on:click={handleCalendarClick}
                  />
                </div>
              {:else}
                <Entry
                  date={entry.date}
                  site={entry.site}
                  comment={entry.comment}
                  {transformValue}
                  on:click={handleCalendarClick}
                />
              {/if}
            </div>
          {/each}
        </div>
      {/if}
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
      --accent-color: #ffffff;
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
    flex-direction: column;
    padding: 1em;
    padding-top: calc(33vh + 1em); /* Reduced from 3em to 1em */
    overflow: hidden;
    border-right: 1px solid #333;
    transition: padding-top 0.3s ease-in-out;
    position: relative; /* Add this to position the button */
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

    .about-container {
      padding-top: 2em;
    }
  }

  .entry-container > div {
    width: 100%;
  }

  .no-transition {
    transition: none !important;
  }

  .about-button {
    margin-bottom: 1em;
    padding: 0.5em 1em;
    color: var(--accent-color);
    border: none;
    cursor: pointer;
    transition: color 0.3s ease;
    background: none; /* Remove background */
    position: absolute; /* Position the button absolutely */
    top: 0; /* Align to the top */
    right: 0; /* Align to the right */
  }

  .about-button:hover {
    text-decoration: underline;
  }

  .about-container {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding: 5em;
    background-color: var(--bg-color);
    transition: top 0.3s ease-in-out;
  }

  @media (max-width: 768px) {
    .container {
      flex-direction: row;
      align-items: flex-start;
      width: 100%;
      height: 100%;
      padding: 0;
    }

    .calendar-container,
    .content {
      flex: none;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      width: 100%;
      max-width: none;
      padding: 1em;
      transition: transform 0.3s ease-in-out;
    }

    .about-button {
      display: flex;
      position: relative;
      align-self: flex-end;
      margin-bottom: 1em;
    }

    .calendar-container.hidden,
    .content.hidden {
      transform: translateX(100%);
      flex: 0;
      padding: 0;
      height: 0;
      width: 0;
      overflow: hidden;
    }

    .calendar-container.visible,
    .content.visible {
      transform: translateX(0);
      overflow-y: scroll;
      flex: 1;
    }

    .calendar-container {
      overflow-x: auto;
      overflow-y: scroll;
      border-right: none;
    }

    .calendar-container > Calendar {
      width: 100%;
      max-width: 400px;
    }
  }
</style>
