    --==============================================================
    -- CHARLINN E BELLA | TIPO CENA DE NOVELA
    -- HUB MOBILE + PC | KILL NPC + AUTO FARME
    -- CORAÇÃO FLUTUANTE | MINIMIZAR / REABRIR
    -- SEM SISTEMA VIP / SEM GAME PASS
    --==============================================================

    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")

    local CoreGui = game:GetService("CoreGui")
    local Player = Players.LocalPlayer
    local PlayerGui = Player:WaitForChild("PlayerGui")

    --==============================================================
    -- PARENT DA INTERFACE
    --==============================================================

    local UIParent = PlayerGui

    if type(gethui) == "function" then
        local ok, hui = pcall(function()
            return gethui()
        end)

        if ok and hui then
            UIParent = hui
        end
    else
        local ok, core = pcall(function()
            return CoreGui
        end)

        if ok and core then
            UIParent = core
        end
    end

    for _, root in ipairs({PlayerGui, CoreGui, UIParent}) do
        pcall(function()
            local old = root:FindFirstChild("CHARLINN_E_BELLA_HUB")
            if old then
                old:Destroy()
            end
        end)
    end

    --==============================================================
    -- CORES
    --==============================================================

    local C = {
        Background = Color3.fromRGB(25, 7, 20),
        Panel = Color3.fromRGB(43, 10, 34),
        Panel2 = Color3.fromRGB(61, 12, 46),

        Pink = Color3.fromRGB(255, 0, 128),
        PinkLight = Color3.fromRGB(255, 74, 170),
        PinkSoft = Color3.fromRGB(255, 160, 210),

        White = Color3.fromRGB(255, 245, 251),
        Muted = Color3.fromRGB(205, 160, 188),

        Green = Color3.fromRGB(95, 235, 155),
        Red = Color3.fromRGB(255, 85, 115),
    }

    --==============================================================
    -- SCREEN GUI
    --==============================================================

    local Gui = Instance.new("ScreenGui")
    Gui.Name = "CHARLINN_E_BELLA_HUB"
    Gui.ResetOnSpawn = false
    Gui.IgnoreGuiInset = true
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Gui.DisplayOrder = 999
    Gui.Enabled = true

    local parentOK, parentError = pcall(function()
        Gui.Parent = UIParent
    end)

    if not parentOK then
        Gui.Parent = PlayerGui
        warn("[CHARLINN E BELLA] Usando PlayerGui: " .. tostring(parentError))
    end

    local Scale = Instance.new("UIScale")
    Scale.Scale = 1
    Scale.Parent = Gui

    --==============================================================
    -- JANELA PRINCIPAL
    --==============================================================

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = UDim2.new(0, 430, 0, 570)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = C.Background
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Visible = true
    Main.Active = true
    Main.Parent = Gui

    local MainSize = Instance.new("UISizeConstraint")
    MainSize.MinSize = Vector2.new(290, 360)
    MainSize.MaxSize = Vector2.new(540, 690)
    MainSize.Parent = Main

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 18)
    MainCorner.Parent = Main

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = C.Pink
    MainStroke.Thickness = 2
    MainStroke.Transparency = 0.08
    MainStroke.Parent = Main

    --==============================================================
    -- CABEÇALHO
    --==============================================================

    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 82)
    Header.BackgroundColor3 = C.Panel
    Header.BorderSizePixel = 0
    Header.Parent = Main

    local HeaderGradient = Instance.new("UIGradient")
    HeaderGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 55)),
        ColorSequenceKeypoint.new(0.55, C.Pink),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 0, 75)),
    })
    HeaderGradient.Rotation = 0
    HeaderGradient.Parent = Header

    local Title = Instance.new("TextLabel")
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.fromOffset(14, 8)
    Title.Size = UDim2.new(1, -100, 0, 34)
    Title.Font = Enum.Font.GothamBlack
    Title.Text = "♥ CHARLINN E BELLA"
    Title.TextColor3 = C.White
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header

    local Subtitle = Instance.new("TextLabel")
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.fromOffset(16, 43)
    Subtitle.Size = UDim2.new(1, -105, 0, 22)
    Subtitle.Font = Enum.Font.GothamBold
    Subtitle.Text = "TIPO CENA DE NOVELA"
    Subtitle.TextColor3 = C.White
    Subtitle.TextSize = 11
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = Header

    --==============================================================
    -- BOTÃO CORAÇÃO DO CABEÇALHO
    --==============================================================

    local Minimize = Instance.new("TextButton")
    Minimize.Name = "Minimize"
    Minimize.Size = UDim2.fromOffset(34, 34)
    Minimize.Position = UDim2.new(1, -78, 0, 12)
    Minimize.BackgroundColor3 = C.Pink
    Minimize.Text = "♥"
    Minimize.TextColor3 = C.White
    Minimize.TextSize = 20
    Minimize.Font = Enum.Font.GothamBlack
    Minimize.AutoButtonColor = true
    Minimize.Parent = Header

    Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1, 0)

    local MinimizeStroke = Instance.new("UIStroke")
    MinimizeStroke.Color = C.PinkSoft
    MinimizeStroke.Thickness = 1.5
    MinimizeStroke.Parent = Minimize

    --==============================================================
    -- BOTÃO FECHAR
    --==============================================================

    local Close = Instance.new("TextButton")
    Close.Name = "Close"
    Close.Size = UDim2.fromOffset(34, 34)
    Close.Position = UDim2.new(1, -39, 0, 12)
    Close.BackgroundColor3 = Color3.fromRGB(130, 0, 65)
    Close.Text = "×"
    Close.TextColor3 = C.White
    Close.TextSize = 24
    Close.Font = Enum.Font.GothamBlack
    Close.Parent = Header

    Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 10)

    --==============================================================
    -- CORAÇÃO FLUTUANTE
    --==============================================================

    local HeartButton = Instance.new("TextButton")
    HeartButton.Name = "FloatingHeart"
    HeartButton.Size = UDim2.fromOffset(48, 48)
    HeartButton.Position = UDim2.new(1, -70, 0.5, -24)
    HeartButton.AnchorPoint = Vector2.new(0, 0)
    HeartButton.BackgroundColor3 = C.Pink
    HeartButton.BorderSizePixel = 0
    HeartButton.Text = "♥"
    HeartButton.TextColor3 = C.White
    HeartButton.TextSize = 29
    HeartButton.Font = Enum.Font.GothamBlack
    HeartButton.Visible = false
    HeartButton.Active = true
    HeartButton.AutoButtonColor = true
    HeartButton.ZIndex = 100
    HeartButton.Parent = Gui

    local HeartCorner = Instance.new("UICorner")
    HeartCorner.CornerRadius = UDim.new(1, 0)
    HeartCorner.Parent = HeartButton

    local HeartStroke = Instance.new("UIStroke")
    HeartStroke.Color = C.PinkSoft
    HeartStroke.Thickness = 2
    HeartStroke.Parent = HeartButton

   --==============================================================
-- ABAS | ROLAGEM PC + MOBILE
--==============================================================

local TabBar = Instance.new("ScrollingFrame")
TabBar.Name = "TabBar"
TabBar.Position = UDim2.fromOffset(10, 91)
TabBar.Size = UDim2.new(1, -20, 0, 46)
TabBar.BackgroundColor3 = C.Panel
TabBar.BorderSizePixel = 0
TabBar.ScrollBarThickness = 3
TabBar.ScrollBarImageColor3 = C.Pink
TabBar.ScrollingDirection = Enum.ScrollingDirection.X
TabBar.AutomaticCanvasSize = Enum.AutomaticSize.X
TabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
TabBar.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
TabBar.Active = true
TabBar.Parent = Main

Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 12)

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingLeft = UDim.new(0, 5)
TabPadding.PaddingRight = UDim.new(0, 5)
TabPadding.PaddingTop = UDim.new(0, 4)
TabPadding.PaddingBottom = UDim.new(0, 4)
TabPadding.Parent = TabBar

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 8)
TabLayout.Parent = TabBar

local TabCount = 0

local function MakeTab(text, x)
    TabCount = TabCount + 1

    local b = Instance.new("TextButton")
    b.Name = "Tab_" .. TabCount
    b.Size = UDim2.new(0, 100, 1, -8)
    b.BackgroundColor3 = C.Panel2
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = C.Muted
    b.TextSize = 11
    b.Font = Enum.Font.GothamBlack
    b.LayoutOrder = TabCount
    b.AutoButtonColor = true
    b.Parent = TabBar

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 9)

    return b
end

local KillTab = MakeTab("☠ KILL")
local FarmTab = MakeTab("♡ FARM")
local TeleportTab = MakeTab("➤ TP")
local UtilsTab = MakeTab("🛠 UTILS")
local ESPTab = MakeTab("🎯 ESP")
    local HSTab = MakeTab("♥ AIMBOT" )

--==============================================================
-- ROLAGEM HORIZONTAL PELO MOUSE
--==============================================================

UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseWheel then

        local mousePosition = UIS:GetMouseLocation()
        local barPosition = TabBar.AbsolutePosition
        local barSize = TabBar.AbsoluteSize

        local dentro =
            mousePosition.X >= barPosition.X
            and mousePosition.X <= barPosition.X + barSize.X
            and mousePosition.Y >= barPosition.Y
            and mousePosition.Y <= barPosition.Y + barSize.Y

        if dentro then
            local maxScroll = math.max(
                0,
                TabBar.AbsoluteCanvasSize.X - TabBar.AbsoluteSize.X
            )

            local newPosition = math.clamp(
                TabBar.CanvasPosition.X - (input.Position.Z * 65),
                0,
                maxScroll
            )

            TabBar.CanvasPosition = Vector2.new(newPosition, 0)
        end
    end
