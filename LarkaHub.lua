--========================================================--
--                         LH HUB
--                    Core Edition
--========================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer

--========================================================--
--                         CORE
--========================================================--

local CORE_URL =
    "https://raw.githubusercontent.com/larka69k/larka-hub/main/Core.lua"

local Core

local CoreLoaded, CoreError = pcall(function()

    local Source = game:HttpGet(CORE_URL)
    local Loader = loadstring(Source)

    if not Loader then
        error("Impossible de charger Core.lua")
    end

    Core = Loader()

end)

if not CoreLoaded or not Core then

    warn("[LH HUB] Impossible de charger Core.lua")
    warn(CoreError)

    return

end

--========================================================--
--                         SETTINGS
--========================================================--

local Settings = Core.Settings
local UniversalSettings = Core.Universal
local GameSettings = Core.Game

--========================================================--
--                         THEME
--========================================================--

local ThemeName = "Blue"

local Themes = {

    Blue = {
        Main = Color3.fromRGB(45, 100, 220),
        Secondary = Color3.fromRGB(25, 55, 130),
        Accent = Color3.fromRGB(80, 140, 255)
    },

    Purple = {
        Main = Color3.fromRGB(125, 70, 220),
        Secondary = Color3.fromRGB(70, 35, 140),
        Accent = Color3.fromRGB(170, 110, 255)
    },

    Red = {
        Main = Color3.fromRGB(210, 55, 65),
        Secondary = Color3.fromRGB(120, 25, 35),
        Accent = Color3.fromRGB(255, 90, 100)
    },

    Green = {
        Main = Color3.fromRGB(45, 180, 100),
        Secondary = Color3.fromRGB(20, 100, 55),
        Accent = Color3.fromRGB(80, 230, 140)
    },

    Cyan = {
        Main = Color3.fromRGB(35, 175, 200),
        Secondary = Color3.fromRGB(20, 90, 110),
        Accent = Color3.fromRGB(80, 220, 240)
    },

    Orange = {
        Main = Color3.fromRGB(220, 120, 40),
        Secondary = Color3.fromRGB(125, 60, 20),
        Accent = Color3.fromRGB(255, 165, 70)
    },

    Pink = {
        Main = Color3.fromRGB(220, 70, 150),
        Secondary = Color3.fromRGB(125, 30, 85),
        Accent = Color3.fromRGB(255, 110, 190)
    },

    White = {
        Main = Color3.fromRGB(180, 180, 190),
        Secondary = Color3.fromRGB(90, 90, 100),
        Accent = Color3.fromRGB(235, 235, 240)
    }

}

local Colors = Themes[ThemeName] or Themes.Blue

--========================================================--
--                         SCRIPTS
--========================================================--

local UniversalScripts = {

    {
        Name = "Universal Script 1",
        Description = "Fonction universelle.",
        URL = ""
    },

    {
        Name = "Universal Script 2",
        Description = "Fonction universelle.",
        URL = ""
    }

}

local GameScripts = {

    {
        Name = "Noob Inc",
        Description = "Macro automatique pour Sand Noob Incremental.",
        URL = "https://raw.githubusercontent.com/larka69k/larka-hub/main/MacroSandNoobIncremental.lua"
    },

    {
        Name = "Game Script 2",
        Description = "Fonction spécifique au jeu.",
        URL = ""
    }

}

--========================================================--
--                         VARIABLES
--========================================================--

local Connections = {}
local Unloaded = false

local SelectedScript = nil
local CurrentCategory = "HOME"

local function Connect(signal, callback)

    local connection = signal:Connect(callback)

    table.insert(Connections, connection)

    return connection

end

--========================================================--
--                           GUI
--========================================================--

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "LarkaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = gethui()
end)

if not ScreenGui.Parent then
    ScreenGui.Parent =
        Player:WaitForChild("PlayerGui")
end

--========================================================--
--                    BOUTON FLOTTANT
--========================================================--

local FloatingButton = Instance.new("TextButton")

FloatingButton.Parent = ScreenGui
FloatingButton.Size = UDim2.fromOffset(56, 56)
FloatingButton.Position =
    UDim2.new(0, 20, 0.5, -28)

