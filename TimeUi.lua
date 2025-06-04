-- Script by Chiriku - Time UI + Real VN Time + Draggable + Close

if game.CoreGui:FindFirstChild("ChirikuTimeUI") then
    game.CoreGui:FindFirstChild("ChirikuTimeUI"):Destroy()
end

local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChirikuTimeUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Main khung chứa 2 dòng thời gian
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 35)
MainFrame.Position = UDim2.new(1, -320, 0, 50) -- Canh góc phải, cao hơn để tránh khung chat
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Label: thời gian từ lúc execute script
local ExecTimeLabel = Instance.new("TextLabel")
ExecTimeLabel.Size = UDim2.new(0.5, 0, 1, 0)
ExecTimeLabel.Position = UDim2.new(0, 10, 0, 0)
ExecTimeLabel.BackgroundTransparency = 1
ExecTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecTimeLabel.TextStrokeTransparency = 0.7
ExecTimeLabel.Font = Enum.Font.GothamBold
ExecTimeLabel.TextSize = 18
ExecTimeLabel.Text = "0:00:00"
ExecTimeLabel.TextXAlignment = Enum.TextXAlignment.Left
ExecTimeLabel.Parent = MainFrame

-- Label: giờ thực tế Việt Nam (GMT+7)
local VNTimeLabel = Instance.new("TextLabel")
VNTimeLabel.Size = UDim2.new(0.5, -30, 1, 0)
VNTimeLabel.Position = UDim2.new(0.5, 0, 0, 0)
VNTimeLabel.BackgroundTransparency = 1
VNTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VNTimeLabel.TextStrokeTransparency = 0.7
VNTimeLabel.Font = Enum.Font.GothamBold
VNTimeLabel.TextSize = 18
VNTimeLabel.Text = "00:00:00"
VNTimeLabel.TextXAlignment = Enum.TextXAlignment.Right
VNTimeLabel.Parent = MainFrame

-- Nút X để tắt UI
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -25, 0, 7)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Đếm thời gian kể từ khi chạy script
local startTick = tick()

-- Cập nhật thời gian
RunService.RenderStepped:Connect(function()
    local elapsed = math.floor(tick() - startTick)
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = elapsed % 60
    ExecTimeLabel.Text = string.format("%d:%02d:%02d", hours, minutes, seconds)

    -- Giờ thực tế theo múi giờ Việt Nam
    local now = os.time()
    local vnTime = now + 7 * 3600 -- GMT+7
    local realHour = os.date("!%H", vnTime)
    local realMinute = os.date("!%M", vnTime)
    local realSecond = os.date("!%S", vnTime)
    VNTimeLabel.Text = string.format("%02d:%02d:%02d", realHour, realMinute, realSecond)
end)
