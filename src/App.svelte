<script lang="ts">
  import { onMount } from "svelte";
  import { fade } from "svelte/transition";
  import { store, loadEntries, navigateWeek } from "./lib/entries.svelte";
  import { getWeekNumber } from "./lib/utils";
  // import { showAbout, isCalendarVisible } from "./stores";
  import { appState } from "./state.svelte";

  // Components
  import Calendar from "./Calendar.svelte";
  import Entry from "./Entry.svelte";
  import About from "./About.svelte";

  const filteredEntries = $derived(() => {
    if (!store.selectedWeek) return store.entries;
    return store.entries.filter((entry) => {
      const entryWeek = getWeekNumber(entry.date);
      const entryYear = entry.date.getFullYear();
      return (
        entryWeek === store.selectedWeek.week &&
        entryYear === store.selectedWeek.year
      );
    });
  });

  // Handle keyboard navigation
  function handleKeydown(event: KeyboardEvent) {
    if (event.key === "ArrowUp") {
      appState.showAbout = false;
      navigateWeek("next");
    } else if (event.key === "ArrowDown") {
      appState.showAbout = false;
      navigateWeek("previous");
    }
  }

  function handleAboutClick() {
    appState.showAbout = true;
    appState.isCalendarVisible = false;
  }

  onMount(async () => {
    await loadEntries();
    window.addEventListener("keydown", handleKeydown);
    return () => window.removeEventListener("keydown", handleKeydown);
  });

  // Swipe gestures

  let touchStartX = 0;

  function handleSwipe(event: TouchEvent) {
    const touch = event.changedTouches[0];
    const swipeDistance = touch.clientX - touchStartX;
    if (swipeDistance < -50) {
      // Swipe left
      appState.isCalendarVisible = false;
    } else if (swipeDistance > 50) {
      // Swipe right
      appState.isCalendarVisible = true;
    }
  }

  function handleTouchStart(event: TouchEvent) {
    touchStartX = event.touches[0].clientX;
  }

  onMount(() => {
    const container = document.querySelector(".container");
    if (!container) return;
    container.addEventListener("touchstart", handleTouchStart);
    container.addEventListener("touchend", handleSwipe);
    return () => {
      container.removeEventListener("touchstart", handleTouchStart);
      container.removeEventListener("touchend", handleSwipe);
    };
  });
</script>

<svelte:window on:keydown={handleKeydown} />

<main>
  <div class="container">
    <div
      class="calendar-container"
      class:visible={appState.isCalendarVisible}
      class:hidden={!appState.isCalendarVisible}
    >
      <button
        class="about-button"
        on:click={handleAboutClick}
        disabled={appState.showAbout}
      >
        About
      </button>

      {#if !store.isLoading}
        {#each [2025, 2024, 2023] as year}
          <Calendar {year} entries={filteredEntries()} />
        {/each}
      {/if}
    </div>

    <div
      class="content"
      class:visible={!appState.isCalendarVisible}
      class:hidden={appState.isCalendarVisible}
    >
      {#if appState.showAbout}
        <div class="about-container">
          <About />
        </div>
      {:else}
        <div class="entry-container">
          {#each filteredEntries() as entry (entry.date.getTime())}
            <div in:fade={{ duration: 300 }}>
              <Entry {...entry} />
            </div>
          {/each}
        </div>
      {/if}
    </div>
  </div>
</main>

<style>
  :global(:root) {
    --bg-color: #ffffff;
    --text-color: #333333;
    --accent-color: #333333;
    --square-color: #a89996;
    --selected-color: white;
    --star-color: #ffb511;
  }

  /* @media (prefers-color-scheme: dark) {
    :global(:root) {
      --bg-color: #111111;
      --text-color: #ffffff;
      --square-color: #f0f0f0;
      --accent-color: #ffffff;
      --selected-color: #ff3e00;
    }
  } */

  html,
  body {
    overflow: hidden;
    height: 100%;
    margin: 0;
    padding: 0;
  }

  main {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    background-color: var(--bg-color);
    color: var(--text-color);
    overflow: hidden;
  }

  .container {
    display: flex;
    flex-direction: row;
    width: 100%;
    max-width: 1200px;
    height: 100vh;
    gap: 4em;
    padding: 0 2em;
    margin: 0 auto;
    justify-content: center;
  }

  .calendar-container {
    flex: 0 0 auto;
    display: flex;
    flex-direction: column;
    padding: 1em;
    padding-top: calc(33vh + 1em);
    /* Reduced from 3em to 1em */
    overflow: hidden;
    border-right: 1px solid #333;
    transition: padding-top 0.3s ease-in-out;
    position: relative;
    /* Add this to position the button */
  }

  .content {
    flex: 1;
    padding: 2em;
    padding-top: 33vh;
    display: flex;
    flex-direction: column;
    min-height: 100%;
    position: relative;
    max-width: 700px;
    margin: 0 auto;
    transition: padding-top 0.3s ease-in-out;
    overflow-x: visible;
  }

  .entry-container {
    position: absolute;
    top: 33vh;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    padding-top: 2em;
    transition: top 0.3s ease-in-out;
    overflow-y: auto;
    /* Allow vertical scrolling if needed */
  }

  .about-button:disabled:hover {
    text-decoration: none;
    cursor: default;
  }

  @media (max-width: 1200px) {
    .container {
      max-width: none;
      gap: 2em;
      padding: 0;
      justify-content: flex-start;
    }

    .calendar-container {
      padding-top: 3em;
      /* Keep the original padding for small screens */
    }

    .content {
      padding-top: 2em;
      /* Reset padding on smaller screens */
      margin: 0;
    }

    .entry-container {
      top: 0;
    }

    .about-container {
      padding-top: 2em;
    }
  }

  .entry-container > div {
    width: 100%;
  }

  .no-transition {
    transition: none !important;
  }

  .about-button {
    margin-bottom: 1em;
    padding: 0.5em 1em;
    color: var(--accent-color);
    border: none;
    cursor: pointer;
    transition: color 0.3s ease;
    background: none;
    /* Remove background */
    position: absolute;
    /* Position the button absolutely */
    top: 0;
    /* Align to the top */
    right: 0;
    /* Align to the right */
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
  }

  .about-button:hover {
    text-decoration: underline;
  }

  .about-container {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 2em;
    background-color: var(--bg-color);
    transition: top 0.3s ease-in-out;
  }

  @media (max-width: 768px) {
    .container {
      flex-direction: row;
      align-items: flex-start;
      width: 100%;
      height: 100%;
      padding: 0;
    }

    .calendar-container,
    .content {
      flex: none;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      width: 100%;
      max-width: none;
      padding: 1em;
      transition: transform 0.3s ease-in-out;
    }

    .about-button {
      display: flex;
      position: relative;
      align-self: flex-end;
      margin-bottom: 1em;
    }

    .calendar-container.hidden,
    .content.hidden {
      transform: translateX(100%);
      flex: 0;
      padding: 0;
      height: 0;
      width: 0;
      overflow: hidden;
    }

    .calendar-container.visible,
    .content.visible {
      transform: translateX(0);
      overflow-y: scroll;
      flex: 1;
    }

    .calendar-container {
      overflow-x: auto;
      overflow-y: scroll;
      border-right: none;
      gap: 2em;
    }

    .about-container {
      padding: 0;
    }

    .about-button {
      align-self: flex-start;
    }

    .content {
      padding: 0;
    }

    .calendar-container > Calendar {
      width: 100%;
      max-width: 400px;
    }
  }
</style>
