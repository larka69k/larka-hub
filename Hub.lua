--========================================================--
--                       LARKA HUB
--                        FINAL
--========================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer

--========================================================--
--                         CORE
--========================================================--

local BASE_URL =
    "https://raw.githubusercontent.com/larka69k/larka-hub/main/"

local function LoadRemote(URL)
    local Source = game:HttpGet(URL)
    local Function = loadstring(Source)

    if not Function then
        error("Unable to load remote file.")
    end

    return Function()
end

local Core = LoadRemote(BASE_URL .. "Core.lua")

--========================================================--
--                       VARIABLES
--========================================================--

local Connections = {}
local Unloaded = false

local Scripts = {
    Universal = {},
    Games = {}
}

local SelectedScript = nil

local function Connect(Signal, Callback)
    local Connection = Signal:Connect(Callback)
    table.insert(Connections, Connection)
    return Connection
end

local function Color(Name)
    return Core:GetColor(Name)
end

--========================================================--
--                          GUI
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
--                    FLOATING BUTTON
--========================================================--

local FloatingButton = Instance.new("TextButton")
FloatingButton.Parent = ScreenGui
FloatingButton.Size = UDim2.new(0, 42, 0, 42)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -21)
FloatingButton.BackgroundColor3 = Color("Panel")
FloatingButton.BorderSizePixel = 0
FloatingButton.Text = "LH"
FloatingButton.TextColor3 = Color("Text")
FloatingButton.TextSize = 12
FloatingButton.Font = Enum.Font.GothamBold
FloatingButton.AutoButtonColor = false
FloatingButton.ZIndex = 20

local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(0, 9)
FloatingCorner.Parent = FloatingButton

local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Thickness = 2
FloatingStroke.Color = Color("Accent")
FloatingStroke.Parent = FloatingButton

--========================================================--
--                     MAIN WINDOW
--========================================================--

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 520, 0, 330)
Main.Position = UDim2.new(0.5, -260, 0.5, -165)
Main.BackgroundColor3 = Color("Background")
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = Color("Secondary")
MainStroke.Parent = Main

--========================================================--
--                         HEADER
--========================================================--

local Header = Instance.new("Frame")
Header.Parent = Main
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundColor3 = Color("Header")
Header.BorderSizePixel = 0

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local Logo = Instance.new("TextLabel")
Logo.Parent = Header
Logo.Position = UDim2.new(0, 14, 0, 9)
Logo.Size = UDim2.new(0, 40, 0, 40)
Logo.BackgroundColor3 = Color("Main")
Logo.BorderSizePixel = 0
Logo.Text = "LH"
Logo.TextColor3 = Color("Text")
Logo.TextSize = 12
Logo.Font = Enum.Font.GothamBold

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 9)
LogoCorner.Parent = Logo

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.Position = UDim2.new(0, 65, 0, 7)
Title.Size = UDim2.new(0, 220, 0, 25)
Title.BackgroundTransparency = 1
Title.Text = "LARKA HUB"
Title.TextColor3 = Color("Text")
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = Header
Subtitle.Position = UDim2.new(0, 66, 0, 31)
Subtitle.Size = UDim2.new(0, 200, 0, 15)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "LH • SCRIPT HUB"
Subtitle.TextColor3 = Color("SubText")
Subtitle.TextSize = 9
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

local SettingsButton = Instance.new("TextButton")
SettingsButton.Parent = Header
SettingsButton.Position = UDim2.new(1, -48, 0, 13)
SettingsButton.Size = UDim2.new(0, 34, 0, 32)
SettingsButton.BackgroundColor3 = Color("Panel")
SettingsButton.BorderSizePixel = 0
SettingsButton.Text = "⚙"
SettingsButton.TextColor3 = Color("Text")
SettingsButton.TextSize = 15
SettingsButton.Font = Enum.Font.GothamBold

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(0, 8)
SettingsCorner.Parent = SettingsButton

--========================================================--
--                         CONTENT
--========================================================--

local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0, 0, 0, 58)
Content.Size = UDim2.new(1, 0, 1, -58)
Content.BackgroundTransparency = 1

