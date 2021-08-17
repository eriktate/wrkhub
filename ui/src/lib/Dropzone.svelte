<script lang="ts">
  export let onDrop = (data: string): void => undefined;
  export let onDragover = (e: DragEvent): void => undefined;

  function handleDragover(e: DragEvent) {
    e.dataTransfer.dropEffect = "move";
    onDragover(e);
  }

  function handleDrop(e: DragEvent) {
    const data = e.dataTransfer.getData("application/wrkhub");
    onDrop(data);
  }
</script>

<div
  on:drop|preventDefault={handleDrop}
  on:dragover|preventDefault={handleDragover}
>
  <slot />
</div>

<style lang="scss">
  div {
    width: 100%;
    height: 100%;
  }
</style>
