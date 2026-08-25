--========================================================--
--                         LH HUB
--                    Compact Edition
--========================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer

--========================================================--
--                     CONFIGURATION
--========================================================--

local Scripts = {

    {
        Name = "Noob Inc",
        Description = "Macro automatique pour Sand Noob Incremental.",
        URL = "https://raw.githubusercontent.com/larka69k/larka-hub/main/MacroSandNoobIncremental.lua"
    },

    {
        Name = "Script 2",
        Description = "Description du Script 2.",
        URL = ""
    },

    {
        Name = "Script 3",
        Description = "Description du Script 3.",
        URL = ""
    },

}

local SelectedScript = Scripts[1]

--========================================================--
--                     VARIABLES
--========================================================--

local Connections = {}
local Unloaded = false

local function Connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(Connections, connection)
    return connection
end

--========================================================--
--                         GUI
--========================================================--

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LarkaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = gethui()
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
end

--========================================================--
--                  BOUTON FLOTTANT LH
--========================================================--

local FloatingButton = Instance.new("TextButton")
FloatingButton.Parent = ScreenGui

FloatingButton.Size = UDim2.new(0, 54, 0, 54)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -27)

FloatingButton.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
FloatingButton.BorderSizePixel = 0

FloatingButton.Text = "LH"
FloatingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingButton.TextSize = 19
FloatingButton.Font = Enum.Font.GothamBold

FloatingButton.AutoButtonColor = false
FloatingButton.ZIndex = 20

local FloatingGradient = Instance.new("UIGradient")
FloatingGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 70, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(55, 35, 130))
})
FloatingGradient.Rotation = 45
FloatingGradient.Parent = FloatingButton

local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(1, 0)
FloatingCorner.Parent = FloatingButton

local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Parent = FloatingButton
FloatingStroke.Thickness = 2
FloatingStroke.Color = Color3.fromRGB(155, 105, 255)

--========================================================--
--                  FENÊTRE PRINCIPALE
--========================================================--

local Main = Instance.new("Frame")
Main.Parent = ScreenGui

Main.Size = UDim2.new(0, 560, 0, 350)
Main.Position = UDim2.new(0.5, -280, 0.5, -175)

Main.BackgroundColor3 = Color3.fromRGB(15, 15, 21)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = Main
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(55, 55, 70)

--========================================================--
--                         HEADER
--========================================================--

local Header = Instance.new("Frame")
Header.Parent = Main

Header.Size = UDim2.new(1, 0, 0, 62)

Header.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Header.BorderSizePixel = 0

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 15)
HeaderCorner.Parent = Header

--========================================================--
--                         LOGO LH
--========================================================--

local Logo = Instance.new("TextLabel")
Logo.Parent = Header

Logo.Position = UDim2.new(0, 16, 0, 10)
Logo.Size = UDim2.new(0, 40, 0, 40)

Logo.BackgroundColor3 = Color3.fromRGB(80, 50, 170)
Logo.BorderSizePixel = 0

Logo.Text = "LH"
Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Logo.TextSize = 13
Logo.Font = Enum.Font.GothamBold

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 10)
LogoCorner.Parent = Logo

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = Logo
LogoStroke.Thickness = 1
LogoStroke.Color = Color3.fromRGB(155, 110, 255)

--========================================================--
--                         TITRE
--========================================================--

local Title = Instance.new("TextLabel")
Title.Parent = Header

Title.Position = UDim2.new(0, 67, 0, 7)
Title.Size = UDim2.new(0, 200, 0, 27)

Title.BackgroundTransparency = 1
Title.Text = "LARKA HUB"

Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 21
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header

SubTitle.Position = UDim2.new(0, 68, 0, 32)
SubTitle.Size = UDim2.new(0, 200, 0, 18)

SubTitle.BackgroundTransparency = 1
SubTitle.Text = "LH • Script Hub"

SubTitle.TextColor3 = Color3.fromRGB(125, 125, 140)
SubTitle.TextSize = 11
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                     STATS FPS / PING
--========================================================--

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Parent = Header

StatsLabel.Position = UDim2.new(1, -205, 0, 11)
StatsLabel.Size = UDim2.new(0, 125, 0, 40)

StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "FPS: --   Ping: --"
StatsLabel.TextColor3 = Color3.fromRGB(150, 150, 165)
StatsLabel.TextSize = 11
StatsLabel.Font = Enum.Font.GothamMedium
StatsLabel.TextXAlignment = Enum.TextXAlignment.Right
StatsLabel.TextYAlignment = Enum.TextYAlignment.Center