--========================================================--
--                           HOME
--========================================================--

local Home = Instance.new("ScrollingFrame")
Home.Parent = Content
Home.Position = UDim2.new(0, 14, 0, 12)
Home.Size = UDim2.new(1, -28, 1, -24)
Home.BackgroundTransparency = 1
Home.BorderSizePixel = 0
Home.ScrollBarThickness = 3
Home.ScrollBarImageColor3 = Color("Main")
Home.CanvasSize = UDim2.new(0, 0, 0, 0)

local HomeLayout = Instance.new("UIListLayout")
HomeLayout.Parent = Home
HomeLayout.Padding = UDim.new(0, 7)
HomeLayout.SortOrder = Enum.SortOrder.LayoutOrder

local HomeTitle = Instance.new("TextLabel")
HomeTitle.Parent = Home
HomeTitle.Size = UDim2.new(1, -5, 0, 28)
HomeTitle.BackgroundTransparency = 1
HomeTitle.Text = "HOME"
HomeTitle.TextColor3 = Color("Text")
HomeTitle.TextSize = 18
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                       CATEGORIES
--========================================================--

local UniversalButton = Instance.new("TextButton")
UniversalButton.Parent = Home
UniversalButton.Size = UDim2.new(1, -5, 0, 38)
UniversalButton.BackgroundColor3 = Color("Panel")
UniversalButton.BorderSizePixel = 0
UniversalButton.Text = "▸  UNIVERSAL"
UniversalButton.TextColor3 = Color("Text")
UniversalButton.TextSize = 11
UniversalButton.Font = Enum.Font.GothamBold
UniversalButton.TextXAlignment = Enum.TextXAlignment.Left

local UniversalCorner = Instance.new("UICorner")
UniversalCorner.CornerRadius = UDim.new(0, 8)
UniversalCorner.Parent = UniversalButton

local UniversalPadding = Instance.new("UIPadding")
UniversalPadding.PaddingLeft = UDim.new(0, 12)
UniversalPadding.Parent = UniversalButton

local UniversalPanel = Instance.new("Frame")
UniversalPanel.Parent = Home
UniversalPanel.Size = UDim2.new(1, -5, 0, 0)
UniversalPanel.AutomaticSize = Enum.AutomaticSize.Y
UniversalPanel.Visible = false
UniversalPanel.BackgroundTransparency = 1

local UniversalLayout = Instance.new("UIListLayout")
UniversalLayout.Parent = UniversalPanel
UniversalLayout.Padding = UDim.new(0, 5)

local GamesButton = Instance.new("TextButton")
GamesButton.Parent = Home
GamesButton.Size = UDim2.new(1, -5, 0, 38)
GamesButton.BackgroundColor3 = Color("Panel")
GamesButton.BorderSizePixel = 0
GamesButton.Text = "▸  GAMES"
GamesButton.TextColor3 = Color("Text")
GamesButton.TextSize = 11
GamesButton.Font = Enum.Font.GothamBold
GamesButton.TextXAlignment = Enum.TextXAlignment.Left

local GamesCorner = Instance.new("UICorner")
GamesCorner.CornerRadius = UDim.new(0, 8)
GamesCorner.Parent = GamesButton

local GamesPadding = Instance.new("UIPadding")
GamesPadding.PaddingLeft = UDim.new(0, 12)
GamesPadding.Parent = GamesButton

local GamesPanel = Instance.new("Frame")
GamesPanel.Parent = Home
GamesPanel.Size = UDim2.new(1, -5, 0, 0)
GamesPanel.AutomaticSize = Enum.AutomaticSize.Y
GamesPanel.Visible = false
GamesPanel.BackgroundTransparency = 1

local GamesLayout = Instance.new("UIListLayout")
GamesLayout.Parent = GamesPanel
GamesLayout.Padding = UDim.new(0, 5)

--========================================================--
--                      DETAILS
--========================================================--

local Details = Instance.new("Frame")
Details.Parent = Content
Details.Visible = false
Details.Position = UDim2.new(0, 14, 0, 12)
Details.Size = UDim2.new(1, -28, 1, -24)
Details.BackgroundColor3 = Color("Panel")
Details.BorderSizePixel = 0

