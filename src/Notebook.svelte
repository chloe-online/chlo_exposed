<script>
  export class Entry {
    constructor(date, site, comment) {
      this.date = date;
      this.site = site;
      this.comment = comment;
    }
  }
  export const pages = [
    new Entry(
      "1/10",
      "middle left",
      "back in bwick! went to a (potentially his last) baby morocco concert last night and one he kissed my hand on stage and two i got a photo with him after so ecstatic"
    ),
    new Entry(
      "1/2",
      "bottom right",
      "lots of first here but first shot of 2025 (here's to many more) and also i think this is my first international shot i am currently in willemstad curacao sitting above the beach i tried to take a photo of my shot but it was unfeasible"
    ),
    new Entry(
      "1/2",
      "bottom right",
      "lots of first here but first shot of 2025 (here's to many more) and also i think this is my first international shot i am currently in willemstad curacao sitting above the beach i tried to take a photo of my shot but it was unfeasible"
    ),
    new Entry(
      "1/2",
      "bottom right",
      "lots of first here but first shot of 2025 (here's to many more) and also i think this is my first international shot i am currently in willemstad curacao sitting above the beach i tried to take a photo of my shot but it was unfeasible"
    ),
  ];
  let currentPage = 0;
</script>

<div class="diary">
  {#each pages as page, index}
    <div class="entry" class:selected={index === currentPage}>
      <h2>{page.date} - {page.site}</h2>
      <p>{page.comment}</p>
    </div>
  {/each}
</div>

<style>
  .diary {
    height: 100%;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 1em;
    width: 100%;
    position: relative;
  }

  .diary::after {
    content: "";
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100px;
    background: linear-gradient(to bottom, transparent, black);
    pointer-events: none;
  }

  .entry {
    font-family: "Berkeley Mono";
    background-color: black;
    color: white;
    /* border: 2px solid white; */
    width: 300px;
    /* min-height: 400px; */
    padding: 10px;
    margin: 10px;
    flex-shrink: 0;
  }
  .entry h2 {
    text-align: left;
  }
  .entry p {
    text-align: left;
  }
  .selected {
  }
</style>