--========================================================--
--                    MINIMIZE
--========================================================--

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = Header

MinimizeButton.Size = UDim2.new(0, 32, 0, 32)
MinimizeButton.Position = UDim2.new(1, -80, 0, 15)

MinimizeButton.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
MinimizeButton.BorderSizePixel = 0

MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(220, 220, 225)
MinimizeButton.TextSize = 17
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

--========================================================--
--                       FERMER
--========================================================--

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Header

CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Position = UDim2.new(1, -42, 0, 15)

CloseButton.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
CloseButton.BorderSizePixel = 0

CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(220, 220, 225)
CloseButton.TextSize = 21
CloseButton.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

--========================================================--
--                    BARRE RECHERCHE
--========================================================--

local SearchBox = Instance.new("TextBox")
SearchBox.Parent = Main

SearchBox.Position = UDim2.new(0, 15, 0, 74)
SearchBox.Size = UDim2.new(0, 200, 0, 36)

SearchBox.BackgroundColor3 = Color3.fromRGB(26, 26, 35)
SearchBox.BorderSizePixel = 0

SearchBox.PlaceholderText = "Rechercher un script..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)

SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(235, 235, 240)
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.Gotham

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 9)
SearchCorner.Parent = SearchBox

local SearchPadding = Instance.new("UIPadding")
SearchPadding.Parent = SearchBox
SearchPadding.PaddingLeft = UDim.new(0, 10)

--========================================================--
--                    LISTE DES SCRIPTS
--========================================================--

local ScriptList = Instance.new("ScrollingFrame")
ScriptList.Parent = Main

ScriptList.Position = UDim2.new(0, 15, 0, 118)
ScriptList.Size = UDim2.new(0, 200, 0, 185)

ScriptList.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
ScriptList.BorderSizePixel = 0

ScriptList.ScrollBarThickness = 3
ScriptList.ScrollBarImageColor3 = Color3.fromRGB(105, 70, 190)

ScriptList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 10)
ListCorner.Parent = ScriptList

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScriptList
ListLayout.Padding = UDim.new(0, 5)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ListPadding = Instance.new("UIPadding")
ListPadding.Parent = ScriptList

ListPadding.PaddingTop = UDim.new(0, 7)
ListPadding.PaddingLeft = UDim.new(0, 7)
ListPadding.PaddingRight = UDim.new(0, 7)

--========================================================--
--                    PANNEAU DROIT
--========================================================--

local Details = Instance.new("Frame")
Details.Parent = Main

Details.Position = UDim2.new(0, 230, 0, 74)
Details.Size = UDim2.new(1, -245, 0, 229)

Details.BackgroundColor3 = Color3.fromRGB(23, 23, 31)
Details.BorderSizePixel = 0

local DetailsCorner = Instance.new("UICorner")
DetailsCorner.CornerRadius = UDim.new(0, 11)
DetailsCorner.Parent = Details

local DetailsStroke = Instance.new("UIStroke")
DetailsStroke.Parent = Details
DetailsStroke.Thickness = 1
DetailsStroke.Color = Color3.fromRGB(40, 40, 52)

--========================================================--
--                     NOM SCRIPT
--========================================================--

local SelectedName = Instance.new("TextLabel")
SelectedName.Parent = Details

SelectedName.Position = UDim2.new(0, 18, 0, 18)
SelectedName.Size = UDim2.new(1, -36, 0, 35)

SelectedName.BackgroundTransparency = 1
SelectedName.Text = SelectedScript.Name

SelectedName.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedName.TextSize = 20
SelectedName.Font = Enum.Font.GothamBold
SelectedName.TextXAlignment = Enum.TextXAlignment.Left
SelectedName.TextWrapped = true

--========================================================--
--                    DESCRIPTION
--========================================================--

local SelectedDescription = Instance.new("TextLabel")
SelectedDescription.Parent = Details

SelectedDescription.Position = UDim2.new(0, 18, 0, 60)
SelectedDescription.Size = UDim2.new(1, -36, 0, 70)

SelectedDescription.BackgroundTransparency = 1
SelectedDescription.Text = SelectedScript.Description

SelectedDescription.TextColor3 = Color3.fromRGB(145, 145, 155)
SelectedDescription.TextSize = 12
SelectedDescription.Font = Enum.Font.Gotham

