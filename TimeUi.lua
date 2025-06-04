-- Script by Chiriku - Time Display UI + Close Button + Draggable

if game.CoreGui:FindFirstChild("ChirikuTimeUI") then
    game.CoreGui:FindFirstChild("ChirikuTimeUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChirikuTimeUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Khung chính (draggable)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 30)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.6
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Label thời gian
local TimeLabel = Instance.new("TextLabel")
TimeLabel.Size = UDim2.new(0, 150, 1, 0)
TimeLabel.Position = UDim2.new(0, 0, 0, 0)
TimeLabel.BackgroundTransparency = 1
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.TextStrokeTransparency = 0.7
TimeLabel.Font = Enum.Font.GothamBold
TimeLabel.TextSize = 20
TimeLabel.Text = "0:00:00"
TimeLabel.TextXAlignment = Enum.TextXAlignment.Left
TimeLabel.Parent = MainFrame

-- Nút X để đóng UI
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 1, 0)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Đồng hồ đếm thời gian
local startTime = tick()

RunService.RenderStepped:Connect(function()
    if TimeLabel and TimeLabel.Parent then
        local elapsed = math.floor(tick() - startTime)
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = elapsed % 60
        TimeLabel.Text = string.format("%d:%02d:%02d", hours, minutes, seconds)
    end
end)
