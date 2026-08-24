--========================================================--
--                      LARKA HUB
--========================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--========================================================--
--                      LIENS RAW
--========================================================--

local MACRO_URL =
    "https://raw.githubusercontent.com/larka69k/larka-hub/main/MacroSandNoobIncremental.lua"

local SCRIPT_2_URL = ""
local SCRIPT_3_URL = ""

--========================================================--
--                     VARIABLES
--========================================================--

local currentURL = MACRO_URL
local currentName = "Macro Sand Noob Inc"

--========================================================--
--                       GUI
--========================================================--

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LarkaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = gethui()
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
end

--========================================================--
--                  BOUTON MINI
--========================================================--

local MiniButton = Instance.new("TextButton")
MiniButton.Parent = ScreenGui
MiniButton.Size = UDim2.new(0, 55, 0, 55)
MiniButton.Position = UDim2.new(0, 20, 0.5, -27)
MiniButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MiniButton.BorderSizePixel = 0
MiniButton.Text = "L"
MiniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniButton.TextSize = 24
MiniButton.Font = Enum.Font.GothamBold
MiniButton.Visible = false
MiniButton.ZIndex = 10

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MiniButton

--========================================================--
--                  FENÊTRE PRINCIPALE
--========================================================--

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 470, 0, 350)
Main.Position = UDim2.new(0.5, -235, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 27)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

--========================================================--
--                       BARRE DU HAUT
--========================================================--

local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1, 0, 0, 65)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent = TopBar

--========================================================--
--                         TITRE
--========================================================--

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Position = UDim2.new(0, 20, 0, 8)
Title.Size = UDim2.new(1, -90, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "LARKA HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 23
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = TopBar
SubTitle.Position = UDim2.new(0, 20, 0, 35)
SubTitle.Size = UDim2.new(1, -90, 0, 20)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Script Hub"
SubTitle.TextColor3 = Color3.fromRGB(145, 145, 155)
SubTitle.TextSize = 12
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                    BOUTON MASQUER
--========================================================--

local HideButton = Instance.new("TextButton")
HideButton.Parent = TopBar
HideButton.Size = UDim2.new(0, 40, 0, 40)
HideButton.Position = UDim2.new(1, -50, 0, 12)
HideButton.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
HideButton.BorderSizePixel = 0
HideButton.Text = "−"
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.TextSize = 24
HideButton.Font = Enum.Font.GothamBold

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 10)
HideCorner.Parent = HideButton

--========================================================--
--                       ONGLET
--========================================================--

local Tabs = Instance.new("Frame")
Tabs.Parent = Main
Tabs.Position = UDim2.new(0, 15, 0, 80)
Tabs.Size = UDim2.new(1, -30, 0, 45)
Tabs.BackgroundTransparency = 1

local function createTab(text, x)

    local Button = Instance.new("TextButton")
    Button.Parent = Tabs
    Button.Position = UDim2.new(0, x, 0, 0)
    Button.Size = UDim2.new(0, 135, 0, 42)

    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 46)
    Button.BorderSizePixel = 0

    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(205, 205, 215)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamBold

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Button

    return Button
end

local MacroTab = createTab(
    "Macro Sand Noob Inc",
    0
)

local Script2Tab = createTab(
    "Script 2",
    145
)

local Script3Tab = createTab(
    "Script 3",
    290
)

--========================================================--
--                       CONTENU
--========================================================--

local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0, 15, 0, 140)
Content.Size = UDim2.new(1, -30, 0, 190)
Content.BackgroundColor3 = Color3.fromRGB(27, 27, 36)
Content.BorderSizePixel = 0

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 12)
ContentCorner.Parent = Content

--========================================================--
--                    NOM DU SCRIPT
--========================================================--

local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Parent = Content
ScriptTitle.Position = UDim2.new(0, 20, 0, 18)
ScriptTitle.Size = UDim2.new(1, -40, 0, 30)

