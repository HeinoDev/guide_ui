import './app.css'
import { mount } from 'svelte'
import App from './App.svelte'

mount(App, { target: document.getElementById('app')! })

if (import.meta.env.DEV) {
    const target = document.createElement('div')
    document.body.appendChild(target)
    import('./Debug.svelte').then(({ default: Debug }) => mount(Debug, { target }))
}