local DetailsCorner = Instance.new("UICorner")
DetailsCorner.CornerRadius = UDim.new(0, 11)
DetailsCorner.Parent = Details

local BackButton = Instance.new("TextButton")
BackButton.Parent = Details
BackButton.Position = UDim2.new(1, -82, 0, 14)
BackButton.Size = UDim2.new(0, 68, 0, 28)
BackButton.BackgroundColor3 = Color("Background")
BackButton.BorderSizePixel = 0
BackButton.Text = "BACK"
BackButton.TextColor3 = Color("SubText")
BackButton.TextSize = 9
BackButton.Font = Enum.Font.GothamBold

local BackCorner = Instance.new("UICorner")
BackCorner.CornerRadius = UDim.new(0, 7)
BackCorner.Parent = BackButton

local SelectedName = Instance.new("TextLabel")
SelectedName.Parent = Details
SelectedName.Position = UDim2.new(0, 16, 0, 15)
SelectedName.Size = UDim2.new(1, -115, 0, 30)
SelectedName.BackgroundTransparency = 1
SelectedName.Text = "SCRIPT"
SelectedName.TextColor3 = Color("Text")
SelectedName.TextSize = 18
SelectedName.Font = Enum.Font.GothamBold
SelectedName.TextXAlignment = Enum.TextXAlignment.Left

local SelectedDescription = Instance.new("TextLabel")
SelectedDescription.Parent = Details
SelectedDescription.Position = UDim2.new(0, 16, 0, 53)
SelectedDescription.Size = UDim2.new(1, -32, 0, 75)
SelectedDescription.BackgroundTransparency = 1
SelectedDescription.Text = ""
SelectedDescription.TextColor3 = Color("SubText")
SelectedDescription.TextSize = 11
SelectedDescription.Font = Enum.Font.Gotham
SelectedDescription.TextWrapped = true
SelectedDescription.TextXAlignment = Enum.TextXAlignment.Left
SelectedDescription.TextYAlignment = Enum.TextYAlignment.Top

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = Details
ExecuteButton.Position = UDim2.new(0, 16, 1, -55)
ExecuteButton.Size = UDim2.new(1, -32, 0, 39)
ExecuteButton.BackgroundColor3 = Color("Main")
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Text = "EXECUTE"
ExecuteButton.TextColor3 = Color("Text")
ExecuteButton.TextSize = 11
ExecuteButton.Font = Enum.Font.GothamBold

local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 8)
ExecuteCorner.Parent = ExecuteButton

--========================================================--
--                        SETTINGS
--========================================================--

local SettingsPanel = Instance.new("Frame")
SettingsPanel.Parent = Main
SettingsPanel.Visible = false
SettingsPanel.Position = UDim2.new(0, 12, 0, 70)
SettingsPanel.Size = UDim2.new(1, -24, 1, -82)
SettingsPanel.BackgroundColor3 = Color("Panel")
SettingsPanel.BorderSizePixel = 0
SettingsPanel.ZIndex = 50

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(0, 11)
SettingsCorner.Parent = SettingsPanel

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Parent = SettingsPanel
SettingsTitle.Position = UDim2.new(0, 16, 0, 12)
SettingsTitle.Size = UDim2.new(1, -100, 0, 28)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Text = "SETTINGS"
SettingsTitle.TextColor3 = Color("Text")
SettingsTitle.TextSize = 17
SettingsTitle.Font = Enum.Font.GothamBold
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingsTitle.ZIndex = 51

local SettingsBack = Instance.new("TextButton")
SettingsBack.Parent = SettingsPanel
SettingsBack.Position = UDim2.new(1, -82, 0, 12)
SettingsBack.Size = UDim2.new(0, 66, 0, 28)
SettingsBack.BackgroundColor3 = Color("Background")
SettingsBack.BorderSizePixel = 0
SettingsBack.Text = "BACK"
SettingsBack.TextColor3 = Color("SubText")
SettingsBack.TextSize = 9
SettingsBack.Font = Enum.Font.GothamBold
SettingsBack.ZIndex = 51

