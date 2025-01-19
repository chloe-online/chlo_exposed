<!-- About.svelte -->
<script>
  export let onClose;
</script>

<div class="about-content">
  <h1>chlo.exposed - An Injection Diary</h1>
  <div class="body">
    <p>
      A collection of my thoughts during my weekly injection of 0.25mg estradiol
      valerate. Sometimes just me complaining about pain, sometimes about where
      I am in the world, sometimes about love, but always about Chloe. I hope
      you can glean smth
    </p>
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
</style>
