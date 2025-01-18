<script context="module">
  export class Entry {
    constructor(date, site, comment) {
      this.date = date;
      this.site = site;
      this.comment = comment;
    }
  }
</script>

<script>
  export let date;
  export let site;
  export let comment;
</script>

<div class="Entry">
  <div class="date">{date}</div>
  <div class="site">{site}</div>
  <div class="comment">{comment}</div>
</div>

<style>
  .entry {
    margin-bottom: 1em;
    padding: 1em;
    border-bottom: 1px solid #ccc;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .date {
    font-weight: bold;
    font-size: 1.2em;
  }

  .site {
    color: #666;
    font-style: italic;
    font-size: 1.2em;
  }

  .comment {
    margin-top: 0.5em;
    font-size: 1.2em;
  }
</style>