local SettingsBackCorner = Instance.new("UICorner")
SettingsBackCorner.CornerRadius = UDim.new(0, 7)
SettingsBackCorner.Parent = SettingsBack

--========================================================--
--                       COLOR PICKER
--========================================================--

local ColorTitle = Instance.new("TextLabel")
ColorTitle.Parent = SettingsPanel
ColorTitle.Position = UDim2.new(0, 16, 0, 50)
ColorTitle.Size = UDim2.new(1, -32, 0, 20)
ColorTitle.BackgroundTransparency = 1
ColorTitle.Text = "HUB COLORS"
ColorTitle.TextColor3 = Color("SubText")
ColorTitle.TextSize = 10
ColorTitle.Font = Enum.Font.GothamBold
ColorTitle.TextXAlignment = Enum.TextXAlignment.Left
ColorTitle.ZIndex = 51

local ColorNames = {
    "Main",
    "Secondary",
    "Accent",
    "Background",
    "Panel",
    "Header",
    "Text",
    "SubText"
}

local ColorButtons = {}

local Picker = Instance.new("Frame")
Picker.Parent = ScreenGui
Picker.Visible = false
Picker.Size = UDim2.new(0, 270, 0, 245)
Picker.BackgroundColor3 = Color("Panel")
Picker.BorderSizePixel = 0
Picker.ZIndex = 100

local PickerCorner = Instance.new("UICorner")
PickerCorner.CornerRadius = UDim.new(0, 12)
PickerCorner.Parent = Picker

local PickerStroke = Instance.new("UIStroke")
PickerStroke.Thickness = 1
PickerStroke.Color = Color("Secondary")
PickerStroke.Parent = Picker

local PickerTitle = Instance.new("TextLabel")
PickerTitle.Parent = Picker
PickerTitle.Position = UDim2.new(0, 14, 0, 10)
PickerTitle.Size = UDim2.new(1, -28, 0, 24)
PickerTitle.BackgroundTransparency = 1
PickerTitle.Text = "COLOR"
PickerTitle.TextColor3 = Color("Text")
PickerTitle.TextSize = 13
PickerTitle.Font = Enum.Font.GothamBold
PickerTitle.TextXAlignment = Enum.TextXAlignment.Left
PickerTitle.ZIndex = 101

local Preview = Instance.new("Frame")
Preview.Parent = Picker
Preview.Position = UDim2.new(0, 14, 0, 42)
Preview.Size = UDim2.new(1, -28, 0, 34)
Preview.BorderSizePixel = 0
Preview.BackgroundColor3 = Color("Main")
Preview.ZIndex = 101

local PreviewCorner = Instance.new("UICorner")
PreviewCorner.CornerRadius = UDim.new(0, 7)
PreviewCorner.Parent = Preview

local RGBInputs = {}

local function CreateRGBInput(Name, X)
    local Box = Instance.new("TextBox")
    Box.Parent = Picker
    Box.Position = UDim2.new(0, X, 0, 88)
    Box.Size = UDim2.new(0, 72, 0, 32)
    Box.BackgroundColor3 = Color("Background")
    Box.BorderSizePixel = 0
    Box.Text = "255"
    Box.TextColor3 = Color("Text")
    Box.PlaceholderText = Name
    Box.PlaceholderColor3 = Color("SubText")
    Box.TextSize = 11
    Box.Font = Enum.Font.GothamMedium
    Box.ClearTextOnFocus = false
    Box.ZIndex = 101

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Box

    RGBInputs[Name] = Box
end

CreateRGBInput("R", 14)
CreateRGBInput("G", 99)
CreateRGBInput("B", 184)

local ApplyColor = Instance.new("TextButton")
ApplyColor.Parent = Picker
ApplyColor.Position = UDim2.new(0, 14, 0, 132)
ApplyColor.Size = UDim2.new(1, -28, 0, 34)
ApplyColor.BackgroundColor3 = Color("Main")
ApplyColor.BorderSizePixel = 0
ApplyColor.Text = "APPLY COLOR"
ApplyColor.TextColor3 = Color("Text")
ApplyColor.TextSize = 10
ApplyColor.Font = Enum.Font.GothamBold
ApplyColor.ZIndex = 101

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 7)
ApplyCorner.Parent = ApplyColor