end)
    local Pages = Instance.new("Frame")
    Pages.Name = "Pages"
   Pages.Position = UDim2.fromOffset(10, 148)
Pages.Size = UDim2.new(1, -20, 1, -158)
    Pages.BackgroundTransparency = 1
    Pages.Parent = Main

    --==============================================================
    -- CRIAR PÁGINAS
    --==============================================================

    local function MakePage(name)
        local page = Instance.new("ScrollingFrame")
        page.Name = name
        page.Size = UDim2.fromScale(1, 1)
        page.BackgroundColor3 = C.Panel
        page.BorderSizePixel = 0
        page.ScrollBarThickness = 4
        page.ScrollBarImageColor3 = C.PinkLight
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.CanvasSize = UDim2.new(0, 0, 0, 900)
        page.Visible = false
        page.Active = true
        page.Parent = Pages

        Instance.new("UICorner", page).CornerRadius = UDim.new(0, 12)

        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 12)
        padding.PaddingBottom = UDim.new(0, 12)
        padding.PaddingLeft = UDim.new(0, 12)
        padding.PaddingRight = UDim.new(0, 12)
        padding.Parent = page

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = page

        return page
    end

    local KillPage = MakePage("KillPage")
    local FarmPage = MakePage("FarmPage")
    local TeleportPage = MakePage("TeleportPage")
    local UtilsPage = MakePage("UtilsPage")
    local ESPPage = MakePage("ESPPage")
    local HSPage = MakePage("HSPage")
    UtilsPage.Visible = false
    TeleportPage.Visible = false

    KillPage.Visible = true
    FarmPage.Visible = false

    local function ShowPage(which)



        KillPage.Visible = which == "kill"
        FarmPage.Visible = which == "farm"
        TeleportPage.Visible = which == "teleport"
        UtilsPage.Visible = which == "utils"

        KillPage.CanvasPosition = Vector2.new(0, 0)
        FarmPage.CanvasPosition = Vector2.new(0, 0)
        TeleportPage.CanvasPosition = Vector2.new(0, 0)
        UtilsPage.CanvasPosition = Vector2.new(0, 0)

        KillTab.BackgroundColor3 = which == "kill" and C.Pink or C.Panel2
        FarmTab.BackgroundColor3 = which == "farm" and C.Pink or C.Panel2
        TeleportTab.BackgroundColor3 = which == "teleport" and C.Pink or C.Panel2
        UtilsTab.BackgroundColor3 = which == "utils" and C.Pink or C.Panel2


        ESPPage.Visible = which == "esp"
        ESPPage.CanvasPosition = Vector2.new(0, 0)

        ESPTab.BackgroundColor3 = which == "esp" and C.Pink or C.Panel2
        ESPTab.TextColor3 = which == "esp" and C.White or C.Muted

        KillTab.TextColor3 = which == "kill" and C.White or C.Muted
        FarmTab.TextColor3 = which == "farm" and C.White or C.Muted
        TeleportTab.TextColor3 = which == "teleport" and C.White or C.Muted
        UtilsTab.TextColor3 = which == "utils" and C.White or C.Muted
        HSPage.Visible = which == "hs"
HSPage.CanvasPosition = Vector2.new(0, 0)

HSTab.BackgroundColor3 = which == "hs" and C.Pink or C.Panel2
HSTab.TextColor3 = which == "hs" and C.White or C.Muted

    end

    KillTab.MouseButton1Click:Connect(function()
        ShowPage("kill")
    end)

    FarmTab.MouseButton1Click:Connect(function()
        ShowPage("farm")
    end)

    TeleportTab.MouseButton1Click:Connect(function()
        ShowPage("teleport")
    end)
    UtilsTab.MouseButton1Click:Connect(function()
        ShowPage("utils")
    end)
HSTab.MouseButton1Click:Connect(function()
    ShowPage("hs")
end)
    ESPTab.MouseButton1Click:Connect(function()
        ShowPage("esp")
    end)
    --==============================================================
    -- COMPONENTES
    --==============================================================

    local function Label(parent, text, height)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, height or 28)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = C.White
        label.Font = Enum.Font.GothamBold
        label.TextSize = 12
        label.TextWrapped = true
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = parent

        return label
    end

    local function Section(parent, title, description)
        local height = 250

        if string.find(string.upper(title), "KILL NPC") then
            height = 315
        elseif string.find(string.upper(title), "ROTA DE FARM") then

            elseif string.find(string.upper(title), "TELEPORT") then
        height = 390
            height = 235
        elseif string.find(string.upper(title), "ESPECIAL AUTOMÁTICO") then
            height = 300
        elseif string.find(string.upper(title), "CONTROLE DO FARM") then
            height = 220
        end

        local frame = Instance.new("Frame")
        frame.Name = "Section_" .. string.gsub(title, "%W", "")
        frame.Size = UDim2.new(1, -2, 0, height)
        frame.AutomaticSize = Enum.AutomaticSize.None
        frame.BackgroundColor3 = C.Panel2
        frame.BorderSizePixel = 0
        frame.ClipsDescendants = false
        frame.Parent = parent

        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 9)
        pad.PaddingBottom = UDim.new(0, 9)
        pad.PaddingLeft = UDim.new(0, 10)
        pad.PaddingRight = UDim.new(0, 10)
        pad.Parent = frame

        local list = Instance.new("UIListLayout")
        list.Padding = UDim.new(0, 7)
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Parent = frame

        local titleLabel = Label(frame, title, 22)
        titleLabel.LayoutOrder = 1

        local desc = Label(frame, description, 30)
        desc.LayoutOrder = 2
        desc.Font = Enum.Font.Gotham
        desc.TextColor3 = C.Muted
        desc.TextSize = 10

        return frame
    end

    local function Button(parent, text, callback)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, 0, 0, 40)
        b.BackgroundColor3 = C.Pink
        b.BorderSizePixel = 0
        b.AutoButtonColor = true
        b.Text = text
        b.TextColor3 = C.White
        b.TextSize = 12
        b.Font = Enum.Font.GothamBlack
        b.Parent = parent

        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 9)

        local stroke = Instance.new("UIStroke")
        stroke.Color = C.PinkLight
        stroke.Thickness = 1
        stroke.Transparency = 0.2
        stroke.Parent = b

        b.MouseButton1Click:Connect(function()
            if callback then
                local ok, err = pcall(callback)

                if not ok then
                    warn("[CHARLINN E BELLA] " .. tostring(err))
                end
            end
        end)

        return b
    end

    local function Input(parent, placeholder, defaultText)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(1, 0, 0, 38)
        box.BackgroundColor3 = C.Background
        box.BorderSizePixel = 0
        box.PlaceholderText = placeholder
        box.Text = defaultText or ""
        box.TextColor3 = C.White
        box.PlaceholderColor3 = C.Muted
        box.Font = Enum.Font.Gotham
        box.TextSize = 12
        box.ClearTextOnFocus = false
        box.Parent = parent

        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

        return box
    end

    local function SetStatus(label, text, color)
        label.Text = text

        if color then
            label.TextColor3 = color
        end
    end

    local function GetRoot()
        local character = Player.Character

        if not character then
            return nil
        end

        return character:FindFirstChild("HumanoidRootPart")
    end


--==============================================================
-- NOVA ABA | CHARLINN PINK HS FPS
-- NPC + PLAYERS | MOBILE + PC
-- FOV DESLIZANTE | CABEÇA / PEITO | HS ON/OFF
--==============================================================

local HSSection = Section(
    HSPage,
    "🎀 CHARLINN E BELLA | HS FPS",
    "Mira assistida para NPCs e jogadores do seu próprio jogo."
)

HSSection.AutomaticSize = Enum.AutomaticSize.Y
HSSection.Size = UDim2.new(1, -2, 0, 0)

-- CONFIGURAÇÕES
local HSEnabled = false
local HSAimPart = "Head"

local FOVRadius = 100
local MinFOV = 30
local MaxFOV = 300
local MaxAimDistance = 300

local HSAimSmoothness = 0,2
local HSDragging = false
local HSConnection = nil

--==============================================================
-- CÍRCULO FOV
--==============================================================

local OldHSOverlay = PlayerGui:FindFirstChild("CHARLINN_HS_OVERLAY")

if OldHSOverlay then
    OldHSOverlay:Destroy()
end

local HSOverlay = Instance.new("ScreenGui")
HSOverlay.Name = "CHARLINN_HS_OVERLAY"
HSOverlay.IgnoreGuiInset = true
HSOverlay.ResetOnSpawn = false
HSOverlay.DisplayOrder = 1000
HSOverlay.Parent = PlayerGui

local FOVCircle = Instance.new("Frame")
FOVCircle.Name = "FOVCircle"
FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircle.Position = UDim2.fromScale(0.5, 0.5)
FOVCircle.Size = UDim2.fromOffset(200, 200)
FOVCircle.BackgroundTransparency = 1
FOVCircle.BorderSizePixel = 0
FOVCircle.Visible = false
FOVCircle.Parent = HSOverlay

local FOVCorner = Instance.new("UICorner")
FOVCorner.CornerRadius = UDim.new(1, 0)
FOVCorner.Parent = FOVCircle

