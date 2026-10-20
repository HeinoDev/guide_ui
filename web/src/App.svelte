<script lang="ts">
    import { flushSync } from 'svelte'

    type Position = 'bottom' | 'left' | 'right'

    type ShowMessage = {
        action: 'show'
        key?: string
        text?: string
        prefix?: string
        position: Position
    }

    type HideMessage = { action: 'hide' }

    let box: HTMLDivElement
    let visible = $state(false)
    let position = $state<Position>('bottom')
    let prefix = $state('')
    let key = $state('')
    let text = $state('')

    function show(data: ShowMessage) {
        if (data.position !== position) {
            visible = false
            position = data.position
            flushSync()
            void box.offsetWidth
        }
        prefix = data.prefix ?? ''
        key = data.key ?? ''
        text = data.text ?? ''
        visible = true
    }

    function onMessage(event: MessageEvent<ShowMessage | HideMessage>) {
        if (event.data.action === 'show') show(event.data)
        if (event.data.action === 'hide') visible = false
    }
</script>

<svelte:window onmessage={onMessage} />

<div bind:this={box} id="textui" class={[position, { visible }]}>
    {#if key}
        <span>{prefix}</span>
        <div id="key">{key}</div>
    {/if}
    <span>{text}</span>
</div>

<style>
    #textui {
        position: fixed;
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 8px 16px;
        background: #1e1e1e;
        border: 1px solid #333333;
        border-radius: 4px;
        box-shadow:
            0 10px 15px -3px rgba(0, 0, 0, 0.1),
            0 4px 6px -4px rgba(0, 0, 0, 0.1);
        color: #d1d5db;
        font-size: 14px;
        line-height: 20px;
        white-space: nowrap;
        opacity: 0;
        transition:
            opacity 200ms cubic-bezier(0.23, 1, 0.32, 1),
            transform 200ms cubic-bezier(0.23, 1, 0.32, 1);
    }

    #textui.bottom {
        bottom: 16px;
        left: 50%;
        transform: translate(-50%, 20px);
    }

    #textui.left {
        left: 16px;
        top: 50%;
        transform: translate(-20px, -50%);
    }

    #textui.right {
        right: 16px;
        top: 50%;
        transform: translate(20px, -50%);
    }

    #textui.bottom.visible {
        opacity: 1;
        transform: translate(-50%, 0);
    }

    #textui.left.visible,
    #textui.right.visible {
        opacity: 1;
        transform: translate(0, -50%);
    }

    #key {
        padding: 4px 8px;
        background: #121212;
        border: 1px solid #333333;
        border-radius: 4px;
        color: #ffffff;
        font-size: 12px;
        line-height: 16px;
        font-weight: 500;
    }
</style>
