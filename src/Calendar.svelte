<script lang="ts">
  import { appState } from "./state.svelte";
  import { store } from "./lib/entries.svelte";
  import { getWeekNumber } from "./lib/utils";
  import type { DiaryEntry } from "./types";

  // Components
  import Dot from "./Dot.svelte";

  // Props
  let { year, entries }: { year: number; entries: DiaryEntry[] } = $props();

  // Constants
  const GRID_SIZE = 7;
  const GRID_WEEKS = 52;
  const EXPANSION_DELAY_MS = 500;

  // State
  let isGridHovered = $state(false);
  let isFullyExpanded = $state(false);

  // Grid generation
  const grid = Array.from({ length: GRID_WEEKS }, (_, index) => ({
    index,
    row: 7 - Math.floor(index / GRID_SIZE),
    col: index % GRID_SIZE,
    weekNumber: index + 1,
  }));

  // Event handlers
  function handleDotClick(weekNumber: number): void {
    const hasEntry = entries.some(
      (entry) =>
        entry?.date &&
        getWeekNumber(entry.date) === weekNumber &&
        entry.date.getFullYear() === year
    );

    if (isFullyExpanded && hasEntry) {
      store.selectedWeek = { year, week: weekNumber };
      appState.showAbout = false;
      appState.isCalendarVisible = false;
    }
  }

  function handleGridEnter(): void {
    isGridHovered = true;
    setTimeout(() => {
      if (isGridHovered) isFullyExpanded = true;
    }, EXPANSION_DELAY_MS);
  }

  function handleGridLeave(): void {
    isGridHovered = false;
    isFullyExpanded = false;
  }
</script>

<div
  class="calendar"
  on:mouseenter={handleGridEnter}
  on:mouseleave={handleGridLeave}
  role="group"
  aria-label={`Calendar for year ${year}`}
>
  <h2 class="year-display">{year}</h2>
  <div class="grid-container">
    <div
      class="grid"
      class:expanded={isGridHovered}
      class:fully-expanded={isFullyExpanded}
      role="grid"
      aria-label="Weekly calendar grid"
    >
      <div class="week-icons" role="row">
        {#each grid as { index, weekNumber, col, row }}
          <Dot
            {weekNumber}
            {year}
            {entries}
            {isGridHovered}
            {isFullyExpanded}
            position={{ col, row }}
            on:click={() => handleDotClick(weekNumber)}
            role="gridcell"
            ariaLabel={`Week ${weekNumber}`}
          />
        {/each}
      </div>
    </div>
  </div>
</div>

<style>
  .calendar {
    display: flex;
    flex-direction: row;
    align-items: flex-end;
    gap: 10px;
    width: 100%;
    font-size: 1.5em;
    color: var(--text-color);
    cursor: default;
  }

  .grid-container {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .grid {
    position: relative;
    width: 30px;
    height: 30px;
    transform-origin: bottom left;
    transition:
      width 0.5s ease,
      height 0.5s ease;
  }

  .grid.expanded {
    --dot-size: 30px;
    --gap-size: 5px;
    --grid-columns: 7;
    --grid-rows: 8;
    width: calc(var(--grid-columns) * (var(--dot-size) + var(--gap-size)));
    height: calc(var(--grid-rows) * (var(--dot-size) + var(--gap-size)));
    transition:
      width 0.5s ease,
      height 0.5s ease;
  }

  .year-display {
    margin: 0;
    font-size: 1.5em;
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    opacity: 1;
    transition: opacity 0.3s ease;
  }

  @media (max-width: 768px) {
    .calendar {
      align-items: flex-end;
      padding: 0;
    }
  }
</style>