local CancelColor = Instance.new("TextButton")
CancelColor.Parent = Picker
CancelColor.Position = UDim2.new(0, 14, 0, 176)
CancelColor.Size = UDim2.new(1, -28, 0, 30)
CancelColor.BackgroundColor3 = Color("Background")
CancelColor.BorderSizePixel = 0
CancelColor.Text = "CANCEL"
CancelColor.TextColor3 = Color("SubText")
CancelColor.TextSize = 9
CancelColor.Font = Enum.Font.GothamBold
CancelColor.ZIndex = 101

local CancelCorner = Instance.new("UICorner")
CancelCorner.CornerRadius = UDim.new(0, 7)
CancelCorner.Parent = CancelColor

local SelectedColorName = nil

local function GetRGB()
    local R = math.clamp(tonumber(RGBInputs.R.Text) or 0, 0, 255)
    local G = math.clamp(tonumber(RGBInputs.G.Text) or 0, 0, 255)
    local B = math.clamp(tonumber(RGBInputs.B.Text) or 0, 0, 255)

    return R, G, B
end

local function UpdatePreview()
    local R, G, B = GetRGB()
    Preview.BackgroundColor3 = Color3.fromRGB(R, G, B)
end

for _, Box in pairs(RGBInputs) do
    Connect(
        Box:GetPropertyChangedSignal("Text"),
        UpdatePreview
    )
end

local function OpenColorPicker(Name)
    SelectedColorName = Name

    local Current = Color(Name)

    RGBInputs.R.Text = tostring(math.floor(Current.R * 255 + 0.5))
    RGBInputs.G.Text = tostring(math.floor(Current.G * 255 + 0.5))
    RGBInputs.B.Text = tostring(math.floor(Current.B * 255 + 0.5))

    PickerTitle.Text =
        "COLOR • " .. string.upper(Name)

    Preview.BackgroundColor3 = Current

    Picker.Position =
        UDim2.new(0.5, -135, 0.5, -122)

    Picker.Visible = true
end

for Index, Name in ipairs(ColorNames) do
    local Button = Instance.new("TextButton")
    Button.Parent = SettingsPanel

    local Column = (Index - 1) % 2
    local Row = math.floor((Index - 1) / 2)

    Button.Position = UDim2.new(
        0,
        16 + Column * 190,
        0,
        77 + Row * 34
    )

    Button.Size = UDim2.new(0, 175, 0, 27)
    Button.BackgroundColor3 = Color(Name)
    Button.BorderSizePixel = 0
    Button.Text = string.upper(Name)
    Button.TextColor3 = Color("Text")
    Button.TextSize = 9
    Button.Font = Enum.Font.GothamBold
    Button.ZIndex = 51

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    ColorButtons[Name] = Button

    Connect(
        Button.MouseButton1Click,
        function()
            OpenColorPicker(Name)
        end
    )
end

Connect(
    ApplyColor.MouseButton1Click,
    function()
        if not SelectedColorName then
            return
        end

        local R, G, B = GetRGB()

        local NewColor =
            Color3.fromRGB(R, G, B)

        Core:SetColor(
            SelectedColorName,
            NewColor
        )

        ColorButtons[
            SelectedColorName
        ].BackgroundColor3 = NewColor

        Picker.Visible = false

        RefreshColors()
    end
)

Connect(
    CancelColor.MouseButton1Click,
    function()
        Picker.Visible = false
    end
)

--========================================================--
--                    REFRESH COLORS
--========================================================--

