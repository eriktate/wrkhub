<div class="lane">
  <slot />
</div>

<style lang="scss">
  .lane {
    display: flex;
    flex: 1 1 auto;
    flex-direction: column;
    padding: 2rem;
    height: 100%;
    border-right: solid 1px #dddddd;
  }
</style>
