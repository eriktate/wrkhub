<script lang="ts">
  import type { Issue } from "./issue";
  import Card from "./Card.svelte";
  export let issue: Issue;
</script>

<Card>
  <div>
    {issue.title} - {issue.state.name.toUpperCase()}
  </div>
  <div>
    {issue.description}
  </div>
</Card>

<style>
</style>