FloatingButton.BackgroundColor3 =
    Color3.fromRGB(10, 25, 55)

FloatingButton.BorderSizePixel = 0

FloatingButton.Text = "LH"

FloatingButton.TextColor3 =
    Color3.fromRGB(170, 175, 185)

FloatingButton.TextSize = 19
FloatingButton.Font = Enum.Font.GothamBold

FloatingButton.AutoButtonColor = false
FloatingButton.ZIndex = 20

local FloatingCorner =
    Instance.new("UICorner")

FloatingCorner.CornerRadius =
    UDim.new(1, 0)

FloatingCorner.Parent =
    FloatingButton

local FloatingStroke =
    Instance.new("UIStroke")

FloatingStroke.Parent =
    FloatingButton

FloatingStroke.Thickness = 2
FloatingStroke.Color =
    Colors.Accent

--========================================================--
--                    FENÊTRE PRINCIPALE
--========================================================--

local Main = Instance.new("Frame")

Main.Parent = ScreenGui

Main.Size =
    UDim2.fromOffset(570, 390)

Main.Position =
    UDim2.new(0.5, -285, 0.5, -195)

Main.BackgroundColor3 =
    Color3.fromRGB(14, 14, 20)

Main.BorderSizePixel = 0

local MainCorner =
    Instance.new("UICorner")

MainCorner.CornerRadius =
    UDim.new(0, 16)

MainCorner.Parent = Main

local MainStroke =
    Instance.new("UIStroke")

MainStroke.Parent = Main

MainStroke.Thickness = 1
MainStroke.Color =
    Colors.Secondary

--========================================================--
--                         HEADER
--========================================================--

local Header = Instance.new("Frame")

Header.Parent = Main

Header.Size =
    UDim2.new(1, 0, 0, 65)

Header.BackgroundColor3 =
    Color3.fromRGB(22, 22, 30)

Header.BorderSizePixel = 0

local HeaderCorner =
    Instance.new("UICorner")

HeaderCorner.CornerRadius =
    UDim.new(0, 16)

HeaderCorner.Parent = Header

--========================================================--
--                         LOGO
--========================================================--

local Logo = Instance.new("TextLabel")

Logo.Parent = Header

Logo.Position =
    UDim2.fromOffset(16, 11)

Logo.Size =
    UDim2.fromOffset(42, 42)

Logo.BackgroundColor3 =
    Colors.Main

Logo.BorderSizePixel = 0

Logo.Text = "LH"

Logo.TextColor3 =
    Color3.fromRGB(255, 255, 255)

Logo.TextSize = 13
Logo.Font = Enum.Font.GothamBold

local LogoCorner =
    Instance.new("UICorner")

LogoCorner.CornerRadius =
    UDim.new(0, 11)

LogoCorner.Parent = Logo

--========================================================--
--                         TITRE
--========================================================--

local Title = Instance.new("TextLabel")

Title.Parent = Header

Title.Position =
    UDim2.fromOffset(70, 8)

Title.Size =
    UDim2.fromOffset(200, 27)

Title.BackgroundTransparency = 1

Title.Text = "LARKA HUB"

Title.TextColor3 =
    Color3.fromRGB(255, 255, 255)

Title.TextSize = 21
Title.Font = Enum.Font.GothamBold

Title.TextXAlignment =
    Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")

SubTitle.Parent = Header

SubTitle.Position =
    UDim2.fromOffset(71, 34)

SubTitle.Size =
    UDim2.fromOffset(250, 18)

SubTitle.BackgroundTransparency = 1

SubTitle.Text = "LH • Script Hub"

SubTitle.TextColor3 =
    Color3.fromRGB(125, 125, 140)

SubTitle.TextSize = 11
SubTitle.Font = Enum.Font.Gotham

SubTitle.TextXAlignment =
    Enum.TextXAlignment.Left

--========================================================--
--                         STATS
--========================================================--

local StatsLabel = Instance.new("TextLabel")

StatsLabel.Parent = Header

StatsLabel.Position =
    UDim2.new(1, -245, 0, 16)

StatsLabel.Size =
    UDim2.fromOffset(145, 30)

StatsLabel.BackgroundTransparency = 1

