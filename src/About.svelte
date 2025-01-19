<!-- About.svelte -->
<script>
  export let onClose;
</script>

<div class="about-content">
  <h2>About This Application</h2>
  <p>
    This application is designed to help you track your diary entries by week.
  </p>
  <button on:click={onClose}>Close</button>
</div>

<style>
  .about-content {
    padding: 2em;
    background-color: var(--bg-color);
    color: var(--text-color);
    border: 1px solid var(--accent-color);
    border-radius: 8px;
  }

  button {
    margin-top: 1em;
    padding: 0.5em 1em;
    color: var(--accent-color);
    border: none;
    cursor: pointer;
    background: none;
  }

  button:hover {
    text-decoration: underline;
  }
</style>
