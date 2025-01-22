<script lang="ts">
  import { onMount } from "svelte";
  import { colorPalette } from "./constants";
  export let date;
  export let site;
  export let comment;

  let dateContainer;
  let useLongDate = false;

  $: [location, side] = site.split(" ");
  $: textColor = colorPalette[side];
  $: bgColor = colorPalette[location];

  function checkWidth() {
    if (dateContainer) {
      const width = dateContainer.offsetWidth;
      console.log("Container width:", width);
      useLongDate = width > 250;
    }
  }

  onMount(() => {
    const resizeObserver = new ResizeObserver(() => {
      checkWidth();
    });

    if (dateContainer) {
      resizeObserver.observe(dateContainer.parentElement);
      checkWidth(); // Initial check
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
    align-items: flex-start;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    flex-wrap: wrap;
    /* Allows header items to wrap when space is tight */
    gap: 1em;
    /* Adds spacing between wrapped items */
    border-bottom: 1px solid var(--text-color);
  }

  .site {
    padding: 10px;
    border-radius: 0.5em;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    max-height: 75px;
    width: 175px;
  }

  .date {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: flex-start;
    text-align: center;
    gap: 0.1em;
    max-width: 50%;
    min-width: min-content;
    /* Prevents date from squashing */
    overflow: visible;
    /* Ensures date text remains visible */
  }

  .entry h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
    justify-content: center;
    align-items: center;
    text-align: center;
  }

  .entry-content {
    font-size: 1.2em;
    font-weight: 100;
    align-self: flex-start;
    padding-left: 2em;
    text-align: left;
    text-wrap: balance;
    width: 100%;
    max-width: 75%;
    /* Default max-width for large screens */
    overflow-wrap: break-word;
    /* Allows long words to break */
    word-break: break-word;
    /* Additional support for word breaking */
  }

  .color-dots {
    display: flex;
    gap: 0.6em;
  }

  .color-dots .location,
  .color-dots .side {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: center;
    position: relative;
  }

  .dot {
    width: 30px;
    height: 30px;
    opacity: 0.8;
    border-radius: 50%;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }

  .color-dots .location h1,
  .color-dots .side h1 {
    margin: 0;
    position: relative;
    z-index: 1;
  }

  .star-container {
    width: 1em;
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: center;
    align-items: center;
  }

  .star-container h3 {
    margin: 0;
    text-align: center;
  }

  .date h1 {
    white-space: nowrap;
  }

  @media (max-width: 1200px) {
    .entry {
      width: 100%;
    }
  }

  @media (max-width: 768px) {
    .entry {
      width: 100%;
    }

    .site {
    }

    .entry-content {
      align-self: flex-start;
    }
  }

  .historical-event {
    margin-top: 1em;
    font-size: 0.9em;
    font-style: italic;
    color: var(--text-color-secondary, #666);
  }
</style>