StatsLabel.Text =
    "FPS: --  |  Ping: --"

StatsLabel.TextColor3 =
    Color3.fromRGB(155, 155, 165)

StatsLabel.TextSize = 11
StatsLabel.Font =
    Enum.Font.GothamMedium

StatsLabel.TextXAlignment =
    Enum.TextXAlignment.Right

--========================================================--
--                         SETTINGS
--========================================================--

local SettingsButton =
    Instance.new("TextButton")

SettingsButton.Parent = Header

SettingsButton.Size =
    UDim2.fromOffset(32, 32)

SettingsButton.Position =
    UDim2.new(1, -115, 0, 16)

SettingsButton.BackgroundColor3 =
    Color3.fromRGB(38, 38, 48)

SettingsButton.BorderSizePixel = 0

SettingsButton.Text = "⚙"

SettingsButton.TextColor3 =
    Color3.fromRGB(220, 220, 225)

SettingsButton.TextSize = 17
SettingsButton.Font =
    Enum.Font.GothamBold

local SettingsCorner =
    Instance.new("UICorner")

SettingsCorner.CornerRadius =
    UDim.new(0, 8)

SettingsCorner.Parent =
    SettingsButton

--========================================================--
--                         MINIMIZE
--========================================================--

local MinimizeButton =
    Instance.new("TextButton")

MinimizeButton.Parent = Header

MinimizeButton.Size =
    UDim2.fromOffset(32, 32)

MinimizeButton.Position =
    UDim2.new(1, -80, 0, 16)

MinimizeButton.BackgroundColor3 =
    Color3.fromRGB(38, 38, 48)

MinimizeButton.BorderSizePixel = 0

MinimizeButton.Text = "—"

MinimizeButton.TextColor3 =
    Color3.fromRGB(220, 220, 225)

MinimizeButton.TextSize = 17
MinimizeButton.Font =
    Enum.Font.GothamBold

local MinimizeCorner =
    Instance.new("UICorner")

MinimizeCorner.CornerRadius =
    UDim.new(0, 8)

MinimizeCorner.Parent =
    MinimizeButton

--========================================================--
--                         CLOSE
--========================================================--

local CloseButton =
    Instance.new("TextButton")

CloseButton.Parent = Header

CloseButton.Size =
    UDim2.fromOffset(32, 32)

CloseButton.Position =
    UDim2.new(1, -42, 0, 16)

CloseButton.BackgroundColor3 =
    Color3.fromRGB(38, 38, 48)

CloseButton.BorderSizePixel = 0

CloseButton.Text = "×"

CloseButton.TextColor3 =
    Color3.fromRGB(220, 220, 225)

CloseButton.TextSize = 21
CloseButton.Font =
    Enum.Font.GothamBold

local CloseCorner =
    Instance.new("UICorner")

CloseCorner.CornerRadius =
    UDim.new(0, 8)

CloseCorner.Parent = CloseButton

--========================================================--
--                         CONTENT
--========================================================--

local Content = Instance.new("Frame")

Content.Parent = Main

Content.Position =
    UDim2.fromOffset(0, 65)

Content.Size =
    UDim2.new(1, 0, 1, -65)

Content.BackgroundTransparency = 1

--========================================================--
--                         HOME
--========================================================--

local HomePage = Instance.new("Frame")

HomePage.Parent = Content

HomePage.Size =
    UDim2.new(1, 0, 1, 0)

HomePage.BackgroundTransparency = 1

--========================================================--
--                         SIDEBAR
--========================================================--

local Sidebar = Instance.new("Frame")

Sidebar.Parent = Content

Sidebar.Size =
    UDim2.fromOffset(190, 1)

Sidebar.Position =
    UDim2.fromOffset(12, 12)

Sidebar.BackgroundColor3 =
    Color3.fromRGB(19, 19, 26)

Sidebar.BorderSizePixel = 0

local SidebarCorner =
    Instance.new("UICorner")

SidebarCorner.CornerRadius =
    UDim.new(0, 11)

SidebarCorner.Parent = Sidebar

local SidebarLayout =
    Instance.new("UIListLayout")

SidebarLayout.Parent = Sidebar