function RefreshColors()
    Main.BackgroundColor3 = Color("Background")
    MainStroke.Color = Color("Secondary")

    Header.BackgroundColor3 = Color("Header")

    Logo.BackgroundColor3 = Color("Main")
    Logo.TextColor3 = Color("Text")

    Title.TextColor3 = Color("Text")
    Subtitle.TextColor3 = Color("SubText")

    FloatingButton.BackgroundColor3 = Color("Panel")
    FloatingButton.TextColor3 = Color("Text")
    FloatingStroke.Color = Color("Accent")

    SettingsButton.BackgroundColor3 = Color("Panel")
    SettingsButton.TextColor3 = Color("Text")

    UniversalButton.BackgroundColor3 = Color("Panel")
    UniversalButton.TextColor3 = Color("Text")

    GamesButton.BackgroundColor3 = Color("Panel")
    GamesButton.TextColor3 = Color("Text")

    ExecuteButton.BackgroundColor3 = Color("Main")
    ExecuteButton.TextColor3 = Color("Text")

    BackButton.BackgroundColor3 = Color("Background")
    SettingsBack.BackgroundColor3 = Color("Background")
end

--========================================================--
--                  SELECT SCRIPT
--========================================================--

local function SelectScript(Data)
    SelectedScript = Data

    SelectedName.Text =
        Data.Name or "SCRIPT"

    SelectedDescription.Text =
        Data.Description
        or "No description available."

    Home.Visible = false
    Details.Visible = true
    SettingsPanel.Visible = false
end

--========================================================--
--                   SCRIPT BUTTON
--========================================================--

local function CreateScriptButton(Data, Parent)
    local Button = Instance.new("TextButton")

    Button.Parent = Parent
    Button.Size = UDim2.new(1, 0, 0, 34)
    Button.BackgroundColor3 = Color("Background")
    Button.BorderSizePixel = 0
    Button.Text = "  " .. (Data.Name or "Unknown Script")
    Button.TextColor3 = Color("Text")
    Button.TextSize = 10
    Button.Font = Enum.Font.GothamMedium
    Button.TextXAlignment = Enum.TextXAlignment.Left

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    Connect(
        Button.MouseButton1Click,
        function()
            SelectScript(Data)
        end
    )
end

--========================================================--
--                       GAME
--========================================================--

local function CreateGame(Data)
    local Button = Instance.new("TextButton")

    Button.Parent = GamesPanel
    Button.Size = UDim2.new(1, 0, 0, 34)
    Button.BackgroundColor3 = Color("Background")
    Button.BorderSizePixel = 0
    Button.Text = "▸  " .. (Data.Name or "Unknown Game")
    Button.TextColor3 = Color("Text")
    Button.TextSize = 10
    Button.Font = Enum.Font.GothamBold
    Button.TextXAlignment = Enum.TextXAlignment.Left

    local Padding = Instance.new("UIPadding")
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.Parent = Button

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    local Panel = Instance.new("Frame")
    Panel.Parent = GamesPanel
    Panel.Size = UDim2.new(1, 0, 0, 0)
    Panel.AutomaticSize = Enum.AutomaticSize.Y
    Panel.Visible = false
    Panel.BackgroundTransparency = 1

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Panel
    Layout.Padding = UDim.new(0, 4)

    for _, ScriptData in ipairs(Data.Scripts or {}) do
        CreateScriptButton(
            ScriptData,
            Panel
        )
    end

    Connect(
        Button.MouseButton1Click,
        function()
            Panel.Visible = not Panel.Visible

            if Panel.Visible then
                Button.Text =
                    "▾  " .. (Data.Name or "Unknown Game")
            else
                Button.Text =
                    "▸  " .. (Data.Name or "Unknown Game")
            end
        end
    )
end

--========================================================--
--                     MANIFEST
--========================================================--

local function LoadManifest()
    local Success, Result = pcall(function()
        return game:HttpGet(
            BASE_URL .. "manifest.json"
        )
    end)

    if not Success then
        warn(
            "Larka Hub: unable to load manifest.json"
        )
        return false
    end

    local DecodeSuccess, Data =
        pcall(function()
            return HttpService:JSONDecode(Result)
        end)

    if not DecodeSuccess
    or type(Data) ~= "table" then
        warn(
            "Larka Hub: invalid manifest.json"
        )
        return false
    end

    Scripts.Universal =
        Data.Universal or {}

    Scripts.Games =
        Data.Games or {}

    return true
