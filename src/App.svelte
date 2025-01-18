<script>
  import { onMount } from "svelte";
  import Notebook from "./Notebook.svelte";
  import Calendar from "./Calendar.svelte";
  import { Entry } from "./Entry.svelte";
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber } from "./utils.js";
  const title = "chlo exposed";

  async function parseDiaryEntries(text) {
    const withoutHeader = text.split("\n").slice(2).join("\n");
    const rawEntries = withoutHeader.split("<div><br></div>\n");

    const entries = rawEntries
      .filter((entry) => entry.trim())
      .map((entry) => {
        const lines = entry.split("\n");

        // Parse date in format "MM/DD/YY"
        const dateStr = lines[0].replace("<div>", "").replace("</div>", "");
        const [month, day, yearStr] = dateStr.split("/");

        // Ensure year is properly formatted
        const fullYear = yearStr.length === 2 ? "20" + yearStr : yearStr;

        // Create date object (months are 0-based in JavaScript)
        const date = new Date(
          parseInt(fullYear),
          parseInt(month) - 1,
          parseInt(day)
        );

        const site = lines[1].replace("<div>", "").replace("</div>", "");
        const comment = lines
          .slice(2)
          .map((line) => line.replace("<div>", "").replace("</div>", ""))
          .join(" ")
          .trim();
        return new Entry(date, site, comment);
      });

    return entries;
  }

  let entries = []; // Initialize entries as empty array
  let loading = true; // Add loading state

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
  <div class="sidebar"></div>
  <div class="calendar-container">
    {#if loading}
      <p>Loading calendars...</p>
    {:else}
      <Calendar id="cal2025" year={2025} {entries} />
      <Calendar id="cal2024" year={2024} {entries} />
      <Calendar id="cal2023" year={2023} {entries} />
    {/if}
  </div>
  <div class="content">
    {#each filteredEntries as entry}
      <div class="entry">
        <h1>{entry.date.toLocaleDateString()} - {entry.site}</h1>
        <p>{entry.comment}</p>
      </div>
    {/each}
  </div>
</main>

<style>
  :global(:root) {
    --bg-color: #ffffff;
    --text-color: #333333;
    --accent-color: #333333;
    --square-color: #a89996;
  }

  @media (prefers-color-scheme: dark) {
    :global(:root) {
      --bg-color: #000000;
      --text-color: #ffffff;
      --square-color: #f0f0f0;
      --accent-color: #333333;
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
    border-right: 1px solid #333;
  }

  .calendar-container {
    flex: 0 0 auto;
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 1em;
    overflow: hidden;
  }

  .content {
    flex: 1;
    padding: 2em;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    width: 100%;
    min-height: 100%;
  }

  .entry {
    width: 400px;
    padding: 2em;
    margin: 0;
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
  }

  .entry h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
    margin-bottom: 1em;
  }
</style>