ScriptTitle.BackgroundTransparency = 1
ScriptTitle.Text = "Macro Sand Noob Inc"
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextSize = 19
ScriptTitle.Font = Enum.Font.GothamBold
ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                    DESCRIPTION
--========================================================--

local Description = Instance.new("TextLabel")
Description.Parent = Content
Description.Position = UDim2.new(0, 20, 0, 48)
Description.Size = UDim2.new(1, -40, 0, 25)

Description.BackgroundTransparency = 1
Description.Text = "Macro automatique"
Description.TextColor3 = Color3.fromRGB(145, 145, 155)
Description.TextSize = 12
Description.Font = Enum.Font.Gotham
Description.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                     BOUTON LOAD
--========================================================--

local LoadButton = Instance.new("TextButton")
LoadButton.Parent = Content
LoadButton.Position = UDim2.new(0, 20, 0, 90)
LoadButton.Size = UDim2.new(1, -40, 0, 55)

LoadButton.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
LoadButton.BorderSizePixel = 0

LoadButton.Text = "CHARGER"
LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.TextSize = 16
LoadButton.Font = Enum.Font.GothamBold

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 10)
LoadCorner.Parent = LoadButton

--========================================================--
--                   CHARGEMENT
--========================================================--

local function loadScript(url)

    if url == nil or url == "" then

        LoadButton.Text = "LIEN MANQUANT"

        task.wait(1)

        LoadButton.Text = "CHARGER"

        return
    end

    LoadButton.Text = "CHARGEMENT..."

    local success, errorMessage = pcall(function()

        local source = game:HttpGet(url)
        local func = loadstring(source)

        if func then
            func()
        else
            error("Impossible de compiler le script.")
        end

    end)

    if success then

        LoadButton.Text = "CHARGÉ !"

    else

        LoadButton.Text = "ERREUR"

        warn(
            "Larka Hub : "
            .. tostring(errorMessage)
        )

    end

    task.wait(1)

    LoadButton.Text = "CHARGER"

end

--========================================================--
--                    ONGLET MACRO
--========================================================--

MacroTab.MouseButton1Click:Connect(function()

    currentURL = MACRO_URL
    currentName = "Macro Sand Noob Inc"

    ScriptTitle.Text = currentName
    Description.Text = "Macro automatique"

end)

--========================================================--
--                    ONGLET SCRIPT 2
--========================================================--

Script2Tab.MouseButton1Click:Connect(function()

    currentURL = SCRIPT_2_URL
    currentName = "Script 2"

    ScriptTitle.Text = currentName
    Description.Text = "Script 2"

end)

--========================================================--
--                    ONGLET SCRIPT 3
--========================================================--

Script3Tab.MouseButton1Click:Connect(function()

    currentURL = SCRIPT_3_URL
    currentName = "Script 3"

    ScriptTitle.Text = currentName
    Description.Text = "Script 3"

end)

--========================================================--
--                    BOUTON CHARGER
--========================================================--

LoadButton.MouseButton1Click:Connect(function()

    task.spawn(function()
        loadScript(currentURL)
    end)

end)

--========================================================--
--                 MASQUER LE HUB
--========================================================--

HideButton.MouseButton1Click:Connect(function()

    Main.Visible = false
    MiniButton.Visible = true

end)

--========================================================--
--                AFFICHER LE HUB
--========================================================--

MiniButton.MouseButton1Click:Connect(function()

    MiniButton.Visible = false
    Main.Visible = true

end)

--========================================================--
--                    FENÊTRE MOBILE
--========================================================--

local dragging = false
local dragStart
local startPosition

TopBar.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Main.Position

    end

end)

TopBar.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false

    end

end)

UserInputService.InputChanged:Connect(function(input)

    if not dragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,

            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )

    end

end)

--========================================================--
--                         FIN
--========================================================--

print("LARKA HUB chargé avec succès.")