SelectedDescription.TextWrapped = true
SelectedDescription.TextXAlignment = Enum.TextXAlignment.Left
SelectedDescription.TextYAlignment = Enum.TextYAlignment.Top

--========================================================--
--                     EXECUTE
--========================================================--

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = Details

ExecuteButton.Position = UDim2.new(0, 18, 1, -58)
ExecuteButton.Size = UDim2.new(1, -36, 0, 42)

ExecuteButton.BackgroundColor3 = Color3.fromRGB(105, 65, 210)
ExecuteButton.BorderSizePixel = 0

ExecuteButton.Text = "EXECUTE"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)

ExecuteButton.TextSize = 14
ExecuteButton.Font = Enum.Font.GothamBold

local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 9)
ExecuteCorner.Parent = ExecuteButton

--========================================================--
--                     UNLOAD
--========================================================--

local UnloadButton = Instance.new("TextButton")
UnloadButton.Parent = Main

UnloadButton.Position = UDim2.new(0, 15, 1, -38)
UnloadButton.Size = UDim2.new(0, 200, 0, 28)

UnloadButton.BackgroundColor3 = Color3.fromRGB(38, 25, 30)
UnloadButton.BorderSizePixel = 0

UnloadButton.Text = "UNLOAD"
UnloadButton.TextColor3 = Color3.fromRGB(235, 120, 130)
UnloadButton.TextSize = 10
UnloadButton.Font = Enum.Font.GothamBold

local UnloadCorner = Instance.new("UICorner")
UnloadCorner.CornerRadius = UDim.new(0, 7)
UnloadCorner.Parent = UnloadButton

--========================================================--
--                RAFRAÎCHIR LA LISTE
--========================================================--

local function UpdateCanvas()

    task.wait()

    ScriptList.CanvasSize = UDim2.new(
        0,
        0,
        0,
        ListLayout.AbsoluteContentSize.Y + 15
    )

end

--========================================================--
--                  SÉLECTION SCRIPT
--========================================================--

local function SelectScript(scriptData)

    SelectedScript = scriptData

    SelectedName.Text = scriptData.Name
    SelectedDescription.Text = scriptData.Description

end

--========================================================--
--                   CRÉER UN ITEM
--========================================================--

local function CreateScriptButton(scriptData)

    local Button = Instance.new("TextButton")
    Button.Parent = ScriptList

    Button.Size = UDim2.new(1, 0, 0, 38)

    Button.BackgroundColor3 = Color3.fromRGB(29, 29, 38)
    Button.BorderSizePixel = 0

    Button.Text = scriptData.Name

    Button.TextColor3 = Color3.fromRGB(205, 205, 215)
    Button.TextSize = 11
    Button.Font = Enum.Font.GothamMedium

    Button.TextXAlignment = Enum.TextXAlignment.Left

    local Padding = Instance.new("UIPadding")
    Padding.Parent = Button
    Padding.PaddingLeft = UDim.new(0, 10)

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    Connect(Button.MouseButton1Click, function()

        SelectScript(scriptData)

    end)

    return Button

end

--========================================================--
--                 CONSTRUIRE LA LISTE
--========================================================--

local function BuildList(filter)

    for _, child in ipairs(ScriptList:GetChildren()) do

        if child:IsA("TextButton") then
            child:Destroy()
        end

    end

    filter = string.lower(filter or "")

    for _, scriptData in ipairs(Scripts) do

        local nameMatch =
            string.find(
                string.lower(scriptData.Name),
                filter,
                1,
                true
            )

        if filter == "" or nameMatch then

            CreateScriptButton(scriptData)

        end

    end

    UpdateCanvas()

end

BuildList("")

--========================================================--
--                      RECHERCHE
--========================================================--

Connect(SearchBox:GetPropertyChangedSignal("Text"), function()

    BuildList(SearchBox.Text)

end)

--========================================================--
--                      EXECUTE
--========================================================--

Connect(ExecuteButton.MouseButton1Click, function()

    if not SelectedScript.URL
    or SelectedScript.URL == "" then

        ExecuteButton.Text = "LIEN MANQUANT"

        task.wait(1)

        if not Unloaded then
            ExecuteButton.Text = "EXECUTE"
        end

        return

    end

    ExecuteButton.Text = "LOADING..."

    task.spawn(function()

        local success, errorMessage = pcall(function()

            local Source = game:HttpGet(
                SelectedScript.URL
            )

            local Function = loadstring(Source)

            if not Function then
                error("Impossible de charger le script.")
            end

            Function()

        end)

        if Unloaded then
            return
        end

        if success then

            ExecuteButton.Text = "LOADED ✓"

        else

            ExecuteButton.Text = "ERROR"

            warn(
                "LH Hub : "
                .. tostring(errorMessage)
            )

        end

        task.wait(1)

        if not Unloaded then
            ExecuteButton.Text = "EXECUTE"
        end

    end)

end)

