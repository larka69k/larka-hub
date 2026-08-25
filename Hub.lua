--========================================================--
--                    RGB COLOR PICKER
--========================================================--

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

local SelectedColorName = nil
local PickerOpen = false

--========================================================--
--                     COLOR PICKER
--========================================================--

local Picker = Instance.new("Frame")

Picker.Parent = ScreenGui
Picker.Visible = false
Picker.ZIndex = 100

Picker.Size = UDim2.new(0, 260, 0, 250)

Picker.BackgroundColor3 =
    Color("Background")

Picker.BorderSizePixel = 0

local PickerCorner = Instance.new("UICorner")
PickerCorner.CornerRadius = UDim.new(0, 12)
PickerCorner.Parent = Picker

local PickerStroke = Instance.new("UIStroke")
PickerStroke.Thickness = 1
PickerStroke.Color = Color("Secondary")
PickerStroke.Parent = Picker

--========================================================--
--                         TITLE
--========================================================--

local PickerTitle = Instance.new("TextLabel")

PickerTitle.Parent = Picker
PickerTitle.Position = UDim2.new(0, 12, 0, 10)
PickerTitle.Size = UDim2.new(1, -24, 0, 25)

PickerTitle.BackgroundTransparency = 1
PickerTitle.Text = "COLOR PICKER"

PickerTitle.TextColor3 = Color("Text")
PickerTitle.TextSize = 14
PickerTitle.Font = Enum.Font.GothamBold

PickerTitle.TextXAlignment =
    Enum.TextXAlignment.Left

--========================================================--
--                      PREVIEW
--========================================================--

local ColorPreview = Instance.new("Frame")

ColorPreview.Parent = Picker
ColorPreview.Position = UDim2.new(0, 12, 0, 42)
ColorPreview.Size = UDim2.new(1, -24, 0, 35)

ColorPreview.BackgroundColor3 =
    Color("Main")

ColorPreview.BorderSizePixel = 0

local PreviewCorner = Instance.new("UICorner")
PreviewCorner.CornerRadius = UDim.new(0, 7)
PreviewCorner.Parent = ColorPreview

--========================================================--
--                       RGB INPUTS
--========================================================--

local RGBInputs = {}

local function CreateRGBInput(Name, Position)

    local Box = Instance.new("TextBox")

    Box.Parent = Picker

    Box.Position = Position
    Box.Size = UDim2.new(0, 70, 0, 32)

    Box.BackgroundColor3 =
        Color("Panel")

    Box.BorderSizePixel = 0

    Box.Text = "255"

    Box.TextColor3 =
        Color("Text")

    Box.PlaceholderText =
        Name

    Box.PlaceholderColor3 =
        Color("SubText")

    Box.TextSize = 11
    Box.Font = Enum.Font.GothamMedium

    Box.ClearTextOnFocus = false

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Box

    local Padding = Instance.new("UIPadding")
    Padding.Parent = Box
    Padding.PaddingLeft = UDim.new(0, 8)

    RGBInputs[Name] = Box

end

CreateRGBInput(
    "R",
    UDim2.new(0, 12, 0, 90)
)

CreateRGBInput(
    "G",
    UDim2.new(0, 95, 0, 90)
)

CreateRGBInput(
    "B",
    UDim2.new(0, 178, 0, 90)
)

--========================================================--
--                     APPLY BUTTON
--========================================================--

local ApplyColor = Instance.new("TextButton")

ApplyColor.Parent = Picker

ApplyColor.Position =
    UDim2.new(0, 12, 0, 135)

ApplyColor.Size =
    UDim2.new(1, -24, 0, 35)

ApplyColor.BackgroundColor3 =
    Color("Main")

ApplyColor.BorderSizePixel = 0

ApplyColor.Text =
    "APPLY COLOR"

ApplyColor.TextColor3 =
    Color("Text")

ApplyColor.TextSize = 11
ApplyColor.Font = Enum.Font.GothamBold

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 7)
ApplyCorner.Parent = ApplyColor

--========================================================--
--                        CLOSE
--========================================================--

local CancelColor = Instance.new("TextButton")

CancelColor.Parent = Picker

CancelColor.Position =
    UDim2.new(0, 12, 0, 180)

CancelColor.Size =
    UDim2.new(1, -24, 0, 30)

CancelColor.BackgroundColor3 =
    Color("Panel")

CancelColor.BorderSizePixel = 0

CancelColor.Text =
    "CANCEL"

CancelColor.TextColor3 =
    Color("SubText")

CancelColor.TextSize = 10
CancelColor.Font = Enum.Font.GothamBold