local FOVStroke = Instance.new("UIStroke")
FOVStroke.Color = C.PinkLight
FOVStroke.Thickness = 2
FOVStroke.Transparency = 0
FOVStroke.Parent = FOVCircle

--==============================================================
-- SELEÇÃO CABEÇA / PEITO
--==============================================================

Label(HSSection, "ESCOLHA ONDE A MIRA DEVE FOCAR", 25)

local HeadButton
local ChestButton

local function UpdateHSButtons()
    HeadButton.Text = HSAimPart == "Head"
        and "♥ MIRA NA CABEÇA [ON]"
        or "♡ MIRA NA CABEÇA"

    ChestButton.Text = HSAimPart == "Chest"
        and "♥ MIRA NO PEITO [ON]"
        or "♡ MIRA NO PEITO"

    HeadButton.BackgroundColor3 = HSAimPart == "Head"
        and C.Pink
        or C.Panel

    ChestButton.BackgroundColor3 = HSAimPart == "Chest"
        and C.Pink
        or C.Panel
end

HeadButton = Button(HSSection, "♥ MIRA NA CABEÇA [ON]", function()
    HSAimPart = "Head"
    UpdateHSButtons()
end)

ChestButton = Button(HSSection, "♡ MIRA NO PEITO", function()
    HSAimPart = "Chest"
    UpdateHSButtons()
end)

--==============================================================
-- TAMANHO DO FOV
--==============================================================

Label(HSSection, "TAMANHO DO FOV", 25)

local FOVValue = Label(
    HSSection,
    "100",
    26
)

FOVValue.TextColor3 = C.PinkSoft
FOVValue.TextSize = 19
FOVValue.TextXAlignment = Enum.TextXAlignment.Center

local Slider = Instance.new("Frame")
Slider.Name = "FOVSlider"
Slider.Size = UDim2.new(1, 0, 0, 22)
Slider.BackgroundColor3 = C.Background
Slider.BorderSizePixel = 0
Slider.Active = true
Slider.Parent = HSSection

Instance.new("UICorner", Slider).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0, 0, 1, 0)
SliderFill.BackgroundColor3 = C.Pink
SliderFill.BorderSizePixel = 0
SliderFill.Parent = Slider

Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

local SliderKnob = Instance.new("Frame")
SliderKnob.Size = UDim2.fromOffset(20, 20)
SliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
SliderKnob.Position = UDim2.new(0, 0, 0.5, 0)
SliderKnob.BackgroundColor3 = C.White
SliderKnob.BorderSizePixel = 0
SliderKnob.Parent = Slider

Instance.new("UICorner", SliderKnob).CornerRadius = UDim.new(1, 0)

local SliderKnobStroke = Instance.new("UIStroke")
SliderKnobStroke.Color = C.PinkLight
SliderKnobStroke.Thickness = 1
SliderKnobStroke.Parent = SliderKnob

local function UpdateHSFOV(Value)
    FOVRadius = math.clamp(
        math.floor(Value),
        MinFOV,
        MaxFOV
    )

    local Percent = (FOVRadius - MinFOV) / (MaxFOV - MinFOV)

    SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
    SliderKnob.Position = UDim2.new(Percent, 0, 0.5, 0)

    FOVValue.Text = tostring(FOVRadius)

    FOVCircle.Size = UDim2.fromOffset(
        FOVRadius * 2,
        FOVRadius * 2
    )
end

local function MoveHSSlider(Position)
    local Width = Slider.AbsoluteSize.X

    if Width <= 0 then
        return
    end

    local Percent = math.clamp(
        (Position.X - Slider.AbsolutePosition.X) / Width,
        0,
        1
    )

    UpdateHSFOV(
        MinFOV + Percent * (MaxFOV - MinFOV)
    )
end

Slider.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        HSDragging = true
        MoveHSSlider(Input.Position)
    end
end)

UIS.InputChanged:Connect(function(Input)
    if not HSDragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then

        MoveHSSlider(Input.Position)
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        HSDragging = false
    end
end)

--==============================================================
-- STATUS E BOTÃO HS
--==============================================================

local HSStatus = Label(
    HSSection,
    "HS: DESATIVADO\nALVOS: NPCs + PLAYERS",
    42
)

HSStatus.TextColor3 = C.PinkSoft

local HSButton

HSButton = Button(HSSection, "♡ HS: OFF", function()
    HSEnabled = not HSEnabled

    if not HSEnabled then
        HSStatus.Text = "HS: DESATIVADO\nALVOS: NPCs + PLAYERS"
    else
        HSStatus.Text = "HS: ATIVADO\nALVOS: NPCs + PLAYERS"
    end

    HSButton.Text = HSEnabled
        and "♥ HS: ON"
        or "♡ HS: OFF"

    HSButton.BackgroundColor3 = HSEnabled
        and C.Pink
        or C.Panel

    FOVCircle.Visible = HSEnabled
end)

--==============================================================
-- SMOOTHNESS | CONTROLE DESLIZANTE 0.5 ATÉ 10
--==============================================================

local MinSmoothness = 0.3
local MaxSmoothness = 10
local SmoothDragging = false

Label(HSSection, "🎯 AJUSTE AIMBOT", 25)

local SmoothValue = Label(
    HSSection,
    "SMOOTHNESS: 1.0",
    26
)

SmoothValue.TextColor3 = C.PinkSoft
SmoothValue.TextSize = 19
SmoothValue.TextXAlignment = Enum.TextXAlignment.Center

local SmoothSlider = Instance.new("Frame")
SmoothSlider.Name = "SmoothnessSlider"
SmoothSlider.Size = UDim2.new(1, 0, 0, 24)
SmoothSlider.BackgroundColor3 = C.Background
SmoothSlider.BorderSizePixel = 0
SmoothSlider.Active = true
SmoothSlider.Parent = HSSection

Instance.new("UICorner", SmoothSlider).CornerRadius = UDim.new(1, 0)

local SmoothFill = Instance.new("Frame")
SmoothFill.BackgroundColor3 = C.Pink
SmoothFill.BorderSizePixel = 0
SmoothFill.Parent = SmoothSlider

Instance.new("UICorner", SmoothFill).CornerRadius = UDim.new(1, 0)

local SmoothKnob = Instance.new("Frame")
SmoothKnob.Size = UDim2.fromOffset(20, 20)
SmoothKnob.AnchorPoint = Vector2.new(0.5, 0.5)
SmoothKnob.BackgroundColor3 = C.White
SmoothKnob.BorderSizePixel = 0
SmoothKnob.Parent = SmoothSlider

Instance.new("UICorner", SmoothKnob).CornerRadius = UDim.new(1, 0)

local SmoothStroke = Instance.new("UIStroke")
SmoothStroke.Color = C.PinkLight
SmoothStroke.Thickness = 1
SmoothStroke.Parent = SmoothKnob

local function UpdateSmoothness(Value)
    HSAimSmoothness = math.clamp(
        math.floor(Value * 10 + 0.5) / 10,
        MinSmoothness,
        MaxSmoothness
    )

    local Percent = (HSAimSmoothness - MinSmoothness)
        / (MaxSmoothness - MinSmoothness)

    SmoothFill.Size = UDim2.new(Percent, 0, 1, 0)
    SmoothKnob.Position = UDim2.new(Percent, 0, 0.5, 0)

    SmoothValue.Text = "AIMBOT: " .. string.format("%.1f", HSAimSmoothness)
end

local function MoveSmoothSlider(Position)
    local Width = SmoothSlider.AbsoluteSize.X

    if Width <= 0 then
        return
    end

    local Percent = math.clamp(
        (Position.X - SmoothSlider.AbsolutePosition.X) / Width,
        0,
        1
    )

    UpdateSmoothness(
        MinSmoothness + Percent * (MaxSmoothness - MinSmoothness)
    )
end

SmoothSlider.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        SmoothDragging = true
        MoveSmoothSlider(Input.Position)
    end
end)

UIS.InputChanged:Connect(function(Input)
    if SmoothDragging then
        if Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch then

            MoveSmoothSlider(Input.Position)
        end
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        SmoothDragging = false
    end
end)

UpdateSmoothness(HSAimSmoothness)

--==============================================================
-- IDENTIFICAR CABEÇA OU PEITO
--==============================================================

local function GetHSAimPart(Character)
    if not Character then
        return nil
    end

    if HSAimPart == "Head" then
        return Character:FindFirstChild("Head")
    end

    return Character:FindFirstChild("UpperTorso")
        or Character:FindFirstChild("Torso")
        or Character:FindFirstChild("HumanoidRootPart")
end

--==============================================================
-- VERIFICAR ALVO
--==============================================================

local function HSIsValidTarget(Model, TargetPlayer)
    if not Model or Model == Player.Character then
        return false
    end

    if TargetPlayer then
        if TargetPlayer == Player then
            return false
        end

        if Player.Team and TargetPlayer.Team then
            if Player.Team == TargetPlayer.Team then
                return false
            end
        end
    end

    local Humanoid = Model:FindFirstChildOfClass("Humanoid")

    if not Humanoid or Humanoid.Health <= 0 then
        return false
    end

    return true
end

--==============================================================
-- COLETAR NPCs E JOGADORES
--==============================================================