SidebarLayout.Padding =
    UDim.new(0, 5)

SidebarLayout.SortOrder =
    Enum.SortOrder.LayoutOrder

local SidebarPadding =
    Instance.new("UIPadding")

SidebarPadding.Parent = Sidebar

SidebarPadding.PaddingTop =
    UDim.new(0, 7)

SidebarPadding.PaddingLeft =
    UDim.new(0, 7)

SidebarPadding.PaddingRight =
    UDim.new(0, 7)

--========================================================--
--                    MAIN PAGE AREA
--========================================================--

local PageArea = Instance.new("Frame")

PageArea.Parent = Content

PageArea.Position =
    UDim2.fromOffset(212, 12)

PageArea.Size =
    UDim2.new(1, -224, 1, -24)

PageArea.BackgroundColor3 =
    Color3.fromRGB(23, 23, 31)

PageArea.BorderSizePixel = 0

local PageCorner =
    Instance.new("UICorner")

PageCorner.CornerRadius =
    UDim.new(0, 11)

PageCorner.Parent = PageArea

--========================================================--
--                    PAGE TITLE
--========================================================--

local PageTitle =
    Instance.new("TextLabel")

PageTitle.Parent = PageArea

PageTitle.Position =
    UDim2.fromOffset(18, 18)

PageTitle.Size =
    UDim2.new(1, -36, 0, 35)

PageTitle.BackgroundTransparency = 1

PageTitle.Text = "HOME"

PageTitle.TextColor3 =
    Color3.fromRGB(255, 255, 255)

PageTitle.TextSize = 20
PageTitle.Font =
    Enum.Font.GothamBold

PageTitle.TextXAlignment =
    Enum.TextXAlignment.Left

--========================================================--
--                    PAGE DESCRIPTION
--========================================================--

local PageDescription =
    Instance.new("TextLabel")

PageDescription.Parent = PageArea

PageDescription.Position =
    UDim2.fromOffset(18, 60)

PageDescription.Size =
    UDim2.new(1, -36, 0, 80)

PageDescription.BackgroundTransparency = 1

PageDescription.Text =
    "Bienvenue dans Larka Hub.\n\nSélectionne une catégorie pour accéder aux fonctions disponibles."

PageDescription.TextColor3 =
    Color3.fromRGB(145, 145, 155)

PageDescription.TextSize = 12

PageDescription.Font =
    Enum.Font.Gotham

PageDescription.TextWrapped = true

PageDescription.TextXAlignment =
    Enum.TextXAlignment.Left

PageDescription.TextYAlignment =
    Enum.TextYAlignment.Top

--========================================================--
--                    CATEGORY SYSTEM
--========================================================--

local Categories = {}

local function CreateCategory(Name, Scripts, Order)

    local Category = {}

    Category.Name = Name
    Category.Open = true
    Category.Scripts = Scripts

    -- HEADER

    local HeaderButton =
        Instance.new("TextButton")

    HeaderButton.Parent = Sidebar

    HeaderButton.Size =
        UDim2.new(1, 0, 0, 38)

    HeaderButton.BackgroundColor3 =
        Color3.fromRGB(29, 29, 38)

    HeaderButton.BorderSizePixel = 0

    HeaderButton.Text =
        "▼  " .. Name

    HeaderButton.TextColor3 =
        Color3.fromRGB(220, 220, 230)

    HeaderButton.TextSize = 12

    HeaderButton.Font =
        Enum.Font.GothamBold

    HeaderButton.TextXAlignment =
        Enum.TextXAlignment.Left

    HeaderButton.LayoutOrder =
        Order

    local HeaderPadding =
        Instance.new("UIPadding")

    HeaderPadding.Parent =
        HeaderButton

    HeaderPadding.PaddingLeft =
        UDim.new(0, 10)

    local HeaderCorner =
        Instance.new("UICorner")

    HeaderCorner.CornerRadius =
        UDim.new(0, 7)

    HeaderCorner.Parent =
        HeaderButton

    Category.Header = HeaderButton

    -- CONTAINER

    local Container =
        Instance.new("Frame")

    Container.Parent = Sidebar

    Container.Size =
        UDim2.new(1, 0, 0, 0)

    Container.BackgroundTransparency = 1

    Container.AutomaticSize =
        Enum.AutomaticSize.Y

    Container.LayoutOrder =
        Order + 1

    local ContainerLayout =
        Instance.new("UIListLayout")

    ContainerLayout.Parent =
        Container

    ContainerLayout.Padding =
        UDim.new(0, 4)

    Category.Container =
        Container

    -- TOGGLE

    Connect(
        HeaderButton.MouseButton1Click,
        function()

            Category.Open =
                not Category.Open

            Container.Visible =
                Category.Open

            if Category.Open then

                HeaderButton.Text =
                    "▼  " .. Name

            else

                HeaderButton.Text =
                    "▶  " .. Name

            end

        end
    )

    Categories[Name] =
        Category

    return Category

