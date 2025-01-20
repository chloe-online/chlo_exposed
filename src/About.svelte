<!-- About.svelte -->
<script>
  const colorPalette = {
    left: "#f15060", // bright red ブライトレッド
    right: "#3D5588", // risoofederal blue リソー フェデラルブルー
    bottom: "#ffe800", // yellow イエロー
    middle: "#ff48b0", // fluorescent pink 蛍光ピンク
    top: "#5ec8e5", // aqua アクア
  };
</script>

<div class="about-content">
  <h1>chlo.exposed - An Injection Diary</h1>
  <div class="body">
    <p>
      A collection of my thoughts during my weekly injection of 0.25mg estradiol
      valerate. Sometimes just me complaining about pain, sometimes about where
      I am in the world, sometimes about love, but always about Chloe.
    </p>
    <p>
      Injections are intended to be performed every Thursday, but as I am only
      human this is not always the case. The location of the injection rotates
      left to right each week and moves from the bottom of my thigh to the top.
    </p>
    <div class="centered">
      <div class="injection-location-container">
        <div class="injection-location">
          <div class="dot" style="background-color: {colorPalette.left}"></div>
          <h1>left</h1>
        </div>
        <div class="injection-location">
          <div
            class="dot"
            style="background-color: {colorPalette.right};"
          ></div>
          <h1>right</h1>
        </div>
        <div class="injection-location">
          <div
            class="dot"
            style="background-color: {colorPalette.bottom};"
          ></div>
          <h1>bottom</h1>
        </div>
        <div class="injection-location">
          <div
            class="dot"
            style="background-color: {colorPalette.middle};"
          ></div>
          <h1>middle</h1>
        </div>
        <div class="injection-location">
          <div class="dot" style="background-color: {colorPalette.top};"></div>
          <h1>top</h1>
        </div>
      </div>
    </div>
    <p>I hope you can glean smth</p>
    <div class="centered">[ beautiful funny cynical wonderful anything ]</div>
    <p>from the whole process.</p>
    <p>
      <i>
        * Originally I was prescribed 0.3mg but had to be bumped down to 0.25mg
        because my estrogen levels were consistenly too high. Its affirming that
        my body process estrogen so well.
      </i>
    </p>
  </div>
</div>

<style>
  .about-content {
    color: var(--text-color);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
  }

  .about-content .body {
    font-size: 1.2em;
    font-weight: 100;
    width: 75%;
    align-self: flex-end;
  }

  .about-content h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
  }

  .centered {
    text-align: center;
  }

  .injection-location-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    gap: 1em;
  }

  .injection-location h1 {
    font-size: 1.2em;
    font-weight: 100;
    margin: 0;
    position: relative;
    z-index: 0;
  }

  .injection-location {
    position: relative;
    background-color: none;
  }

  .injection-location .dot {
    width: 20px;
    height: 20px;
    opacity: 0.8;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }

  @media (max-width: 1200px) {
    .about-content {
      width: 100%;
    }
    .about-content .body {
      width: 100%;
    }
  }
</style>