local function HSGetTargets()
    local Targets = {}

    -- JOGADORES
    for _, TargetPlayer in ipairs(Players:GetPlayers()) do
        if TargetPlayer ~= Player and TargetPlayer.Character then
            table.insert(Targets, {
                Model = TargetPlayer.Character,
                Player = TargetPlayer
            })
        end
    end

    -- NPCs: COLOQUE OS NPCs EM WORKSPACE > NPCs
    local NPCFolder = workspace:FindFirstChild("NPCs")

    if NPCFolder then
        for _, NPC in ipairs(NPCFolder:GetChildren()) do
            if NPC:IsA("Model") then
                local NPCPlayer = Players:GetPlayerFromCharacter(NPC)

                if not NPCPlayer then
                    table.insert(Targets, {
                        Model = NPC,
                        Player = nil
                    })
                end
            end
        end
    end

    return Targets
end

--==============================================================
-- VERIFICAR SE EXISTE OBSTÁCULO
--==============================================================

local function HSHasLineOfSight(Model, AimPart)
    local Camera = workspace.CurrentCamera

    if not Camera or not Model or not AimPart then
        return false
    end

    local Params = RaycastParams.new()
    Params.FilterType = Enum.RaycastFilterType.Exclude
    Params.FilterDescendantsInstances = {
        Player.Character
    }
    Params.IgnoreWater = true

    local Origin = Camera.CFrame.Position
    local Direction = AimPart.Position - Origin

    local Result = workspace:Raycast(
        Origin,
        Direction,
        Params
    )

    return Result ~= nil
        and Result.Instance:IsDescendantOf(Model)
end

--==============================================================
-- ESCOLHER ALVO MAIS PRÓXIMO DO CENTRO DO FOV
--==============================================================

local function HSGetBestTarget()
    local Camera = workspace.CurrentCamera

    if not Camera then
        return nil, nil
    end

    local Center = Camera.ViewportSize / 2

    local BestModel = nil
    local BestPart = nil
    local BestDistance = FOVRadius

    for _, TargetData in ipairs(HSGetTargets()) do
        local Model = TargetData.Model
        local TargetPlayer = TargetData.Player

        if HSIsValidTarget(Model, TargetPlayer) then
            local AimPart = GetHSAimPart(Model)

            if AimPart then
                local Position, OnScreen =
                    Camera:WorldToViewportPoint(AimPart.Position)

                local ScreenDistance = (
                    Vector2.new(Position.X, Position.Y) - Center
                ).Magnitude

                local WorldDistance = (
                    Camera.CFrame.Position - AimPart.Position
                ).Magnitude

                if OnScreen
                    and Position.Z > 0
                    and ScreenDistance <= BestDistance
                    and WorldDistance <= MaxAimDistance then

                    if HSHasLineOfSight(Model, AimPart) then
                        BestDistance = ScreenDistance
                        BestModel = Model
                        BestPart = AimPart
                    end
                end
            end
        end
    end

    return BestModel, BestPart
end

--==============================================================
-- ATUALIZAÇÃO DA MIRA E DO FOV
--==============================================================

HSConnection = RunService.RenderStepped:Connect(function()
    local Camera = workspace.CurrentCamera

    if not Camera then
        return
    end

    local Viewport = Camera.ViewportSize

    FOVCircle.Position = UDim2.fromOffset(
        Viewport.X / 2,
        Viewport.Y / 2
    )

    if not HSEnabled then
        FOVCircle.Visible = false
        return
    end

    FOVCircle.Visible = true

    local Target, AimPart = HSGetBestTarget()

    if Target and AimPart then
        local Origin = Camera.CFrame.Position

        local Goal = CFrame.lookAt(
            Origin,
            AimPart.Position
        )

        Camera.CFrame = Camera.CFrame:Lerp(
            Goal,
            HSAimSmoothness
        )
    end
end)

--==============================================================
-- LIMPEZA DO HS
--==============================================================

local function StopHS()
    HSEnabled = false
    HSDragging = false

    if HSConnection then
        HSConnection:Disconnect()
        HSConnection = nil
    end

    if HSOverlay and HSOverlay.Parent then
        HSOverlay:Destroy()
    end
end

--==============================================================
-- INICIALIZAÇÃO HS
--==============================================================

UpdateHSFOV(FOVRadius)
UpdateHSButtons()

FOVCircle.Visible = false

