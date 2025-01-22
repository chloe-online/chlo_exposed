<!-- About.svelte -->
<script lang="ts">
  import { colorPalette } from "./constants";
</script>

<div class="about-content">
  <h1>An Injection Diary</h1>
  <div class="body">
    <p>
      A collection of my thoughts during my weekly injection of 0.25mg estradiol
      valerate. Sometimes just me complaining about pain, sometimes about where
      I am in the world, sometimes about love, but always about Chloe.
    </p>
    <p>
      The location of the injection rotates left to right each week and moves
      from the bottom of my thigh to the top.
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
    <p>
      Injections are intended to be performed every Thursday, but as I am only
      human this is not always the case.
    </p>
    <p>I hope you can find something</p>
    <div class="centered">[ beautiful funny cynical wonderful anything ]</div>
    <div class="right-aligned">
      <p>from my diary.</p>
    </div>
    <div class="right-aligned">
      <p>With love, Chloe</p>
    </div>
    <hr />
    <p>
      <i>
        * Originally I was prescribed 0.3mg but had to be bumped down to 0.25mg
        because my estrogen levels were consistenly too high. It's affirming
        that my body processes estrogen too well.
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
    align-self: flex-start;
    padding-left: 2em;
  }

  .about-content h1 {
    font-style: italic;
    font-family: "Playfair Display", "Times New Roman", Georgia, serif;
    font-size: 2em;
    font-weight: 100;
    width: 100%;
    border-bottom: 1px solid var(--text-color);
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
    border-bottom: none;
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

  .right-aligned {
    display: flex;
    flex-direction: row-reverse;
    align-items: flex-end;
  }

  .right-aligned p {
    align-self: flex-end;
  }

  @media (max-width: 1200px) {
    .about-content {
      width: 100%;
      align-self: flex-start;
    }

    .about-content .body {
      align-self: flex-start;
      width: 100%;
      padding: 0;
    }
  }
</style>
