To change the UI, edit the Svelte code in `web/src` and rebuild:

```
cd web
bun install
bun run build
```

Use `npm install` and `npm run build` if you don't use bun.

## Exports

### `Show(text, position)`

Shows the prompt.

- `text` (string): the prompt. Wrap a key in brackets to show it as a key badge, for example `'[E] Open da door'`. Text without brackets is shown without a badge.
- `position` (string, optional): `'bottom'`, `'left'` or `'right'`. Defaults to `'bottom'`. Any other value also falls back to `'bottom'`.

```lua
exports['guide_ui']:Show('[E] Open da door')
exports['guide_ui']:Show('Open da door', 'left')
```

Calling `Show` again with the same text and position does nothing.

### `Hide()`

Hides the prompt. Does nothing if it is already hidden.

```lua
exports['guide_ui']:Hide()
```

### `IsShowing()`

Returns two values: whether the prompt is visible, and its current text.

```lua
local Open, Text = exports['guide_ui']:IsShowing()
```

If the prompt is hidden, `Text` is `nil`.
