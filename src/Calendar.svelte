<script>
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber } from "./utils.js";
  export let year;
  export let id;
  export let entries;

  const GRID_SIZE = 7;
  const SQUARE_SIZE = 15;
  const GAP = 5;

  // Create grid with week numbers
  const grid = Array.from({ length: 52 }, (_, index) => {
    const row = 7 - Math.floor(index / GRID_SIZE);
    const col = index % GRID_SIZE;
    const weekNumber = index + 1;
    return { index, row, col, weekNumber };
  });

  // Function to check if a square has entries
  function hasEntries(weekNumber) {
    const entriesForWeek = entries.filter((entry) => {
      if (!entry || !entry.date) {
        console.warn("Invalid entry:", entry);
        return false;
      }
      const entryWeek = getWeekNumber(entry.date);
      const entryYear = entry.date.getFullYear();
      return entryWeek === weekNumber && entryYear === year;
    });

    if (entriesForWeek.length === 0)
      return { hasEntry: false, opacity: 0.2, hasComment: false };

    // Check if any entries have comments
    const hasComment = entriesForWeek.some(
      (entry) => entry.comment.trim() !== ""
    );

    // Find the entry with the minimum distance from Thursday
    const minDistance = Math.min(
      ...entriesForWeek.map((entry) => getDayDistanceFromThursday(entry.date))
    );

    const opacity = 1 - minDistance * 0.3;

    return { hasEntry: true, opacity, hasComment };
  }

  function handleSquareClick(weekNumber) {
    const { hasEntry } = hasEntries(weekNumber);
    if (hasEntry) {
      $selectedWeek = { year, week: weekNumber };
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

  $: getSquareStyle = (square) => {
    const x = isGridHovered ? square.col * (SQUARE_SIZE + GAP) : 0;
    const y = isGridHovered ? square.row * (SQUARE_SIZE + GAP) : 0;
    return `--x: ${x}px; --y: ${y}px;`;
  };

  function getDayDistanceFromThursday(date) {
    const day = date.getDay();
    const thursday = 4; // 0 is Sunday, 4 is Thursday
    const distance = Math.abs(day - thursday);
    return Math.min(distance, 7 - distance); // Get shortest distance considering week wrapping
  }
</script>

<div
  class="Calendar"
  on:mouseenter={handleGridEnter}
  on:mouseleave={handleGridLeave}
>
  <div class="sidebar">
    <div class="year">{year}</div>
  </div>
  <div class="grid-container">
    <div
      class="grid"
      class:expanded={isGridHovered}
      class:fully-expanded={isFullyExpanded}
    >
      {#each grid as square (square.index)}
        <div
          class="square"
          class:has-entries={hasEntries(square.weekNumber).hasEntry}
          class:has-comment={hasEntries(square.weekNumber).hasComment}
          class:selected={$selectedWeek &&
            $selectedWeek.week === square.weekNumber &&
            $selectedWeek.year === year}
          style="{getSquareStyle(square)} --opacity: {hasEntries(
            square.weekNumber
          ).opacity};"
          data-week={square.weekNumber}
          data-has-entries={hasEntries(square.weekNumber).hasEntry}
          on:click={() => handleSquareClick(square.weekNumber)}
        ></div>
      {/each}
    </div>
  </div>
</div>

<style>
  .Calendar {
    display: flex;
    flex-direction: row;
    gap: 10px;
    width: 100%;
    align-items: start;
    font-size: 1.5em;
    padding: 1em;
    color: var(--text-color);
    cursor: default;
  }

  .year {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
  }

  .grid-container {
    width: 100%;
    display: flex;
  }

  .grid {
    position: relative;
    width: 15px;
    height: 15px;
    transition: all 0.5s ease;
    transform-origin: bottom left;
    background-color: var(--square-color);
  }

  .grid.expanded {
    width: 140px;
    height: 140px;
    background-color: transparent;
  }

  .square {
    position: absolute;
    top: 0;
    left: 0;
    background-color: var(--square-color);
    width: 15px;
    height: 15px;
    transition: all 0.5s ease;
    opacity: 0.2;
    transform: translate(var(--x, 0), var(--y, 0));
    cursor: default;
  }

  .square.has-entries {
    opacity: var(--opacity) !important;
    background-color: var(--accent-color, #ff3e00);
    cursor: pointer;
  }

  .square.has-entries.has-comment::after {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 50%;
    height: 50%;
    border-radius: 50%;
    background-color: white;
    opacity: 1;
  }

  .grid:not(.expanded) .square.has-entries.has-comment::after {
    display: none;
  }

  .grid:not(.expanded) .square.has-entries.selected::after {
    display: block;
  }

  .grid:not(.expanded) .square:first-child {
    opacity: 1;
  }

  .grid.fully-expanded .square:hover {
    transform: translate(var(--x, 0), var(--y, 0)) scale(1.2);
    z-index: 2;
  }

  .square.selected {
    background-color: var(--selected-color);
    border: 1px dashed var(--accent-color);
    opacity: 1;
    z-index: 1;
  }

  .square.has-entries.has-comment.selected::after {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 50%;
    height: 50%;
    border-radius: 50%;
    background-color: var(--accent-color);
    opacity: 1;
  }
</style>
