-- Version stable - Sans Pathfinding
-- Première destination -> 1min40 -> clic -> deuxième destination -> boucle

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer

local isActive = false
local isRunning = false

-- ========== GUI ==========

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ParcoursStable"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
	ScreenGui.Parent = gethui and gethui() or CoreGui
end)

if not ScreenGui.Parent then
	ScreenGui.Parent = player:WaitForChild("PlayerGui")
end

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
Button.Position = UDim2.new(0, 20, 0, 100)
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Font = Enum.Font.GothamBold
Button.Text = "Activer Parcours"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 18

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Button

-- ========== PERSONNAGE ==========

local function getChar()
	local char = player.Character

	if not char or not char.Parent then
		char = player.CharacterAdded:Wait()
	end

	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")

	if not hum or not root then
		hum = char:WaitForChild("Humanoid", 3)
		root = char:WaitForChild("HumanoidRootPart", 3)
	end

	return char, hum, root
end

local function stopMoving()
	local char, hum, root = getChar()

	if hum and root then
		hum:MoveTo(root.Position)
		hum.WalkSpeed = 16
	end
end

-- ========== CLIC ==========

local function faireClic()
	if not isActive then
		return
	end

	local x = 1212
	local y = 925

	pcall(function()
		VirtualInputManager:SendMouseButtonEvent(
			x, y, 0, true, game, 0
		)

		task.wait(0.1)

		VirtualInputManager:SendMouseButtonEvent(
			x, y, 0, false, game, 0
		)
	end)

	print("Clic effectué : X = " .. x .. " | Y = " .. y)
end

-- ========== DÉPLACEMENT ==========

local function walkTo(x, z)
	if not isActive then
		return false
	end

	local char, hum, root = getChar()

	if not hum or not root then
		return false
	end

	local target = Vector3.new(
		x,
		root.Position.Y,
		z
	)

	hum:MoveTo(target)

	local startTime = tick()

	while isActive and tick() - startTime < 15 do

		if not root or not root.Parent then
			return false
		end

		local distance = (
			Vector3.new(root.Position.X, 0, root.Position.Z)
			-
			Vector3.new(x, 0, z)
		).Magnitude

		if distance <= 2 then
			return true
		end

		task.wait(0.2)
	end

	if isActive then
		hum:MoveTo(target)
		task.wait(1)

		local distance = (
			Vector3.new(root.Position.X, 0, root.Position.Z)
			-
			Vector3.new(x, 0, z)
		).Magnitude

		return distance <= 3
	end

	return false
end

-- ========== PARCOURS INFINI ==========

local function startParcours()
	if isRunning then
		return
	end

	isRunning = true

	while isActive do

		-- =========================================
		-- 1️⃣ PREMIÈRE DESTINATION
		-- =========================================

		local ox = math.random(-2, 2) / 10
		local oz = math.random(-2, 2) / 10

		local ok1 = walkTo(
			549 + ox,
			7825.4 + oz
		)

		if not isActive then
			break
		end

		if not ok1 then
			task.wait(1)
			continue
		end

		-- =========================================
		-- 2️⃣ ATTENTE DE 1 MIN 40
		-- =========================================

		for i = 1, 100 do
			if not isActive then
				break
			end

			task.wait(1)
		end

		if not isActive then
			break
		end

		-- =========================================
		-- 3️⃣ CLIC
		-- =========================================

		faireClic()

		task.wait(0.5)

		-- =========================================
		-- 4️⃣ DEUXIÈME DESTINATION
		-- =========================================

		local ok2 = walkTo(
			556.1,
			7818.2
		)

		if not isActive then
			break
		end

		if not ok2 then
			task.wait(1)
			continue
		end

		-- Petite pause avant de recommencer
		task.wait(1)
	end

	isRunning = false

	Button.Text = "Activer Parcours"
	Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
end

-- ========== BOUTON ==========

Button.MouseButton1Click:Connect(function()

	if isActive then
		isActive = false

		Button.Text = "Activer Parcours"
		Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

		stopMoving()

		return
	end

	isActive = true

	Button.Text = "Désactiver Parcours"
	Button.BackgroundColor3 = Color3.fromRGB(200, 40, 40)

	task.spawn(startParcours)
end)

print("Script chargé - sans mouvement répété au début")