--========================================================--
--                 MINIMIZE / FERMER
--========================================================--

Connect(MinimizeButton.MouseButton1Click, function()

    Main.Visible = false

end)

Connect(CloseButton.MouseButton1Click, function()

    Main.Visible = false

end)

--========================================================--
--                     TOGGLE HUB
--========================================================--

local function ToggleHub()

    Main.Visible = not Main.Visible

end

--========================================================--
--             BOUTON FLOTTANT DÉPLAÇABLE
--========================================================--

local FloatingDragging = false
local FloatingDragStart
local FloatingStartPosition
local FloatingMoved = false

Connect(FloatingButton.InputBegan, function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        FloatingDragging = true
        FloatingMoved = false

        FloatingDragStart = input.Position
        FloatingStartPosition = FloatingButton.Position

    end

end)

Connect(FloatingButton.InputChanged, function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        if FloatingDragging then

            local delta =
                input.Position - FloatingDragStart

            if math.abs(delta.X) > 5
            or math.abs(delta.Y) > 5 then

                FloatingMoved = true

            end

            FloatingButton.Position = UDim2.new(
                FloatingStartPosition.X.Scale,
                FloatingStartPosition.X.Offset + delta.X,

                FloatingStartPosition.Y.Scale,
                FloatingStartPosition.Y.Offset + delta.Y
            )

        end

    end

end)

Connect(FloatingButton.InputEnded, function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        FloatingDragging = false

        if not FloatingMoved then
            ToggleHub()
        end

    end

end)

--========================================================--
--             FENÊTRE PRINCIPALE DÉPLAÇABLE
--========================================================--

local MainDragging = false
local MainDragStart
local MainStartPosition

Connect(Header.InputBegan, function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        MainDragging = true

        MainDragStart = input.Position
        MainStartPosition = Main.Position

    end

end)

Connect(Header.InputEnded, function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        MainDragging = false

    end

end)

Connect(UserInputService.InputChanged, function(input)

    if not MainDragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        local delta =
            input.Position - MainDragStart

        Main.Position = UDim2.new(
            MainStartPosition.X.Scale,
            MainStartPosition.X.Offset + delta.X,

            MainStartPosition.Y.Scale,
            MainStartPosition.Y.Offset + delta.Y
        )

    end

end)

--========================================================--
--                       FPS
--========================================================--

local FPS = 0
local Frames = 0
local LastFPSUpdate = tick()

Connect(RunService.RenderStepped, function()

    Frames = Frames + 1

    local CurrentTime = tick()

    if CurrentTime - LastFPSUpdate >= 1 then

        FPS = Frames
        Frames = 0
        LastFPSUpdate = CurrentTime

    end

end)

--========================================================--
--                       FPS / PING
--========================================================--

task.spawn(function()

    while not Unloaded do

        local Ping = "?"

        pcall(function()

            local NetworkStats =
                Stats.Network.ServerStatsItem["Data Ping"]

            local PingValue =
                NetworkStats:GetValue()

            Ping = math.floor(PingValue) .. "ms"

        end)

        StatsLabel.Text =
            "FPS: "
            .. tostring(FPS)
            .. "   Ping: "
            .. tostring(Ping)

        task.wait(0.5)

    end

end)

--========================================================--
--                         UNLOAD
--========================================================--

local function UnloadHub()

    if Unloaded then
        return
    end

    Unloaded = true

    -- Déconnecter toutes les connexions
    for _, connection in ipairs(Connections) do

        pcall(function()
            connection:Disconnect()
        end)

    end

    table.clear(Connections)

    -- Supprimer complètement l'interface
    pcall(function()
        ScreenGui:Destroy()
    end)

    print("LH Hub unloaded.")

end

Connect(UnloadButton.MouseButton1Click, function()

    UnloadButton.Text = "UNLOADING..."

    task.wait(0.2)

    UnloadHub()

end)

--========================================================--
--                          FIN
--========================================================--

print("LH HUB chargé !")
