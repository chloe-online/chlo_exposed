<script>
  export let date;
  export let site;
  export let comment;
  export let transformValue;

  const colorPalette = {
    left: "#f15060", // bright red ブライトレッド
    right: "#3D5588", // risoofederal blue リソー フェデラルブルー
    bottom: "#ffe800", // yellow イエロー
    middle: "#ff48b0", // fluorescent pink 蛍光ピンク
    top: "#5ec8e5", // aqua アクア
  };

  $: [location, side] = site.split(" ");
  $: textColor = colorPalette[side];
  $: bgColor = colorPalette[location];
</script>

<div
  class="entry"
  style="transform: {transformValue({ date, site, comment })};"
>
  <div class="entry-header">
    <div class="date">
      <div class="star-container">
        {#if date.getDay() === 4}
          <h1>★</h1>
        {/if}
      </div>
      <h1>
        {date.toLocaleDateString("en-US", { weekday: "long" })}
        {date.toLocaleDateString()}
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
    gap: 0.5em;
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
    align-self: center;
    text-align: left;
    text-wrap: balance;
    width: 100%;
    max-width: 75%;
  }

  .color-dots {
    display: flex;
    gap: 1em;
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
    justify-content: center;
    align-items: center;
  }

  .star-container h1 {
    margin: 0;
  }
</style>