end

--========================================================--
--                         HOME BUTTON
--========================================================--

local HomeButton =
    Instance.new("TextButton")

HomeButton.Parent =
    Sidebar

HomeButton.Size =
    UDim2.new(1, 0, 0, 38)

HomeButton.BackgroundColor3 =
    Colors.Main

HomeButton.BorderSizePixel = 0

HomeButton.Text =
    "⌂  HOME"

HomeButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

HomeButton.TextSize = 12

HomeButton.Font =
    Enum.Font.GothamBold

HomeButton.TextXAlignment =
    Enum.TextXAlignment.Left

HomeButton.LayoutOrder = 1

local HomePadding =
    Instance.new("UIPadding")

HomePadding.Parent =
    HomeButton

HomePadding.PaddingLeft =
    UDim.new(0, 10)

local HomeCorner =
    Instance.new("UICorner")

HomeCorner.CornerRadius =
    UDim.new(0, 7)

HomeCorner.Parent =
    HomeButton

--========================================================--
--                    CREATE CATEGORIES
--========================================================--

local UniversalCategory =
    CreateCategory(
        "UNIVERSAL",
        UniversalScripts,
        10
    )

local GameCategory =
    CreateCategory(
        "GAME",
        GameScripts,
        20
    )

--========================================================--
--                    SCRIPT DETAILS
--========================================================--

local DetailsTitle =
    Instance.new("TextLabel")

DetailsTitle.Parent =
    PageArea

DetailsTitle.Position =
    UDim2.fromOffset(18, 155)

DetailsTitle.Size =
    UDim2.new(1, -36, 0, 30)

DetailsTitle.BackgroundTransparency = 1

DetailsTitle.Text =
    "Aucune fonction sélectionnée"

DetailsTitle.TextColor3 =
    Color3.fromRGB(230, 230, 235)

DetailsTitle.TextSize = 16

DetailsTitle.Font =
    Enum.Font.GothamBold

DetailsTitle.TextXAlignment =
    Enum.TextXAlignment.Left

--========================================================--
--                    DESCRIPTION
--========================================================--

local DetailsDescription =
    Instance.new("TextLabel")

DetailsDescription.Parent =
    PageArea

DetailsDescription.Position =
    UDim2.fromOffset(18, 190)

DetailsDescription.Size =
    UDim2.new(1, -36, 0, 55)

DetailsDescription.BackgroundTransparency = 1

DetailsDescription.Text =
    "Sélectionne une fonction dans UNIVERSAL ou GAME."

DetailsDescription.TextColor3 =
    Color3.fromRGB(145, 145, 155)

DetailsDescription.TextSize = 11

DetailsDescription.Font =
    Enum.Font.Gotham

DetailsDescription.TextWrapped = true

DetailsDescription.TextXAlignment =
    Enum.TextXAlignment.Left

DetailsDescription.TextYAlignment =
    Enum.TextYAlignment.Top

--========================================================--
--                         EXECUTE
--========================================================--

local ExecuteButton =
    Instance.new("TextButton")

ExecuteButton.Parent =
    PageArea

ExecuteButton.Position =
    UDim2.new(0, 18, 1, -55)

ExecuteButton.Size =
    UDim2.new(1, -36, 0, 38)

ExecuteButton.BackgroundColor3 =
    Colors.Main

ExecuteButton.BorderSizePixel = 0

ExecuteButton.Text =
    "EXECUTE"

ExecuteButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

