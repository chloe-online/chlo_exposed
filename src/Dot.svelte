<script lang="ts">
  import { store } from "./lib/entries.svelte";
  import { getWeekNumber } from "./lib/utils";
  import { colorPalette } from "./constants";
  import type { CalendarEntry } from "./Calendar.svelte";

  // Types
  interface DotDimensions {
    readonly DOT_CONTAINER_SIZE: number;
    readonly DOT_GAP: number;
    readonly DOT_SIZE: number;
    readonly DOT_SPACING_RATE: number;
  }

  interface Dot {
    x: number;
    y: number;
    size: number;
  }

  interface DotInfo {
    hasEntry: boolean;
    dotSpacing: number;
    hasComment: boolean;
    color: string;
    dotColor: string;
    dots: Dot[];
  }

  // Props
  let {
    weekNumber,
    year,
    isGridHovered,
    isFullyExpanded,
    entries,
    position,
    role,
    ariaLabel,
  }: {
    weekNumber: number;
    year: number;
    isGridHovered: boolean;
    isFullyExpanded: boolean;
    entries: CalendarEntry[];
    position: { col: number; row: number };
    role: string | undefined;
    ariaLabel: string | undefined;
  } = $props();

  // Constants
  const dimensions: DotDimensions = {
    DOT_CONTAINER_SIZE: 30,
    DOT_GAP: 5,
    DOT_SIZE: 6,
    DOT_SPACING_RATE: 2,
  } as const;

  // Helper functions
  function generateDots(spacing: number, size: number): Dot[] {
    const dots: Dot[] = [];
    const count = Math.ceil(dimensions.DOT_CONTAINER_SIZE / spacing);

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

  const getDayDistanceFromThursday = (date: Date): number => {
    const distances: { [key: number]: number } = {
      0: 3.5, // Sunday
      1: 3.5, // Monday
      2: 2.5, // Tuesday
      3: 1.5, // Wednesday
      4: 0, // Thursday
      5: 1.5, // Friday
      6: 2.5, // Saturday
    };
    return distances[date.getDay()];
  };

  // Convert reactive declarations to $derived
  const entriesForWeek = $derived(
    entries.filter((entry) => {
      if (!entry?.date) return false;
      return (
        getWeekNumber(entry.date) === weekNumber &&
        entry.date.getFullYear() === year
      );
    })
  );

  const dotInfo = $derived(computeDotInfo(entriesForWeek));

  function computeDotInfo(entries: CalendarEntry[]): DotInfo {
    if (entries.length === 0) {
      return {
        hasEntry: false,
        dotSpacing: 4,
        hasComment: false,
        color: "rgba(128, 128, 128, 0.3)",
        dotColor: "rgba(128, 128, 128, 0.3)",
        dots: [],
      };
    }

    const hasComment = entries.some((entry) => entry.comment.trim() !== "");
    const minDistance = Math.min(
      ...entries.map((entry) => getDayDistanceFromThursday(entry.date))
    );
    const dotSpacing =
      dimensions.DOT_SIZE + (minDistance + 1) * dimensions.DOT_SPACING_RATE;
    const [location, side] = entries[0].site.toLowerCase().split(" ");

    return {
      hasEntry: true,
      dotSpacing,
      hasComment,
      color: colorPalette[side],
      dotColor: colorPalette[location],
      dots: generateDots(dotSpacing, dimensions.DOT_SIZE),
    };
  }

  const dotStyle = $derived(() => {
    const x = isGridHovered
      ? position.col * (dimensions.DOT_CONTAINER_SIZE + dimensions.DOT_GAP)
      : 0;
    const y = isGridHovered
      ? position.row * (dimensions.DOT_CONTAINER_SIZE + dimensions.DOT_GAP)
      : 0;
    return `--x: ${x}px; --y: ${y}px;`;
  });
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<div
  class="dot"
  class:has-entries={dotInfo.hasEntry}
  class:has-comment={dotInfo.hasComment}
  class:selected={store.selectedWeek.week === weekNumber &&
    store.selectedWeek.year === year}
  style="{dotStyle} background-color: {dotInfo.color};"
  data-week={weekNumber}
  data-has-entries={dotInfo.hasEntry}
  {role}
  aria-label={ariaLabel}
  aria-selected={store.selectedWeek.week === weekNumber &&
    store.selectedWeek.year === year}
  on:click
>
  {#if dotInfo.hasEntry}
    <svg
      width={dimensions.DOT_CONTAINER_SIZE}
      height={dimensions.DOT_CONTAINER_SIZE}
      viewBox="0 0 {dimensions.DOT_CONTAINER_SIZE} {dimensions.DOT_CONTAINER_SIZE}"
    >
      <g fill={dotInfo.dotColor} opacity="0.75">
        {#each dotInfo.dots as dot}
          <circle cx={dot.x} cy={dot.y} r={dot.size / 2} />
        {/each}
      </g>
    </svg>
  {/if}
</div>

<style>
  :root {
    --dot-size: 30px;
    --dot-indicator-size: 8px;
    --dot-indicator-offset: 3px;
    --transition-duration: 0.5s;
    --hover-scale: 1.2;
  }

  .dot {
    position: absolute;
    top: 0;
    left: 0;
    width: var(--dot-size);
    height: var(--dot-size);
    border-radius: 50%;
    transition: all var(--transition-duration) ease;
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
    top: var(--dot-indicator-offset);
    right: var(--dot-indicator-offset);
    width: var(--dot-indicator-size);
    height: var(--dot-indicator-size);
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
    transform: translate(var(--x, 0), var(--y, 0)) scale(var(--hover-scale));
    z-index: 2;
  }
</style>