local CancelCorner = Instance.new("UICorner")
CancelCorner.CornerRadius = UDim.new(0, 7)
CancelCorner.Parent = CancelColor

--========================================================--
--                     OPEN PICKER
--========================================================--

local function OpenColorPicker(Name)

    SelectedColorName = Name

    local CurrentColor =
        Color(Name)

    local R =
        math.floor(CurrentColor.R * 255)

    local G =
        math.floor(CurrentColor.G * 255)

    local B =
        math.floor(CurrentColor.B * 255)

    RGBInputs.R.Text = tostring(R)
    RGBInputs.G.Text = tostring(G)
    RGBInputs.B.Text = tostring(B)

    ColorPreview.BackgroundColor3 =
        CurrentColor

    PickerTitle.Text =
        "COLOR PICKER • "
        .. string.upper(Name)

    Picker.Position =
        UDim2.new(
            0.5,
            -130,
            0.5,
            -125
        )

    Picker.Visible = true

    PickerOpen = true

end

--========================================================--
--                    RGB PREVIEW
--========================================================--

local function UpdatePreview()

    local R =
        math.clamp(
            tonumber(RGBInputs.R.Text) or 0,
            0,
            255
        )

    local G =
        math.clamp(
            tonumber(RGBInputs.G.Text) or 0,
            0,
            255
        )

    local B =
        math.clamp(
            tonumber(RGBInputs.B.Text) or 0,
            0,
            255
        )

    ColorPreview.BackgroundColor3 =
        Color3.fromRGB(R, G, B)

end

for _, Box in pairs(RGBInputs) do

    Connect(
        Box:GetPropertyChangedSignal("Text"),
        UpdatePreview
    )

end

--========================================================--
--                       APPLY
--========================================================--

Connect(
    ApplyColor.MouseButton1Click,
    function()

        if not SelectedColorName then
            return
        end

        local R =
            math.clamp(
                tonumber(RGBInputs.R.Text) or 0,
                0,
                255
            )

        local G =
            math.clamp(
                tonumber(RGBInputs.G.Text) or 0,
                0,
                255
            )

        local B =
            math.clamp(
                tonumber(RGBInputs.B.Text) or 0,
                0,
                255
            )

        local NewColor =
            Color3.fromRGB(R, G, B)

        Core:SetColor(
            SelectedColorName,
            NewColor
        )

        if ColorButtons[SelectedColorName] then

            ColorButtons[
                SelectedColorName
            ].BackgroundColor3 =
                NewColor

        end

        Picker.Visible = false
        PickerOpen = false

    end
)

--========================================================--
--                       CANCEL
--========================================================--

Connect(
    CancelColor.MouseButton1Click,
    function()

        Picker.Visible = false
        PickerOpen = false

    end
)

--========================================================--
--                    COLOR CONTROLS
--========================================================--

local function CreateColorControl(Name)

    local Row = Instance.new("Frame")

    Row.Parent = Home

    Row.Size =
        UDim2.new(1, -5, 0, 32)

    Row.BackgroundColor3 =
        Color("Panel")

    Row.BorderSizePixel = 0

    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(0, 7)

    Corner.Parent = Row

    local Label =
        Instance.new("TextLabel")

    Label.Parent = Row

    Label.Position =
        UDim2.new(0, 10, 0, 0)

    Label.Size =
        UDim2.new(0.5, 0, 1, 0)

    Label.BackgroundTransparency = 1

    Label.Text =
        string.upper(Name)
        .. " COLOR"

    Label.TextColor3 =
        Color("Text")

    Label.TextSize = 10
    Label.Font = Enum.Font.GothamMedium

    Label.TextXAlignment =
        Enum.TextXAlignment.Left

    local ColorButton =
        Instance.new("TextButton")

    ColorButton.Parent = Row

    ColorButton.Position =
        UDim2.new(1, -110, 0, 5)

    ColorButton.Size =
        UDim2.new(0, 100, 0, 22)

    ColorButton.BackgroundColor3 =
        Color(Name)

    ColorButton.BorderSizePixel = 0

    ColorButton.Text = ""

    local ButtonCorner =
        Instance.new("UICorner")

    ButtonCorner.CornerRadius =
        UDim.new(0, 6)

    ButtonCorner.Parent =
        ColorButton

    ColorButtons[Name] =
        ColorButton

    Connect(
        ColorButton.MouseButton1Click,
        function()

            OpenColorPicker(Name)

        end
    )

end

for _, Name in ipairs(ColorNames) do

    CreateColorControl(Name)

end