ExecuteButton.TextSize = 12

ExecuteButton.Font =
    Enum.Font.GothamBold

local ExecuteCorner =
    Instance.new("UICorner")

ExecuteCorner.CornerRadius =
    UDim.new(0, 8)

ExecuteCorner.Parent =
    ExecuteButton

--========================================================--
--                    CREATE SCRIPT BUTTON
--========================================================--

local function CreateScriptButton(
    Category,
    ScriptData
)

    local Button =
        Instance.new("TextButton")

    Button.Parent =
        Category.Container

    Button.Size =
        UDim2.new(1, 0, 0, 32)

    Button.BackgroundColor3 =
        Color3.fromRGB(24, 24, 32)

    Button.BorderSizePixel = 0

    Button.Text =
        "•  " .. ScriptData.Name

    Button.TextColor3 =
        Color3.fromRGB(180, 180, 190)

    Button.TextSize = 10

    Button.Font =
        Enum.Font.GothamMedium

    Button.TextXAlignment =
        Enum.TextXAlignment.Left

    local Padding =
        Instance.new("UIPadding")

    Padding.Parent =
        Button

    Padding.PaddingLeft =
        UDim.new(0, 12)

    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(0, 6)

    Corner.Parent =
        Button

    Connect(
        Button.MouseButton1Click,
        function()

            SelectedScript =
                ScriptData

            CurrentCategory =
                Category.Name

            PageTitle.Text =
                Category.Name

            DetailsTitle.Text =
                ScriptData.Name

            DetailsDescription.Text =
                ScriptData.Description

            ExecuteButton.Text =
                "EXECUTE"

        end
    )

end

--========================================================--
--                    BUILD CATEGORIES
--========================================================--

for _, ScriptData in ipairs(
    UniversalScripts
) do

    CreateScriptButton(
        UniversalCategory,
        ScriptData
    )

end

for _, ScriptData in ipairs(
    GameScripts
) do

    CreateScriptButton(
        GameCategory,
        ScriptData
    )

end

--========================================================--
--                         HOME
--========================================================--

Connect(
    HomeButton.MouseButton1Click,
    function()

        SelectedScript = nil
        CurrentCategory = "HOME"

        PageTitle.Text =
            "HOME"

        DetailsTitle.Text =
            "Aucune fonction sélectionnée"

        DetailsDescription.Text =
            "Sélectionne une fonction dans UNIVERSAL ou GAME."

        ExecuteButton.Text =
            "EXECUTE"

    end
)

--========================================================--
--                         EXECUTE
--========================================================--

Connect(
    ExecuteButton.MouseButton1Click,
    function()

        if not SelectedScript then

            ExecuteButton.Text =
                "SELECT SCRIPT"

            task.wait(1)

            if not Unloaded then
                ExecuteButton.Text =
                    "EXECUTE"
            end

            return

        end

        if not SelectedScript.URL
        or SelectedScript.URL == "" then

            ExecuteButton.Text =
                "LIEN MANQUANT"

            task.wait(1)

            if not Unloaded then
                ExecuteButton.Text =
                    "EXECUTE"
            end

            return

        end

        ExecuteButton.Text =
            "LOADING..."

        task.spawn(function()

            local Success, ErrorMessage =
                pcall(function()

                    local Source =
                        game:HttpGet(
                            SelectedScript.URL
                        )

                    local Loader =
                        loadstring(Source)

                    if not Loader then
                        error(
                            "Impossible de charger le script."
                        )
                    end

                    Loader()

                end)

            if Unloaded then
                return
            end

            if Success then

                ExecuteButton.Text =
                    "LOADED ✓"

            else

                ExecuteButton.Text =
                    "ERROR"

                warn(
                    "[LH HUB] "
                    .. tostring(ErrorMessage)
                )

            end

            task.wait(1)

            if not Unloaded then
                ExecuteButton.Text =
                    "EXECUTE"
            end

        end)

    end
)

--========================================================--
--                         SETTINGS
--========================================================--

local SettingsPanel =
    Instance.new("Frame")

SettingsPanel.Parent =
    Main

SettingsPanel.Visible = false

SettingsPanel.Position =
    UDim2.fromOffset(15, 77)

