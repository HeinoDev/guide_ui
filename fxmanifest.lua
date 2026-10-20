--[[
    exports['guide_ui']:Show('[E] Åbn døren')
    exports['guide_ui']:Show('Åbn døren', 'bottom' | 'left' | 'right')
    exports['guide_ui']:Hide()
    local Open, Text = exports['guide_ui']:IsShowing()
]]

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'guide_ui'
description 'Guide UI tekstprompt'
version '1.0.0'

ui_page 'web/build/index.html'

client_script 'client.lua'

files {
    'web/build/index.html',
    'web/build/**/*',
}
