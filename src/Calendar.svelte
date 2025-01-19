<script>
  import { selectedWeek } from "./stores.js";
  import { getWeekNumber } from "./utils.js";

  export let year;
  export let id;
  export let entries;

  const GRID_SIZE = 7;
  const dot_SIZE = 30;
  const GAP = 5;
  const DOT_SIZE = 6; // diameter of dots in pixels
  const DOT_SPACING_RATE = 2; // pixels to increase per day of distance

  // color source https://www.stencil.wiki/colors
  const colorPalette = {
    left: "#f15060", // bright red ブライトレッド
    right: "#3D5588", // risoofederal blue リソー フェデラルブルー
    bottom: "#ffe800", // yellow イエロー
    middle: "#ff48b0", // fluorescent pink 蛍光ピンク
    top: "#5ec8e5", // aqua アクア
  };

  // Create grid with week numbers
  const grid = Array.from({ length: 52 }, (_, index) => {
    const row = 7 - Math.floor(index / GRID_SIZE);
    const col = index % GRID_SIZE;
    const weekNumber = index + 1;
    return { index, row, col, weekNumber };
  });

  // Function to generate random dots within a dot
  function generateDots(spacing, size) {
    const dots = [];
    const count = Math.ceil(30 / spacing); // 30 is dot size

    for (let x = 0; x < count; x++) {
      for (let y = 0; y < count; y++) {
        const offsetX = (Math.random() * 2 - 1).toFixed(2);
        const offsetY = (Math.random() * 2 - 1).toFixed(2);
        dots.push({
          x: x * spacing + Number(offsetX) + spacing / 2,
          y: y * spacing + Number(offsetY) + spacing / 2,
          size,
        });
      }
    }
    return dots;
  }

  // Function to check if a dot has entries
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
        dotColor: "rgba(128, 128, 128, 0.3)",
        dots: [],
      };

    // Check if any entries have comments
    const hasComment = entriesForWeek.some(
      (entry) => entry.comment.trim() !== ""
    );

    const minDistance = Math.min(
      ...entriesForWeek.map((entry) => getDayDistanceFromThursday(entry.date))
    );

    // Base spacing is dot size plus additional spacing based on distance
    const dotSpacing = DOT_SIZE + (minDistance + 1) * DOT_SPACING_RATE;

    // Get the site and determine background and dot colors
    const site = entriesForWeek[0].site.toLowerCase();
    const [location, side] = site.split(" ");
    const dotColor = colorPalette[location];
    const backgroundColor = colorPalette[side];

    return {
      hasEntry: true,
      dotSpacing,
      hasComment,
      color: backgroundColor,
      dotColor: dotColor,
      dots: generateDots(dotSpacing, DOT_SIZE),
    };
  }

  function handledotClick(weekNumber) {
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

  $: getdotStyle = (weekIcon) => {
    const x = isGridHovered ? weekIcon.col * (dot_SIZE + GAP) : 0;
    const y = isGridHovered ? weekIcon.row * (dot_SIZE + GAP) : 0;
    return `--x: ${x}px; --y: ${y}px;`;
  };

  function getDayDistanceFromThursday(date) {
    const day = date.getDay();
    const thursday = 4; // 0 is Sunday, 4 is Thursday

    // Create an asymmetric distance mapping where Friday and Saturday have different values
    const distances = {
      0: 3, // Sunday
      1: 2, // Monday
      2: 1, // Tuesday
      3: 1, // Wednesday
      4: 0, // Thursday
      5: 1.5, // Friday - slightly larger distance
      6: 2.5, // Saturday - even larger distance
    };

    return distances[day];
  }
</script>

<div
  class="Calendar"
  on:mouseenter={handleGridEnter}
  on:mouseleave={handleGridLeave}
>
  <div class="year-display">{year}</div>
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
            class="dot"
            class:has-entries={hasEntries(weekIcon.weekNumber).hasEntry}
            class:has-comment={hasEntries(weekIcon.weekNumber).hasComment}
            class:selected={$selectedWeek &&
              $selectedWeek.week === weekIcon.weekNumber &&
              $selectedWeek.year === year}
            style="{getdotStyle(weekIcon)} background-color: {hasEntries(
              weekIcon.weekNumber
            ).color};"
            data-week={weekIcon.weekNumber}
            data-has-entries={hasEntries(weekIcon.weekNumber).hasEntry}
            on:click={() => handledotClick(weekIcon.weekNumber)}
          >
            {#if hasEntries(weekIcon.weekNumber).hasEntry}
              <svg width="30" height="30" viewBox="0 0 30 30">
                <g
                  fill={hasEntries(weekIcon.weekNumber).dotColor}
                  opacity="0.75"
                >
                  {#each hasEntries(weekIcon.weekNumber).dots as dot}
                    <circle cx={dot.x} cy={dot.y} r={dot.size / 2} />
                  {/each}
                </g>
              </svg>
            {/if}
          </div>
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

  .dot {
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
    background-color: var(--dot-color);
    overflow: hidden;
    border: none;
    box-shadow: none; /* No shadow by default */
  }

  .grid.expanded .dot {
    transform: translate(var(--x, 0), var(--y, 0));
  }

  .dot.has-entries {
    cursor: pointer;
  }

  .dot.has-entries.has-comment::after {
    content: "";
    position: absolute;
    top: 3px;
    right: 3px;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background-color: var(--bg-color);
    opacity: 1;
    z-index: 1;
    border: none !important;
  }

  .dot.has-entries.has-comment.selected::after {
    border: 2px dashed var(--accent-color);
  }

  .grid:not(.expanded) .dot.has-entries.has-comment::after {
    display: none;
  }

  .grid:not(.expanded) .dot.has-entries.selected::after {
    display: block;
  }

  .grid:not(.expanded) .dot:first-child {
    opacity: 1;
  }

  .grid.fully-expanded .dot:hover {
    transform: translate(var(--x, 0), var(--y, 0)) scale(1.2);
    z-index: 2;
  }

  .dot.selected {
    background-color: var(--selected-color);
    border: 2px dashed var(--bg-color);
    opacity: 1;
    z-index: 1;
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
</style>
