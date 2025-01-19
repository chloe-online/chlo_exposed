<script>
  export let date;
  export let site;
  export let comment;
  export let transformValue;

  const colorPalette = {
    "bottom left": "#fbb4ae",
    "bottom right": "#b3cde3",
    "middle left": "#ccebc5",
    "middle right": "#decbe4",
    "top left": "#fed9a6",
    "top right": "#ffffcc",
  };
</script>

<div
  class="entry"
  style="transform: {transformValue({ date, site, comment })};"
>
  <div class="entry-header">
    <div class="site" style="background-color: {colorPalette[site]}">
      <h1>{site}</h1>
    </div>
    <div class="date">
      {#if date.getDay() === 4}
        <h1>★</h1>
      {/if}
      <h1>
        {date.toLocaleDateString("en-US", { weekday: "long" })}
        {date.toLocaleDateString()}
      </h1>
    </div>
  </div>
  <div class="entry-content">
    <p>{comment}</p>
  </div>
</div>

<style>
  .entry {
    margin-bottom: 1em;
    padding: 1em;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    transform-origin: top center;
    transition: transform 0.2s cubic-bezier(0.2, 0, 0, 1);
    width: 75%;
  }

  .entry-header {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    align-items: center;
    justify-content: space-between;
    width: 100%;
  }

  .site {
    padding: 10px;
    border-radius: 0.5em;
    text-align: center;
    display: flex;
    align-items: flex-start;
    justify-content: center;
    flex-direction: column;
    max-height: 50px;
    width: 175px;
  }

  .date {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    text-align: center;
    gap: 0.5em;
  }

  .entry h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
    margin-bottom: 1em;
  }
</style>
