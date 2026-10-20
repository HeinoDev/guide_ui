local IsOpen = false
local CurrentText = nil
local CurrentPosition = nil

local Positions = { bottom = true, left = true, right = true }

local function SplitKey(Text)
    local Key, Rest = Text:match('^%[(.-)%]%s*%-?%s*(.*)$')
    if Key then return Key, Rest end
    return nil, Text
end

local function Show(Text, Position)
    Position = Positions[Position] and Position or 'bottom'
    if IsOpen and CurrentText == Text and CurrentPosition == Position then return end
    local Key, Label = SplitKey(Text or '')
    IsOpen = true
    CurrentText = Text
    CurrentPosition = Position
    SendNUIMessage({
        action = 'show',
        key = Key,
        text = Label,
        prefix = 'Tryk',
        position = Position,
    })
end

local function Hide()
    if not IsOpen then return end
    IsOpen = false
    CurrentText = nil
    CurrentPosition = nil
    SendNUIMessage({ action = 'hide' })
end

local function IsShowing()
    return IsOpen, CurrentText
end

exports('Show', Show)
exports('Hide', Hide)
exports('IsShowing', IsShowing)
