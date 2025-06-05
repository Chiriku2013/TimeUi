-- Script by Chiriku - Time UI gọn, logo giữa, trắng viền đen, draggable, không mất chữ

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

-- Khung chính gọn lại
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 275, 0, 27.5)
MainFrame.Position = UDim2.new(0.5, -180, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.4
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Thời gian đã chạy
local ExecTime = Instance.new("TextLabel")
ExecTime.Size = UDim2.new(0, 85, 1, 0)
ExecTime.Position = UDim2.new(0, 6, 0, 0)
ExecTime.BackgroundTransparency = 1
ExecTime.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecTime.TextStrokeTransparency = 0
ExecTime.Font = Enum.Font.GothamBold
ExecTime.TextSize = 17
ExecTime.TextXAlignment = Enum.TextXAlignment.Left
ExecTime.Text = "0:00:00"
ExecTime.Parent = MainFrame

-- Icon giữa
local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 20, 0, 20)
Icon.Position = UDim2.new(0.5, -73, 0.5, -10)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://81787064714217"
Icon.Parent = MainFrame

-- Tên
local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(0, 120, 1, 0)
NameLabel.Position = UDim2.new(0.5, -53, 0, 0)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = "Chiriku Roblox"
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextStrokeTransparency = 0
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 17
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.Parent = MainFrame

-- Giờ Việt Nam
local VNTime = Instance.new("TextLabel")
VNTime.Size = UDim2.new(0, 80, 1, 0)
VNTime.Position = UDim2.new(0.5, 39, 0, 0)
VNTime.BackgroundTransparency = 1
VNTime.TextColor3 = Color3.fromRGB(255, 255, 255)
VNTime.TextStrokeTransparency = 0
VNTime.Font = Enum.Font.GothamBold
VNTime.TextSize = 17
VNTime.TextXAlignment = Enum.TextXAlignment.Right
VNTime.Text = "00:00:00"
VNTime.Parent = MainFrame

-- Nút đóng
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.5, 117, 0.5, -10)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.TextStrokeTransparency = 0
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.Parent = MainFrame

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Cập nhật thời gian
local startTick = tick()
RunService.RenderStepped:Connect(function()
    local elapsed = math.floor(tick() - startTick)
    local h = math.floor(elapsed / 3600)
    local m = math.floor((elapsed % 3600) / 60)
    local s = elapsed % 60
    ExecTime.Text = string.format("%d:%02d:%02d", h, m, s)

    local now = os.time()
    local vnTime = now + 7 * 3600
    VNTime.Text = os.date("!%H:%M:%S", vnTime)
end)
