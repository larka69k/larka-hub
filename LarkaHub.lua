--========================================================--
--                      LARKA HUB
--========================================================--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--========================================================--
--                     VARIABLES
--========================================================--

local isActive = false

local PARCOURS_URL =
	"https://raw.githubusercontent.com/larka69k/larka-hub/main/MacroSandNoobIncremental.lua"

local SCRIPT_2_URL = "TON_LIEN_RAW_SCRIPT_2"
local SCRIPT_3_URL = "TON_LIEN_RAW_SCRIPT_3"

--========================================================--
--                       GUI
--========================================================--

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LarkaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
	ScreenGui.Parent = gethui and gethui() or CoreGui
end)

if not ScreenGui.Parent then
	ScreenGui.Parent = player:WaitForChild("PlayerGui")
end

--========================================================--
--                    FENÊTRE PRINCIPALE
--========================================================--

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 440, 0, 320)
Main.Position = UDim2.new(0.5, -220, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

--========================================================--
--                       TITRE
--========================================================--

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Position = UDim2.new(0, 20, 0, 10)
Title.Size = UDim2.new(1, -40, 0, 40)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "LARKA HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 25
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Main
SubTitle.Position = UDim2.new(0, 20, 0, 42)
SubTitle.Size = UDim2.new(1, -40, 0, 25)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Script Hub"
SubTitle.TextColor3 = Color3.fromRGB(145, 145, 155)
SubTitle.TextSize = 13
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                       ONGLET
--========================================================--

local Tabs = Instance.new("Frame")
Tabs.Parent = Main
Tabs.Position = UDim2.new(0, 15, 0, 78)
Tabs.Size = UDim2.new(1, -30, 0, 42)
Tabs.BackgroundTransparency = 1

local function createTab(text, position)

	local Button = Instance.new("TextButton")

	Button.Parent = Tabs
	Button.Position = position
	Button.Size = UDim2.new(0, 125, 0, 40)

	Button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
	Button.BorderSizePixel = 0

	Button.Font = Enum.Font.GothamBold
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(220, 220, 225)
	Button.TextSize = 14

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button

	return Button

end

local ParcoursTab = createTab(
	"Parcours",
	UDim2.new(0, 0, 0, 0)
)

local Script2Tab = createTab(
	"Script 2",
	UDim2.new(0, 132, 0, 0)
)

local Script3Tab = createTab(
	"Script 3",
	UDim2.new(0, 264, 0, 0)
)

--========================================================--
--                       CONTENU
--========================================================--

local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0, 15, 0, 130)
Content.Size = UDim2.new(1, -30, 0, 170)

Content.BackgroundColor3 = Color3.fromRGB(30, 30, 37)
Content.BorderSizePixel = 0

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = Content

local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Parent = Content
ScriptTitle.Position = UDim2.new(0, 20, 0, 15)
ScriptTitle.Size = UDim2.new(1, -40, 0, 30)

ScriptTitle.BackgroundTransparency = 1
ScriptTitle.Font = Enum.Font.GothamBold
ScriptTitle.Text = "Macro Sand Noob Incremental"
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextSize = 18
ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

local Description = Instance.new("TextLabel")
Description.Parent = Content
Description.Position = UDim2.new(0, 20, 0, 47)
Description.Size = UDim2.new(1, -40, 0, 35)

Description.BackgroundTransparency = 1
Description.Font = Enum.Font.Gotham
Description.Text = "Macro Sand Noob Incremental"
Description.TextColor3 = Color3.fromRGB(150, 150, 160)
Description.TextSize = 12
Description.TextXAlignment = Enum.TextXAlignment.Left

--========================================================--
--                    BOUTON CHARGER
--========================================================--

local LoadButton = Instance.new("TextButton")
LoadButton.Parent = Content
LoadButton.Position = UDim2.new(0, 20, 0, 95)
LoadButton.Size = UDim2.new(1, -40, 0, 50)

LoadButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
LoadButton.BorderSizePixel = 0

LoadButton.Font = Enum.Font.GothamBold
LoadButton.Text = "CHARGER"
LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.TextSize = 16

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 8)
LoadCorner.Parent = LoadButton

--========================================================--
--                    CHARGEMENT SCRIPT
--========================================================--

local function loadScript(url)

	if not url or url == "" then
		warn("Lien du script manquant.")
		return
	end

	if url:find("TON_LIEN") then
		warn("Lien Raw non configuré.")
		return
	end

	local success, result = pcall(function()

		return loadstring(
			game:HttpGet(url)
		)()

	end)

	if not success then

		warn(
			"Erreur lors du chargement du script : "
			.. tostring(result)
		)

	end

end

--========================================================--
--                    ONGLET PARCOURS
--========================================================--

ParcoursTab.MouseButton1Click:Connect(function()

	ScriptTitle.Text = "Macro Sand Noob Incremental"

	Description.Text = "Script prêt à être chargé"

	LoadButton.Text = "CHARGER"

end)

--========================================================--
--                    BOUTON CHARGER
--========================================================--

LoadButton.MouseButton1Click:Connect(function()

	LoadButton.Text = "CHARGEMENT..."

	task.spawn(function()

		loadScript(PARCOURS_URL)

		task.wait(0.5)

		LoadButton.Text = "CHARGER"

	end)

end)

--========================================================--
--                    SCRIPT 2
--========================================================--

Script2Tab.MouseButton1Click:Connect(function()

	ScriptTitle.Text = "Script 2"
	Description.Text = "Script 2"

	LoadButton.Text = "CHARGER"

	LoadButton.MouseButton1Click:Wait()

end)

--========================================================--
--                    SCRIPT 3
--========================================================--

Script3Tab.MouseButton1Click:Connect(function()

	ScriptTitle.Text = "Script 3"
	Description.Text = "Script 3"

	LoadButton.Text = "CHARGER"

end)

--========================================================--
--                  FENÊTRE DÉPLAÇABLE
--========================================================--

local dragging = false
local dragStart
local startPos

Title.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = Main.Position

	end

end)

Title.InputEnded:Connect(function(input)

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
			startPos.X.Scale,
			startPos.X.Offset + delta.X,

			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)

	end

end)

print("LARKA HUB chargé !")
