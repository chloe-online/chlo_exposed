<script lang="ts">
  import { selectedWeek, showAbout, isCalendarVisible } from "./stores";
  import { getWeekNumber } from "./utils";
  import Dot from "./Dot.svelte";

  export let year: number;
  export let id: string;
  export let entries: {
    date: Date;
    site: string;
    comment: string;
  }[];

  const GRID_SIZE = 7;

  // Create grid with week numbers
  const grid = Array.from({ length: 52 }, (_, index) => ({
    index,
    row: 7 - Math.floor(index / GRID_SIZE),
    col: index % GRID_SIZE,
    weekNumber: index + 1,
  }));

  function handledotClick(weekNumber) {
    const hasEntry = entries.some((entry) => {
      if (!entry?.date) return false;
      return (
        getWeekNumber(entry.date) === weekNumber &&
        entry.date.getFullYear() === year
      );
    });

    if (isFullyExpanded && hasEntry) {
      $selectedWeek = { year, week: weekNumber };
      $showAbout = false;
      $isCalendarVisible = false;
    }
  }

  let isGridHovered = false;
  let isFullyExpanded = false;

  function handleGridEnter() {
    isGridHovered = true;
    setTimeout(() => {
      if (isGridHovered) isFullyExpanded = true;
    }, 500);
  }

  function handleGridLeave() {
    isGridHovered = false;
    isFullyExpanded = false;
  }
</script>

<div
  class="Calendar"
  on:mouseenter={handleGridEnter}
  on:mouseleave={handleGridLeave}
  role="group"
  aria-label={`Calendar for year ${year}`}
>
  <div class="year-display" role="heading" aria-level="2">{year}</div>
  <div class="grid-container">
    <div
      class="grid"
      class:expanded={isGridHovered}
      class:fully-expanded={isFullyExpanded}
      role="grid"
      aria-label="Weekly calendar grid"
    >
      <div class="week-icons" role="row">
        {#each grid as weekIcon (weekIcon.index)}
          <Dot
            weekNumber={weekIcon.weekNumber}
            {year}
            {entries}
            {isGridHovered}
            {isFullyExpanded}
            position={{ col: weekIcon.col, row: weekIcon.row }}
            on:click={() => handledotClick(weekIcon.weekNumber)}
            role="gridcell"
            ariaLabel={`Week ${weekIcon.weekNumber}`}
          />
        {/each}
      </div>
    </div>
  </div>
</div>

<style>
  .Calendar {
    display: flex;
    flex-direction: row;
    gap: 10px;
    width: 100%;
    align-items: flex-end;
    font-size: 1.5em;
    padding: 1em;
    color: var(--text-color);
    cursor: default;
  }

  .grid-container {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding-bottom: 10px;
  }

  .grid {
    position: relative;
    width: 30px;
    height: 30px;
    transition: all 0.5s ease;
    transform-origin: bottom left;
  }

  .grid.expanded {
    width: 245px;
    height: 245px;
  }

  .year-display {
    display: flex;
    bottom: 10px;
    left: 10px;
    font-size: 1.5em;
    opacity: 1;
    transition: opacity 0.3s ease;
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
  }

  @media (max-width: 768px) {
    .Calendar {
      align-items: flex-end;
      padding: 0;
    }
  }
</style>
