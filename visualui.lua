-- VisualUI v2.0.0
-- All-in-one executor ready
-- Multi-tabs, buttons, toggles, sliders, animations
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VisualUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- UICorner + UIStroke
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,16)
corner.Parent = mainFrame
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(70,70,70)
stroke.Thickness = 2
stroke.Parent = mainFrame

-- Tab system
local tabs = {}
local function createTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0,120,0,30)
    tabBtn.Text = name
    tabBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    tabBtn.TextColor3 = Color3.fromRGB(255,255,255)
    tabBtn.Parent = mainFrame
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, -20, 1, -50)
    tabFrame.Position = UDim2.new(0,10,0,40)
    tabFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
    tabFrame.Visible = false
    tabFrame.Parent = mainFrame
    tabs[name] = tabFrame
    tabBtn.MouseButton1Click:Connect(function()
        for _,f in pairs(tabs) do f.Visible = false end
        tabFrame.Visible = true
    end)
end

createTab("Main")
createTab("Options")
createTab("About")
tabs["Main"].Visible = true

-- Sample button in Main tab
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0,180,0,40)
btn.Position = UDim2.new(0,10,0,10)
btn.Text = "Print Hello"
btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.Parent = tabs["Main"]
btn.MouseButton1Click:Connect(function()
    print("Hello from VisualUI v2.0.0")
end)

-- Dragging function
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState==Enum.UserInputState.End then dragging=false end
        end)
    end
end)
mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
        dragInput=input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input==dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

print("✅ VisualUI v2.0.0 chargé")