SettingsPanel.Size =
    UDim2.new(1, -30, 1, -92)

SettingsPanel.BackgroundColor3 =
    Color3.fromRGB(20, 20, 28)

SettingsPanel.BorderSizePixel = 0

SettingsPanel.ZIndex = 10

local SettingsCorner =
    Instance.new("UICorner")

SettingsCorner.CornerRadius =
    UDim.new(0, 12)

SettingsCorner.Parent =
    SettingsPanel

local SettingsTitle =
    Instance.new("TextLabel")

SettingsTitle.Parent =
    SettingsPanel

SettingsTitle.Position =
    UDim2.fromOffset(18, 16)

SettingsTitle.Size =
    UDim2.new(1, -36, 0, 30)

SettingsTitle.BackgroundTransparency = 1

SettingsTitle.Text =
    "SETTINGS"

SettingsTitle.TextColor3 =
    Color3.fromRGB(255, 255, 255)

SettingsTitle.TextSize = 19

SettingsTitle.Font =
    Enum.Font.GothamBold

SettingsTitle.TextXAlignment =
    Enum.TextXAlignment.Left

--========================================================--
--                         THEMES
--========================================================--

local ThemeLabel =
    Instance.new("TextLabel")

ThemeLabel.Parent =
    SettingsPanel

ThemeLabel.Position =
    UDim2.fromOffset(18, 57)

ThemeLabel.Size =
    UDim2.new(1, -36, 0, 25)

ThemeLabel.BackgroundTransparency = 1

ThemeLabel.Text =
    "Couleur du Hub"

ThemeLabel.TextColor3 =
    Color3.fromRGB(180, 180, 190)

ThemeLabel.TextSize = 12

ThemeLabel.Font =
    Enum.Font.GothamMedium

ThemeLabel.TextXAlignment =
    Enum.TextXAlignment.Left

local ThemeButtons = {}

local ThemeOrder = {
    "Blue",
    "Purple",
    "Red",
    "Green",
    "Cyan",
    "Orange",
    "Pink",
    "White"
}

local function ApplyTheme(Name)

    local Theme =
        Themes[Name]

    if not Theme then
        return
    end

    ThemeName =
        Name

    Colors =
        Theme

    Logo.BackgroundColor3 =
        Colors.Main

    ExecuteButton.BackgroundColor3 =
        Colors.Main

    HomeButton.BackgroundColor3 =
        Colors.Main

    MainStroke.Color =
        Colors.Secondary

    FloatingStroke.Color =
        Colors.Accent

    for ThemeNameValue, Button in pairs(
        ThemeButtons
    ) do

        if ThemeNameValue == Name then

            Button.BackgroundColor3 =
                Colors.Main

            Button.TextColor3 =
                Color3.fromRGB(
                    255,
                    255,
                    255
                )

        else

            Button.BackgroundColor3 =
                Color3.fromRGB(
                    30,
                    30,
                    40
                )

            Button.TextColor3 =
                Color3.fromRGB(
                    190,
                    190,
                    200
                )

        end

    end

end

for Index, ThemeNameValue in ipairs(
    ThemeOrder
) do

    local Button =
        Instance.new("TextButton")

    Button.Parent =
        SettingsPanel

    local Column =
        (Index - 1) % 4

    local Row =
        math.floor(
            (Index - 1) / 4
        )

    Button.Position =
        UDim2.fromOffset(
            18 + Column * 125,
            92 + Row * 50
        )

    Button.Size =
        UDim2.fromOffset(
            112,
            38
        )

    Button.BackgroundColor3 =
        Color3.fromRGB(
            30,
            30,
            40
        )

    Button.BorderSizePixel = 0

    Button.Text =
        ThemeNameValue

    Button.TextColor3 =
        Color3.fromRGB(
            190,
            190,
            200
        )

    Button.TextSize = 11

    Button.Font =
        Enum.Font.GothamBold

    Button.ZIndex = 11

    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(0, 8)

    Corner.Parent =
        Button

    ThemeButtons[
        ThemeNameValue
    ] = Button

    Connect(
        Button.MouseButton1Click,
        function()

            ApplyTheme(
                ThemeNameValue
            )

        end
    )

