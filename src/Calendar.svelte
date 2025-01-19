<script>
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber } from "./utils.js";

  export let year;
  export let id;
  export let entries;

  const GRID_SIZE = 7;
  const SQUARE_SIZE = 30;
  const GAP = 5;

  const colorPalette = {
    "bottom left": "#fbb4ae",
    "bottom right": "#b3cde3",
    "middle left": "#ccebc5",
    "middle right": "#decbe4",
    "top left": "#fed9a6",
    "top right": "#ffffcc",
  };

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
      return {
        hasEntry: false,
        dotSpacing: "4",
        hasComment: false,
        color: "rgba(128, 128, 128, 0.3)",
      };

    // Check if any entries have comments
    const hasComment = entriesForWeek.some(
      (entry) => entry.comment.trim() !== ""
    );

    // Find the entry with the minimum distance from Thursday
    const minDistance = Math.min(
      ...entriesForWeek.map((entry) => getDayDistanceFromThursday(entry.date))
    );

    // Calculate dot spacing based on distance (0 = dense, 3 = sparse)
    const dotSpacing = 2 + minDistance * 2;

    // Determine color based on the site of the first entry
    const site = entriesForWeek[0].site.toLowerCase();
    const color = colorPalette[site] || "var(--square-color)";

    return { hasEntry: true, dotSpacing, hasComment, color };
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

  $: getSquareStyle = (weekIcon) => {
    const x = isGridHovered ? weekIcon.col * (SQUARE_SIZE + GAP) : 0;
    const y = isGridHovered ? weekIcon.row * (SQUARE_SIZE + GAP) : 0;
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
      <div class="week-icons">
        {#each grid as weekIcon (weekIcon.index)}
          <!-- svelte-ignore a11y-click-events-have-key-events -->
          <div
            class="square"
            class:has-entries={hasEntries(weekIcon.weekNumber).hasEntry}
            class:has-comment={hasEntries(weekIcon.weekNumber).hasComment}
            class:selected={$selectedWeek &&
              $selectedWeek.week === weekIcon.weekNumber &&
              $selectedWeek.year === year}
            style="{getSquareStyle(weekIcon)} --dot-spacing: {hasEntries(
              weekIcon.weekNumber
            ).dotSpacing}px; --dot-color: {hasEntries(weekIcon.weekNumber)
              .color};"
            data-week={weekIcon.weekNumber}
            data-has-entries={hasEntries(weekIcon.weekNumber).hasEntry}
            on:click={() => handleSquareClick(weekIcon.weekNumber)}
          ></div>
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
    width: 30px;
    height: 30px;
    transition: all 0.5s ease;
    transform-origin: bottom left;
  }

  .grid.expanded {
    width: 245px;
    height: 245px;
  }

  .square {
    position: absolute;
    top: 0;
    left: 0;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    transition: all 0.5s ease;
    transform: translate(var(--x, 0), var(--y, 0));
    animation: float 3s ease-in-out infinite;
    cursor: default;
    background-color: rgba(128, 128, 128, 0.3); /* Default solid background */
  }

  .square.has-entries {
    cursor: pointer;
    background-color: transparent; /* Reset for squares with entries */
    background-image: radial-gradient(
      circle at center,
      var(--dot-color) 1px,
      transparent 1px
    );
    background-size: var(--dot-spacing) var(--dot-spacing);
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
    background-color: var(--accent-color);
    opacity: 0.5;
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
