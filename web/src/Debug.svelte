<script lang="ts">
    const positions = [
        { value: 'bottom', label: 'bottom' },
        { value: 'left', label: 'venstre' },
        { value: 'right', label: 'højre' },
    ]

    function send(data: object) {
        window.dispatchEvent(new MessageEvent('message', { data }))
    }

    function showAt(position: string) {
        send({ action: 'show', key: 'E', prefix: 'Tryk', text: 'for idk', position })
    }

    let open = $state(false)
</script>

<button class="toggle" onclick={() => (open = !open)}>{open ? 'Luk' : 'Debug'}</button>

{#if open}
    <div class="panel">
        {#each positions as { value, label }}
            <button onclick={() => showAt(value)}>{label}</button>
        {/each}
        <button onclick={() => send({ action: 'show', text: 'no bind', position: 'bottom' })}>no bind</button>
        <button onclick={() => send({ action: 'hide' })}>Hide</button>
    </div>
{/if}

<style>
    .toggle {
        position: fixed;
        top: 16px;
        left: 16px;
        padding: 4px 8px;
        font-size: 12px;
    }

    .panel {
        position: fixed;
        top: 52px;
        left: 16px;
        display: flex;
        flex-direction: column;
        gap: 6px;
        padding: 10px;
        background: #1e1e1e;
        border: 1px solid #333333;
        border-radius: 2px;
        font-family: ui-sans-serif, system-ui, sans-serif;
        font-size: 13px;
    }

    button {
        padding: 6px 10px;
        background: #121212;
        border: 1px solid #333333;
        border-radius: 4px;
        color: #d1d5db;
        cursor: pointer;
        text-align: left;
    }

    button:hover {
        border-color: #555555;
    }
</style>
