--========================================================--
--                         LH CORE
--========================================================--

local Core = {}

--========================================================--
--                         COLORS
--========================================================--

local Colors = {

    Main = Color3.fromRGB(45, 100, 220),

    Secondary = Color3.fromRGB(25, 55, 130),

    Accent = Color3.fromRGB(80, 140, 255),

    Background = Color3.fromRGB(14, 14, 20),

    Panel = Color3.fromRGB(23, 23, 31),

    Header = Color3.fromRGB(22, 22, 30),

    Text = Color3.fromRGB(255, 255, 255),

    SubText = Color3.fromRGB(145, 145, 155)

}

--========================================================--
--                      HUB SETTINGS
--========================================================--

local HubSettings = {

    ShowFPS = true,

    ShowPing = true,

    SearchEnabled = true

}

--========================================================--
--                       GET COLOR
--========================================================--

function Core:GetColor(Name)

    return Colors[Name]

end

--========================================================--
--                       SET COLOR
--========================================================--

function Core:SetColor(Name, Value)

    if typeof(Value) ~= "Color3" then
        return false
    end

    if Colors[Name] == nil then
        return false
    end

    Colors[Name] = Value

    return true

end

--========================================================--
--                    GET ALL COLORS
--========================================================--

function Core:GetColors()

    local Copy = {}

    for Name, Value in pairs(Colors) do

        Copy[Name] = Value

    end

    return Copy

end

--========================================================--
--                   GET HUB SETTING
--========================================================--

function Core:GetHubSetting(Name)

    return HubSettings[Name]

end

--========================================================--
--                   SET HUB SETTING
--========================================================--

function Core:SetHubSetting(Name, Value)

    if HubSettings[Name] == nil then
        return false
    end

    HubSettings[Name] = Value

    return true

end

--========================================================--
--                 GET ALL HUB SETTINGS
--========================================================--

function Core:GetHubSettings()

    local Copy = {}

    for Name, Value in pairs(HubSettings) do

        Copy[Name] = Value

    end

    return Copy

end

--========================================================--
--                     RESET COLORS
--========================================================--

local DefaultColors = {

    Main = Color3.fromRGB(45, 100, 220),

    Secondary = Color3.fromRGB(25, 55, 130),

    Accent = Color3.fromRGB(80, 140, 255),

    Background = Color3.fromRGB(14, 14, 20),

    Panel = Color3.fromRGB(23, 23, 31),

    Header = Color3.fromRGB(22, 22, 30),

    Text = Color3.fromRGB(255, 255, 255),

    SubText = Color3.fromRGB(145, 145, 155)

}

function Core:ResetColors()

    for Name, Value in pairs(DefaultColors) do

        Colors[Name] = Value

    end

end

--========================================================--
--                   RESET SETTINGS
--========================================================--

local DefaultSettings = {

    ShowFPS = true,

    ShowPing = true,

    SearchEnabled = true

}

function Core:ResetHubSettings()

    for Name, Value in pairs(DefaultSettings) do

        HubSettings[Name] = Value

    end

end

--========================================================--
--                         VERSION
--========================================================--

Core.Version = "1.0.0"

--========================================================--
--                           END
--========================================================--

return Core