print("[CHARLINN PINK] HS FPS CARREGADO")





    --==============================================================
    -- ABA 5 | ESP FPS
    --==============================================================

    local ESPSection = Section(
        ESPPage,
        "🎯 CHARLINN | ESP FPS",
        "Marque aliados, inimigos e jogadores individualmente."
    )

    ESPSection.AutomaticSize = Enum.AutomaticSize.Y
    ESPSection.Size = UDim2.new(1, -2, 0, 0)

    local ESPTeamEnabled = true
    local ESPEnemyEnabled = true

    local TeamColor = Color3.fromRGB(70, 170, 255)
    local EnemyColor = Color3.fromRGB(255, 65, 65)

    local ESPObjects = {}
    local PlayerColors = {}
    local SelectedPlayer = nil
    local SelectedColor = Color3.fromRGB(255, 0, 128)
    local ESPConnection = nil

    local AvailableColors = {
        {Name = "VERMELHO", Color = Color3.fromRGB(255, 50, 50)},
        {Name = "AZUL", Color = Color3.fromRGB(50, 130, 255)},
        {Name = "VERDE", Color = Color3.fromRGB(50, 255, 100)},
        {Name = "AMARELO", Color = Color3.fromRGB(255, 230, 40)},
        {Name = "ROXO", Color = Color3.fromRGB(180, 70, 255)},
        {Name = "ROSA", Color = Color3.fromRGB(255, 0, 128)},
        {Name = "CIANO", Color = Color3.fromRGB(0, 255, 255)},
        {Name = "BRANCO", Color = Color3.fromRGB(255, 255, 255)},
        {Name = "LARANJA", Color = Color3.fromRGB(255, 140, 30)}
    }

    local ESPStatus = Label(
        ESPSection,
        "ESP: ATIVADO\nALIADOS: ATIVADOS\nINIMIGOS: ATIVADOS",
        65
    )

    ESPStatus.TextColor3 = C.PinkSoft
    ESPStatus.TextYAlignment = Enum.TextYAlignment.Top

    local function IsSameTeam(target)
        if Player.Team and target.Team then
            return Player.Team == target.Team
        end

        return false
    end

    local function RemoveESP(target)
        local data = ESPObjects[target]

        if data then
            if data.Highlight then
                data.Highlight:Destroy()
            end

            if data.Billboard then
                data.Billboard:Destroy()
            end

            ESPObjects[target] = nil
        end
    end

    local function CreateESP(target)
        if target == Player then
            RemoveESP(target)
            return
        end

        local character = target.Character

        if not character then
            RemoveESP(target)
            return
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local head = character:FindFirstChild("Head")

        if not humanoid or humanoid.Health <= 0 or not head then
            RemoveESP(target)
            return
        end

        local color = PlayerColors[target]

        if not color then
            if IsSameTeam(target) then
                if not ESPTeamEnabled then
                    RemoveESP(target)
                    return
                end

                color = TeamColor
            else
                if not ESPEnemyEnabled then
                    RemoveESP(target)
                    return
                end

                color = EnemyColor
            end
        end

        local data = ESPObjects[target]

        if not data or data.Character ~= character then
            RemoveESP(target)

            local highlight = Instance.new("Highlight")
            highlight.Name = "CHARLINN_ESP"
            highlight.Adornee = character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillTransparency = 0.65
            highlight.OutlineTransparency = 0
            highlight.Parent = character

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "CHARLINN_ESP_NAME"
            billboard.Adornee = head
            billboard.Size = UDim2.fromOffset(160, 35)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = head

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.fromScale(1, 1)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = target.DisplayName
            nameLabel.TextColor3 = color
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            nameLabel.Font = Enum.Font.GothamBlack
            nameLabel.TextSize = 13
            nameLabel.Parent = billboard

            data = {
                Highlight = highlight,
                Billboard = billboard,
                NameLabel = nameLabel,
                Character = character
            }

            ESPObjects[target] = data
        end

        data.Highlight.FillColor = color
        data.Highlight.OutlineColor = color
        data.NameLabel.TextColor3 = color
        data.NameLabel.Text = target.DisplayName
    end

    local function UpdateESP()
        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= Player then
                CreateESP(target)
            end
        end
    end

    local function UpdateESPStatus()
        ESPStatus.Text =
            "ALIADOS: " .. (ESPTeamEnabled and "ON" or "OFF")
            .. "\nINIMIGOS: " .. (ESPEnemyEnabled and "ON" or "OFF")
            .. "\nJOGADORES MARCADOS: " .. tostring(#Players:GetPlayers() - 1)
    end

    Button(ESPSection, "ALIADOS: LIGAR / DESLIGAR", function()
        ESPTeamEnabled = not ESPTeamEnabled
        UpdateESP()
        UpdateESPStatus()
    end)

    Button(ESPSection, "INIMIGOS: LIGAR / DESLIGAR", function()
        ESPEnemyEnabled = not ESPEnemyEnabled
        UpdateESP()
        UpdateESPStatus()
    end)

    Button(ESPSection, "ATUALIZAR ESP", function()
        UpdateESP()
        UpdateESPStatus()
    end)

    Label(ESPSection, "CORES DOS ALIADOS", 25)

    for _, colorData in ipairs({
        {Name = "AZUL", Color = Color3.fromRGB(70, 170, 255)},
        {Name = "VERDE", Color = Color3.fromRGB(50, 255, 100)},
        {Name = "AMARELO", Color = Color3.fromRGB(255, 230, 40)},
        {Name = "ROXO", Color = Color3.fromRGB(180, 70, 255)}
    }) do
        Button(ESPSection, "ALIADOS: " .. colorData.Name, function()
            TeamColor = colorData.Color
            UpdateESP()
        end)
    end

    Label(ESPSection, "CORES DOS INIMIGOS", 25)

    for _, colorData in ipairs({
        {Name = "VERMELHO", Color = Color3.fromRGB(255, 50, 50)},
        {Name = "LARANJA", Color = Color3.fromRGB(255, 140, 30)},
        {Name = "ROSA", Color = Color3.fromRGB(255, 0, 128)},
        {Name = "CIANO", Color = Color3.fromRGB(0, 255, 255)}
    }) do
        Button(ESPSection, "INIMIGOS: " .. colorData.Name, function()
            EnemyColor = colorData.Color
            UpdateESP()
        end)
    end

    Label(ESPSection, "MARCAR JOGADOR INDIVIDUALMENTE", 28)

    local PlayerNameInput = Input(
        ESPSection,
        "DIGITE O NOME DO JOGADOR",
        ""
    )

    local PlayerESPStatus = Label(
        ESPSection,
        "NENHUM JOGADOR SELECIONADO",
        40
    )

    PlayerESPStatus.TextColor3 = C.PinkSoft

    Button(ESPSection, "SELECIONAR JOGADOR", function()
        local searchName = string.lower(PlayerNameInput.Text)
        SelectedPlayer = nil

        if searchName == "" then
            PlayerESPStatus.Text = "DIGITE UM NOME PRIMEIRO"
            return
        end

        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= Player then
                local username = string.lower(target.Name)
                local displayName = string.lower(target.DisplayName)

                if string.find(username, searchName, 1, true)
                    or string.find(displayName, searchName, 1, true) then

                    SelectedPlayer = target
                    PlayerESPStatus.Text =
                        "SELECIONADO: " .. target.DisplayName
                    return
                end
            end
        end

        PlayerESPStatus.Text = "JOGADOR NÃO ENCONTRADO"
    end)

    Label(ESPSection, "ESCOLHA A COR INDIVIDUAL", 25)

    for _, colorData in ipairs(AvailableColors) do
        Button(ESPSection, "COR: " .. colorData.Name, function()
            SelectedColor = colorData.Color
            PlayerESPStatus.Text = "COR SELECIONADA: " .. colorData.Name
        end)
    end

    Button(ESPSection, "APLICAR COR AO JOGADOR", function()
        if not SelectedPlayer or not SelectedPlayer.Parent then
            PlayerESPStatus.Text = "SELECIONE UM JOGADOR PRIMEIRO"
            return
        end

        PlayerColors[SelectedPlayer] = SelectedColor
        UpdateESP()

        PlayerESPStatus.Text =
            "COR APLICADA: " .. SelectedPlayer.DisplayName
    end)

    Button(ESPSection, "REMOVER MARCAÇÃO INDIVIDUAL", function()
        if not SelectedPlayer then
            PlayerESPStatus.Text = "NENHUM JOGADOR SELECIONADO"
            return
        end

        PlayerColors[SelectedPlayer] = nil
        RemoveESP(SelectedPlayer)
        CreateESP(SelectedPlayer)

        PlayerESPStatus.Text = "MARCAÇÃO INDIVIDUAL REMOVIDA"
    end)

    Button(ESPSection, "LIMPAR TODAS AS MARCAÇÕES INDIVIDUAIS", function()
        PlayerColors = {}

        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= Player then
                RemoveESP(target)
            end
        end

        UpdateESP()
        PlayerESPStatus.Text = "MARCAÇÕES INDIVIDUAIS LIMPAS"
    end)

    -- Atualização automática e respawn
    ESPConnection = RunService.Heartbeat:Connect(function()
        UpdateESP()
    end)

    Players.PlayerRemoving:Connect(function(target)
        RemoveESP(target)
        PlayerColors[target] = nil
    end)

    local function StopESP()
        if ESPConnection then
            ESPConnection:Disconnect()
            ESPConnection = nil
        end

        local targets = {}

        for target in pairs(ESPObjects) do
            table.insert(targets, target)
        end

        for _, target in ipairs(targets) do
            RemoveESP(target)
        end

        PlayerColors = {}
    end

    UpdateESP()
    UpdateESPStatus()


    --==============================================================
    -- ABA 4 | UTILS
    -- FLY + ATRAVESSAR PAREDE + VELOCIDADE + PULO
    --==============================================================

    local UtilsSection = Section(
        UtilsPage,
        "🛠 CHARLINN | UTILS",
        "Voo, atravessar parede, velocidade e controle de pulo."
    )

    -- Aumenta a altura da seção para comportar os controles.
    UtilsSection.Size = UDim2.new(1, -2, 0, 570)

    --==============================================================
    -- CONFIGURAÇÕES
    --==============================================================

    local FlyEnabled = false
    local NoclipEnabled = false

    local FlySpeed = 55
    local VerticalMode = 0

    local FlyVelocity = nil
    local FlyGyro = nil
    local FlyConnection = nil
    local NoclipConnection = nil

    local OriginalCollisions = {}

    local DefaultWalkSpeed = 16
    local DefaultJumpPower = 50

    --==============================================================
    -- CAMPOS DE CONFIGURAÇÃO
    --==============================================================

    local FlySpeedInput = Input(
        UtilsSection,
        "VELOCIDADE DO VOO",
        "55"
    )

    local WalkSpeedInput = Input(
        UtilsSection,
        "VELOCIDADE DO PERSONAGEM",
        "32"
    )

    local JumpPowerInput = Input(
        UtilsSection,
        "FORÇA DO PULO",
        "70"
    )

    local UtilsStatus = Label(
        UtilsSection,
        "UTILS: AGUARDANDO",
        65
    )

    UtilsStatus.TextColor3 = C.PinkSoft
    UtilsStatus.TextYAlignment = Enum.TextYAlignment.Top

    local function UpdateUtilsStatus()
        UtilsStatus.Text =
            "VOO: " .. (FlyEnabled and "ATIVADO" or "DESATIVADO")
            .. "\nATRAVESSAR PAREDE: "
            .. (NoclipEnabled and "ATIVADO" or "DESATIVADO")
            .. "\nVELOCIDADE: " .. tostring(FlySpeed)

        UtilsStatus.TextColor3 = C.PinkSoft
    end

    --==============================================================
    -- FLY | DESATIVAR
    --==============================================================

    local function StopFly()

        FlyEnabled = false
        VerticalMode = 0

        if FlyConnection then
            FlyConnection:Disconnect()
            FlyConnection = nil
        end

        if FlyVelocity then
            FlyVelocity:Destroy()
            FlyVelocity = nil
        end

        if FlyGyro then
            FlyGyro:Destroy()
            FlyGyro = nil
        end

        UpdateUtilsStatus()
    end

    --==============================================================
    -- FLY | ATIVAR
    --==============================================================

    local function StartFly()

        local character = Player.Character

        if not character then
            SetStatus(UtilsStatus, "PERSONAGEM NÃO ENCONTRADO", C.Red)
            return
        end

        local root = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if not root or not humanoid then
            SetStatus(UtilsStatus, "PERSONAGEM NÃO CARREGADO", C.Red)
            return
        end

        StopFly()

        FlyEnabled = true

        FlyVelocity = Instance.new("BodyVelocity")
        FlyVelocity.Name = "CHARLINN_FlyVelocity"
        FlyVelocity.MaxForce = Vector3.new(1000000, 1000000, 1000000)
        FlyVelocity.Velocity = Vector3.zero
        FlyVelocity.Parent = root

        FlyGyro = Instance.new("BodyGyro")
        FlyGyro.Name = "CHARLINN_FlyGyro"
        FlyGyro.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
        FlyGyro.P = 10000
        FlyGyro.CFrame = workspace.CurrentCamera.CFrame
        FlyGyro.Parent = root

        FlyConnection = RunService.Heartbeat:Connect(function()

            if not FlyEnabled then
                return
            end

            local currentCharacter = Player.Character
            local currentRoot = currentCharacter
                and currentCharacter:FindFirstChild("HumanoidRootPart")

            local currentHumanoid = currentCharacter
                and currentCharacter:FindFirstChildOfClass("Humanoid")

            if not currentRoot or not currentHumanoid then
                StopFly()
                return
            end

            local camera = workspace.CurrentCamera

            if not camera then
                return
            end

            local moveDirection = currentHumanoid.MoveDirection

            local horizontalVelocity = moveDirection * FlySpeed
            local verticalVelocity = VerticalMode * FlySpeed

            FlyVelocity.Velocity =
                horizontalVelocity + Vector3.new(0, verticalVelocity, 0)

            FlyGyro.CFrame = camera.CFrame

        end)

        UpdateUtilsStatus()
    end

    --==============================================================
    -- BOTÃO VOAR ON / OFF
    --==============================================================

    local FlyButton

    FlyButton = Button(
        UtilsSection,
        "♡ VOAR: DESATIVADO",
        function()

            if FlyEnabled then

                StopFly()
                FlyButton.Text = "♡ VOAR: DESATIVADO"

            else

                StartFly()

                if FlyEnabled then
                    FlyButton.Text = "♥ VOAR: ATIVADO"
                end

            end

        end
    )

    --==============================================================
    -- SUBIR E DESCER
    --==============================================================

    local UpButton

    UpButton = Button(
        UtilsSection,
        "⬆ SUBIR: DESATIVADO",
        function()

            if not FlyEnabled then
                SetStatus(UtilsStatus, "ATIVE O VOO PRIMEIRO", C.Red)
                return
            end

            if VerticalMode == 1 then
                VerticalMode = 0
            else
                VerticalMode = 1
            end

            UpButton.Text = VerticalMode == 1
                and "⬆ SUBINDO"
                or "⬆ SUBIR: DESATIVADO"

            DownButton.Text = VerticalMode == -1
                and "⬇ DESCENDO"
                or "⬇ DESCER: DESATIVADO"

        end
    )

    local DownButton

    DownButton = Button(
        UtilsSection,
        "⬇ DESCER: DESATIVADO",
        function()

            if not FlyEnabled then
                SetStatus(UtilsStatus, "ATIVE O VOO PRIMEIRO", C.Red)
                return
            end

            if VerticalMode == -1 then
                VerticalMode = 0
            else
                VerticalMode = -1
            end

            UpButton.Text = VerticalMode == 1
                and "⬆ SUBINDO"
                or "⬆ SUBIR: DESATIVADO"

            DownButton.Text = VerticalMode == -1
                and "⬇ DESCENDO"
                or "⬇ DESCER: DESATIVADO"

        end
    )

    --==============================================================
    -- VELOCIDADE DO VOO
    --==============================================================

    Button(UtilsSection, "⚡ APLICAR VELOCIDADE DO VOO", function()

        local value = tonumber(FlySpeedInput.Text)

        if not value or value < 5 or value > 200 then
            SetStatus(UtilsStatus, "VALOR INVÁLIDO: USE 5 ATÉ 200", C.Red)
            return
        end

        FlySpeed = value

        SetStatus(
            UtilsStatus,
            "VELOCIDADE DO VOO DEFINIDA: " .. FlySpeed,
            C.Green
        )

    end)

    --==============================================================
    -- ATRAVESSAR PAREDE | NOCLIP
    --==============================================================

    local function RestoreCollisions()

        for part, originalValue in pairs(OriginalCollisions) do

            if part and part.Parent then
                part.CanCollide = originalValue
            end

        end

        OriginalCollisions = {}
    end

    local function ApplyNoclip()

        local character = Player.Character

        if not character then
            return
        end

        for _, part in ipairs(character:GetDescendants()) do

            if part:IsA("BasePart") then

                if OriginalCollisions[part] == nil then
                    OriginalCollisions[part] = part.CanCollide
                end

                part.CanCollide = false

            end

        end

    end

    local function StopNoclip()

        NoclipEnabled = false

        if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
        end

        RestoreCollisions()
        UpdateUtilsStatus()

    end

    local NoclipButton

    NoclipButton = Button(
        UtilsSection,
        "♡ ATRAVESSAR PAREDE: OFF",
        function()

            if NoclipEnabled then

                StopNoclip()
                NoclipButton.Text = "♡ ATRAVESSAR PAREDE: OFF"

            else

                NoclipEnabled = true

                NoclipConnection = RunService.Stepped:Connect(function()
                    if NoclipEnabled then
                        ApplyNoclip()
                    end
                end)

                NoclipButton.Text = "♥ ATRAVESSAR PAREDE: ON"
                UpdateUtilsStatus()

            end

        end
    )

    --==============================================================
    -- VELOCIDADE DO PERSONAGEM
    --==============================================================

    Button(UtilsSection, "⚡ APLICAR VELOCIDADE", function()

        local value = tonumber(WalkSpeedInput.Text)

        if not value or value < 0 or value > 200 then
            SetStatus(UtilsStatus, "VELOCIDADE INVÁLIDA (0–200)", C.Red)
            return
        end

        local character = Player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if not humanoid then
            SetStatus(UtilsStatus, "HUMANOID NÃO ENCONTRADO", C.Red)
            return
        end

        humanoid.WalkSpeed = value

        SetStatus(
            UtilsStatus,
            "VELOCIDADE APLICADA: " .. value,
            C.Green
        )

    end)

    --==============================================================
    -- FORÇA DO PULO
    --==============================================================

    Button(UtilsSection, "⬆ APLICAR FORÇA DO PULO", function()

        local value = tonumber(JumpPowerInput.Text)

        if not value or value < 0 or value > 200 then
            SetStatus(UtilsStatus, "PULO INVÁLIDO (0–200)", C.Red)
            return
        end

        local character = Player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if not humanoid then
            SetStatus(UtilsStatus, "HUMANOID NÃO ENCONTRADO", C.Red)
            return
        end

        humanoid.UseJumpPower = true
        humanoid.JumpPower = value

        SetStatus(
            UtilsStatus,
            "FORÇA DO PULO APLICADA: " .. value,
            C.Green
        )

    end)

    --==============================================================
    -- RESTAURAR PADRÕES
    --==============================================================

    Button(UtilsSection, "↺ RESTAURAR VELOCIDADE E PULO", function()

        local character = Player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = DefaultWalkSpeed
            humanoid.UseJumpPower = true
            humanoid.JumpPower = DefaultJumpPower
        end

        WalkSpeedInput.Text = tostring(DefaultWalkSpeed)
        JumpPowerInput.Text = tostring(DefaultJumpPower)

        SetStatus(UtilsStatus, "CONFIGURAÇÕES RESTAURADAS", C.Green)

    end)

    --==============================================================
    -- RESPawn | REAPLICAR NOCLIP
    --==============================================================

    Player.CharacterAdded:Connect(function()

        task.wait(1)

        if NoclipEnabled then
            ApplyNoclip()
        end

        if FlyEnabled then
            StartFly()
        end

    end)

    --==============================================================
    -- LIMPEZA DOS SISTEMAS
    --==============================================================

    local function StopAllUtils()

        StopFly()
        StopNoclip()

        VerticalMode = 0

        UpButton.Text = "⬆ SUBIR: DESATIVADO"
        DownButton.Text = "⬇ DESCER: DESATIVADO"
        FlyButton.Text = "♡ VOAR: DESATIVADO"
        NoclipButton.Text = "♡ ATRAVESSAR PAREDE: OFF"

    end

    UpdateUtilsStatus()

    --==============================================================
    -- ABA 3 | TELEPORT
    --==============================================================

    local TeleportSection = Section(
        TeleportPage,
        "➤ CHARLINN | TELEPORT",
        "Salve posições e acompanhe os pontos marcados no mapa."
    )

    --==============================================================
    -- CONFIGURAÇÕES
    --==============================================================

    local TeleportPoints = {}
    local TeleportLoopEnabled = false
    local TeleportDelay = 2
    local TeleportIndex = 1

    local TeleportDelayInput = Input(
        TeleportSection,
        "DELAY EM SEGUNDOS",
        "2"
    )

    local TeleportStatus = Label(
        TeleportSection,
        "TELEPORT: DESATIVADO\nPOSIÇÕES: 0",
        48
    )

    TeleportStatus.TextColor3 = C.PinkSoft
    TeleportStatus.TextYAlignment = Enum.TextYAlignment.Top

    --==============================================================
    -- ATUALIZAR STATUS
    --==============================================================

    local function UpdateTeleportStatus()
        local text = "TELEPORT: "
            .. (TeleportLoopEnabled and "ATIVADO" or "DESATIVADO")

        text = text .. "\nPOSIÇÕES SALVAS: " .. #TeleportPoints

        if #TeleportPoints > 0 then
            text = text .. "\nPRÓXIMO PONTO: " .. TeleportIndex
        end

        TeleportStatus.Text = text

        TeleportStatus.TextColor3 =
            TeleportLoopEnabled and C.Green or C.PinkSoft
    end

    --==============================================================
    -- CRIAR SETA NO MAPA
    --==============================================================

    local function CreateTeleportMarker(position, number)

        local marker = Instance.new("Part")
        marker.Name = "CHARLINN_TP_MARKER_" .. number
        marker.Size = Vector3.new(0.2, 0.2, 0.2)
        marker.Position = position + Vector3.new(0, 4, 0)
        marker.Anchored = true
        marker.CanCollide = false
        marker.CanTouch = false
        marker.CanQuery = false
        marker.Transparency = 1
        marker.Parent = workspace

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "TeleportArrow"
        billboard.Size = UDim2.fromOffset(120, 55)
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 1, 0)
        billboard.Adornee = marker
        billboard.Parent = marker

        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.fromScale(1, 1)
        arrow.BackgroundTransparency = 1
        arrow.Text = "▼ PONTO " .. number
        arrow.TextColor3 = C.Pink
        arrow.TextStrokeColor3 = Color3.new(0, 0, 0)
        arrow.TextStrokeTransparency = 0
        arrow.Font = Enum.Font.GothamBlack
        arrow.TextSize = 15
        arrow.Parent = billboard

        return marker
    end

    --==============================================================
    -- ADICIONAR POSIÇÃO
    --==============================================================

    Button(TeleportSection, "＋ ADICIONAR POSIÇÃO", function()

        local root = GetRoot()

        if not root then
            TeleportStatus.Text = "PERSONAGEM NÃO ENCONTRADO"
            return
        end

        local position = root.Position
        local number = #TeleportPoints + 1

        local marker = CreateTeleportMarker(position, number)

        table.insert(TeleportPoints, {
            Position = position,
            Marker = marker
        })

        UpdateTeleportStatus()

    end)

    --==============================================================
    -- SALVAR DELAY
    --==============================================================

    Button(TeleportSection, "◷ SALVAR DELAY", function()

        local value = tonumber(TeleportDelayInput.Text)

        if not value or value < 0.5 or value > 60 then
            TeleportStatus.Text = "DELAY INVÁLIDO (0.5 ATÉ 60)"
            TeleportStatus.TextColor3 = C.Red
            return
        end

        TeleportDelay = value

        TeleportStatus.Text = "DELAY DEFINIDO: "
            .. TeleportDelay .. " SEGUNDOS"

        TeleportStatus.TextColor3 = C.Green

    end)

    --==============================================================
    -- LOOP TELEPORT ON / OFF
    --==============================================================

    local TeleportButton

    TeleportButton = Button(
        TeleportSection,
        "♡ LOOP TP: DESATIVADO",
        function()

            if TeleportLoopEnabled then

                TeleportLoopEnabled = false

                TeleportButton.Text = "♡ LOOP TP: DESATIVADO"

                UpdateTeleportStatus()

                return
            end

            if #TeleportPoints == 0 then
                TeleportStatus.Text = "ADICIONE UMA POSIÇÃO PRIMEIRO!"
                TeleportStatus.TextColor3 = C.Red
                return
            end

            TeleportLoopEnabled = true
            TeleportIndex = 1

            TeleportButton.Text = "♥ LOOP TP: ATIVADO"

            UpdateTeleportStatus()

            task.spawn(function()

                while TeleportLoopEnabled and Gui.Parent do

                    if #TeleportPoints == 0 then
                        break
                    end

                    local point = TeleportPoints[TeleportIndex]
                    local root = GetRoot()

                    if root and point then

                        local targetPosition = point.Position

                        -- Teleporte para a posição salva
                        root.CFrame = CFrame.new(
                            targetPosition + Vector3.new(0, 3, 0)
                        )

                        -- Próxima posição
                        TeleportIndex = TeleportIndex + 1

                        if TeleportIndex > #TeleportPoints then
                            TeleportIndex = 1
                        end

                        UpdateTeleportStatus()

                        -- Intervalo entre os teletransportes
                        task.wait(TeleportDelay)

                    else
                        task.wait(1)
                    end

                end

                TeleportLoopEnabled = false

                if TeleportButton and TeleportButton.Parent then
                    TeleportButton.Text = "♡ LOOP TP: DESATIVADO"
                end

                UpdateTeleportStatus()

            end)

        end
    )

    --==============================================================
    -- LIMPAR POSIÇÕES
    --==============================================================

    Button(
        TeleportSection,
        "⌫ LIMPAR POSIÇÕES",
        function()

            TeleportLoopEnabled = false

            if TeleportButton then
                TeleportButton.Text = "♡ LOOP TP: DESATIVADO"
            end

            for _, point in ipairs(TeleportPoints) do

                if point.Marker and point.Marker.Parent then
                    point.Marker:Destroy()
                end

            end

            TeleportPoints = {}
            TeleportIndex = 1

            UpdateTeleportStatus()

            TeleportStatus.Text = "TODAS AS POSIÇÕES FORAM LIMPARAS"

        end
    )

    UpdateTeleportStatus()


    --==============================================================
    -- ABA 1 | KILL NPC
    --==============================================================

    local KillSection = Section(
        KillPage,
        "☠  KILL NPC",
        "Busca NPCs próximos e executa o processamento dentro do alcance definido."
    )

    local KillRangeInput = Input(
        KillSection,
        "ALCANCE ENTRE 5 E 300",
        "50"
    )

    local KillStatus = Label(KillSection, "MODO: AGUARDANDO", 38)
    KillStatus.TextColor3 = C.PinkSoft

    local LoopKillEnabled = false
    local LoopKillDelay = 0.25

    local function FindNPCs(range)
        local character = Player.Character
        local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

        if not playerRoot then
            return nil, "PERSONAGEM NÃO ENCONTRADO"
        end

        local targets = {}

        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("Model") and object ~= character then
                local isPlayer = Players:GetPlayerFromCharacter(object)
                local humanoid = object:FindFirstChildOfClass("Humanoid")
                local root = object:FindFirstChild("HumanoidRootPart")

                if not isPlayer and humanoid and root and humanoid.Health > 0 then
                    local distance = (playerRoot.Position - root.Position).Magnitude

                    if distance <= range then
                        table.insert(targets, object)
                    end
                end
            end
        end

        return targets
    end

    local function KillAllNPCs(range)
        local targets, errorMessage = FindNPCs(range)

        if not targets then
            return 0, errorMessage
        end

        local processed = 0

        for _, npc in ipairs(targets) do
            local humanoid = npc:FindFirstChildOfClass("Humanoid")

            if humanoid and humanoid.Health > 0 then
                humanoid.Health = 0
                processed = processed + 1
            end
        end

        return processed
    end

    Button(KillSection, "⌕  PROCURAR NPCs", function()
        local range = tonumber(KillRangeInput.Text)

        if not range or range < 5 or range > 300 then
            SetStatus(KillStatus, "ALCANCE INVÁLIDO (5–300)", C.Red)
            return
        end

        local targets, err = FindNPCs(range)

        if not targets then
            SetStatus(KillStatus, err, C.Red)
            return
        end

        SetStatus(KillStatus, "NPCs ENCONTRADOS: " .. #targets, C.Green)
    end)

    Button(KillSection, "☠  KILL TODOS NPCs", function()
        local range = tonumber(KillRangeInput.Text)

        if not range or range < 5 or range > 300 then
            SetStatus(KillStatus, "ALCANCE INVÁLIDO (5–300)", C.Red)
            return
        end

        local count, err = KillAllNPCs(range)

        if err then
            SetStatus(KillStatus, err, C.Red)
            return
        end

        SetStatus(KillStatus, "NPCs PROCESSADOS: " .. count, C.Green)
    end)

    local LoopButton

    LoopButton = Button(KillSection, "♡  LOOP KILL: DESATIVADO", function()
        LoopKillEnabled = not LoopKillEnabled

        LoopButton.Text = LoopKillEnabled
            and "♥  LOOP KILL: ATIVADO"
            or "♡  LOOP KILL: DESATIVADO"

        SetStatus(
            KillStatus,
            LoopKillEnabled and "LOOP KILL: ATIVADO" or "LOOP KILL: DESATIVADO",
            LoopKillEnabled and C.Green or C.PinkSoft
        )
    end)

    --==============================================================
    -- ABA 2 | AUTO FARME
    --==============================================================

    local RouteSection = Section(
        FarmPage,
        "01 — ROTA DE FARM",
        "Marque os pontos do percurso e defina onde o personagem deverá finalizar."
    )

    local FarmStatus = Label(RouteSection, "NENHUM PONTO MARCADO.", 58)
    FarmStatus.TextYAlignment = Enum.TextYAlignment.Top

    local SpecialSection = Section(
        FarmPage,
        "02 — ESPECIAL AUTOMÁTICO",
        "Marque um botão do jogo e configure o intervalo de ativação."
    )

    local SpecialStatus = Label(SpecialSection, "ESPECIAL: NÃO MARCADO", 34)
    SpecialStatus.TextColor3 = C.PinkSoft

    local SpecialIntervalBox = Input(
        SpecialSection,
        "INTERVALO EM SEGUNDOS",
        "5"
    )

    local ControlSection = Section(
        FarmPage,
        "03 — CONTROLE DO FARM",
        "Inicie, interrompa ou limpe a configuração da rota."
    )

    local FarmPoints = {}
    local FarmVisited = {}
    local FarmLoopAtivo = false
    local FarmArrivalPosition = nil
    local FarmFinished = false

    local SpecialButton = nil
    local WaitingSpecialButton = false
    local SpecialInterval = 5
    local SpecialLoopAtivo = false


    local function UpdateFarmStatus()
        local root = GetRoot()
        local text = "PONTOS DE FARM: " .. #FarmPoints .. "\n"

        if not root then
            FarmStatus.Text = text .. "Personagem não encontrado."
            return
        end

        for i, point in ipairs(FarmPoints) do
            local distance = (root.Position - point).Magnitude
            local status = FarmVisited[i] and "CONCLUÍDO" or "PENDENTE"

            text = text .. "\nPonto " .. i .. " | "
                .. math.floor(distance) .. " studs | " .. status
        end

        if FarmArrivalPosition then
            local distance = (root.Position - FarmArrivalPosition).Magnitude

            text = text .. "\n\nCHEGADA FINAL: "
                .. math.floor(distance) .. " studs"
        end

        if FarmFinished then
            text = text .. "\n\nROTA CONCLUÍDA — AGUARDANDO"
        end

        FarmStatus.Text = text
        FarmStatus.Size = UDim2.new(
            1,
            0,
            0,
            math.max(58, 40 + #FarmPoints * 20)
        )
    end

    Button(RouteSection, "＋  ADICIONAR PONTO DE FARM", function()
        if FarmLoopAtivo then
            return
        end

        local root = GetRoot()

        if not root then
            FarmStatus.Text = "PERSONAGEM NÃO ENCONTRADO"
            return
        end

        table.insert(FarmPoints, root.Position)
        UpdateFarmStatus()
    end)

    Button(RouteSection, "⚑  MARCAR CHEGADA FINAL", function()
        if FarmLoopAtivo then
            return
        end

        local root = GetRoot()

        if not root then
            FarmStatus.Text = "PERSONAGEM NÃO ENCONTRADO"
            return
        end

        FarmArrivalPosition = root.Position
        UpdateFarmStatus()
    end)

    --==============================================================
    -- ESPECIAL AUTOMÁTICO
    --==============================================================

    Button(SpecialSection, "SALVAR INTERVALO", function()
        local value = tonumber(SpecialIntervalBox.Text)

        if value and value >= 1 and value <= 3600 then
            SpecialInterval = value

            SpecialStatus.Text = "INTERVALO DEFINIDO: "
                .. SpecialInterval .. " SEGUNDOS"
        else
            SpecialStatus.Text = "DIGITE UM NÚMERO VÁLIDO (1–3600)"
        end
    end)

    Button(SpecialSection, "MARCAR BOTÃO ESPECIAL", function()
        WaitingSpecialButton = true
        SpecialStatus.Text = "TOQUE NO BOTÃO DO JOGO QUE DESEJA MARCAR"
    end)

    Button(SpecialSection, "CANCELAR MARCAÇÃO", function()
        WaitingSpecialButton = false
        SpecialStatus.Text = "MARCAÇÃO CANCELADA"
    end)

    Button(SpecialSection, "REMOVER BOTÃO MARCADO", function()
        WaitingSpecialButton = false
        SpecialButton = nil
        SpecialStatus.Text = "ESPECIAL: NÃO MARCADO"
    end)

    UIS.InputBegan:Connect(function(input, gameProcessed)
        if not WaitingSpecialButton then
            return
        end

        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        local position = input.Position
        local objects = PlayerGui:GetGuiObjectsAtPosition(
            position.X,
            position.Y
        )

        for _, object in ipairs(objects) do
            if (object:IsA("ImageButton") or object:IsA("TextButton"))
                and not object:IsDescendantOf(Gui) then

                SpecialButton = object
                WaitingSpecialButton = false

                SpecialStatus.Text = "ESPECIAL MARCADO: " .. object.Name
                return
            end
        end

        SpecialStatus.Text = "NÃO ENCONTREI O BOTÃO. TENTE NOVAMENTE."
    end)

    local function StartSpecialLoop()
        if SpecialLoopAtivo then
            return
        end

        SpecialLoopAtivo = true

        task.spawn(function()
            while SpecialLoopAtivo and FarmLoopAtivo do
                if SpecialButton and SpecialButton.Parent
                    and SpecialButton:IsA("GuiButton")
                    and SpecialButton.Visible
                    and SpecialButton.Active then

                    pcall(function()
                        SpecialButton:Activate()
                    end)
                end

                task.wait(SpecialInterval)
            end

            SpecialLoopAtivo = false
        end)
    end

    --==============================================================
    -- CONTROLE DO FARM
    --==============================================================

    Button(ControlSection, "▶  INICIAR FARM LOOP", function()
        if FarmLoopAtivo then
            return
        end

        if #FarmPoints == 0 then
            FarmStatus.Text = "MARQUE OS PONTOS DE FARM PRIMEIRO!"
            return
        end

        if not FarmArrivalPosition then
            FarmStatus.Text = "MARQUE O PONTO DE CHEGADA!"
            return
        end

        local root = GetRoot()

        if not root then
            FarmStatus.Text = "PERSONAGEM NÃO ENCONTRADO"
            return
        end

        FarmVisited = {}
        FarmFinished = false
        FarmLoopAtivo = true

        StartSpecialLoop()

        local nearestDistance = math.huge

        for _, point in ipairs(FarmPoints) do
            local distance = (root.Position - point).Magnitude

            if distance < nearestDistance then
                nearestDistance = distance
            end
        end

        if (root.Position - FarmArrivalPosition).Magnitude < nearestDistance then
            FarmFinished = true
        end

        task.spawn(function()
            while FarmLoopAtivo do
                local currentRoot = GetRoot()

                if currentRoot then
                    local character = currentRoot.Parent
                    local humanoid = character
                        and character:FindFirstChildOfClass("Humanoid")

                    if humanoid and humanoid.Health > 0 then
                        local arrivalDistance =
                            (currentRoot.Position - FarmArrivalPosition).Magnitude

                        if FarmFinished then
                            if arrivalDistance > 4 then
                                humanoid:MoveTo(FarmArrivalPosition)
                            end
                        else
                            local nearestIndex = nil
                            local nearest = math.huge

                            for i, point in ipairs(FarmPoints) do
                                if not FarmVisited[i] then
                                    local distance =
                                        (currentRoot.Position - point).Magnitude

                                    if distance < nearest then
                                        nearest = distance
                                        nearestIndex = i
                                    end
                                end
                            end

                            if nearestIndex then
                                if nearest <= 4 then
                                    FarmVisited[nearestIndex] = true
                                else
                                    humanoid:MoveTo(FarmPoints[nearestIndex])
                                end
                            else
                                if arrivalDistance <= 4 then
                                    FarmFinished = true
                                else
                                    humanoid:MoveTo(FarmArrivalPosition)
                                end
                            end
                        end
                    end
                end

                UpdateFarmStatus()
                task.wait(0.5)
            end
        end)
    end)

    Button(ControlSection, "■  PARAR FARM LOOP", function()
        FarmLoopAtivo = false
        SpecialLoopAtivo = false

        local root = GetRoot()

        if root then
            local humanoid = root.Parent:FindFirstChildOfClass("Humanoid")

            if humanoid then
                humanoid:MoveTo(root.Position)
            end
        end

        UpdateFarmStatus()
    end)

    Button(ControlSection, "⌫  LIMPAR TODOS OS PONTOS", function()
        FarmLoopAtivo = false
        SpecialLoopAtivo = false

        FarmPoints = {}
        FarmVisited = {}
        FarmArrivalPosition = nil
        FarmFinished = false

        UpdateFarmStatus()
    end)

    --==============================================================
    -- LOOP DE ATUALIZAÇÃO
    --==============================================================

    task.spawn(function()
        while Gui.Parent do
            if LoopKillEnabled then
                local range = tonumber(KillRangeInput.Text)

                if range and range >= 5 and range <= 300 then
                    local count, err = KillAllNPCs(range)

                    if err then
                        SetStatus(KillStatus, err, C.Red)
                    else
                        SetStatus(
                            KillStatus,
                            "LOOP KILL | PROCESSADOS: " .. count,
                            C.Green
                        )
                    end
                else
                    SetStatus(KillStatus, "ALCANCE INVÁLIDO (5–300)", C.Red)
                end
            end

            UpdateFarmStatus()
            task.wait(LoopKillDelay)
        end
    end)

    --==============================================================
    -- RESPAWN
    --==============================================================

    Player.CharacterAdded:Connect(function()
        if FarmLoopAtivo then
            FarmVisited = {}
            FarmFinished = false
        end

        task.wait(1)
        UpdateFarmStatus()
    end)

    --==============================================================
    -- MINIMIZAR E REABRIR COM CORAÇÃO
    --==============================================================

    local minimized = false
    local expandedSize = Main.Size

    local function MinimizeHub()
        if minimized then
            return
        end

        minimized = true

        expandedSize = Main.Size

        Main.Visible = false
        HeartButton.Visible = true
    end

    local function RestoreHub()
        if not minimized then
            return
        end

        minimized = false

        Main.Size = expandedSize
        Main.Visible = true
        HeartButton.Visible = false
    end

    Minimize.MouseButton1Click:Connect(function()
        MinimizeHub()
    end)

    HeartButton.MouseButton1Click:Connect(function()
        RestoreHub()
    end)

    --==============================================================
    -- FECHAR HUB
    --==============================================================

    Close.MouseButton1Click:Connect(function()
    LoopKillEnabled = false
    FarmLoopAtivo = false
    StopAllUtils()
    StopESP()
    StopHS()

    SpecialLoopAtivo = false
    WaitingSpecialButton = false

    Gui:Destroy()
end)

    TeleportLoopEnabled = false

    for _, point in ipairs(TeleportPoints) do
        if point.Marker and point.Marker.Parent then
            point.Marker:Destroy()
        end
    end

    TeleportPoints = {}
    --==============================================================
    -- ARRASTAR JANELA
    --==============================================================

    local dragging = false
    local dragStart
    local startPosition
    local dragInput

    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPosition = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then

            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart

            Main.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)

    --==============================================================
    -- AJUSTE AUTOMÁTICO MOBILE + PC
    --==============================================================

    local function UpdateScale()
        local camera = workspace.CurrentCamera

        if not camera then
            return
        end

        local viewport = camera.ViewportSize

        if viewport.X < 600 then
            Scale.Scale = math.clamp(viewport.X / 430, 0.78, 1)
        else
            Scale.Scale = 1
        end
    end

    if workspace.CurrentCamera then
        workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
    end

    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local camera = workspace.CurrentCamera

        if camera then
            camera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
            UpdateScale()
        end
    end)

    --==============================================================
    -- INICIALIZAÇÃO
    --==============================================================

    ShowPage("kill")
    UpdateFarmStatus()
    UpdateScale()

    print("[CHARLINN E BELLA] HUB INICIADO COM SUCESSO!")
    print("[CHARLINN E BELLA] KILL NPC + AUTO FARME")
    print("[CHARLINN E BELLA] CORAÇÃO FLUTUANTE ATIVADO")
    print("[CHARLINN E BELLA] SEM VIP / SEM GAME PASS")
