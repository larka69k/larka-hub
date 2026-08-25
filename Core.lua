--==================================================
-- LH HUB - CORE
--==================================================

local Core = {}

--==================================================
-- HUB SETTINGS
--==================================================

Core.Settings = {

    -- Général
    Enabled = true,
    Debug = false,

    -- Délais
    StartDelay = 5,
    ActionDelay = 1,
    ClickDelay = 0.2,

    -- Mouvement
    WalkSpeed = 16,

    -- Clic
    ClickRadius = 10,

    -- Répétition
    RepeatEnabled = true,
    RepeatCount = 1,

}

--==================================================
-- GAME SETTINGS
--==================================================

Core.Game = {

    Name = "Default",

    -- Coordonnées
    Coordinates = {
        Position1 = Vector3.new(0, 0, 0),
        Position2 = Vector3.new(0, 0, 0),
        Position3 = Vector3.new(0, 0, 0),
    },

    -- Délais propres au jeu
    Delays = {
        Position1 = 0,
        Position2 = 0,
        Position3 = 0,
    },

}

--==================================================
-- UNIVERSAL SETTINGS
--==================================================

Core.Universal = {

    AutoStart = false,
    AutoRepeat = false,

}

--==================================================
-- GET SETTING
--==================================================

function Core:GetSetting(Name)

    return self.Settings[Name]

end

--==================================================
-- SET SETTING
--==================================================

function Core:SetSetting(Name, Value)

    if self.Settings[Name] ~= nil then
        self.Settings[Name] = Value
        return true
    end

    warn("[LH HUB] Setting not found: " .. tostring(Name))

    return false

end

--==================================================
-- GET GAME SETTING
--==================================================

function Core:GetGameSetting(Name)

    return self.Game[Name]

end

--==================================================
-- SET GAME SETTING
--==================================================

function Core:SetGameSetting(Name, Value)

    if self.Game[Name] ~= nil then
        self.Game[Name] = Value
        return true
    end

    warn("[LH HUB] Game setting not found: " .. tostring(Name))

    return false

end

--==================================================
-- GET COORDINATE
--==================================================

function Core:GetCoordinate(Name)

    return self.Game.Coordinates[Name]

end

--==================================================
-- SET COORDINATE
--==================================================

function Core:SetCoordinate(Name, Position)

    self.Game.Coordinates[Name] = Position

end

--==================================================
-- GET DELAY
--==================================================

function Core:GetDelay(Name)

    return self.Game.Delays[Name]

end

--==================================================
-- SET DELAY
--==================================================

function Core:SetDelay(Name, Value)

    self.Game.Delays[Name] = Value

end

--==================================================
-- CORE READY
--==================================================

print("[LH HUB] Core loaded.")

return Core