end

ApplyTheme(ThemeName)

--========================================================--
--                    SETTINGS BUTTON
--========================================================--

Connect(
    SettingsButton.MouseButton1Click,
    function()

        SettingsPanel.Visible =
            not SettingsPanel.Visible

    end
)

--========================================================--
--                       MINIMIZE
--========================================================--

local function ToggleHub()

    Main.Visible =
        not Main.Visible

end

Connect(
    MinimizeButton.MouseButton1Click,
    function()

        Main.Visible = false

    end
)

Connect(
    CloseButton.MouseButton1Click,
    function()

        Main.Visible = false

    end
)

--========================================================--
--                  FLOATING BUTTON DRAG
--========================================================--

local FloatingDragging = false
local FloatingDragStart
local FloatingStartPosition
local FloatingMoved = false

Connect(
    FloatingButton.InputBegan,
    function(Input)

        if Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            FloatingDragging = true
            FloatingMoved = false

            FloatingDragStart =
                Input.Position

            FloatingStartPosition =
                FloatingButton.Position

        end

    end
)

Connect(
    FloatingButton.InputChanged,
    function(Input)

        if not FloatingDragging then
            return
        end

        if Input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            local Delta =
                Input.Position
                - FloatingDragStart

            if math.abs(Delta.X) > 5
            or math.abs(Delta.Y) > 5 then

                FloatingMoved = true

            end

            FloatingButton.Position =
                UDim2.new(
                    FloatingStartPosition.X.Scale,
                    FloatingStartPosition.X.Offset
                        + Delta.X,

                    FloatingStartPosition.Y.Scale,
                    FloatingStartPosition.Y.Offset
                        + Delta.Y
                )

        end

    end
)

Connect(
    FloatingButton.InputEnded,
    function(Input)

        if Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            FloatingDragging = false

            if not FloatingMoved then
                ToggleHub()
            end

        end

    end
)

--========================================================--
--                  MAIN WINDOW DRAG
--========================================================--

local MainDragging = false
local MainDragStart
local MainStartPosition

Connect(
    Header.InputBegan,
    function(Input)

        if Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            MainDragging = true

            MainDragStart =
                Input.Position

            MainStartPosition =
                Main.Position

        end

    end
)

Connect(
    Header.InputEnded,
    function(Input)

        if Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            MainDragging = false

        end

    end
)

Connect(
    UserInputService.InputChanged,
    function(Input)

        if not MainDragging then
            return
        end

        if Input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or Input.UserInputType ==
            Enum.UserInputType.Touch then

            local Delta =
                Input.Position
                - MainDragStart

            Main.Position =
                UDim2.new(
                    MainStartPosition.X.Scale,
                    MainStartPosition.X.Offset
                        + Delta.X,

                    MainStartPosition.Y.Scale,
                    MainStartPosition.Y.Offset
                        + Delta.Y
                )

        end

    end
)

--========================================================--
--                         FPS
--========================================================--

local FPS = 0
local Frames = 0
local LastFPSUpdate = tick()

Connect(
    RunService.RenderStepped,
    function()

        Frames =
            Frames + 1

        local CurrentTime =
            tick()

        if CurrentTime -
            LastFPSUpdate >= 1 then

            FPS =
                Frames

            Frames = 0

            LastFPSUpdate =
                CurrentTime

        end

    end
)

--========================================================--
--                         PING
--========================================================--

task.spawn(function()

    while not Unloaded do

        local Ping = "?"

        pcall(function()

            local NetworkStats =
                Stats.Network.ServerStatsItem[
                    "Data Ping"
                ]

            Ping =
                math.floor(
                    NetworkStats:GetValue()
                )
                .. "ms"

        end)

        StatsLabel.Text =
            "FPS: "
            .. tostring(FPS)
            .. "  |  Ping: "
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

    for _, Connection in ipairs(
        Connections
    ) do

        pcall(function()

            Connection:Disconnect()

        end)

    end

    table.clear(
        Connections
    )

    pcall(function()

        ScreenGui:Destroy()

    end)

end

--========================================================--
--                         READY
--========================================================--

print(
    "[LH HUB] Loaded with Core.lua"
)
