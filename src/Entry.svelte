<script lang="ts">
  import { onMount } from "svelte";
  import { colorPalette } from "./constants";

  // Props
  let { date, site, comment }: { date: Date; site: string; comment: string } =
    $props();

  // DOM references
  let dateContainer: HTMLDivElement;

  // State and derived values
  let useLongDate = $state(false);
  let location = $derived(site.split(" ")[0]);
  let side = $derived(site.split(" ")[1]);
  let textColor = $derived(colorPalette[side]);
  let bgColor = $derived(colorPalette[location]);

  // Width handling
  function checkWidth() {
    if (dateContainer) {
      useLongDate = dateContainer.offsetWidth > 250;
    }
  }

  onMount(() => {
    const resizeObserver = new ResizeObserver(checkWidth);

    if (dateContainer) {
      resizeObserver.observe(dateContainer.parentElement as Element);
      checkWidth();
    }

    return () => resizeObserver.disconnect();
  });
</script>

<div class="entry">
  <div class="entry-header">
    <div class="date" bind:this={dateContainer}>
      <div class="star-container">
        {#if date.getDay() === 4}
          <h3>★</h3>
        {/if}
      </div>
      <h1>
        {#if useLongDate}
          {date.toLocaleDateString("en-US", { weekday: "long" })} -
          {date.toLocaleDateString()}
        {:else}
          {date.toLocaleDateString("en-US", {
            weekday: "short",
            month: "numeric",
            day: "numeric",
            year: "2-digit",
          })}
        {/if}
      </h1>
    </div>
    <div class="site">
      <div class="color-dots">
        <div class="location">
          <div class="dot" style="background-color: {bgColor}" />
          <h1>{location}</h1>
        </div>
        <div class="side">
          <div class="dot" style="background-color: {textColor}" />
          <h1>{side}</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="entry-content">
    {#if comment == ""}
      <p><i>no comment...</i></p>
    {:else}
      <p>{comment}</p>
    {/if}
  </div>
</div>

<style>
  /* Layout */
  .entry {
    margin-bottom: 1em;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    width: 75%;
    min-width: min-content;
  }

  .entry-header {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    flex-wrap: wrap;
    gap: 1em;
    border-bottom: 1px solid var(--text-color);
  }

  /* Typography */
  .entry h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
    margin: 0;
  }

  /* Date section */
  .date {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 0.1em;
    max-width: 50%;
    min-width: min-content;
    overflow: visible;
  }

  .date h1 {
    white-space: nowrap;
  }

  .star-container {
    width: 1em;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .star-container h3 {
    margin: 0;
  }

  /* Site section */
  .site {
    padding: 10px;
    border-radius: 0.5em;
    display: flex;
    align-items: center;
    justify-content: center;
    max-height: 75px;
    width: 175px;
    background: transparent;
  }

  .color-dots {
    display: flex;
    gap: 0.6em;
    background: transparent;
  }

  .color-dots .location,
  .color-dots .side {
    display: flex;
    align-items: flex-start;
    justify-content: center;
    position: relative;
    background: transparent;
  }

  .dot {
    width: 30px;
    height: 30px;
    opacity: 0.8;
    border-radius: 50%;
    position: absolute;
    z-index: 0;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }

  .color-dots h1 {
    position: relative;
    z-index: 1;
  }

  /* Content section */
  .entry-content {
    font-size: 1.2em;
    font-weight: 100;
    align-self: flex-start;
    padding-left: 2em;
    text-align: left;
    text-wrap: balance;
    width: 100%;
    max-width: 75%;
    overflow-wrap: break-word;
    word-break: break-word;
  }

  /* Responsive design */
  @media (max-width: 1200px) {
    .entry {
      width: 100%;
    }

    .entry-content {
      max-width: 90%;
    }
  }

  @media (max-width: 768px) {
    .entry-content {
      padding-left: 1em;
      max-width: 100%;
    }
  }

  .historical-event {
    margin-top: 1em;
    font-size: 0.9em;
    font-style: italic;
    color: var(--text-color-secondary, #666);
  }
</style>
