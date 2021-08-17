<script lang="ts">
  export let data: string;
  export let onDragStart = (e: DragEvent): void => undefined;
  export let onDragEnd = (e: DragEvent): void => undefined;

  function handleDragStart(e: DragEvent) {
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData("application/wrkhub", data);
    onDragStart(e);
  }
</script>

<div draggable="true" on:dragstart={handleDragStart} on:dragend={onDragEnd}>
  <slot />
</div>