end

--========================================================--
--                   BUILD UNIVERSAL
--========================================================--

local function BuildUniversal()
    for _, Child in ipairs(
        UniversalPanel:GetChildren()
    ) do
        if Child:IsA("TextButton") then
            Child:Destroy()
        end
    end

    for _, Data in ipairs(
        Scripts.Universal
    ) do
        CreateScriptButton(
            Data,
            UniversalPanel
        )
    end
end

--========================================================--
--                     BUILD GAMES
--========================================================--

local function BuildGames()
    for _, Child in ipairs(
        GamesPanel:GetChildren()
    ) do
        Child:Destroy()
    end

    for _, Data in ipairs(
        Scripts.Games
    ) do
        CreateGame(Data)
    end
end

--========================================================--
--                     CATEGORIES
--========================================================--

Connect(
    UniversalButton.MouseButton1Click,
    function()
        UniversalPanel.Visible =
            not UniversalPanel.Visible

        UniversalButton.Text =
            UniversalPanel.Visible
            and "▾  UNIVERSAL"
            or "▸  UNIVERSAL"
    end
)

Connect(
    GamesButton.MouseButton1Click,
    function()
        GamesPanel.Visible =
            not GamesPanel.Visible

        GamesButton.Text =
            GamesPanel.Visible
            and "▾  GAMES"
            or "▸  GAMES"
    end
)

--========================================================--
--                         BACK
--========================================================--

Connect(
    BackButton.MouseButton1Click,
    function()
        Details.Visible = false
        Home.Visible = true
    end
)

--========================================================--
--                        SETTINGS
--========================================================--

Connect(
    SettingsButton.MouseButton1Click,
    function()
        Home.Visible = false
        Details.Visible = false
        SettingsPanel.Visible = true
    end
)

Connect(
    SettingsBack.MouseButton1Click,
    function()
        SettingsPanel.Visible = false
        Home.Visible = true
    end
)

--========================================================--
--                        EXECUTE
--========================================================--

Connect(
    ExecuteButton.MouseButton1Click,
    function()
        if not SelectedScript then
            return
        end

        if not SelectedScript.URL
        or SelectedScript.URL == "" then

            ExecuteButton.Text = "URL MISSING"

            task.wait(1)

            if not Unloaded then
                ExecuteButton.Text = "EXECUTE"
            end

            return
        end

        ExecuteButton.Text = "LOADING..."

        task.spawn(function()

            local Success, ErrorMessage =
                pcall(function()

                    local Source =
                        game:HttpGet(
                            SelectedScript.URL
                        )

                    local Function =
                        loadstring(Source)

                    if not Function then
                        error(
                            "Unable to load script."
                        )
                    end

                    Function()

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
                    "Larka Hub: "
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
--                   FLOATING BUTTON DRAG
--========================================================--

local FloatingDragging = false
local FloatingMoved = false
local FloatingDragStart
local FloatingStartPosition

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
    UserInputService.InputChanged,
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
                Main.Visible =
                    not Main.Visible
            end
        end
    end
)

--========================================================--
--                       MAIN DRAG
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
            MainDragStart = Input.Position
            MainStartPosition = Main.Position
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
--                           FPS
--========================================================--

local FPS = 0
local Frames = 0
local LastFPSUpdate = tick()

Connect(
    RunService.RenderStepped,
    function()

        Frames += 1

        local Now = tick()

        if Now - LastFPSUpdate >= 1 then
            FPS = Frames
            Frames = 0
            LastFPSUpdate = Now
        end
    end
)

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

    table.clear(Connections)

    pcall(function()
        ScreenGui:Destroy()
    end)

    print("LARKA HUB unloaded.")

end

--========================================================--
--                         START
--========================================================--

RefreshColors()

local ManifestLoaded =
    LoadManifest()

if ManifestLoaded then
    BuildUniversal()
    BuildGames()
else
    warn(
        "Larka Hub: no scripts loaded."
    )
end

print("LARKA HUB loaded!")
