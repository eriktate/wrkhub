<script lang="ts">
  import type { Issue as IssueType } from "./issue";
  import { issuesByState } from "./issue";
  import { issueStates } from "../stores";
  import { title } from "./strings";
  import Issue from "./Issue.svelte";
  import Lane from "./Lane.svelte";
  import Draggable from "./Draggable.svelte";
  import Dropzone from "./Dropzone.svelte";

  export let issues: IssueType[] = [];

  function handleDrop(stateId: string) {
    return (issueId: string) => {
      // hack to make sure svelte understands this state change
      const issueIdx = issues.findIndex((issue) => issue.id === issueId);
      issues[issueIdx].state.id = stateId;
    };
  }
</script>

<div class="container swimlanes">
  {#each $issueStates as state}
    <Dropzone onDrop={handleDrop(state.id)}>
      <Lane>
        {title(state.name)}
        {#each issuesByState(issues, state.id) as issue}
          <Draggable data={issue.id}>
            <Issue {issue} />
          </Draggable>
        {/each}
      </Lane>
    </Dropzone>
  {/each}
</div>

<style lang="scss">
  .swimlanes {
    flex-direction: row;
  }
</style>
