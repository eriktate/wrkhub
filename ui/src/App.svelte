<script lang="ts">
  import { getIssues } from "./lib/api";
  import Swimlanes from "./lib/Swimlanes.svelte";

  const issues = getIssues();
</script>

<main class="container">
  {#await issues}
    <p>Loading issues...</p>
  {:then issues}
    <Swimlanes {issues} />
  {/await}
</main>

<style global lang="scss">
  @import "../scss/main.scss";
  .app-container {
    height: 100vh;
  }
</style>
