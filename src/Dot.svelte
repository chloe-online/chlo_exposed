<script lang="ts">
  import { selectedWeek } from "./stores";
  import { getWeekNumber } from "./utils";
  import { colorPalette } from "./constants";
  import type { Entry } from "./Entry.svelte";

  export let weekNumber: number;
  export let year: number;
  export let isGridHovered: boolean;
  export let isFullyExpanded: boolean;
  export let entries: Entry[];
  export let position: { col: number; row: number };
  export let role: string | undefined = undefined;
  export let ariaLabel: string | undefined = undefined;

  const dot_SIZE = 30;
  const GAP = 5;
  const DOT_SIZE = 6;
  const DOT_SPACING_RATE = 2;

  function generateDots(spacing: number, size: number) {
    const dots = [];
    const count = Math.ceil(30 / spacing);

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

  function getDayDistanceFromThursday(date: Date) {
    const day = date.getDay();
    const distances: { [key: number]: number } = {
      0: 3.5, // Sunday
      1: 3.5, // Monday
      2: 2.5, // Tuesday
      3: 1.5, // Wednesday
      4: 0, // Thursday
      5: 1.5, // Friday
      6: 2.5, // Saturday
    };
    return distances[day];
  }

  $: entriesForWeek = entries.filter((entry) => {
    if (!entry?.date) return false;
    const entryWeek = getWeekNumber(entry.date);
    const entryYear = entry.date.getFullYear();
    return entryWeek === weekNumber && entryYear === year;
  });

  $: dotInfo = (() => {
    if (entriesForWeek.length === 0) {
      return {
        hasEntry: false,
        dotSpacing: "4",
        hasComment: false,
        color: "rgba(128, 128, 128, 0.3)",
        dotColor: "rgba(128, 128, 128, 0.3)",
        dots: [],
      };
    }
    const hasComment = entriesForWeek.some(
      (entry) => entry.comment.trim() !== ""
    );
    const minDistance = Math.min(
      ...entriesForWeek.map((entry) => getDayDistanceFromThursday(entry.date))
    );
    const dotSpacing = DOT_SIZE + (minDistance + 1) * DOT_SPACING_RATE;
    const [location, side] = entriesForWeek[0].site.toLowerCase().split(" ");
    return {
      hasEntry: true,
      dotSpacing,
      hasComment,
      color: colorPalette[side],
      dotColor: colorPalette[location],
      dots: generateDots(dotSpacing, DOT_SIZE),
    };
  })();

  $: dotStyle = () => {
    const x = isGridHovered ? position.col * (dot_SIZE + GAP) : 0;
    const y = isGridHovered ? position.row * (dot_SIZE + GAP) : 0;
    return `--x: ${x}px; --y: ${y}px;`;
  };
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<div
  class="dot"
  class:has-entries={dotInfo.hasEntry}
  class:has-comment={dotInfo.hasComment}
  class:selected={$selectedWeek &&
    $selectedWeek.week === weekNumber &&
    $selectedWeek.year === year}
  style="{dotStyle()} background-color: {dotInfo.color};"
  data-week={weekNumber}
  data-has-entries={dotInfo.hasEntry}
  {role}
  aria-label={ariaLabel}
  aria-selected={$selectedWeek &&
    $selectedWeek.week === weekNumber &&
    $selectedWeek.year === year}
  on:click
>
  {#if dotInfo.hasEntry}
    <svg width="30" height="30" viewBox="0 0 30 30">
      <g fill={dotInfo.dotColor} opacity="0.75">
        {#each dotInfo.dots as dot}
          <circle cx={dot.x} cy={dot.y} r={dot.size / 2} />
        {/each}
      </g>
    </svg>
  {/if}
</div>

<style>
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
    box-shadow: none;
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

  .dot.selected {
    background-color: var(--selected-color);
    border: 2px dashed var(--bg-color);
    opacity: 1;
    z-index: 1;
  }

  /* Add these new styles from Calendar.svelte */
  :global(.grid:not(.expanded)) .dot.has-entries.has-comment::after {
    display: none;
  }

  :global(.grid:not(.expanded)) .dot.has-entries.selected::after {
    display: block;
  }

  :global(.grid:not(.expanded)) .dot:first-child {
    opacity: 1;
  }

  :global(.grid.fully-expanded) .dot:hover {
    transform: translate(var(--x, 0), var(--y, 0)) scale(1.2);
    z-index: 2;
  }
</style>
