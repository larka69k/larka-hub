--========================================================--
--                       LARKA HUB
--                    Compact Edition
--========================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

--========================================================--
--                     CONFIGURATION
--========================================================--

local Scripts = {

    {
        Name = "Macro Sand Noob Inc",
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
--                 BOUTON FLOTTANT
--========================================================--

local FloatingButton = Instance.new("TextButton")
FloatingButton.Parent = ScreenGui

FloatingButton.Size = UDim2.new(0, 48, 0, 48)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -24)

FloatingButton.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
FloatingButton.BorderSizePixel = 0

FloatingButton.Text = "L"
FloatingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingButton.TextSize = 24
FloatingButton.Font = Enum.Font.GothamBold

FloatingButton.AutoButtonColor = false
FloatingButton.ZIndex = 20

local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(1, 0)
FloatingCorner.Parent = FloatingButton

local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Parent = FloatingButton
FloatingStroke.Thickness = 2
FloatingStroke.Color = Color3.fromRGB(130, 80, 255)

--========================================================--
--                   FENÊTRE PRINCIPALE
--========================================================--

local Main = Instance.new("Frame")
Main.Parent = ScreenGui

Main.Size = UDim2.new(0, 540, 0, 330)
Main.Position = UDim2.new(0.5, -270, 0.5, -165)

Main.BackgroundColor3 = Color3.fromRGB(17, 17, 23)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = Main
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(50, 50, 65)

--========================================================--
--                         HEADER
--========================================================--

local Header = Instance.new("Frame")
Header.Parent = Main

Header.Size = UDim2.new(1, 0, 0, 58)

Header.BackgroundColor3 = Color3.fromRGB(23, 23, 31)
Header.BorderSizePixel = 0

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Parent = Header

Title.Position = UDim2.new(0, 18, 0, 7)
Title.Size = UDim2.new(1, -70, 0, 27)

Title.BackgroundTransparency = 1
Title.Text = "LARKA HUB"

Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 21
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header

SubTitle.Position = UDim2.new(0, 19, 0, 32)
SubTitle.Size = UDim2.new(1, -80, 0, 18)

SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Script Hub"

SubTitle.TextColor3 = Color3.fromRGB(125, 125, 140)
SubTitle.TextSize = 11
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                    BOUTON FERMER
--========================================================--

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Header

CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Position = UDim2.new(1, -42, 0, 13)

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

SearchBox.Position = UDim2.new(0, 15, 0, 70)
SearchBox.Size = UDim2.new(0, 190, 0, 34)

SearchBox.BackgroundColor3 = Color3.fromRGB(27, 27, 36)
SearchBox.BorderSizePixel = 0

SearchBox.PlaceholderText = "Rechercher un script..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)

SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(235, 235, 240)
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.Gotham

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchBox

local SearchPadding = Instance.new("UIPadding")
SearchPadding.Parent = SearchBox
SearchPadding.PaddingLeft = UDim.new(0, 10)

--========================================================--
--                    LISTE DES SCRIPTS
--========================================================--

local ScriptList = Instance.new("ScrollingFrame")
ScriptList.Parent = Main

ScriptList.Position = UDim2.new(0, 15, 0, 112)
ScriptList.Size = UDim2.new(0, 190, 0, 202)

ScriptList.BackgroundColor3 = Color3.fromRGB(21, 21, 28)
ScriptList.BorderSizePixel = 0

ScriptList.ScrollBarThickness = 3
ScriptList.ScrollBarImageColor3 = Color3.fromRGB(100, 70, 180)

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

Details.Position = UDim2.new(0, 220, 0, 70)
Details.Size = UDim2.new(1, -235, 0, 244)

Details.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
Details.BorderSizePixel = 0

local DetailsCorner = Instance.new("UICorner")
DetailsCorner.CornerRadius = UDim.new(0, 10)
DetailsCorner.Parent = Details

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

    Button.MouseButton1Click:Connect(function()

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

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()

    BuildList(SearchBox.Text)

end)

--========================================================--
--                      EXECUTE
--========================================================--

ExecuteButton.MouseButton1Click:Connect(function()

    if not SelectedScript.URL
    or SelectedScript.URL == "" then

        ExecuteButton.Text = "LIEN MANQUANT"

        task.wait(1)

        ExecuteButton.Text = "EXECUTE"

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

        if success then

            ExecuteButton.Text = "LOADED ✓"

        else

            ExecuteButton.Text = "ERROR"

            warn(
                "Larka Hub : "
                .. tostring(errorMessage)
            )

        end

        task.wait(1)

        ExecuteButton.Text = "EXECUTE"

    end)

end)

--========================================================--
--                 AFFICHER / CACHER
--========================================================--

local function ToggleHub()

    Main.Visible = not Main.Visible

end

FloatingButton.MouseButton1Click:Connect(function()

    ToggleHub()

end)

CloseButton.MouseButton1Click:Connect(function()

    Main.Visible = false

end)

--========================================================--
--             BOUTON FLOTTANT DÉPLAÇABLE
--========================================================--

local dragging = false
local dragStart
local buttonStartPosition
local moved = false

FloatingButton.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        moved = false

        dragStart = input.Position
        buttonStartPosition = FloatingButton.Position

    end

end)

FloatingButton.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        if dragging then

            local delta =
                input.Position - dragStart

            if math.abs(delta.X) > 5
            or math.abs(delta.Y) > 5 then

                moved = true

            end

            FloatingButton.Position = UDim2.new(
                buttonStartPosition.X.Scale,
                buttonStartPosition.X.Offset + delta.X,

                buttonStartPosition.Y.Scale,
                buttonStartPosition.Y.Offset + delta.Y
            )

        end

    end

end)

FloatingButton.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false

    end

end)

--========================================================--
--             FENÊTRE PRINCIPALE DÉPLAÇABLE
--========================================================--

local MainDragging = false
local MainDragStart
local MainStartPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        MainDragging = true

        MainDragStart = input.Position
        MainStartPosition = Main.Position

    end

end)

Header.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        MainDragging = false

    end

end)

UserInputService.InputChanged:Connect(function(input)

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
--                         FIN
--========================================================--

print("LARKA HUB chargé !")
