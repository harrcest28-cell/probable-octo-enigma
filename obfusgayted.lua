-- Midnight Hub
-- One menu for Urban Reload: camera aim, thin ESP, no recoil, no spread, spin, movement.
-- Run this file by itself. Do not also execute the old aimbot / ESP / spinbot files.

if type(getgenv) == "function" then
    if type(getgenv().__MidnightHubUnload) == "function" then
        pcall(getgenv().__MidnightHubUnload)
    end
    if type(getgenv().__HardAimbotUnload) == "function" then
        pcall(getgenv().__HardAimbotUnload)
    end
    if type(getgenv().__SkeletonESPUnload) == "function" then
        pcall(getgenv().__SkeletonESPUnload)
    end
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local ICON = "rbxassetid://106237632702124"

local function GetCamera()
    return Workspace.CurrentCamera
end

local Config = {
    Aimbot = false,
    AimMode = "Smooth",
    Snap = 0.22,
    FOV = 180,
    ShowFOV = true,
    FOVColor = Color3.fromRGB(255, 255, 255),
    Hitboxes = {"Head"},
    Priority = "Closest",
    AimTeamCheck = true,
    AimWalls = true,
    Sticky = true,
    StickyScale = 1.4,
    Prediction = false,
    PredictionTime = 0.12,
    Humanize = 0,
    AimDistance = 1500,
    AimOffset = 0,
    TargetLine = true,
    TargetDot = true,
    TargetColor = Color3.fromRGB(255, 70, 70),
    Trigger = false,
    TriggerDelay = 0.08,
    TriggerFOV = 18,

    ESP = true,
    Skeleton = true,
    Thickness = 1,
    CornerBox = true,
    FullBox = false,
    Names = true,
    HealthBar = true,
    HealthText = false,
    Distance = true,
    Weapon = true,
    HeadDot = true,
    Tracers = false,
    TracerFrom = "Bottom",
    Chams = false,
    ChamsWalls = true,
    ChamsFill = 1,
    ChamsOutline = 0,
    ESPTeamCheck = true,
    VisCheck = true,
    ESPDistance = 1500,
    TextSize = 13,
    VisibleColor = Color3.fromRGB(255, 255, 255),
    HiddenColor = Color3.fromRGB(120, 120, 120),
    BoxColor = Color3.fromRGB(255, 255, 255),
    NameColor = Color3.fromRGB(255, 255, 255),
    Arrows = false,
    ArrowSize = 8,
    Outline = true,
    OutlineColor = Color3.fromRGB(0, 0, 0),
    Box3D = false,
    BoxFill = false,
    FillAlpha = 0.18,
    Fade = false,
    LookDir = false,
    LookLength = 8,
    Joints = false,
    HeadFilled = false,
    NameMode = "Display",
    NamePlate = true,
    UseTeamColor = false,
    HealthTint = false,
    BarWidth = 2,
    ShowState = false,
    ItemESP = false,
    ItemColor = Color3.fromRGB(255, 210, 90),

    Grade = false,
    Saturation = 0.15,
    Contrast = 0.08,
    GradeBright = 0,
    Tint = Color3.fromRGB(255, 255, 255),
    Bloom = false,
    BloomIntensity = 0.4,
    BloomSize = 24,
    BloomThreshold = 0.9,
    SunRays = false,
    SunIntensity = 0.12,
    SunSpread = 0.6,
    DOF = false,
    FocusDistance = 40,
    FocusRadius = 30,
    BlurOn = false,
    BlurSize = 4,
    AtmosphereOn = false,
    AtmoDensity = 0.25,
    AtmoHaze = 1,
    AtmoColor = Color3.fromRGB(180, 200, 220),
    AtmoDecay = Color3.fromRGB(90, 100, 120),
    CustomFog = false,
    FogColor = Color3.fromRGB(190, 200, 210),
    FogDistance = 800,
    FogNear = 0,
    SoftShadows = false,
    ShadowSoft = 0.4,
    Diffuse = 1,
    Specular = 1,
    WaterOn = false,
    WaterColor = Color3.fromRGB(12, 84, 92),
    WaterAlpha = 0.3,
    Xray = false,
    XrayRange = 80,
    XrayAmount = 0.65,
    NoParticles = false,
    HideViewmodel = false,
    BulletTracers = false,
    TracerColor = Color3.fromRGB(255, 226, 150),
    TracerLife = 0.35,
    TracerWidth = 0.06,
    TracerRange = 800,
    Impact = true,
    TrackShots = false,
    Snow = false,
    SnowRate = 220,
    SnowSize = 0.28,
    Rain = false,
    RainRate = 420,
    Ash = false,
    Dust = false,
    Lightning = false,
    Wind = 0,
    Skybox = "Game",
    HitSound = "None",
    HitMode = "Single",
    HitList = {},
    ShootSound = "None",
    DeadSound = "None",
    HitVolume = 2,

    NoRecoil = false,
    NoSpread = false,
    NoCameraKick = false,
    NoSway = false,
    RapidFire = false,
    FireScale = 2,
    InstantReload = false,
    NoEquip = false,
    Crosshair = false,
    CrossSize = 6,
    CrossGap = 3,
    CrossThickness = 1,
    CrossColor = Color3.fromRGB(255, 255, 255),
    CrossDot = false,
    Hitmarker = true,
    HitTime = 0.12,
    HitColor = Color3.fromRGB(255, 255, 255),

    Spin = false,
    SpinSpeed = 20,
    SpinMode = "Horizontal",
    SmoothSpin = true,
    Speed = false,
    SpeedMode = "Walk",
    WalkSpeed = 24,
    CFrameSpeed = 60,
    Jump = false,
    JumpPower = 60,
    InfiniteJump = false,
    Bhop = false,
    Fly = false,
    FlyMode = "Velocity",
    FlySpeed = 80,
    Noclip = false,
    Hip = false,
    HipHeight = 2,
    GravityOn = false,
    Gravity = 196,

    Fullbright = false,
    NoFog = false,
    NoShadows = false,
    Brightness = 2,
    ClockOn = false,
    ClockTime = 14,
    Ambient = Color3.fromRGB(180, 180, 180),
    CameraFOVOn = false,
    CameraFOV = 90,
    ZoomOn = false,
    Zoom = 20,
    AntiAFK = false,
    FPSOn = false,
    FPSCap = 240,
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NIcoGabrielRealYtr/Midnight-Hub-Library/refs/heads/main/Source"))()

local Window = Library:Window({
    Name = "unnamed project.cc",
})

local Watermark = Library:Watermark("unnamed project.cc")
local KeyList = Library:KeybindList()

local Connections = {}
local ESPData = {}
local Hooked = {}
local SpreadSprings = {}
local OriginalValues = setmetatable({}, { __mode = "k" })
local HooksStarted = false
local CurrentTarget = nil
local HumanizeOffset = Vector3.zero
local LastTargetHealth = nil
local HitUntil = 0
local LastShotAt = 0
local NextShot = 0
local SpinYaw = 0
local SpinPitch = 0
local SpinTick = 0
local FlyVelocity = nil
local Saved = {
    Gravity = Workspace.Gravity,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Exposure = Lighting.ExposureCompensation,
    ZoomMin = LocalPlayer.CameraMinZoomDistance,
    ZoomMax = LocalPlayer.CameraMaxZoomDistance,
    FieldOfView = 70,
    FogColor = Lighting.FogColor,
    ShadowSoftness = Lighting.ShadowSoftness,
    Diffuse = Lighting.EnvironmentDiffuseScale,
    Specular = Lighting.EnvironmentSpecularScale,
}

local Terrain = Workspace.Terrain
local function ReadWater()
    local ok, color, alpha, wave = pcall(function()
        return Terrain.WaterColor, Terrain.WaterTransparency, Terrain.WaterWaveSize
    end)
    if ok then
        return { Color = color, Alpha = alpha, Wave = wave }
    end
    return nil
end
Saved.Water = ReadWater()

local function MakeEffect(className, name)
    local effect = Instance.new(className)
    effect.Name = name
    effect.Enabled = false
    effect.Parent = Lighting
    return effect
end

local GradeFX = MakeEffect("ColorCorrectionEffect", "MH_Grade")
local BloomFX = MakeEffect("BloomEffect", "MH_Bloom")
local SunFX = MakeEffect("SunRaysEffect", "MH_Sun")
local DOFFX = MakeEffect("DepthOfFieldEffect", "MH_DOF")
local BlurFX = MakeEffect("BlurEffect", "MH_Blur")
local OwnedAtmosphere = false
local ParticleState = {}
local XrayState = {}
local HiddenViewmodel = {}
local ItemCache = {}
local NextItemScan = 0
local NextXray = 0

local R15 = {
    { "HumanoidRootPart", "LowerTorso" },
    { "LowerTorso", "UpperTorso" },
    { "UpperTorso", "Head" },
    { "UpperTorso", "LeftUpperArm" },
    { "LeftUpperArm", "LeftLowerArm" },
    { "LeftLowerArm", "LeftHand" },
    { "UpperTorso", "RightUpperArm" },
    { "RightUpperArm", "RightLowerArm" },
    { "RightLowerArm", "RightHand" },
    { "LowerTorso", "LeftUpperLeg" },
    { "LeftUpperLeg", "LeftLowerLeg" },
    { "LeftLowerLeg", "LeftFoot" },
    { "LowerTorso", "RightUpperLeg" },
    { "RightUpperLeg", "RightLowerLeg" },
    { "RightLowerLeg", "RightFoot" },
}

local R6 = {
    { "HumanoidRootPart", "Torso" },
    { "Torso", "Head" },
    { "Torso", "Left Arm" },
    { "Torso", "Right Arm" },
    { "Torso", "Left Leg" },
    { "Torso", "Right Leg" },
}

local HitboxParts = {
    Head = { "Head" },
    Chest = { "UpperTorso", "Torso" },
    Arms = { "LeftUpperArm", "RightUpperArm", "Left Arm", "Right Arm" },
    Legs = { "LeftUpperLeg", "RightUpperLeg", "Left Leg", "Right Leg" },
}

local function Bind(signal, fn)
    local connection = signal:Connect(fn)
    table.insert(Connections, connection)
    return connection
end

local function KeyActive(flag, master)
    if not master then
        return false
    end
    local data = Library.Flags[flag]
    if type(data) ~= "table" then
        return true
    end
    if data.Mode == "Always" then
        return true
    end
    return data.Toggled == true
end

local function Draw(kind, props)
    local obj = Drawing.new(kind)
    for key, value in pairs(props) do
        obj[key] = value
    end
    return obj
end

local FOVCircle = Draw("Circle", {
    Thickness = 1,
    NumSides = 64,
    Radius = Config.FOV,
    Color = Config.FOVColor,
    Transparency = 0.85,
    Visible = false,
    Filled = false,
})

local TriggerCircle = Draw("Circle", {
    Thickness = 1,
    NumSides = 48,
    Radius = Config.TriggerFOV,
    Color = Color3.fromRGB(255, 180, 80),
    Transparency = 0.7,
    Visible = false,
    Filled = false,
})

local TargetDot = Draw("Circle", {
    Thickness = 1,
    NumSides = 16,
    Radius = 4,
    Color = Config.TargetColor,
    Transparency = 1,
    Visible = false,
    Filled = false,
})

local TargetLine = Draw("Line", {
    Thickness = 1,
    Color = Config.TargetColor,
    Transparency = 1,
    Visible = false,
})

local Crosshair = {
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
}

local CrossDot = Draw("Circle", {
    Thickness = 1,
    NumSides = 12,
    Radius = 1.5,
    Filled = true,
    Visible = false,
    Transparency = 1,
})

local HitLines = {
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
    Draw("Line", { Thickness = 1, Transparency = 1, Visible = false }),
}

local function WorldToScreen(position)
    local camera = GetCamera()
    if not camera then
        return Vector2.zero, false
    end
    local point = camera:WorldToViewportPoint(position)
    return Vector2.new(point.X, point.Y), point.Z > 0
end

local function ScreenCenter()
    local camera = GetCamera()
    if not camera then
        return Vector2.zero
    end
    return Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
end

local function IsAlive(player)
    local character = player.Character
    if not character then
        return false
    end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")
    return humanoid ~= nil and root ~= nil and humanoid.Health > 0
end

local function IsTeammate(player)
    return player.Team ~= nil and player.Team == LocalPlayer.Team
end

local function DistanceTo(position)
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then
        return math.huge
    end
    return (root.Position - position).Magnitude
end

local function IsVisible(character, part)
    local camera = GetCamera()
    if not camera or not part then
        return false
    end
    local filter = { LocalPlayer.Character }
    for _, child in ipairs(camera:GetChildren()) do
        if child:IsA("Model") or child:IsA("BasePart") then
            table.insert(filter, child)
        end
    end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = filter
    local origin = camera.CFrame.Position
    local result = Workspace:Raycast(origin, part.Position - origin, params)
    return result == nil or result.Instance:IsDescendantOf(character)
end

local function SelectedNames()
    local selected = Config.Hitboxes
    if type(selected) ~= "table" or #selected == 0 then
        return { "Head" }
    end
    return selected
end

local function BestPart(player, center)
    local character = player.Character
    if not character then
        return nil
    end
    local best, bestDist
    for _, group in ipairs(SelectedNames()) do
        local names = HitboxParts[group]
        if names then
            for _, name in ipairs(names) do
                local part = character:FindFirstChild(name)
                if part and part:IsA("BasePart") then
                    local screen, onScreen = WorldToScreen(part.Position)
                    if onScreen then
                        local dist = (screen - center).Magnitude
                        if not bestDist or dist < bestDist then
                            best = part
                            bestDist = dist
                        end
                    elseif not best then
                        best = part
                    end
                end
            end
        end
    end
    return best or character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
end

local function AimPosition(part)
    local position = part.Position + Vector3.new(0, Config.AimOffset, 0)
    if Config.Prediction then
        position += part.AssemblyLinearVelocity * Config.PredictionTime
    end
    if Config.Humanize > 0 then
        position += HumanizeOffset
    end
    return position
end

local function Consider(pool, player, center)
    if player == LocalPlayer or not IsAlive(player) then
        return
    end
    if Config.AimTeamCheck and IsTeammate(player) then
        return
    end
    local part = BestPart(player, center)
    if not part then
        return
    end
    local worldDist = DistanceTo(part.Position)
    if worldDist > Config.AimDistance then
        return
    end
    if Config.AimWalls and not IsVisible(player.Character, part) then
        return
    end
    local screen, onScreen = WorldToScreen(AimPosition(part))
    if not onScreen then
        return
    end
    local screenDist = (screen - center).Magnitude
    if screenDist > Config.FOV then
        return
    end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    table.insert(pool, {
        Player = player,
        Part = part,
        ScreenDist = screenDist,
        Dist = worldDist,
        HP = humanoid and humanoid.Health or 0,
    })
end

local function PickTarget(center)
    if Config.Sticky and CurrentTarget and IsAlive(CurrentTarget) then
        if not (Config.AimTeamCheck and IsTeammate(CurrentTarget)) then
            local part = BestPart(CurrentTarget, center)
            if part and DistanceTo(part.Position) <= Config.AimDistance then
                local blocked = Config.AimWalls and not IsVisible(CurrentTarget.Character, part)
                local screen, onScreen = WorldToScreen(AimPosition(part))
                if not blocked and onScreen and (screen - center).Magnitude <= Config.FOV * Config.StickyScale then
                    return { Player = CurrentTarget, Part = part }
                end
            end
        end
    end

    local pool = {}
    for _, player in ipairs(Players:GetPlayers()) do
        Consider(pool, player, center)
    end
    if #pool == 0 then
        return nil
    end
    if Config.Priority == "Random" then
        return pool[math.random(1, #pool)]
    end
    table.sort(pool, function(a, b)
        if Config.Priority == "Lowest HP" then
            return a.HP < b.HP
        elseif Config.Priority == "Highest HP" then
            return a.HP > b.HP
        elseif Config.Priority == "Nearest" then
            return a.Dist < b.Dist
        end
        return a.ScreenDist < b.ScreenDist
    end)
    return pool[1]
end

local function ApplyAim(part)
    local camera = GetCamera()
    if not camera or not part then
        return
    end
    local goal = CFrame.lookAt(camera.CFrame.Position, AimPosition(part))
    if Config.AimMode == "Hard" then
        camera.CFrame = goal
    else
        camera.CFrame = camera.CFrame:Lerp(goal, math.clamp(Config.Snap, 0.02, 1))
    end
end

local PlayHitSound
local PlayShootSound
local PlayDeadSound

local function UpdateAim()
    local center = ScreenCenter()
    FOVCircle.Position = center
    FOVCircle.Radius = Config.FOV
    FOVCircle.Color = Config.FOVColor
    FOVCircle.Visible = Config.ShowFOV and Config.Aimbot

    TriggerCircle.Position = center
    TriggerCircle.Radius = Config.TriggerFOV
    TriggerCircle.Visible = Config.Trigger and Config.ShowFOV

    local aiming = KeyActive("AimKey", Config.Aimbot)
    local entry
    if aiming or Config.Trigger then
        entry = PickTarget(center)
    end

    if entry then
        if entry.Player ~= CurrentTarget then
            CurrentTarget = entry.Player
            local amount = Config.Humanize
            HumanizeOffset = Vector3.new(
                (math.random() - 0.5) * amount,
                (math.random() - 0.5) * amount,
                (math.random() - 0.5) * amount
            )
            LastTargetHealth = nil
        end
        local screen, onScreen = WorldToScreen(AimPosition(entry.Part))
        if aiming then
            ApplyAim(entry.Part)
            screen, onScreen = WorldToScreen(AimPosition(entry.Part))
            TargetDot.Visible = Config.TargetDot and onScreen
            TargetDot.Position = screen
            TargetDot.Color = Config.TargetColor
            TargetLine.Visible = Config.TargetLine and onScreen
            TargetLine.From = center
            TargetLine.To = screen
            TargetLine.Color = Config.TargetColor
        else
            TargetDot.Visible = false
            TargetLine.Visible = false
        end

        local humanoid = entry.Player.Character and entry.Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if LastTargetHealth and humanoid.Health < LastTargetHealth - 0.5 then
                HitUntil = os.clock() + Config.HitTime
                if humanoid.Health <= 0 then
                    PlayDeadSound()
                else
                    PlayHitSound()
                end
            end
            LastTargetHealth = humanoid.Health
        end

        if Config.Trigger and KeyActive("TriggerKey", true) and onScreen then
            if (screen - center).Magnitude <= Config.TriggerFOV and os.clock() >= NextShot then
                NextShot = os.clock() + Config.TriggerDelay
                if type(mouse1click) == "function" and not UserInputService:GetFocusedTextBox() then
                    pcall(mouse1click)
                end
            end
        end
    else
        CurrentTarget = nil
        LastTargetHealth = nil
        TargetDot.Visible = false
        TargetLine.Visible = false
    end
end

local function HideDraw(obj)
    if obj then
        obj.Visible = false
    end
end

local function HideList(list)
    if not list then
        return
    end
    for _, obj in ipairs(list) do
        HideDraw(obj)
    end
end

local function HideESP(esp)
    HideList(esp.Skeleton)
    HideList(esp.SkelOutline)
    HideList(esp.Corner)
    HideList(esp.CornerOutline)
    HideList(esp.Box)
    HideList(esp.BoxOutline)
    HideList(esp.Box3D)
    HideList(esp.Arrow)
    HideList(esp.Joints)
    HideDraw(esp.Tracer)
    HideDraw(esp.Look)
    HideDraw(esp.Head)
    HideDraw(esp.BarBack)
    HideDraw(esp.Bar)
    HideDraw(esp.Fill)
    HideDraw(esp.Plate)
    for _, text in pairs(esp.Text) do HideDraw(text) end
    if esp.Highlight then
        esp.Highlight.Enabled = false
    end
end

local function MakeLine()
    return Draw("Line", { Thickness = 1, Transparency = 1, Visible = false })
end

local function MakeText(size)
    return Draw("Text", {
        Size = size,
        Center = true,
        Outline = true,
        Transparency = 1,
        Visible = false,
        Color = Color3.new(1, 1, 1),
    })
end

local function CreateESP(player)
    if player == LocalPlayer or ESPData[player] then
        return
    end
    local esp = {
        Player = player,
        Skeleton = {},
        SkelOutline = {},
        Corner = {},
        CornerOutline = {},
        Box = {},
        BoxOutline = {},
        Box3D = {},
        Arrow = {},
        Joints = {},
        Text = {},
    }
    for i = 1, #R15 do
        esp.Skeleton[i] = MakeLine()
        esp.SkelOutline[i] = MakeLine()
    end
    for i = 1, 8 do
        esp.Corner[i] = MakeLine()
        esp.CornerOutline[i] = MakeLine()
    end
    for i = 1, 4 do
        esp.Box[i] = MakeLine()
        esp.BoxOutline[i] = MakeLine()
    end
    for i = 1, 12 do
        esp.Box3D[i] = MakeLine()
    end
    for i = 1, 10 do
        esp.Joints[i] = Draw("Circle", {
            Thickness = 1,
            NumSides = 12,
            Radius = 2,
            Filled = true,
            Visible = false,
            Transparency = 1,
        })
    end
    esp.Arrow[1] = MakeLine()
    esp.Arrow[2] = MakeLine()
    esp.Tracer = MakeLine()
    esp.Look = MakeLine()
    esp.Fill = Draw("Square", { Filled = true, Thickness = 1, Visible = false, Transparency = 0.15, Color = Color3.new(1, 1, 1) })
    esp.Plate = Draw("Square", { Filled = true, Thickness = 1, Visible = false, Transparency = 0.45, Color = Color3.new(0, 0, 0) })
    esp.Head = Draw("Circle", {
        Thickness = 1,
        NumSides = 16,
        Radius = 3,
        Filled = false,
        Visible = false,
        Transparency = 1,
    })
    esp.BarBack = Draw("Square", { Filled = true, Thickness = 1, Visible = false, Transparency = 0.65, Color = Color3.new(0, 0, 0) })
    esp.Bar = Draw("Square", { Filled = true, Thickness = 1, Visible = false, Transparency = 1 })
    esp.Text.Name = MakeText(Config.TextSize)
    esp.Text.Health = MakeText(Config.TextSize - 1)
    esp.Text.Distance = MakeText(Config.TextSize - 1)
    esp.Text.Weapon = MakeText(Config.TextSize - 1)
    esp.Text.State = MakeText(Config.TextSize - 1)
    ESPData[player] = esp
end

local function DestroyDraw(obj)
    if obj then
        pcall(function()
            obj:Remove()
        end)
    end
end

local function RemoveESP(player)
    local esp = ESPData[player]
    if not esp then
        return
    end
    local function DestroyList(list)
        if not list then
            return
        end
        for _, obj in ipairs(list) do
            DestroyDraw(obj)
        end
    end
    DestroyList(esp.Skeleton)
    DestroyList(esp.SkelOutline)
    DestroyList(esp.Corner)
    DestroyList(esp.CornerOutline)
    DestroyList(esp.Box)
    DestroyList(esp.BoxOutline)
    DestroyList(esp.Box3D)
    DestroyList(esp.Arrow)
    DestroyList(esp.Joints)
    DestroyDraw(esp.Tracer)
    DestroyDraw(esp.Look)
    DestroyDraw(esp.Head)
    DestroyDraw(esp.BarBack)
    DestroyDraw(esp.Bar)
    DestroyDraw(esp.Fill)
    DestroyDraw(esp.Plate)
    for _, text in pairs(esp.Text) do DestroyDraw(text) end
    if esp.Highlight then
        pcall(function()
            esp.Highlight:Destroy()
        end)
    end
    ESPData[player] = nil
end

local function EnsureHighlight(esp, character)
    if not Config.Chams then
        if esp.Highlight then
            esp.Highlight.Enabled = false
        end
        return
    end
    if not esp.Highlight or esp.Highlight.Parent == nil then
        local highlight = Instance.new("Highlight")
        highlight.Name = "MH_Chams"
        highlight.Parent = character
        esp.Highlight = highlight
    end
    local highlight = esp.Highlight
    highlight.Adornee = character
    highlight.Enabled = true
    highlight.FillTransparency = Config.ChamsFill
    highlight.OutlineTransparency = Config.ChamsOutline
    highlight.DepthMode = Config.ChamsWalls and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
end

local function Bounds(character)
    local ok, cf, size = pcall(function()
        return character:GetBoundingBox()
    end)
    if not ok or not cf or not size then
        return nil
    end
    local hx, hy, hz = size.X / 2, size.Y / 2, size.Z / 2
    local points = {
        cf * Vector3.new(-hx, hy, -hz),
        cf * Vector3.new(hx, hy, -hz),
        cf * Vector3.new(-hx, -hy, -hz),
        cf * Vector3.new(hx, -hy, -hz),
        cf * Vector3.new(-hx, hy, hz),
        cf * Vector3.new(hx, hy, hz),
        cf * Vector3.new(-hx, -hy, hz),
        cf * Vector3.new(hx, -hy, hz),
    }
    local minX, minY = math.huge, math.huge
    local maxX, maxY = -math.huge, -math.huge
    local seen = false
    for _, world in ipairs(points) do
        local screen, onScreen = WorldToScreen(world)
        if onScreen then
            seen = true
            minX = math.min(minX, screen.X)
            minY = math.min(minY, screen.Y)
            maxX = math.max(maxX, screen.X)
            maxY = math.max(maxY, screen.Y)
        end
    end
    if not seen then
        return nil
    end
    return minX, minY, maxX, maxY
end

local function FadeOf(dist)
    if not Config.Fade then
        return 1
    end
    return math.clamp(1 - dist / math.max(Config.ESPDistance, 1), 0.28, 1)
end

local function PaintLine(line, from, to, color, thickness, fade, outline)
    fade = fade or 1
    if outline then
        if Config.Outline then
            outline.From = from
            outline.To = to
            outline.Color = Config.OutlineColor
            outline.Thickness = thickness + 1.25
            outline.Transparency = fade
            outline.Visible = true
        else
            outline.Visible = false
        end
    end
    line.From = from
    line.To = to
    line.Color = color
    line.Thickness = thickness
    line.Transparency = fade
    line.Visible = true
end

local BoxEdges = {
    { 1, 2 }, { 2, 4 }, { 4, 3 }, { 3, 1 },
    { 5, 6 }, { 6, 8 }, { 8, 7 }, { 7, 5 },
    { 1, 5 }, { 2, 6 }, { 3, 7 }, { 4, 8 },
}

local JointNames = {
    "Head", "UpperTorso", "LowerTorso", "Torso",
    "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg",
    "LeftLowerArm", "RightLowerArm",
}

local function DrawBox3D(esp, character, color, thickness, fade)
    if not Config.Box3D then
        HideList(esp.Box3D)
        return
    end
    local ok, cf, size = pcall(function()
        return character:GetBoundingBox()
    end)
    if not ok or not cf or not size then
        HideList(esp.Box3D)
        return
    end
    local hx, hy, hz = size.X / 2, size.Y / 2, size.Z / 2
    local offsets = {
        Vector3.new(-hx, hy, -hz), Vector3.new(hx, hy, -hz),
        Vector3.new(-hx, -hy, -hz), Vector3.new(hx, -hy, -hz),
        Vector3.new(-hx, hy, hz), Vector3.new(hx, hy, hz),
        Vector3.new(-hx, -hy, hz), Vector3.new(hx, -hy, hz),
    }
    local screen, onScreen = {}, {}
    for index, offset in ipairs(offsets) do
        screen[index], onScreen[index] = WorldToScreen((cf * CFrame.new(offset)).Position)
    end
    for index, edge in ipairs(BoxEdges) do
        if onScreen[edge[1]] and onScreen[edge[2]] then
            PaintLine(esp.Box3D[index], screen[edge[1]], screen[edge[2]], color, thickness, fade)
        else
            esp.Box3D[index].Visible = false
        end
    end
end

local function DrawJoints(esp, character, color, fade)
    if not Config.Joints then
        HideList(esp.Joints)
        return
    end
    local slot = 1
    for _, name in ipairs(JointNames) do
        if slot > #esp.Joints then
            break
        end
        local part = character:FindFirstChild(name)
        local dot = esp.Joints[slot]
        if part then
            local screen, onScreen = WorldToScreen(part.Position)
            dot.Visible = onScreen
            dot.Position = screen
            dot.Color = color
            dot.Radius = name == "Head" and 3 or 2
            dot.Transparency = fade
            slot += 1
        end
    end
    for index = slot, #esp.Joints do
        esp.Joints[index].Visible = false
    end
end

local function UpdateESP(esp)
    local player = esp.Player
    if not Config.ESP or not IsAlive(player) or (Config.ESPTeamCheck and IsTeammate(player)) then
        HideESP(esp)
        return
    end

    local character = player.Character
    local root = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then
        HideESP(esp)
        return
    end

    local dist = DistanceTo(root.Position)
    if dist > Config.ESPDistance then
        HideESP(esp)
        return
    end

    local visible = IsVisible(character, head or root)
    local color = Config.BoxColor
    if Config.HealthTint then
        local ratio = math.clamp(humanoid.Health / math.max(humanoid.MaxHealth, 1), 0, 1)
        color = Color3.fromRGB(math.floor(255 * (1 - ratio)), math.floor(220 * ratio + 30), 70)
    elseif Config.VisCheck then
        color = visible and Config.VisibleColor or Config.HiddenColor
    elseif Config.UseTeamColor and player.Team then
        color = player.Team.TeamColor.Color
    end
    local thickness = math.clamp(Config.Thickness, 1, 3)
    local fade = FadeOf(dist)

    if Config.Skeleton then
        local bones = character:FindFirstChild("UpperTorso") and R15 or R6
        for i, bone in ipairs(esp.Skeleton) do
            local pair = bones[i]
            local a = pair and character:FindFirstChild(pair[1])
            local b = pair and character:FindFirstChild(pair[2])
            if a and b then
                local s1, on1 = WorldToScreen(a.Position)
                local s2, on2 = WorldToScreen(b.Position)
                if on1 and on2 then
                    PaintLine(bone, s1, s2, color, thickness, fade, esp.SkelOutline[i])
                else
                    bone.Visible = false
                    esp.SkelOutline[i].Visible = false
                end
            else
                bone.Visible = false
                if esp.SkelOutline[i] then
                    esp.SkelOutline[i].Visible = false
                end
            end
        end
    else
        HideList(esp.Skeleton)
        HideList(esp.SkelOutline)
    end
    DrawJoints(esp, character, color, fade)
    DrawBox3D(esp, character, color, thickness, fade)

    local minX, minY, maxX, maxY = Bounds(character)
    if minX then
        local width, height = maxX - minX, maxY - minY
        local length = math.clamp(math.min(width, height) * 0.22, 4, 18)
        if Config.CornerBox then
            local corners = {
                { Vector2.new(minX, minY), Vector2.new(minX + length, minY) },
                { Vector2.new(minX, minY), Vector2.new(minX, minY + length) },
                { Vector2.new(maxX, minY), Vector2.new(maxX - length, minY) },
                { Vector2.new(maxX, minY), Vector2.new(maxX, minY + length) },
                { Vector2.new(minX, maxY), Vector2.new(minX + length, maxY) },
                { Vector2.new(minX, maxY), Vector2.new(minX, maxY - length) },
                { Vector2.new(maxX, maxY), Vector2.new(maxX - length, maxY) },
                { Vector2.new(maxX, maxY), Vector2.new(maxX, maxY - length) },
            }
            for i, segment in ipairs(corners) do
                PaintLine(esp.Corner[i], segment[1], segment[2], color, thickness, fade, esp.CornerOutline[i])
            end
        else
            HideList(esp.Corner)
            HideList(esp.CornerOutline)
        end

        if Config.FullBox and not Config.CornerBox then
            local topLeft = Vector2.new(minX, minY)
            local topRight = Vector2.new(maxX, minY)
            local bottomRight = Vector2.new(maxX, maxY)
            local bottomLeft = Vector2.new(minX, maxY)
            PaintLine(esp.Box[1], topLeft, topRight, color, thickness, fade, esp.BoxOutline[1])
            PaintLine(esp.Box[2], topRight, bottomRight, color, thickness, fade, esp.BoxOutline[2])
            PaintLine(esp.Box[3], bottomRight, bottomLeft, color, thickness, fade, esp.BoxOutline[3])
            PaintLine(esp.Box[4], bottomLeft, topLeft, color, thickness, fade, esp.BoxOutline[4])
        else
            HideList(esp.Box)
            HideList(esp.BoxOutline)
        end

        if Config.BoxFill then
            esp.Fill.Position = Vector2.new(minX, minY)
            esp.Fill.Size = Vector2.new(math.max(width, 1), math.max(height, 1))
            esp.Fill.Color = color
            esp.Fill.Transparency = math.clamp(Config.FillAlpha, 0.04, 0.85) * fade
            esp.Fill.Visible = true
        else
            esp.Fill.Visible = false
        end

        if Config.HealthBar then
            local ratio = math.clamp(humanoid.Health / math.max(humanoid.MaxHealth, 1), 0, 1)
            local barHeight = height * ratio
            local barWidth = math.clamp(Config.BarWidth, 1, 6)
            esp.BarBack.Position = Vector2.new(minX - (barWidth + 3), minY)
            esp.BarBack.Size = Vector2.new(barWidth, height)
            esp.BarBack.Transparency = 0.55 * fade
            esp.BarBack.Visible = true
            esp.Bar.Position = Vector2.new(minX - (barWidth + 3), minY + (height - barHeight))
            esp.Bar.Size = Vector2.new(barWidth, math.max(barHeight, 1))
            esp.Bar.Color = Color3.fromRGB(math.floor(255 * (1 - ratio)), math.floor(255 * ratio), 40)
            esp.Bar.Transparency = fade
            esp.Bar.Visible = true
        else
            esp.BarBack.Visible = false
            esp.Bar.Visible = false
        end

        local cursorY = minY - 14
        local midX = (minX + maxX) / 2
        local function Place(text, str, enabled, y, plate)
            if enabled then
                text.Text = str
                text.Size = Config.TextSize
                text.Color = Config.NameColor
                text.Transparency = fade
                text.Position = Vector2.new(midX, y)
                text.Visible = true
                if plate and Config.NamePlate then
                    local plateWidth = math.max(28, #str * Config.TextSize * 0.48)
                    esp.Plate.Size = Vector2.new(plateWidth, Config.TextSize + 4)
                    esp.Plate.Position = Vector2.new(midX - plateWidth / 2, y - Config.TextSize / 2 - 2)
                    esp.Plate.Transparency = 0.5 * fade
                    esp.Plate.Visible = true
                end
                return y + Config.TextSize
            end
            text.Visible = false
            return y
        end
        local nameLabel = player.Name
        if Config.NameMode == "Display" then
            nameLabel = player.DisplayName
        elseif Config.NameMode == "Both" then
            nameLabel = player.DisplayName .. " (" .. player.Name .. ")"
        end
        esp.Plate.Visible = false
        cursorY = Place(esp.Text.Name, nameLabel, Config.Names, cursorY, true)
        if Config.HealthText then
            esp.Text.Health.Text = string.format("%d HP", math.floor(humanoid.Health))
            esp.Text.Health.Size = Config.TextSize - 1
            esp.Text.Health.Color = Config.NameColor
            esp.Text.Health.Transparency = fade
            esp.Text.Health.Position = Vector2.new(midX, cursorY)
            esp.Text.Health.Visible = true
            cursorY += Config.TextSize - 1
        else
            esp.Text.Health.Visible = false
        end
        if Config.ShowState then
            esp.Text.State.Text = humanoid:GetState().Name
            esp.Text.State.Size = Config.TextSize - 1
            esp.Text.State.Color = Config.NameColor
            esp.Text.State.Transparency = fade
            esp.Text.State.Position = Vector2.new(midX, cursorY)
            esp.Text.State.Visible = true
        else
            esp.Text.State.Visible = false
        end

        local tool = character:FindFirstChildOfClass("Tool")
        if Config.Weapon then
            esp.Text.Weapon.Text = tool and tool.Name or "Hands"
            esp.Text.Weapon.Size = Config.TextSize - 1
            esp.Text.Weapon.Color = Config.NameColor
            esp.Text.Weapon.Transparency = fade
            esp.Text.Weapon.Position = Vector2.new(midX, maxY + 2)
            esp.Text.Weapon.Visible = true
        else
            esp.Text.Weapon.Visible = false
        end
        if Config.Distance then
            esp.Text.Distance.Text = string.format("[%dm]", math.floor(dist))
            esp.Text.Distance.Size = Config.TextSize - 1
            esp.Text.Distance.Color = Config.NameColor
            esp.Text.Distance.Transparency = fade
            local extra = Config.Weapon and (Config.TextSize - 1) or 0
            esp.Text.Distance.Position = Vector2.new(midX, maxY + 2 + extra)
            esp.Text.Distance.Visible = true
        else
            esp.Text.Distance.Visible = false
        end
    else
        HideList(esp.Corner)
        HideList(esp.CornerOutline)
        HideList(esp.Box)
        HideList(esp.BoxOutline)
        esp.BarBack.Visible = false
        esp.Bar.Visible = false
        esp.Fill.Visible = false
        esp.Plate.Visible = false
        for _, text in pairs(esp.Text) do text.Visible = false end
    end

    if Config.HeadDot and head then
        local screen, onScreen = WorldToScreen(head.Position)
        esp.Head.Visible = onScreen
        esp.Head.Position = screen
        esp.Head.Color = color
        esp.Head.Radius = Config.HeadFilled and 2.5 or 4
        esp.Head.Filled = Config.HeadFilled
        esp.Head.Thickness = 1
        esp.Head.Transparency = fade
    else
        esp.Head.Visible = false
    end

    if Config.LookDir and head then
        local origin = head.Position
        local target = origin + head.CFrame.LookVector * Config.LookLength
        local from, onFrom = WorldToScreen(origin)
        local to, onTo = WorldToScreen(target)
        if onFrom and onTo then
            PaintLine(esp.Look, from, to, color, thickness, fade)
        else
            esp.Look.Visible = false
        end
    else
        esp.Look.Visible = false
    end

    if Config.Tracers then
        local screen, onScreen = WorldToScreen(root.Position)
        local camera = GetCamera()
        if onScreen and camera then
            local from = ScreenCenter()
            if Config.TracerFrom == "Bottom" then
                from = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
            elseif Config.TracerFrom == "Top" then
                from = Vector2.new(camera.ViewportSize.X / 2, 0)
            elseif Config.TracerFrom == "Mouse" then
                from = UserInputService:GetMouseLocation()
            end
            PaintLine(esp.Tracer, from, screen, color, thickness, fade)
        else
            esp.Tracer.Visible = false
        end
    else
        esp.Tracer.Visible = false
    end

    if Config.Arrows then
        local camera = GetCamera()
        local screen, onScreen = WorldToScreen(root.Position)
        if camera and not onScreen then
            local raw = camera:WorldToViewportPoint(root.Position)
            local center = ScreenCenter()
            local point = Vector2.new(raw.X, raw.Y)
            if raw.Z < 0 then
                point = center - (point - center)
            end
            local direction = point - center
            if direction.Magnitude > 1 then
                direction = direction.Unit
                local radius = math.min(center.X, center.Y) - 28
                local tip = center + direction * radius
                local side = Vector2.new(-direction.Y, direction.X) * Config.ArrowSize
                local base = tip - direction * (Config.ArrowSize * 1.6)
                PaintLine(esp.Arrow[1], tip, base + side, color, thickness)
                PaintLine(esp.Arrow[2], tip, base - side, color, thickness)
            else
                esp.Arrow[1].Visible = false
                esp.Arrow[2].Visible = false
            end
        else
            esp.Arrow[1].Visible = false
            esp.Arrow[2].Visible = false
        end
    else
        esp.Arrow[1].Visible = false
        esp.Arrow[2].Visible = false
    end

    EnsureHighlight(esp, character)
    if esp.Highlight and esp.Highlight.Enabled then
        esp.Highlight.FillColor = color
        esp.Highlight.OutlineColor = color
    end
end

local ItemDrawings = {}
for i = 1, 20 do
    ItemDrawings[i] = {
        Text = MakeText(12),
        Line = MakeLine(),
    }
end

local function UpdateItems()
    for _, draw in ipairs(ItemDrawings) do
        draw.Text.Visible = false
        draw.Line.Visible = false
    end
    if not Config.ItemESP then
        return
    end
    if os.clock() >= NextItemScan then
        NextItemScan = os.clock() + 0.5
        table.clear(ItemCache)
        local checked = 0
        for _, inst in ipairs(Workspace:GetDescendants()) do
            checked += 1
            if checked > 2500 or #ItemCache >= 20 then
                break
            end
            if inst:IsA("Tool") then
                local model = inst:FindFirstAncestorOfClass("Model")
                if not (model and Players:GetPlayerFromCharacter(model)) then
                    local part = inst:FindFirstChildWhichIsA("BasePart")
                    if part then
                        table.insert(ItemCache, { Part = part, Name = inst.Name })
                    end
                end
            end
        end
    end
    local center = ScreenCenter()
    for index, item in ipairs(ItemCache) do
        local draw = ItemDrawings[index]
        local part = item.Part
        if draw and part and part.Parent then
            local screen, onScreen = WorldToScreen(part.Position)
            if onScreen and DistanceTo(part.Position) <= Config.ESPDistance then
                draw.Text.Text = item.Name
                draw.Text.Color = Config.ItemColor
                draw.Text.Size = Config.TextSize - 1
                draw.Text.Position = screen - Vector2.new(0, 12)
                draw.Text.Visible = true
                draw.Line.From = center
                draw.Line.To = screen
                draw.Line.Color = Config.ItemColor
                draw.Line.Thickness = 1
                draw.Line.Visible = true
            end
        end
    end
end

local function RenderESP()
    for player, esp in pairs(ESPData) do
        if player.Parent then
            UpdateESP(esp)
        else
            RemoveESP(player)
        end
    end
    UpdateItems()
end

local function InstallHooks()
    HooksStarted = true
    if type(getgc) ~= "function" or type(hookfunction) ~= "function" then
        return
    end
    task.spawn(function()
        local step = 0
        for _, obj in next, getgc(true) do
            step += 1
            if step % 500 == 0 then
                task.wait()
            end
            if type(obj) == "table" then
                local recoil = rawget(obj, "setWeaponRecoil")
                if type(recoil) == "function" and not Hooked[recoil] then
                    Hooked[recoil] = true
                    local old
                    old = hookfunction(recoil, function(...)
                        if Config.NoRecoil then
                            return
                        end
                        return old(...)
                    end)
                end
                local kick = rawget(obj, "weaponKick")
                if type(kick) == "function" and not Hooked[kick] then
                    Hooked[kick] = true
                    local old
                    old = hookfunction(kick, function(...)
                        if Config.NoRecoil then
                            return
                        end
                        return old(...)
                    end)
                end
                local spread = rawget(obj, "getTrueSpread")
                if type(spread) == "function" and not Hooked[spread] then
                    Hooked[spread] = true
                    local old
                    old = hookfunction(spread, function(...)
                        if Config.NoSpread then
                            return 0
                        end
                        return old(...)
                    end)
                end
                local spring = rawget(obj, "_spreadSpring")
                if type(spring) == "table" then
                    SpreadSprings[spring] = true
                end
            elseif type(obj) == "function" and debug and debug.getinfo and not Hooked[obj] then
                local ok, info = pcall(debug.getinfo, obj)
                if ok and info then
                    if info.name == "calculateRecoilOffset" then
                        Hooked[obj] = true
                        local old
                        old = hookfunction(obj, function(...)
                            if Config.NoRecoil then
                                return UDim2.new()
                            end
                            return old(...)
                        end)
                    elseif info.name == "calculateSpread" or info.name == "getSpread" then
                        Hooked[obj] = true
                        local old
                        old = hookfunction(obj, function(...)
                            if Config.NoSpread then
                                return 0
                            end
                            return old(...)
                        end)
                    end
                end
            end
        end
    end)
end

local function ApplyToolNumbers(tool)
    for _, inst in ipairs(tool:GetDescendants()) do
        if inst:IsA("NumberValue") or inst:IsA("IntValue") then
            if OriginalValues[inst] == nil then
                OriginalValues[inst] = inst.Value
            end
            local base = OriginalValues[inst]
            local name = string.lower(inst.Name)
            local value = base
            if Config.NoRecoil and (string.find(name, "recoil", 1, true) or string.find(name, "kick", 1, true)) then
                value = 0
            end
            if Config.NoSway and (string.find(name, "sway", 1, true) or string.find(name, "bob", 1, true)) then
                value = 0
            end
            if Config.NoSpread and (string.find(name, "spread", 1, true) or string.find(name, "bloom", 1, true) or string.find(name, "inaccur", 1, true)) then
                value = 0
            end
            if Config.RapidFire and (string.find(name, "cooldown", 1, true) or string.find(name, "firedelay", 1, true)) then
                value = base / math.max(Config.FireScale, 1)
            elseif Config.RapidFire and (string.find(name, "firerate", 1, true) or name == "rpm") then
                value = base * Config.FireScale
            end
            if (Config.InstantReload or Config.RapidFire) and string.find(name, "reload", 1, true) then
                value = Config.InstantReload and 0 or base / math.max(Config.FireScale, 1)
            end
            if Config.NoEquip and (string.find(name, "equip", 1, true) or string.find(name, "deploy", 1, true)) then
                value = 0
            end
            if inst.Value ~= value then
                inst.Value = value
            end
        end
    end
end

local function UpdateWeapon()
    if (Config.NoRecoil or Config.NoSpread) and not HooksStarted then
        InstallHooks()
    end
    if Config.NoSpread then
        for spring in pairs(SpreadSprings) do
            pcall(function()
                spring._p0 = Vector3.zero
                spring._v0 = Vector3.zero
                spring.p = Vector3.zero
                spring.v = Vector3.zero
            end)
        end
    end
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid and Config.NoCameraKick then
        humanoid.CameraOffset = Vector3.zero
    end
    local tool = character and character:FindFirstChildOfClass("Tool")
    if tool then
        ApplyToolNumbers(tool)
    end

    local center = ScreenCenter()
    local size = Config.CrossSize
    local gap = Config.CrossGap
    for _, line in ipairs(Crosshair) do
        line.Color = Config.CrossColor
        line.Thickness = Config.CrossThickness
        line.Visible = Config.Crosshair
    end
    if Config.Crosshair then
        Crosshair[1].From = center + Vector2.new(0, -(gap + size))
        Crosshair[1].To = center + Vector2.new(0, -gap)
        Crosshair[2].From = center + Vector2.new(0, gap)
        Crosshair[2].To = center + Vector2.new(0, gap + size)
        Crosshair[3].From = center + Vector2.new(-(gap + size), 0)
        Crosshair[3].To = center + Vector2.new(-gap, 0)
        Crosshair[4].From = center + Vector2.new(gap, 0)
        Crosshair[4].To = center + Vector2.new(gap + size, 0)
    end
    CrossDot.Position = center
    CrossDot.Color = Config.CrossColor
    CrossDot.Visible = Config.Crosshair and Config.CrossDot

    local showHit = Config.Hitmarker and os.clock() < HitUntil
    local arm = 6
    HitLines[1].Visible = showHit
    HitLines[2].Visible = showHit
    if showHit then
        HitLines[1].Color = Config.HitColor
        HitLines[2].Color = Config.HitColor
        HitLines[1].From = center + Vector2.new(-arm, -arm)
        HitLines[1].To = center + Vector2.new(arm, arm)
        HitLines[2].From = center + Vector2.new(arm, -arm)
        HitLines[2].To = center + Vector2.new(-arm, arm)
    end
    WatchHits()
end

local function Spin(root, speed)
    if Config.SpinMode == "Vertical" then
        SpinPitch = (SpinPitch + speed) % 360
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(SpinPitch), 0, 0)
    elseif Config.SpinMode == "Both" then
        SpinYaw = (SpinYaw + speed) % 360
        SpinPitch = (SpinPitch + speed * 0.5) % 360
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(SpinPitch), math.rad(SpinYaw), 0)
    elseif Config.SpinMode == "Random" then
        SpinTick += 1
        if SpinTick >= 60 then
            SpinTick = 0
            SpinYaw = math.random(0, 360)
            SpinPitch = math.random(0, 360)
        end
        SpinYaw = (SpinYaw + speed) % 360
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(SpinPitch * 0.3), math.rad(SpinYaw), 0)
    else
        SpinYaw = (SpinYaw + speed) % 360
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(SpinYaw), 0)
    end
end

local function StopFly(humanoid)
    if FlyVelocity then
        FlyVelocity:Destroy()
        FlyVelocity = nil
    end
    if humanoid and humanoid.PlatformStand then
        humanoid.PlatformStand = false
    end
end

local LastMoveTick = os.clock()

local function FlatDirection(vector)
    local flat = Vector3.new(vector.X, 0, vector.Z)
    if flat.Magnitude < 0.001 then
        return Vector3.zero
    end
    return flat.Unit
end

local function CameraMoveDirection(includeVertical)
    local camera = GetCamera()
    local direction = Vector3.zero
    if camera then
        local look = includeVertical and camera.CFrame.LookVector or FlatDirection(camera.CFrame.LookVector)
        local right = includeVertical and camera.CFrame.RightVector or FlatDirection(camera.CFrame.RightVector)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction += look end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction -= look end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction -= right end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction += right end
    end
    if includeVertical then
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction += Vector3.yAxis end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then direction -= Vector3.yAxis end
    end
    if direction.Magnitude > 0 then
        return direction.Unit
    end
    return Vector3.zero
end

local function UpdateMovement()
    local now = os.clock()
    local dt = math.clamp(now - LastMoveTick, 0, 0.1)
    LastMoveTick = now

    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then
        StopFly(nil)
        return
    end

    local flying = KeyActive("FlyKey", Config.Fly)
    if flying and Config.FlyMode == "CFrame" then
        if FlyVelocity then
            StopFly(humanoid)
        end
        humanoid.PlatformStand = true
        local direction = CameraMoveDirection(true)
        if direction.Magnitude > 0 then
            root.CFrame = root.CFrame + direction * Config.FlySpeed * dt
        end
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    elseif flying then
        if not FlyVelocity or FlyVelocity.Parent ~= root then
            StopFly(humanoid)
            FlyVelocity = Instance.new("BodyVelocity")
            FlyVelocity.Name = "MH_Fly"
            FlyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            FlyVelocity.Parent = root
        end
        humanoid.PlatformStand = true
        FlyVelocity.Velocity = CameraMoveDirection(true) * Config.FlySpeed
    else
        StopFly(humanoid)
        if KeyActive("SpinKey", Config.Spin) then
            local speed = Config.SpinSpeed
            if Config.SmoothSpin then
                speed *= 0.1
            end
            Spin(root, speed)
        end
    end

    local cframeSpeed = Config.Speed and Config.SpeedMode == "CFrame" and not flying
    if cframeSpeed then
        if not Saved.SpeedOn then
            Saved.WalkSpeed = humanoid.WalkSpeed
            Saved.SpeedOn = true
        end
        humanoid.WalkSpeed = 0
        local move = humanoid.MoveDirection
        if move.Magnitude < 0.05 then
            move = CameraMoveDirection(false)
        end
        if move.Magnitude > 0 then
            root.CFrame = root.CFrame + move.Unit * Config.CFrameSpeed * dt
        end
        root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
    elseif Config.Speed then
        if not Saved.SpeedOn then
            Saved.WalkSpeed = humanoid.WalkSpeed
            Saved.SpeedOn = true
        end
        humanoid.WalkSpeed = Config.WalkSpeed
    elseif Saved.SpeedOn then
        humanoid.WalkSpeed = Saved.WalkSpeed or 16
        Saved.SpeedOn = false
    end
    if Config.Jump then
        if not Saved.JumpOn then
            Saved.JumpPower = humanoid.JumpPower
            Saved.JumpHeight = humanoid.JumpHeight
            Saved.JumpOn = true
        end
        if humanoid.UseJumpPower then
            humanoid.JumpPower = Config.JumpPower
        else
            humanoid.JumpHeight = Config.JumpPower
        end
    elseif Saved.JumpOn then
        humanoid.JumpPower = Saved.JumpPower or 50
        humanoid.JumpHeight = Saved.JumpHeight or 7.2
        Saved.JumpOn = false
    end
    if Config.Hip then
        if not Saved.HipOn then
            Saved.HipHeight = humanoid.HipHeight
            Saved.HipOn = true
        end
        humanoid.HipHeight = Config.HipHeight
    elseif Saved.HipOn then
        humanoid.HipHeight = Saved.HipHeight or 2
        Saved.HipOn = false
    end
    if Config.Bhop and UserInputService:IsKeyDown(Enum.KeyCode.Space) and humanoid.FloorMaterial ~= Enum.Material.Air then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
    if Config.Noclip then
        Saved.NoclipOn = true
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    elseif Saved.NoclipOn then
        Saved.NoclipOn = false
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and (part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Torso" or string.find(part.Name, "Leg", 1, true)) then
                part.CanCollide = true
            end
        end
    end
    if Config.GravityOn then
        Workspace.Gravity = Config.Gravity
    elseif Saved.GravityOn then
        Workspace.Gravity = Saved.Gravity
    end
    Saved.GravityOn = Config.GravityOn
end

local UpdateScene

local function UpdateWorld()
    local camera = GetCamera()
    if Config.Fullbright then
        Lighting.Brightness = Config.Brightness
        Lighting.Ambient = Config.Ambient
        Lighting.OutdoorAmbient = Config.Ambient
        Lighting.ExposureCompensation = 0
    elseif Saved.Fullbright then
        Lighting.Brightness = Saved.Brightness
        Lighting.Ambient = Saved.Ambient
        Lighting.OutdoorAmbient = Saved.OutdoorAmbient
        Lighting.ExposureCompensation = Saved.Exposure
    end
    if Config.NoFog then
        Lighting.FogStart = 0
        Lighting.FogEnd = 1e6
    elseif Saved.NoFog then
        Lighting.FogStart = Saved.FogStart
        Lighting.FogEnd = Saved.FogEnd
    end
    if Config.NoShadows then
        Lighting.GlobalShadows = false
    elseif Saved.NoShadows then
        Lighting.GlobalShadows = Saved.GlobalShadows
    end
    if Config.ClockOn then
        Lighting.ClockTime = Config.ClockTime
    elseif Saved.ClockOn then
        Lighting.ClockTime = Saved.ClockTime
    end
    if camera and Config.CameraFOVOn then
        camera.FieldOfView = Config.CameraFOV
    elseif camera and Saved.CameraFOVOn then
        camera.FieldOfView = Saved.FieldOfView
    end
    if Config.ZoomOn then
        LocalPlayer.CameraMinZoomDistance = math.min(8, Config.Zoom)
        LocalPlayer.CameraMaxZoomDistance = Config.Zoom
    elseif Saved.ZoomOn then
        LocalPlayer.CameraMinZoomDistance = Saved.ZoomMin
        LocalPlayer.CameraMaxZoomDistance = Saved.ZoomMax
    end
    Saved.Fullbright = Config.Fullbright
    Saved.NoFog = Config.NoFog
    Saved.NoShadows = Config.NoShadows
    Saved.ClockOn = Config.ClockOn
    Saved.CameraFOVOn = Config.CameraFOVOn
    Saved.ZoomOn = Config.ZoomOn
    if Config.FPSOn and type(setfpscap) == "function" then
        setfpscap(Config.FPSCap)
    end
    UpdateScene()
end

local function GetAtmosphere()
    local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
    if not atmosphere then
        atmosphere = Instance.new("Atmosphere")
        atmosphere.Name = "MH_Atmosphere"
        atmosphere.Parent = Lighting
        OwnedAtmosphere = true
    end
    if not Saved.Atmo then
        Saved.Atmo = {
            Density = atmosphere.Density,
            Offset = atmosphere.Offset,
            Color = atmosphere.Color,
            Decay = atmosphere.Decay,
            Glare = atmosphere.Glare,
            Haze = atmosphere.Haze,
        }
    end
    return atmosphere
end

local function UpdateViewmodel()
    local camera = GetCamera()
    if not camera then
        return
    end
    if Config.HideViewmodel then
        for _, child in ipairs(camera:GetChildren()) do
            if child:IsA("BasePart") then
                child.LocalTransparencyModifier = 1
                HiddenViewmodel[child] = true
            end
            for _, part in ipairs(child:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.LocalTransparencyModifier = 1
                    HiddenViewmodel[part] = true
                end
            end
        end
    elseif next(HiddenViewmodel) then
        for part in pairs(HiddenViewmodel) do
            if part.Parent then
                pcall(function()
                    part.LocalTransparencyModifier = 0
                end)
            end
        end
        table.clear(HiddenViewmodel)
    end
end

local function UpdateXray()
    if not Config.Xray then
        if next(XrayState) then
            for part, old in pairs(XrayState) do
                if part.Parent then
                    pcall(function()
                        part.LocalTransparencyModifier = old
                    end)
                end
            end
            table.clear(XrayState)
        end
        return
    end
    if os.clock() < NextXray then
        return
    end
    NextXray = os.clock() + 0.25
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then
        return
    end
    local filter = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            table.insert(filter, player.Character)
        end
    end
    local params = OverlapParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = filter
    local ok, parts = pcall(function()
        return Workspace:GetPartBoundsInRadius(root.Position, Config.XrayRange, params)
    end)
    if not ok or not parts then
        return
    end
    local seen = {}
    for index, part in ipairs(parts) do
        if index > 400 then
            break
        end
        if part:IsA("BasePart") then
            if XrayState[part] == nil then
                XrayState[part] = part.LocalTransparencyModifier
            end
            part.LocalTransparencyModifier = Config.XrayAmount
            seen[part] = true
        end
    end
    for part, old in pairs(XrayState) do
        if not seen[part] then
            if part.Parent then
                pcall(function()
                    part.LocalTransparencyModifier = old
                end)
            end
            XrayState[part] = nil
        end
    end
end

local FXFolder
local UpdateWeather
local ClearWeather

local NextParticle = 0
local function UpdateParticles()
    if Config.NoParticles then
        if Saved.ParticlesApplied and os.clock() < NextParticle then
            return
        end
        Saved.ParticlesApplied = true
        NextParticle = os.clock() + 3
        local checked = 0
        for _, inst in ipairs(Workspace:GetDescendants()) do
            checked += 1
            if checked > 4000 then
                break
            end
            if FXFolder and inst:IsDescendantOf(FXFolder) then
                continue
            end
            if inst:IsA("ParticleEmitter") or inst:IsA("Beam") or inst:IsA("Trail") or inst:IsA("Fire") or inst:IsA("Smoke") or inst:IsA("Sparkles") then
                if ParticleState[inst] == nil then
                    ParticleState[inst] = inst.Enabled
                end
                inst.Enabled = false
            end
        end
    elseif Saved.ParticlesApplied then
        Saved.ParticlesApplied = false
        for inst, enabled in pairs(ParticleState) do
            if inst.Parent then
                pcall(function()
                    inst.Enabled = enabled
                end)
            end
        end
        table.clear(ParticleState)
    end
end

local ShotMarks = {}
local WatchedShots = {}
local NextShotMark = 0
local NextLightning = 0
local HookedTools = {}

local function MakeEmitter(parent, name, props)
    local emitter = Instance.new("ParticleEmitter")
    emitter.Name = name
    emitter.Enabled = false
    emitter.LightInfluence = 0.4
    emitter.LockedToPart = false
    emitter.Parent = parent
    for key, value in pairs(props) do
        emitter[key] = value
    end
    return emitter
end

FXFolder = Instance.new("Folder")
FXFolder.Name = "MH_FX"
FXFolder.Parent = Workspace

local SkyHost = Instance.new("Part")
SkyHost.Name = "MH_Sky"
SkyHost.Anchored = true
SkyHost.CanCollide = false
SkyHost.CanQuery = false
SkyHost.CanTouch = false
SkyHost.Transparency = 1
SkyHost.Size = Vector3.new(160, 1, 160)
SkyHost.Parent = FXFolder

local SnowEmitter = MakeEmitter(SkyHost, "Snow", {
    Texture = "rbxasset://textures/particles/sparkles_main.dds",
    Color = ColorSequence.new(Color3.fromRGB(245, 248, 255)),
    LightEmission = 0.15,
    Size = NumberSequence.new(0.25),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.15),
        NumberSequenceKeypoint.new(1, 1),
    }),
    Lifetime = NumberRange.new(3.5, 6),
    Speed = NumberRange.new(6, 14),
    Acceleration = Vector3.new(0, -10, 0),
    SpreadAngle = Vector2.new(18, 18),
    Rotation = NumberRange.new(0, 360),
    RotSpeed = NumberRange.new(-40, 40),
    EmissionDirection = Enum.NormalId.Bottom,
    Rate = 0,
    Drag = 0.4,
})

local RainEmitter = MakeEmitter(SkyHost, "Rain", {
    Texture = "rbxasset://textures/particles/smoke_main.dds",
    Color = ColorSequence.new(Color3.fromRGB(180, 200, 220)),
    LightEmission = 0.35,
    Orientation = Enum.ParticleOrientation.VelocityParallel,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.15),
        NumberSequenceKeypoint.new(1, 0.05),
    }),
    Transparency = NumberSequence.new(0.25),
    Lifetime = NumberRange.new(0.45, 0.7),
    Speed = NumberRange.new(70, 100),
    Acceleration = Vector3.new(0, -50, 0),
    SpreadAngle = Vector2.new(2, 2),
    EmissionDirection = Enum.NormalId.Bottom,
    Rate = 0,
    Drag = 0,
})

local AshEmitter = MakeEmitter(SkyHost, "Ash", {
    Texture = "rbxasset://textures/particles/smoke_main.dds",
    Color = ColorSequence.new(Color3.fromRGB(255, 120, 40), Color3.fromRGB(40, 40, 40)),
    LightEmission = 0.6,
    Size = NumberSequence.new(0.35),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1),
    }),
    Lifetime = NumberRange.new(2.5, 4.5),
    Speed = NumberRange.new(3, 8),
    Acceleration = Vector3.new(0, -4, 0),
    SpreadAngle = Vector2.new(30, 30),
    EmissionDirection = Enum.NormalId.Bottom,
    Rate = 0,
    Drag = 1,
})

local DustEmitter = MakeEmitter(SkyHost, "Dust", {
    Texture = "rbxasset://textures/particles/smoke_main.dds",
    Color = ColorSequence.new(Color3.fromRGB(190, 170, 140)),
    LightEmission = 0,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(1, 1.8),
    }),
    Transparency = NumberSequence.new(0.55),
    Lifetime = NumberRange.new(2, 4),
    Speed = NumberRange.new(1, 5),
    Acceleration = Vector3.new(0, 1, 0),
    SpreadAngle = Vector2.new(40, 40),
    EmissionDirection = Enum.NormalId.Bottom,
    Rate = 0,
    Drag = 2,
})

local function ApplyWind(emitter, fall)
    emitter.Acceleration = Vector3.new(Config.Wind, fall, 0)
end

local function SpawnShot(fromPos, toPos, life)
    local offset = toPos - fromPos
    local distance = offset.Magnitude
    if distance < 0.4 then
        return
    end
    if #ShotMarks > 48 then
        local old = table.remove(ShotMarks, 1)
        if old.Part then
            old.Part:Destroy()
        end
    end
    local part = Instance.new("Part")
    part.Name = "MH_Shot"
    part.Anchored = true
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Material = Enum.Material.Neon
    part.Color = Config.TracerColor
    part.Size = Vector3.new(Config.TracerWidth, Config.TracerWidth, distance)
    part.CFrame = CFrame.lookAt(fromPos, toPos) * CFrame.new(0, 0, -distance / 2)
    part.Parent = FXFolder
    table.insert(ShotMarks, { Part = part, Born = os.clock(), Life = life or Config.TracerLife })
end

local function SpawnImpact(position, normal)
    local part = Instance.new("Part")
    part.Name = "MH_Impact"
    part.Anchored = true
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Transparency = 1
    part.Size = Vector3.new(0.2, 0.2, 0.2)
    part.CFrame = CFrame.new(position, position + (normal.Magnitude > 0 and normal or Vector3.yAxis))
    part.Parent = FXFolder
    local spark = Instance.new("ParticleEmitter")
    spark.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    spark.Color = ColorSequence.new(Config.TracerColor)
    spark.LightEmission = 1
    spark.Size = NumberSequence.new(0.2)
    spark.Lifetime = NumberRange.new(0.15, 0.35)
    spark.Speed = NumberRange.new(6, 14)
    spark.SpreadAngle = Vector2.new(35, 35)
    spark.Rate = 0
    spark.Parent = part
    spark:Emit(14)
    task.delay(0.4, function()
        if part.Parent then
            part:Destroy()
        end
    end)
end

local function MuzzlePosition(fallback)
    local camera = GetCamera()
    local lists = {}
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool then
        table.insert(lists, tool)
    end
    if camera then
        for _, child in ipairs(camera:GetChildren()) do
            if child:IsA("Model") then
                table.insert(lists, child)
            end
        end
    end
    for _, root in ipairs(lists) do
        for _, desc in ipairs(root:GetDescendants()) do
            if desc:IsA("BasePart") or desc:IsA("Attachment") then
                local name = string.lower(desc.Name)
                if string.find(name, "muzzle", 1, true) or string.find(name, "barrel", 1, true) or name == "flash" then
                    return desc:IsA("Attachment") and desc.WorldPosition or desc.Position
                end
            end
        end
    end
    return fallback
end

local function CastTracer()
    if os.clock() < NextShotMark then
        return
    end
    NextShotMark = os.clock() + 0.02
    local camera = GetCamera()
    if not camera then
        return
    end
    local origin = camera.CFrame.Position
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    local filter = { LocalPlayer.Character, FXFolder }
    for _, child in ipairs(camera:GetChildren()) do
        table.insert(filter, child)
    end
    params.FilterDescendantsInstances = filter
    local result = Workspace:Raycast(origin, camera.CFrame.LookVector * Config.TracerRange, params)
    local hit = result and result.Position or (origin + camera.CFrame.LookVector * math.min(Config.TracerRange, 300))
    SpawnShot(MuzzlePosition(origin), hit, Config.TracerLife)
    if Config.Impact and result then
        SpawnImpact(result.Position, result.Normal)
    end
end

local function WatchTool(tool)
    if not tool:IsA("Tool") or HookedTools[tool] then
        return
    end
    HookedTools[tool] = true
    Bind(tool.Activated, function()
        LastShotAt = os.clock()
        PlayShootSound()
        if Config.BulletTracers then
            CastTracer()
        end
    end)
end

local function WatchCharacter(character)
    if not character then
        return
    end
    Bind(character.ChildAdded, function(child)
        WatchTool(child)
    end)
    for _, child in ipairs(character:GetChildren()) do
        WatchTool(child)
    end
end

function UpdateWeather()
    local now = os.clock()
    for index = #ShotMarks, 1, -1 do
        local mark = ShotMarks[index]
        local age = now - mark.Born
        if not mark.Part.Parent or age >= mark.Life then
            if mark.Part.Parent then
                mark.Part:Destroy()
            end
            table.remove(ShotMarks, index)
        else
            mark.Part.Transparency = math.clamp(age / mark.Life, 0, 1)
            mark.Part.Color = Config.TracerColor
        end
    end

    for index = #WatchedShots, 1, -1 do
        local item = WatchedShots[index]
        local part = item.Part
        if not Config.TrackShots or not part.Parent or now > item.Until then
            table.remove(WatchedShots, index)
        else
            local position = part.Position
            if (position - item.Last).Magnitude > 6 then
                SpawnShot(item.Last, position, 0.12)
                item.Last = position
            end
        end
    end

    local anyone = Config.Snow or Config.Rain or Config.Ash or Config.Dust
    SnowEmitter.Enabled = Config.Snow
    RainEmitter.Enabled = Config.Rain
    AshEmitter.Enabled = Config.Ash
    DustEmitter.Enabled = Config.Dust
    if Config.Snow then
        SnowEmitter.Rate = Config.SnowRate
        SnowEmitter.Size = NumberSequence.new(Config.SnowSize)
        ApplyWind(SnowEmitter, -10)
    end
    if Config.Rain then
        RainEmitter.Rate = Config.RainRate
        ApplyWind(RainEmitter, -50)
    end
    if Config.Ash then
        AshEmitter.Rate = 36
        ApplyWind(AshEmitter, -4)
    end
    if Config.Dust then
        DustEmitter.Rate = 18
        ApplyWind(DustEmitter, 1)
    end
    if anyone then
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local camera = GetCamera()
        local base = root and root.Position or (camera and camera.CFrame.Position) or Vector3.zero
        SkyHost.CFrame = CFrame.new(base + Vector3.new(0, 42, 0))
    end

    if Config.Lightning then
        if now > NextLightning then
            NextLightning = now + math.random(5, 11)
            Saved.FlashFrom = Lighting.ExposureCompensation
            Saved.FlashUntil = now + 0.08
            Lighting.ExposureCompensation = (Saved.FlashFrom or 0) + 1.6
        elseif Saved.FlashUntil and now > Saved.FlashUntil then
            Lighting.ExposureCompensation = Saved.FlashFrom or Saved.Exposure
            Saved.FlashUntil = nil
        end
    elseif Saved.FlashUntil then
        Lighting.ExposureCompensation = Saved.FlashFrom or Saved.Exposure
        Saved.FlashUntil = nil
    end
end

function ClearWeather()
    for _, mark in ipairs(ShotMarks) do
        if mark.Part then
            mark.Part:Destroy()
        end
    end
    table.clear(ShotMarks)
    table.clear(WatchedShots)
    if FXFolder then
        FXFolder:Destroy()
        FXFolder = nil
    end
end

Bind(UserInputService.InputBegan, function(input, gameProcessed)
    if gameProcessed or input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not tool then
        return
    end
    LastShotAt = os.clock()
    PlayShootSound()
    if Config.BulletTracers then
        CastTracer()
    end
end)

Bind(Workspace.DescendantAdded, function(inst)
    if not Config.TrackShots or not inst:IsA("BasePart") then
        return
    end
    if inst.Name == "MH_Shot" or inst.Name == "MH_Impact" or inst.Name == "MH_Sky" then
        return
    end
    if FXFolder and inst:IsDescendantOf(FXFolder) then
        return
    end
    local name = string.lower(inst.Name)
    if not (string.find(name, "bullet", 1, true) or string.find(name, "proj", 1, true) or string.find(name, "rocket", 1, true) or string.find(name, "shell", 1, true)) then
        return
    end
    if inst.Size.Magnitude > 8 then
        return
    end
    table.insert(WatchedShots, { Part = inst, Last = inst.Position, Until = os.clock() + 2 })
end)

if LocalPlayer.Character then
    WatchCharacter(LocalPlayer.Character)
end
Bind(LocalPlayer.CharacterAdded, WatchCharacter)

local function HoldEffect(flag, effect, apply)
    if Config[flag] then
        effect.Enabled = true
        apply()
        Saved[flag] = true
    elseif Saved[flag] then
        effect.Enabled = false
        Saved[flag] = false
    end
end

function UpdateScene()
    HoldEffect("Grade", GradeFX, function()
        GradeFX.Saturation = Config.Saturation
        GradeFX.Contrast = Config.Contrast
        GradeFX.Brightness = Config.GradeBright
        GradeFX.TintColor = Config.Tint
    end)
    HoldEffect("Bloom", BloomFX, function()
        BloomFX.Intensity = Config.BloomIntensity
        BloomFX.Size = Config.BloomSize
        BloomFX.Threshold = Config.BloomThreshold
    end)
    HoldEffect("SunRays", SunFX, function()
        SunFX.Intensity = Config.SunIntensity
        SunFX.Spread = Config.SunSpread
    end)
    HoldEffect("DOF", DOFFX, function()
        DOFFX.FocusDistance = Config.FocusDistance
        DOFFX.InFocusRadius = Config.FocusRadius
        DOFFX.FarIntensity = 0.45
        DOFFX.NearIntensity = 0.15
    end)
    HoldEffect("BlurOn", BlurFX, function()
        BlurFX.Size = Config.BlurSize
    end)

    if Config.AtmosphereOn then
        local atmosphere = GetAtmosphere()
        atmosphere.Density = Config.AtmoDensity
        atmosphere.Haze = Config.AtmoHaze
        atmosphere.Color = Config.AtmoColor
        atmosphere.Decay = Config.AtmoDecay
        Saved.AtmosphereOn = true
    elseif Saved.AtmosphereOn and Saved.Atmo then
        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if atmosphere then
            atmosphere.Density = Saved.Atmo.Density
            atmosphere.Offset = Saved.Atmo.Offset
            atmosphere.Color = Saved.Atmo.Color
            atmosphere.Decay = Saved.Atmo.Decay
            atmosphere.Glare = Saved.Atmo.Glare
            atmosphere.Haze = Saved.Atmo.Haze
        end
        Saved.AtmosphereOn = false
    end

    if Config.CustomFog and not Config.NoFog then
        Lighting.FogColor = Config.FogColor
        Lighting.FogStart = Config.FogNear
        Lighting.FogEnd = Config.FogDistance
        Saved.CustomFog = true
    elseif Saved.CustomFog and not Config.NoFog then
        Lighting.FogColor = Saved.FogColor
        Lighting.FogStart = Saved.FogStart
        Lighting.FogEnd = Saved.FogEnd
        Saved.CustomFog = false
    end

    if Config.SoftShadows then
        Lighting.ShadowSoftness = Config.ShadowSoft
        Lighting.EnvironmentDiffuseScale = Config.Diffuse
        Lighting.EnvironmentSpecularScale = Config.Specular
        Saved.SoftShadows = true
    elseif Saved.SoftShadows then
        Lighting.ShadowSoftness = Saved.ShadowSoftness
        Lighting.EnvironmentDiffuseScale = Saved.Diffuse
        Lighting.EnvironmentSpecularScale = Saved.Specular
        Saved.SoftShadows = false
    end

    if Config.WaterOn and Saved.Water then
        Terrain.WaterColor = Config.WaterColor
        Terrain.WaterTransparency = Config.WaterAlpha
        Saved.WaterOn = true
    elseif Saved.WaterOn and Saved.Water then
        Terrain.WaterColor = Saved.Water.Color
        Terrain.WaterTransparency = Saved.Water.Alpha
        Saved.WaterOn = false
    end

    UpdateViewmodel()
    UpdateXray()
    UpdateParticles()
    UpdateWeather()
    UpdateSky()
end

local function ApplyLook(name)
    if name == "Clean" then
        GradeFX.Enabled = true
        GradeFX.Saturation = 0.12
        GradeFX.Contrast = 0.05
        GradeFX.Brightness = 0.02
        GradeFX.TintColor = Color3.fromRGB(255, 255, 255)
        BloomFX.Enabled = true
        BloomFX.Intensity = 0.22
        BloomFX.Size = 18
        BloomFX.Threshold = 0.95
        SunFX.Enabled = false
        DOFFX.Enabled = false
        BlurFX.Enabled = false
        Lighting.FogColor = Color3.fromRGB(214, 222, 230)
        Lighting.FogStart = 0
        Lighting.FogEnd = 2400
    elseif name == "Night" then
        Lighting.ClockTime = 0
        Lighting.Brightness = 1.15
        Lighting.Ambient = Color3.fromRGB(40, 52, 96)
        Lighting.OutdoorAmbient = Color3.fromRGB(28, 34, 72)
        GradeFX.Enabled = true
        GradeFX.Saturation = -0.04
        GradeFX.Contrast = 0.14
        GradeFX.Brightness = -0.02
        GradeFX.TintColor = Color3.fromRGB(176, 194, 255)
        BloomFX.Enabled = true
        BloomFX.Intensity = 0.5
        BloomFX.Size = 28
        BloomFX.Threshold = 0.72
        SunFX.Enabled = false
    elseif name == "Sunset" then
        Lighting.ClockTime = 17.4
        Lighting.Brightness = 2.1
        Lighting.Ambient = Color3.fromRGB(186, 124, 86)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 154, 96)
        GradeFX.Enabled = true
        GradeFX.Saturation = 0.32
        GradeFX.Contrast = 0.1
        GradeFX.TintColor = Color3.fromRGB(255, 196, 156)
        BloomFX.Enabled = true
        BloomFX.Intensity = 0.4
        BloomFX.Size = 26
        BloomFX.Threshold = 0.8
        SunFX.Enabled = true
        SunFX.Intensity = 0.16
        SunFX.Spread = 0.75
    elseif name == "Arctic" then
        Lighting.ClockTime = 10
        Lighting.Ambient = Color3.fromRGB(206, 216, 224)
        Lighting.OutdoorAmbient = Color3.fromRGB(226, 234, 238)
        Lighting.FogColor = Color3.fromRGB(232, 238, 242)
        Lighting.FogStart = 12
        Lighting.FogEnd = 380
        GradeFX.Enabled = true
        GradeFX.Saturation = -0.22
        GradeFX.Contrast = 0.05
        GradeFX.TintColor = Color3.fromRGB(214, 228, 236)
        local atmosphere = GetAtmosphere()
        atmosphere.Density = 0.32
        atmosphere.Haze = 2
        atmosphere.Color = Color3.fromRGB(226, 234, 238)
        atmosphere.Decay = Color3.fromRGB(186, 198, 206)
    elseif name == "Neon" then
        GradeFX.Enabled = true
        GradeFX.Saturation = 0.65
        GradeFX.Contrast = 0.26
        GradeFX.Brightness = 0.03
        GradeFX.TintColor = Color3.fromRGB(255, 186, 255)
        BloomFX.Enabled = true
        BloomFX.Intensity = 0.75
        BloomFX.Size = 34
        BloomFX.Threshold = 0.55
        SunFX.Enabled = false
        DOFFX.Enabled = false
    end
end

local function RestoreScene()
    GradeFX.Enabled = false
    BloomFX.Enabled = false
    SunFX.Enabled = false
    DOFFX.Enabled = false
    BlurFX.Enabled = false
    Config.Grade = false
    Config.Bloom = false
    Config.SunRays = false
    Config.DOF = false
    Config.BlurOn = false
    Config.AtmosphereOn = false
    Config.CustomFog = false
    Config.SoftShadows = false
    Config.WaterOn = false
    Config.Xray = false
    Config.NoParticles = false
    Config.HideViewmodel = false
    if Saved.Atmo then
        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if atmosphere then
            atmosphere.Density = Saved.Atmo.Density
            atmosphere.Offset = Saved.Atmo.Offset
            atmosphere.Color = Saved.Atmo.Color
            atmosphere.Decay = Saved.Atmo.Decay
            atmosphere.Glare = Saved.Atmo.Glare
            atmosphere.Haze = Saved.Atmo.Haze
        end
    end
    Saved.AtmosphereOn = false
    Saved.CustomFog = false
    Saved.SoftShadows = false
    Saved.WaterOn = false
    if Saved.Water then
        pcall(function()
            Terrain.WaterColor = Saved.Water.Color
            Terrain.WaterTransparency = Saved.Water.Alpha
        end)
    end
    Config.Xray = false
    UpdateXray()
    Config.NoParticles = false
    UpdateParticles()
    Config.HideViewmodel = false
    UpdateViewmodel()
end

local SkyFaces = { "SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp" }

local Skyboxes = {
    Minecraft = { SkyboxBk = "rbxassetid://1876545003", SkyboxDn = "rbxassetid://1876544331", SkyboxFt = "rbxassetid://1876542941", SkyboxLf = "rbxassetid://1876543392", SkyboxRt = "rbxassetid://1876543764", SkyboxUp = "rbxassetid://1876544642" },
    PurpleDay = { SkyboxBk = "rbxassetid://296908715", SkyboxDn = "rbxassetid://296908724", SkyboxFt = "rbxassetid://296908740", SkyboxLf = "rbxassetid://296908755", SkyboxRt = "rbxassetid://296908764", SkyboxUp = "rbxassetid://296908769" },
    RedNight = { SkyboxBk = "rbxassetid://401664839", SkyboxDn = "rbxassetid://401664862", SkyboxFt = "rbxassetid://401664960", SkyboxLf = "rbxassetid://401664881", SkyboxRt = "rbxassetid://401664901", SkyboxUp = "rbxassetid://401664936" },
    Trollge = { SkyboxBk = "rbxassetid://6155393905", SkyboxDn = "rbxassetid://6155393905", SkyboxFt = "rbxassetid://6155393905", SkyboxLf = "rbxassetid://6155393905", SkyboxRt = "rbxassetid://6155393905", SkyboxUp = "rbxassetid://6155393905" },
    Night = { SkyboxBk = "rbxassetid://48020371", SkyboxDn = "rbxassetid://48020144", SkyboxFt = "rbxassetid://48020234", SkyboxLf = "rbxassetid://48020211", SkyboxRt = "rbxassetid://48020254", SkyboxUp = "rbxassetid://48020383" },
    Space = { SkyboxBk = "rbxassetid://149397692", SkyboxDn = "rbxassetid://149397686", SkyboxFt = "rbxassetid://149397697", SkyboxLf = "rbxassetid://149397684", SkyboxRt = "rbxassetid://149397688", SkyboxUp = "rbxassetid://149397702" },
    Default = { SkyboxBk = "rbxassetid://6444884337", SkyboxDn = "rbxassetid://6444884785", SkyboxFt = "rbxassetid://6444884337", SkyboxLf = "rbxassetid://6444884337", SkyboxRt = "rbxassetid://6444884337", SkyboxUp = "rbxassetid://6412503613" },
    VibeMorning = { SkyboxBk = "rbxassetid://1417494030", SkyboxDn = "rbxassetid://1417494146", SkyboxFt = "rbxassetid://1417494253", SkyboxLf = "rbxassetid://1417494402", SkyboxRt = "rbxassetid://1417494499", SkyboxUp = "rbxassetid://1417494643" },
    VibeNight = { SkyboxBk = "rbxassetid://5084575798", SkyboxDn = "rbxassetid://5084575916", SkyboxFt = "rbxassetid://5103949679", SkyboxLf = "rbxassetid://5103948542", SkyboxRt = "rbxassetid://5103948784", SkyboxUp = "rbxassetid://5084576400" },
    PurpleSplash = { SkyboxBk = "rbxassetid://8539982183", SkyboxDn = "rbxassetid://8539981943", SkyboxFt = "rbxassetid://8539981721", SkyboxLf = "rbxassetid://8539981424", SkyboxRt = "rbxassetid://8539980766", SkyboxUp = "rbxassetid://8539981085" },
    GreenSpace = { SkyboxBk = "rbxassetid://159248188", SkyboxDn = "rbxassetid://159248183", SkyboxFt = "rbxassetid://159248187", SkyboxLf = "rbxassetid://159248173", SkyboxRt = "rbxassetid://159248192", SkyboxUp = "rbxassetid://159248176" },
    Snowy = { SkyboxBk = "rbxassetid://155657655", SkyboxDn = "rbxassetid://155674246", SkyboxFt = "rbxassetid://155657609", SkyboxLf = "rbxassetid://155657671", SkyboxRt = "rbxassetid://155657619", SkyboxUp = "rbxassetid://155674931" },
    Spongebob = { SkyboxBk = "rbxassetid://10287764626", SkyboxDn = "rbxassetid://10287766382", SkyboxFt = "rbxassetid://10287764626", SkyboxLf = "rbxassetid://10287763421", SkyboxRt = "rbxassetid://10287764626", SkyboxUp = "rbxassetid://10287767597" },
    PinkDay = { SkyboxBk = "rbxassetid://271042516", SkyboxDn = "rbxassetid://271077243", SkyboxFt = "rbxassetid://271042556", SkyboxLf = "rbxassetid://271042310", SkyboxRt = "rbxassetid://271042467", SkyboxUp = "rbxassetid://271077958" },
    AlienRed = { SkyboxBk = "rbxassetid://1012890", SkyboxDn = "rbxassetid://1012891", SkyboxFt = "rbxassetid://1012887", SkyboxLf = "rbxassetid://1012889", SkyboxRt = "rbxassetid://1012888", SkyboxUp = "rbxassetid://1014449" },
    WallsOfAutumn = { SkyboxBk = "rbxassetid://7123244709", SkyboxDn = "rbxassetid://7123246497", SkyboxFt = "rbxassetid://7123255895", SkyboxLf = "rbxassetid://7123257992", SkyboxRt = "rbxassetid://7123279103", SkyboxUp = "rbxassetid://7123281828" },
    ColdWinterness = { SkyboxBk = "rbxassetid://7123754562", SkyboxDn = "rbxassetid://7123756028", SkyboxFt = "rbxassetid://7123757422", SkyboxLf = "rbxassetid://7123758897", SkyboxRt = "rbxassetid://7123760563", SkyboxUp = "rbxassetid://7123762364" },
    Oblivion = { SkyboxBk = "rbxassetid://7123654189", SkyboxDn = "rbxassetid://7123657455", SkyboxFt = "rbxassetid://7123662047", SkyboxLf = "rbxassetid://7123664533", SkyboxRt = "rbxassetid://7123666598", SkyboxUp = "rbxassetid://7123668994" },
    ClassicSky = { SkyboxBk = "rbxassetid://672345740", SkyboxDn = "rbxassetid://672345828", SkyboxFt = "rbxassetid://672345879", SkyboxLf = "rbxassetid://672345927", SkyboxRt = "rbxassetid://672346006", SkyboxUp = "rbxassetid://672346072" },
    PurpleNight = { SkyboxBk = "rbxassetid://5084575798", SkyboxDn = "rbxassetid://5084575916", SkyboxFt = "rbxassetid://5103949679", SkyboxLf = "rbxassetid://5103948542", SkyboxRt = "rbxassetid://5103948784", SkyboxUp = "rbxassetid://5084576400" },
    PurpleDayClear = { SkyboxBk = "rbxassetid://6847607535", SkyboxDn = "rbxassetid://6847607977", SkyboxFt = "rbxassetid://6847608302", SkyboxLf = "rbxassetid://6847608608", SkyboxRt = "rbxassetid://6847608986", SkyboxUp = "rbxassetid://6847609323" },
    YellowDay = { SkyboxBk = "rbxassetid://2651432901", SkyboxDn = "rbxassetid://2651434974", SkyboxFt = "rbxassetid://2651435990", SkyboxLf = "rbxassetid://2651436494", SkyboxRt = "rbxassetid://2651436979", SkyboxUp = "rbxassetid://2651437350" },
    MinecraftSky = { SkyboxBk = "rbxassetid://8735166756", SkyboxDn = "rbxassetid://8735166707", SkyboxFt = "rbxassetid://8735231668", SkyboxLf = "rbxassetid://8735166755", SkyboxRt = "rbxassetid://8735166751", SkyboxUp = "rbxassetid://8735166729" },
    Sunset = { SkyboxBk = "rbxassetid://150939022", SkyboxDn = "rbxassetid://150939038", SkyboxFt = "rbxassetid://150939047", SkyboxLf = "rbxassetid://150939056", SkyboxRt = "rbxassetid://150939063", SkyboxUp = "rbxassetid://150939082" },
    CartoonSky = { SkyboxBk = "rbxassetid://6778646360", SkyboxDn = "rbxassetid://6778658683", SkyboxFt = "rbxassetid://6778648039", SkyboxLf = "rbxassetid://6778649136", SkyboxRt = "rbxassetid://6778650519", SkyboxUp = "rbxassetid://6778658364" },
    Anime = { SkyboxBk = "rbxassetid://7643700666", SkyboxDn = "rbxassetid://7643743687", SkyboxFt = "rbxassetid://7644304186", SkyboxLf = "rbxassetid://7644288724", SkyboxRt = "rbxassetid://7643700819", SkyboxUp = "rbxassetid://7643757404" },
    HellSky = { SkyboxBk = "rbxassetid://437430787", SkyboxDn = "rbxassetid://437430804", SkyboxFt = "rbxassetid://437430543", SkyboxLf = "rbxassetid://437430732", SkyboxRt = "rbxassetid://437430747", SkyboxUp = "rbxassetid://437430771" },
    StarryNight = { SkyboxBk = "rbxassetid://8291078911", SkyboxDn = "rbxassetid://8291077403", SkyboxFt = "rbxassetid://8291081613", SkyboxLf = "rbxassetid://8291074004", SkyboxRt = "rbxassetid://8291080353", SkyboxUp = "rbxassetid://8291075054" },
    Omori = { SkyboxBk = "rbxassetid://8767416629", SkyboxDn = "rbxassetid://8767416629", SkyboxFt = "rbxassetid://8767416629", SkyboxLf = "rbxassetid://8767416629", SkyboxRt = "rbxassetid://8767416629", SkyboxUp = "rbxassetid://8767416629" },
    c00lkidd = { SkyboxBk = "rbxassetid://433381097", SkyboxDn = "rbxassetid://433381097", SkyboxFt = "rbxassetid://433381097", SkyboxLf = "rbxassetid://433381097", SkyboxRt = "rbxassetid://433381097", SkyboxUp = "rbxassetid://433381097" },
    ClearDay = { SkyboxBk = "rbxassetid://591058823", SkyboxDn = "rbxassetid://591059876", SkyboxFt = "rbxassetid://591058104", SkyboxLf = "rbxassetid://591057861", SkyboxRt = "rbxassetid://591057625", SkyboxUp = "rbxassetid://591059642" },
    Mountains = { SkyboxBk = "rbxassetid://324014980", SkyboxDn = "rbxassetid://324015477", SkyboxFt = "rbxassetid://324014995", SkyboxLf = "rbxassetid://324014679", SkyboxRt = "rbxassetid://324015013", SkyboxUp = "rbxassetid://324015409" },
    Forest = { SkyboxBk = "rbxassetid://70945545", SkyboxDn = "rbxassetid://70945449", SkyboxFt = "rbxassetid://70945487", SkyboxLf = "rbxassetid://70945523", SkyboxRt = "rbxassetid://70945508", SkyboxUp = "rbxassetid://70945531" },
    LargeForest = { SkyboxBk = "rbxassetid://17428978603", SkyboxDn = "rbxassetid://17428977445", SkyboxFt = "rbxassetid://17428977114", SkyboxLf = "rbxassetid://17428978399", SkyboxRt = "rbxassetid://17428976828", SkyboxUp = "rbxassetid://17428976669" },
    Crimson = { SkyboxBk = "rbxassetid://15832429892", SkyboxDn = "rbxassetid://15832430998", SkyboxFt = "rbxassetid://15832430210", SkyboxLf = "rbxassetid://15832430671", SkyboxRt = "rbxassetid://15832431198", SkyboxUp = "rbxassetid://15832429401" },
    PumpkinHill = { SkyboxBk = "rbxassetid://11202510597", SkyboxDn = "rbxassetid://11202510255", SkyboxFt = "rbxassetid://11202509993", SkyboxLf = "rbxassetid://11202510806", SkyboxRt = "rbxassetid://11202511066", SkyboxUp = "rbxassetid://11202509704" },
    AnimeIsland = { SkyboxBk = "rbxassetid://14753804949", SkyboxDn = "rbxassetid://14753795573", SkyboxFt = "rbxassetid://14753807625", SkyboxLf = "rbxassetid://14753797417", SkyboxRt = "rbxassetid://14753799966", SkyboxUp = "rbxassetid://14753810287" },
    SnowyMountains = { SkyboxBk = "rbxassetid://368385273", SkyboxDn = "rbxassetid://48015300", SkyboxFt = "rbxassetid://368388290", SkyboxLf = "rbxassetid://368390615", SkyboxRt = "rbxassetid://368385190", SkyboxUp = "rbxassetid://48015387" },
    Desert = { SkyboxBk = "rbxassetid://161319957", SkyboxDn = "rbxassetid://161319965", SkyboxFt = "rbxassetid://161319970", SkyboxLf = "rbxassetid://161319983", SkyboxRt = "rbxassetid://161319989", SkyboxUp = "rbxassetid://161319996" },
    Cloudy = { SkyboxBk = "rbxassetid://225469345", SkyboxDn = "rbxassetid://225469349", SkyboxFt = "rbxassetid://225469359", SkyboxLf = "rbxassetid://225469364", SkyboxRt = "rbxassetid://225469372", SkyboxUp = "rbxassetid://225469380" },
    Island = { SkyboxBk = "rbxassetid://319343577", SkyboxDn = "rbxassetid://319343653", SkyboxFt = "rbxassetid://319343666", SkyboxLf = "rbxassetid://319343686", SkyboxRt = "rbxassetid://319343631", SkyboxUp = "rbxassetid://319343614" },
    OrangeFog = { SkyboxBk = "rbxassetid://458016711", SkyboxDn = "rbxassetid://458016826", SkyboxFt = "rbxassetid://458016532", SkyboxLf = "rbxassetid://458016655", SkyboxRt = "rbxassetid://458016782", SkyboxUp = "rbxassetid://458016792" },
    FadeNight = { SkyboxBk = "rbxassetid://16888843486", SkyboxDn = "rbxassetid://16888845693", SkyboxFt = "rbxassetid://16888848245", SkyboxLf = "rbxassetid://16888850949", SkyboxRt = "rbxassetid://16888854243", SkyboxUp = "rbxassetid://16888857144" },
    Office = { SkyboxBk = "rbxassetid://658623433", SkyboxDn = "rbxassetid://316342560", SkyboxFt = "rbxassetid://658625205", SkyboxLf = "rbxassetid://658627155", SkyboxRt = "rbxassetid://658628504", SkyboxUp = "rbxassetid://658632701" },
    Spongebob2 = { SkyboxBk = "rbxassetid://12049872454", SkyboxDn = "rbxassetid://12049872284", SkyboxFt = "rbxassetid://12049872181", SkyboxLf = "rbxassetid://12049872074", SkyboxRt = "rbxassetid://12049871884", SkyboxUp = "rbxassetid://12049871774" },
    PurpleFog = { SkyboxBk = "rbxassetid://17279854976", SkyboxDn = "rbxassetid://17279856318", SkyboxFt = "rbxassetid://17279858447", SkyboxLf = "rbxassetid://17279860360", SkyboxRt = "rbxassetid://17279862234", SkyboxUp = "rbxassetid://17279864507" },
    EarthSpace = { SkyboxBk = "rbxassetid://15753305495", SkyboxDn = "rbxassetid://15753362674", SkyboxFt = "rbxassetid://15753305823", SkyboxLf = "rbxassetid://15753310707", SkyboxRt = "rbxassetid://15753304774", SkyboxUp = "rbxassetid://15753304473" },
    GreenCloudy = { SkyboxBk = "rbxassetid://921882045", SkyboxDn = "rbxassetid://921881907", SkyboxFt = "rbxassetid://921882121", SkyboxLf = "rbxassetid://921881811", SkyboxRt = "rbxassetid://921881989", SkyboxUp = "rbxassetid://921882259" },
    SummerDay = { SkyboxBk = "rbxassetid://135483466", SkyboxDn = "rbxassetid://135483484", SkyboxFt = "rbxassetid://135483461", SkyboxLf = "rbxassetid://135483495", SkyboxRt = "rbxassetid://135483499", SkyboxUp = "rbxassetid://135483475" },
    SnowyPlains = { SkyboxBk = "rbxassetid://155657655", SkyboxDn = "rbxassetid://155674246", SkyboxFt = "rbxassetid://155657609", SkyboxLf = "rbxassetid://155657671", SkyboxRt = "rbxassetid://155657619", SkyboxUp = "rbxassetid://155674931" },
    Underwater = { SkyboxBk = "rbxassetid://227635868", SkyboxDn = "rbxassetid://227635921", SkyboxFt = "rbxassetid://227635954", SkyboxLf = "rbxassetid://227635974", SkyboxRt = "rbxassetid://227635990", SkyboxUp = "rbxassetid://227636031" },
    BlueAbyss = { SkyboxBk = "rbxassetid://16269815885", SkyboxDn = "rbxassetid://16269839652", SkyboxFt = "rbxassetid://16269798011", SkyboxLf = "rbxassetid://16269813852", SkyboxRt = "rbxassetid://16269814948", SkyboxUp = "rbxassetid://16269829700" },
    Poison = { SkyboxBk = "rbxassetid://1370716695", SkyboxDn = "rbxassetid://1370716766", SkyboxFt = "rbxassetid://1370716833", SkyboxLf = "rbxassetid://1370716898", SkyboxRt = "rbxassetid://1370716955", SkyboxUp = "rbxassetid://1370717024" },
    BlueSpace = { SkyboxBk = "rbxassetid://1127563035", SkyboxDn = "rbxassetid://1127563006", SkyboxFt = "rbxassetid://1127563026", SkyboxLf = "rbxassetid://1127563216", SkyboxRt = "rbxassetid://1127563115", SkyboxUp = "rbxassetid://1127562999" },
    AnimeMountains = { SkyboxBk = "rbxassetid://12849370744", SkyboxDn = "rbxassetid://12849378890", SkyboxFt = "rbxassetid://12849390276", SkyboxLf = "rbxassetid://12849405549", SkyboxRt = "rbxassetid://12849398428", SkyboxUp = "rbxassetid://12849426002" },
    PinkGradient = { SkyboxBk = "rbxassetid://5371541816", SkyboxDn = "rbxassetid://5371541154", SkyboxFt = "rbxassetid://5371541816", SkyboxLf = "rbxassetid://5371541816", SkyboxRt = "rbxassetid://5371541816", SkyboxUp = "rbxassetid://5371540604" },
    YellowGradient = { SkyboxBk = "rbxassetid://159005370", SkyboxDn = "rbxassetid://858422412", SkyboxFt = "rbxassetid://159005370", SkyboxLf = "rbxassetid://159005370", SkyboxRt = "rbxassetid://159005370", SkyboxUp = "rbxassetid://159006363" },
    BlueGradient = { SkyboxBk = "rbxassetid://4628466090", SkyboxDn = "rbxassetid://4628471901", SkyboxFt = "rbxassetid://4628466090", SkyboxLf = "rbxassetid://4628466090", SkyboxRt = "rbxassetid://4628466090", SkyboxUp = "rbxassetid://4628472152" },
    GreenNebula = { SkyboxBk = "rbxassetid://47974894", SkyboxDn = "rbxassetid://47974690", SkyboxFt = "rbxassetid://47974821", SkyboxLf = "rbxassetid://47974776", SkyboxRt = "rbxassetid://47974859", SkyboxUp = "rbxassetid://47974909" },
    OrangeGradient = { SkyboxBk = "rbxassetid://6902754982", SkyboxDn = "rbxassetid://6902795826", SkyboxFt = "rbxassetid://6902754982", SkyboxLf = "rbxassetid://6902754982", SkyboxRt = "rbxassetid://6902754982", SkyboxUp = "rbxassetid://6902796078" },
    GreenAurora = { SkyboxBk = "rbxassetid://16563478983", SkyboxDn = "rbxassetid://16563481302", SkyboxFt = "rbxassetid://16563484084", SkyboxLf = "rbxassetid://16563485362", SkyboxRt = "rbxassetid://16563487078", SkyboxUp = "rbxassetid://16563489821" },
}

local HitSounds = {
    Bubble = "rbxassetid://6534947588",
    Lazer = "rbxassetid://130791043",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Sans = "rbxassetid://3188795283",
    Fart = "rbxassetid://130833677",
    Big = "rbxassetid://5332005053",
    Vine = "rbxassetid://5332680810",
    UwU = "rbxassetid://8679659744",
    Bruh = "rbxassetid://4578740568",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Fatality = "rbxassetid://6534947869",
    Bonk = "rbxassetid://5766898159",
    Minecraft = "rbxassetid://5869422451",
    Gamesense = "rbxassetid://4817809188",
    RIFK7 = "rbxassetid://9102080552",
    Bamboo = "rbxassetid://3769434519",
    Crowbar = "rbxassetid://546410481",
    Weeb = "rbxassetid://6442965016",
    Beep = "rbxassetid://8177256015",
    Bambi = "rbxassetid://8437203821",
    Stone = "rbxassetid://3581383408",
    ["Old Fatality"] = "rbxassetid://6607142036",
    Click = "rbxassetid://8053704437",
    Ding = "rbxassetid://7149516994",
    Snow = "rbxassetid://6455527632",
    Laser = "rbxassetid://7837461331",
    Mario = "rbxassetid://2815207981",
    Steve = "rbxassetid://4965083997",
    ["Call of Duty"] = "rbxassetid://5952120301",
    Bat = "rbxassetid://3333907347",
    ["TF2 Critical"] = "rbxassetid://296102734",
    Saber = "rbxassetid://8415678813",
    Baimware = "rbxassetid://3124331820",
    Osu = "rbxassetid://7149255551",
    TF2 = "rbxassetid://2868331684",
    Slime = "rbxassetid://6916371803",
    ["Among Us"] = "rbxassetid://5700183626",
    One = "rbxassetid://7380502345",
}

local SkyNames = { "Game" }
local HitNames = { "None" }
for name in pairs(Skyboxes) do
    table.insert(SkyNames, name)
end
for name in pairs(HitSounds) do
    table.insert(HitNames, name)
end
table.sort(SkyNames, function(a, b)
    if a == "Game" then
        return true
    end
    if b == "Game" then
        return false
    end
    return a < b
end)
table.sort(HitNames, function(a, b)
    if a == "None" then
        return true
    end
    if b == "None" then
        return false
    end
    return a < b
end)

local function MakePlayer(name)
    local sound = Instance.new("Sound")
    sound.Name = name
    sound.Volume = Config.HitVolume
    sound.Parent = SoundService
    return sound
end

local HitPlayer = MakePlayer("MH_Hit")
local ShootPlayer = MakePlayer("MH_Shoot")
local DeadPlayer = MakePlayer("MH_Dead")

local NextHitSound = 0
local NextShootSound = 0
local NextDeadSound = 0
local HealthSeen = {}

local function PlayOn(sound, id)
    if not id then
        return false
    end
    sound.SoundId = id
    sound.Volume = Config.HitVolume
    sound.TimePosition = 0
    sound:Play()
    return true
end

local function HitIds()
    local ids = {}
    if Config.HitMode == "Random" or Config.HitMode == "All" then
        if type(Config.HitList) == "table" then
            for _, name in ipairs(Config.HitList) do
                if HitSounds[name] then
                    table.insert(ids, HitSounds[name])
                end
            end
        end
    end
    if #ids == 0 and HitSounds[Config.HitSound] then
        table.insert(ids, HitSounds[Config.HitSound])
    end
    return ids
end

function PlayHitSound()
    if os.clock() < NextHitSound then
        return
    end
    local ids = HitIds()
    if #ids == 0 then
        return
    end
    NextHitSound = os.clock() + 0.08
    if Config.HitMode == "All" then
        for _, id in ipairs(ids) do
            local sound = MakePlayer("MH_HitStack")
            PlayOn(sound, id)
            task.delay(5, function()
                if sound.Parent then
                    sound:Destroy()
                end
            end)
        end
    elseif Config.HitMode == "Random" then
        PlayOn(HitPlayer, ids[math.random(1, #ids)])
    else
        PlayOn(HitPlayer, ids[1])
    end
end

function PlayShootSound()
    if os.clock() < NextShootSound then
        return
    end
    if PlayOn(ShootPlayer, HitSounds[Config.ShootSound]) then
        NextShootSound = os.clock() + 0.05
    end
end

function PlayDeadSound()
    if os.clock() < NextDeadSound then
        return
    end
    if PlayOn(DeadPlayer, HitSounds[Config.DeadSound]) then
        NextDeadSound = os.clock() + 0.2
    end
end

function WatchHits()
    local now = os.clock()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local previous = HealthSeen[player]
                if previous and humanoid.Health < previous - 0.5 and now - LastShotAt < 0.4 then
                    HitUntil = now + Config.HitTime
                    if humanoid.Health <= 0 then
                        PlayDeadSound()
                    else
                        PlayHitSound()
                    end
                end
                HealthSeen[player] = humanoid.Health
            end
        end
    end
end

local function ApplySky(name)
    local data = Skyboxes[name]
    if not data then
        return
    end
    if not Saved.SkyCaptured then
        Saved.SkyCaptured = true
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("Sky") and child.Name ~= "MH_Sky" then
                Saved.OriginalSky = child
                child.Parent = nil
                break
            end
        end
    end
    local sky = Lighting:FindFirstChild("MH_Sky")
    if not sky then
        sky = Instance.new("Sky")
        sky.Name = "MH_Sky"
        sky.Parent = Lighting
    end
    for _, face in ipairs(SkyFaces) do
        if sky[face] ~= data[face] then
            sky[face] = data[face]
        end
    end
end

local function RestoreSky()
    local custom = Lighting:FindFirstChild("MH_Sky")
    if custom then
        custom:Destroy()
    end
    if Saved.OriginalSky and Saved.OriginalSky.Parent == nil then
        Saved.OriginalSky.Parent = Lighting
    end
    Saved.SkyCaptured = false
    Config.Skybox = "Game"
end

function UpdateSky()
    if Config.Skybox and Config.Skybox ~= "Game" then
        ApplySky(Config.Skybox)
    end
end

local function RestoreWorld()
    Lighting.Brightness = Saved.Brightness
    Lighting.ClockTime = Saved.ClockTime
    Lighting.FogEnd = Saved.FogEnd
    Lighting.FogStart = Saved.FogStart
    Lighting.FogColor = Saved.FogColor
    Lighting.GlobalShadows = Saved.GlobalShadows
    Lighting.Ambient = Saved.Ambient
    Lighting.OutdoorAmbient = Saved.OutdoorAmbient
    Lighting.ExposureCompensation = Saved.Exposure
    pcall(function()
        Lighting.ShadowSoftness = Saved.ShadowSoftness
        Lighting.EnvironmentDiffuseScale = Saved.Diffuse
        Lighting.EnvironmentSpecularScale = Saved.Specular
    end)
    Workspace.Gravity = Saved.Gravity
    LocalPlayer.CameraMinZoomDistance = Saved.ZoomMin
    LocalPlayer.CameraMaxZoomDistance = Saved.ZoomMax
    local camera = GetCamera()
    if camera then
        camera.FieldOfView = Saved.FieldOfView
    end
    RestoreSky()
    RestoreScene()
end

local function Unload()
    Config.ESP = false
    Config.Aimbot = false
    Config.Spin = false
    Config.Fly = false
    Config.Noclip = false
    pcall(function() RunService:UnbindFromRenderStep("MidnightHubAim") end)
    pcall(function() RunService:UnbindFromRenderStep("MidnightHubESP") end)
    for _, connection in ipairs(Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(Connections)
    for player in pairs(ESPData) do
        RemoveESP(player)
    end
    for _, obj in ipairs({
        FOVCircle, TriggerCircle, TargetDot, TargetLine, CrossDot, HitLines[1], HitLines[2],
        Crosshair[1], Crosshair[2], Crosshair[3], Crosshair[4],
    }) do
        DestroyDraw(obj)
    end
    for _, draw in ipairs(ItemDrawings) do
        DestroyDraw(draw.Text)
        DestroyDraw(draw.Line)
    end
    local character = LocalPlayer.Character
    StopFly(character and character:FindFirstChildOfClass("Humanoid"))
    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char then
            local highlight = char:FindFirstChild("MH_Chams")
            if highlight then
                highlight:Destroy()
            end
        end
    end
    ClearWeather()
    RestoreWorld()
    for _, effect in ipairs({ GradeFX, BloomFX, SunFX, DOFFX, BlurFX }) do
        pcall(function()
            effect:Destroy()
        end)
    end
    if OwnedAtmosphere then
        local atmosphere = Lighting:FindFirstChild("MH_Atmosphere")
        if atmosphere then
            atmosphere:Destroy()
        end
    end
    for _, sound in ipairs({ HitPlayer, ShootPlayer, DeadPlayer }) do
        if sound then
            sound:Destroy()
        end
    end
    if getgenv and getgenv().__MidnightHubUnload == Unload then
        getgenv().__MidnightHubUnload = nil
    end
end

if getgenv then
    getgenv().__MidnightHubUnload = Unload
end

for _, player in ipairs(Players:GetPlayers()) do
    CreateESP(player)
end
Bind(Players.PlayerAdded, CreateESP)
Bind(Players.PlayerRemoving, RemoveESP)
Bind(UserInputService.JumpRequest, function()
    if not Config.InfiniteJump then
        return
    end
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
Bind(LocalPlayer.Idled, function()
    if not Config.AntiAFK then
        return
    end
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local camera = GetCamera()
if camera then
    Saved.FieldOfView = camera.FieldOfView
end

RunService:BindToRenderStep("MidnightHubAim", Enum.RenderPriority.Camera.Value + 1, function()
    UpdateWeapon()
    UpdateAim()
    UpdateMovement()
    UpdateWorld()
end)
RunService:BindToRenderStep("MidnightHubESP", Enum.RenderPriority.Camera.Value + 2, function()
    RenderESP()
end)

local function Toggle(section, name, key, default)
    Config[key] = default
    return section:Toggle({
        Name = name,
        Flag = key,
        Default = default,
        Callback = function(value)
            Config[key] = value
        end,
    })
end

local function Slider(section, name, key, default, min, max, decimals, suffix)
    Config[key] = default
    section:Slider({
        Name = name,
        Flag = key,
        Default = default,
        Min = min,
        Max = max,
        Decimals = decimals,
        Suffix = suffix or "",
        Callback = function(value)
            Config[key] = value
        end,
    })
end

local function Drop(section, name, key, default, items, multi)
    Config[key] = default
    section:Dropdown({
        Name = name,
        Flag = key,
        Default = default,
        Items = items,
        Multi = multi,
        Callback = function(value)
            Config[key] = value
        end,
    })
end

local function Color(section, name, key, default)
    Config[key] = default
    section:Label(name):Colorpicker({
        Flag = key,
        Default = default,
        Alpha = 0,
        Callback = function(color)
            Config[key] = color
        end,
    })
end

local Aim = Window:Page({ Name = "Aim", Icon = ICON })
local AimLeft = Aim:Section({ Name = "Camera", Side = 1 })
local AimRight = Aim:Section({ Name = "Target", Side = 2 })

local AimToggle = Toggle(AimLeft, "Aimbot", "Aimbot", false)
AimToggle:Keybind({
    Name = "Aim Key",
    Flag = "AimKey",
    Default = Enum.UserInputType.MouseButton2,
    Mode = "Hold",
})
Drop(AimLeft, "Aim Mode", "AimMode", "Smooth", { "Smooth", "Hard" }, false)
Slider(AimLeft, "Snap Speed", "Snap", 0.22, 0.05, 1, 0.01, "")
Slider(AimLeft, "FOV", "FOV", 180, 20, 800, 1, " px")
local FovToggle = Toggle(AimLeft, "Show FOV", "ShowFOV", true)
FovToggle:Colorpicker({
    Name = "FOV Color",
    Flag = "FOVColor",
    Default = Config.FOVColor,
    Alpha = 0,
    Callback = function(color)
        Config.FOVColor = color
    end,
})
Drop(AimLeft, "Hitboxes", "Hitboxes", { "Head" }, { "Head", "Chest", "Arms", "Legs" }, true)
Drop(AimLeft, "Priority", "Priority", "Closest", { "Closest", "Nearest", "Lowest HP", "Highest HP", "Random" }, false)
Toggle(AimLeft, "Team Check", "AimTeamCheck", true)
Toggle(AimLeft, "Wall Check", "AimWalls", true)
Toggle(AimLeft, "Sticky Aim", "Sticky", true)
Slider(AimLeft, "Sticky Scale", "StickyScale", 1.4, 1, 3, 0.05, "x")

Toggle(AimRight, "Prediction", "Prediction", false)
Slider(AimRight, "Prediction Time", "PredictionTime", 0.12, 0, 0.4, 0.01, "s")
Slider(AimRight, "Humanize", "Humanize", 0, 0, 2, 0.05, " st")
Slider(AimRight, "Height Offset", "AimOffset", 0, -2, 2, 0.05, " st")
Slider(AimRight, "Max Distance", "AimDistance", 1500, 50, 5000, 1, " st")
Toggle(AimRight, "Target Line", "TargetLine", true)
local DotToggle = Toggle(AimRight, "Target Dot", "TargetDot", true)
DotToggle:Colorpicker({
    Name = "Target Color",
    Flag = "TargetColor",
    Default = Config.TargetColor,
    Alpha = 0,
    Callback = function(color)
        Config.TargetColor = color
    end,
})
Toggle(AimRight, "Triggerbot", "Trigger", false)
AimRight:Label("Trigger Key"):Keybind({
    Flag = "TriggerKey",
    Default = Enum.KeyCode.E,
    Mode = "Hold",
})
Slider(AimRight, "Trigger Delay", "TriggerDelay", 0.08, 0.01, 0.5, 0.01, "s")
Slider(AimRight, "Trigger FOV", "TriggerFOV", 18, 2, 80, 1, " px")

local Visuals = Window:Page({ Name = "Visuals", Icon = ICON })
local VisLeft = Visuals:Section({ Name = "Skeleton", Side = 1 })
local VisRight = Visuals:Section({ Name = "Style", Side = 2 })

Toggle(VisLeft, "ESP", "ESP", true)
Toggle(VisLeft, "Skeleton", "Skeleton", true)
Slider(VisLeft, "Line Thickness", "Thickness", 1, 1, 3, 1, " px")
Toggle(VisLeft, "Corner Box", "CornerBox", true)
Toggle(VisLeft, "Full Box", "FullBox", false)
Toggle(VisLeft, "Names", "Names", true)
Toggle(VisLeft, "Health Bar", "HealthBar", true)
Toggle(VisLeft, "Health Text", "HealthText", false)
Toggle(VisLeft, "Distance", "Distance", true)
Toggle(VisLeft, "Weapon", "Weapon", true)
Toggle(VisLeft, "Head Dot", "HeadDot", true)
Toggle(VisLeft, "Tracers", "Tracers", false)
Drop(VisLeft, "Tracer Origin", "TracerFrom", "Bottom", { "Bottom", "Center", "Top", "Mouse" }, false)

Toggle(VisRight, "Chams", "Chams", false)
Toggle(VisRight, "Chams Through Walls", "ChamsWalls", true)
Slider(VisRight, "Chams Fill", "ChamsFill", 1, 0, 1, 0.01, "")
Slider(VisRight, "Chams Outline", "ChamsOutline", 0, 0, 1, 0.01, "")
Toggle(VisRight, "Team Check", "ESPTeamCheck", true)
Toggle(VisRight, "Visibility Colors", "VisCheck", true)
Slider(VisRight, "Max Distance", "ESPDistance", 1500, 50, 5000, 1, " st")
Slider(VisRight, "Text Size", "TextSize", 13, 10, 22, 1, "")
Color(VisRight, "Visible", "VisibleColor", Config.VisibleColor)
Color(VisRight, "Hidden", "HiddenColor", Config.HiddenColor)
Color(VisRight, "Box", "BoxColor", Config.BoxColor)
Color(VisRight, "Text", "NameColor", Config.NameColor)
Toggle(VisRight, "Offscreen Arrows", "Arrows", false)
Slider(VisRight, "Arrow Size", "ArrowSize", 8, 4, 20, 1, " px")

local Detail = Window:Page({ Name = "Detail", Icon = ICON })
local DetailLeft = Detail:Section({ Name = "Lines", Side = 1 })
local DetailRight = Detail:Section({ Name = "Labels", Side = 2 })

Toggle(DetailLeft, "Black Outline", "Outline", true)
Color(DetailLeft, "Outline", "OutlineColor", Config.OutlineColor)
Toggle(DetailLeft, "3D Box", "Box3D", false)
Toggle(DetailLeft, "Filled Box", "BoxFill", false)
Slider(DetailLeft, "Fill Strength", "FillAlpha", 0.18, 0.04, 0.6, 0.01, "")
Toggle(DetailLeft, "Distance Fade", "Fade", false)
Toggle(DetailLeft, "Joint Dots", "Joints", false)
Toggle(DetailLeft, "Filled Head", "HeadFilled", false)
Toggle(DetailLeft, "Look Direction", "LookDir", false)
Slider(DetailLeft, "Look Length", "LookLength", 8, 2, 30, 1, " st")
Toggle(DetailLeft, "Health Tint", "HealthTint", false)
Slider(DetailLeft, "Health Bar Width", "BarWidth", 2, 1, 6, 1, " px")

Drop(DetailRight, "Name Style", "NameMode", "Display", { "Display", "User", "Both" }, false)
Toggle(DetailRight, "Name Plate", "NamePlate", true)
Toggle(DetailRight, "Team Color", "UseTeamColor", false)
Toggle(DetailRight, "State", "ShowState", false)
Toggle(DetailRight, "Dropped Tools", "ItemESP", false)
Color(DetailRight, "Tool Color", "ItemColor", Config.ItemColor)

local Weapon = Window:Page({ Name = "Weapon", Icon = ICON })
local GunLeft = Weapon:Section({ Name = "Gun", Side = 1 })
local GunRight = Weapon:Section({ Name = "Overlay", Side = 2 })

Toggle(GunLeft, "No Recoil", "NoRecoil", false)
Toggle(GunLeft, "No Spread", "NoSpread", false)
Toggle(GunLeft, "No Camera Kick", "NoCameraKick", false)
Toggle(GunLeft, "No Sway", "NoSway", false)
Toggle(GunLeft, "Rapid Fire", "RapidFire", false)
Slider(GunLeft, "Fire Scale", "FireScale", 2, 1, 8, 0.1, "x")
Toggle(GunLeft, "Instant Reload", "InstantReload", false)
Toggle(GunLeft, "No Equip Delay", "NoEquip", false)
local GunButtons = GunLeft:Button()
GunButtons:Add("Rescan Hooks", function()
    HooksStarted = false
    InstallHooks()
end)
GunButtons:Add("Restore Stats", function()
    for inst, value in pairs(OriginalValues) do
        pcall(function()
            inst.Value = value
        end)
    end
end)

Toggle(GunRight, "Crosshair", "Crosshair", false)
Slider(GunRight, "Crosshair Size", "CrossSize", 6, 2, 20, 1, " px")
Slider(GunRight, "Crosshair Gap", "CrossGap", 3, 0, 16, 1, " px")
Slider(GunRight, "Crosshair Thickness", "CrossThickness", 1, 1, 3, 1, " px")
Color(GunRight, "Crosshair Color", "CrossColor", Config.CrossColor)
Toggle(GunRight, "Center Dot", "CrossDot", false)
Toggle(GunRight, "Hitmarker", "Hitmarker", true)
Slider(GunRight, "Hitmarker Time", "HitTime", 0.12, 0.05, 0.4, 0.01, "s")
Color(GunRight, "Hitmarker Color", "HitColor", Config.HitColor)
Drop(GunRight, "Hit Mode", "HitMode", "Single", { "Single", "Random", "All" }, false)
GunRight:Label("Hit Sound")
GunRight:Searchbox({
    Name = "Hit Sound",
    Flag = "HitSound",
    Default = "None",
    Items = HitNames,
    Multi = false,
    Callback = function(value)
        if type(value) == "string" then
            Config.HitSound = value
        end
    end,
})
GunRight:Label("Multi Hit Sounds")
GunRight:Searchbox({
    Name = "Multi Hit Sounds",
    Flag = "HitList",
    Default = {},
    Items = HitNames,
    Multi = true,
    Callback = function(value)
        if type(value) == "table" then
            Config.HitList = value
        end
    end,
})
GunRight:Label("Shoot Sound")
GunRight:Searchbox({
    Name = "Shoot Sound",
    Flag = "ShootSound",
    Default = "None",
    Items = HitNames,
    Multi = false,
    Callback = function(value)
        if type(value) == "string" then
            Config.ShootSound = value
        end
    end,
})
GunRight:Label("Dead Sound")
GunRight:Searchbox({
    Name = "Dead Sound",
    Flag = "DeadSound",
    Default = "None",
    Items = HitNames,
    Multi = false,
    Callback = function(value)
        if type(value) == "string" then
            Config.DeadSound = value
        end
    end,
})
Slider(GunRight, "Sound Volume", "HitVolume", 2, 0, 5, 0.1, "")
local HitButtons = GunRight:Button()
HitButtons:Add("Test Hit", function()
    PlayHitSound()
end)
HitButtons:Add("Test Shoot", function()
    PlayShootSound()
end)
local DeadButtons = GunRight:Button()
DeadButtons:Add("Test Dead", function()
    PlayDeadSound()
end)

local Movement = Window:Page({ Name = "Movement", Icon = ICON })
local MoveLeft = Movement:Section({ Name = "Spin", Side = 1 })
local MoveRight = Movement:Section({ Name = "Travel", Side = 2 })

local SpinToggle = Toggle(MoveLeft, "Spinbot", "Spin", false)
SpinToggle:Keybind({
    Name = "Spin Key",
    Flag = "SpinKey",
    Default = Enum.KeyCode.V,
    Mode = "Always",
})
Slider(MoveLeft, "Spin Speed", "SpinSpeed", 20, 1, 100, 1, "")
Drop(MoveLeft, "Spin Mode", "SpinMode", "Horizontal", { "Horizontal", "Vertical", "Both", "Random" }, false)
Toggle(MoveLeft, "Smooth Spin", "SmoothSpin", true)
Toggle(MoveLeft, "Speed", "Speed", false)
Drop(MoveLeft, "Speed Mode", "SpeedMode", "Walk", { "Walk", "CFrame" }, false)
Slider(MoveLeft, "Walk Speed", "WalkSpeed", 24, 16, 120, 1, "")
Slider(MoveLeft, "CFrame Speed", "CFrameSpeed", 60, 10, 400, 1, "")
Toggle(MoveLeft, "Jump Power", "Jump", false)
Slider(MoveLeft, "Jump Power", "JumpPower", 60, 16, 200, 1, "")
Toggle(MoveLeft, "Infinite Jump", "InfiniteJump", false)
Toggle(MoveLeft, "Bunny Hop", "Bhop", false)

local FlyToggle = Toggle(MoveRight, "Fly", "Fly", false)
FlyToggle:Keybind({
    Name = "Fly Key",
    Flag = "FlyKey",
    Default = Enum.KeyCode.F,
    Mode = "Hold",
})
Drop(MoveRight, "Fly Mode", "FlyMode", "Velocity", { "Velocity", "CFrame" }, false)
Slider(MoveRight, "Fly Speed", "FlySpeed", 80, 20, 400, 1, "")
Toggle(MoveRight, "Noclip", "Noclip", false)
Toggle(MoveRight, "Hip Height", "Hip", false)
Slider(MoveRight, "Hip Height", "HipHeight", 2, 0, 20, 0.1, "")
Toggle(MoveRight, "Custom Gravity", "GravityOn", false)
Slider(MoveRight, "Gravity", "Gravity", 196, 0, 400, 1, "")
local MoveButtons = MoveRight:Button()
MoveButtons:Add("Reset Gravity", function()
    Config.GravityOn = false
    Workspace.Gravity = Saved.Gravity
end)
MoveButtons:Add("Reset Speed", function()
    Config.Speed = false
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
    end
end)

local World = Window:Page({ Name = "World", Icon = ICON })
local WorldLeft = World:Section({ Name = "Lighting", Side = 1 })
local WorldRight = World:Section({ Name = "Client", Side = 2 })

Toggle(WorldLeft, "Fullbright", "Fullbright", false)
Toggle(WorldLeft, "No Fog", "NoFog", false)
Toggle(WorldLeft, "No Shadows", "NoShadows", false)
Slider(WorldLeft, "Brightness", "Brightness", 2, 0, 10, 0.1, "")
Toggle(WorldLeft, "Clock Time", "ClockOn", false)
Slider(WorldLeft, "Time", "ClockTime", 14, 0, 24, 0.1, " h")
Color(WorldLeft, "Ambient", "Ambient", Config.Ambient)
Toggle(WorldLeft, "Camera FOV", "CameraFOVOn", false)
Slider(WorldLeft, "Field Of View", "CameraFOV", 90, 40, 120, 1, "")
Toggle(WorldLeft, "Zoom Unlock", "ZoomOn", false)
Slider(WorldLeft, "Zoom Distance", "Zoom", 20, 5, 200, 1, "")

Toggle(WorldRight, "Anti AFK", "AntiAFK", false)
Toggle(WorldRight, "FPS Cap", "FPSOn", false)
Slider(WorldRight, "FPS", "FPSCap", 240, 60, 999, 1, "")
local ClientButtons = WorldRight:Button()
ClientButtons:Add("Copy Position", function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root and type(setclipboard) == "function" then
        setclipboard(string.format("%.2f, %.2f, %.2f", root.Position.X, root.Position.Y, root.Position.Z))
    end
end)
ClientButtons:Add("Rejoin", function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
local ResetButtons = WorldRight:Button()
ResetButtons:Add("Restore Lighting", function()
    Config.Fullbright = false
    Config.NoFog = false
    Config.NoShadows = false
    Config.ClockOn = false
    Config.CameraFOVOn = false
    Config.ZoomOn = false
    RestoreWorld()
end)
ResetButtons:Add("Unload", Unload)

local Scene = Window:Page({ Name = "Scene", Icon = ICON })
local SceneLeft = Scene:Section({ Name = "Grade", Side = 1 })
local SceneRight = Scene:Section({ Name = "World", Side = 2 })

Toggle(SceneLeft, "Color Grade", "Grade", false)
Slider(SceneLeft, "Saturation", "Saturation", 0.15, -1, 1, 0.01, "")
Slider(SceneLeft, "Contrast", "Contrast", 0.08, -1, 1, 0.01, "")
Slider(SceneLeft, "Grade Brightness", "GradeBright", 0, -0.4, 0.4, 0.01, "")
Color(SceneLeft, "Tint", "Tint", Config.Tint)
Toggle(SceneLeft, "Bloom", "Bloom", false)
Slider(SceneLeft, "Bloom Intensity", "BloomIntensity", 0.4, 0, 2, 0.01, "")
Slider(SceneLeft, "Bloom Size", "BloomSize", 24, 0, 56, 1, "")
Slider(SceneLeft, "Bloom Threshold", "BloomThreshold", 0.9, 0, 2, 0.01, "")
Toggle(SceneLeft, "Sun Rays", "SunRays", false)
Slider(SceneLeft, "Sun Intensity", "SunIntensity", 0.12, 0, 1, 0.01, "")
Slider(SceneLeft, "Sun Spread", "SunSpread", 0.6, 0, 1, 0.01, "")
Toggle(SceneLeft, "Depth Of Field", "DOF", false)
Slider(SceneLeft, "Focus Distance", "FocusDistance", 40, 0, 200, 1, "")
Slider(SceneLeft, "Focus Radius", "FocusRadius", 30, 0, 120, 1, "")
Toggle(SceneLeft, "Blur", "BlurOn", false)
Slider(SceneLeft, "Blur Size", "BlurSize", 4, 0, 20, 1, "")

Toggle(SceneRight, "Atmosphere", "AtmosphereOn", false)
Slider(SceneRight, "Density", "AtmoDensity", 0.25, 0, 1, 0.01, "")
Slider(SceneRight, "Haze", "AtmoHaze", 1, 0, 10, 0.1, "")
Color(SceneRight, "Air Color", "AtmoColor", Config.AtmoColor)
Color(SceneRight, "Decay", "AtmoDecay", Config.AtmoDecay)
Toggle(SceneRight, "Custom Fog", "CustomFog", false)
Slider(SceneRight, "Fog Distance", "FogDistance", 800, 40, 5000, 1, "")
Slider(SceneRight, "Fog Start", "FogNear", 0, 0, 500, 1, "")
Color(SceneRight, "Fog Color", "FogColor", Config.FogColor)
Toggle(SceneRight, "Soft Light", "SoftShadows", false)
Slider(SceneRight, "Shadow Softness", "ShadowSoft", 0.4, 0, 1, 0.01, "")
Slider(SceneRight, "Diffuse", "Diffuse", 1, 0, 1, 0.01, "")
Slider(SceneRight, "Specular", "Specular", 1, 0, 1, 0.01, "")
Toggle(SceneRight, "Water", "WaterOn", false)
Color(SceneRight, "Water Color", "WaterColor", Config.WaterColor)
Slider(SceneRight, "Water Clarity", "WaterAlpha", 0.3, 0, 1, 0.01, "")
Toggle(SceneRight, "X-Ray", "Xray", false)
Slider(SceneRight, "X-Ray Range", "XrayRange", 80, 10, 250, 1, " st")
Slider(SceneRight, "X-Ray Amount", "XrayAmount", 0.65, 0.1, 0.95, 0.01, "")
Toggle(SceneRight, "Hide Particles", "NoParticles", false)
Toggle(SceneRight, "Hide Viewmodel", "HideViewmodel", false)

local LookButtons = SceneRight:Button()
LookButtons:Add("Clean", function()
    ApplyLook("Clean")
end)
LookButtons:Add("Night", function()
    ApplyLook("Night")
end)
local LookButtonsB = SceneRight:Button()
LookButtonsB:Add("Sunset", function()
    ApplyLook("Sunset")
end)
LookButtonsB:Add("Arctic", function()
    ApplyLook("Arctic")
end)
local LookButtonsC = SceneRight:Button()
LookButtonsC:Add("Neon", function()
    ApplyLook("Neon")
end)
LookButtonsC:Add("Clear Look", function()
    RestoreScene()
end)

local Weather = Window:Page({ Name = "Weather", Icon = ICON })
local WeatherLeft = Weather:Section({ Name = "Tracers", Side = 1 })
local WeatherRight = Weather:Section({ Name = "Sky", Side = 2 })

Toggle(WeatherLeft, "Bullet Tracers", "BulletTracers", false)
Color(WeatherLeft, "Tracer Color", "TracerColor", Config.TracerColor)
Slider(WeatherLeft, "Tracer Life", "TracerLife", 0.35, 0.05, 1.5, 0.01, "s")
Slider(WeatherLeft, "Tracer Width", "TracerWidth", 0.06, 0.02, 0.3, 0.01, "")
Slider(WeatherLeft, "Tracer Range", "TracerRange", 800, 50, 2000, 1, " st")
Toggle(WeatherLeft, "Impact Sparks", "Impact", true)
Toggle(WeatherLeft, "Track World Shots", "TrackShots", false)
WeatherLeft:Label("Skybox")
WeatherLeft:Searchbox({
    Name = "Skybox",
    Flag = "Skybox",
    Default = "Game",
    Items = SkyNames,
    Multi = false,
    Callback = function(value)
        if type(value) ~= "string" then
            return
        end
        Config.Skybox = value
        if value == "Game" then
            RestoreSky()
            Config.Skybox = "Game"
        else
            ApplySky(value)
        end
    end,
})

Toggle(WeatherRight, "Snow", "Snow", false)
Slider(WeatherRight, "Snow Amount", "SnowRate", 220, 20, 800, 1, "")
Slider(WeatherRight, "Snowflake Size", "SnowSize", 0.28, 0.08, 1.2, 0.01, "")
Toggle(WeatherRight, "Rain", "Rain", false)
Slider(WeatherRight, "Rain Amount", "RainRate", 420, 40, 1200, 1, "")
Toggle(WeatherRight, "Ash", "Ash", false)
Toggle(WeatherRight, "Dust", "Dust", false)
Toggle(WeatherRight, "Lightning", "Lightning", false)
Slider(WeatherRight, "Wind", "Wind", 0, -40, 40, 1, "")

Library:CreateSettingsPage(Window, Watermark, KeyList)

print("Midnight Hub loaded. Right Shift opens the menu.")

-- Additional Config
Config.Ragebot = false
Config.RagebotAutoShoot = true
Config.RagebotDelay = 0.05
Config.AutoFarm = false
Config.AutoFarmKills = true
Config.AutoRespawn = true
Config.BulletTracers = true
Config.TracerDuration = 2
Config.RemoveResyncBlock = true
Config.InfiniteAmmo = false
Config.InstantHit = false

-- Variables for new features
local LastRageShot = 0
local ActiveTracers = {}
local ResyncFixed = false

-- Get Remotes
local HitRemote = game.ReplicatedStorage.Remotes.Hit
local FireRemote = game.ReplicatedStorage.Remotes.Fire

--[[ FIX POSITION RESYNC - REMOVES MOVEMENT BLOCK ]]--
local function FixPositionResync()
    if not Config.RemoveResyncBlock then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if rootPart and humanoid then
        -- Remove body constraints that cause resync
        for _, child in pairs(rootPart:GetChildren()) do
            if child:IsA("BodyVelocity") or child:IsA("BodyPosition") or child:IsA("BodyGyro") then
                if child.Name ~= "FlyVelocity" then -- Don't remove fly velocity
                    child:Destroy()
                end
            end
        end
        
        -- Restore movement
        if humanoid.WalkSpeed == 0 then
            humanoid.WalkSpeed = Config.WalkSpeed or 16
        end
        
        ResyncFixed = true
    end
end

--[[ RAGEBOT - AUTO SHOOT ]]--
local function Ragebot()
    if not Config.Ragebot or not Config.RagebotAutoShoot then return end
    
    local currentTime = tick()
    if currentTime - LastRageShot < Config.RagebotDelay then return end
    
    -- Use existing aim target from main aimbot
    if CurrentTarget and IsAlive(CurrentTarget) then
        local character = CurrentTarget.Character
        if not character then return end
        
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        -- Check if in FOV
        local screen, onScreen = WorldToScreen(head.Position)
        if not onScreen then return end
        
        local center = ScreenCenter()
        local dist = (screen - center).Magnitude
        if dist > Config.FOV then return end
        
        -- Auto shoot
        pcall(function()
            if FireRemote then FireRemote:FireServer() end
            if HitRemote then HitRemote:FireServer(head.Position, head) end
        end)
        
        LastRageShot = currentTime
    end
end

--[[ BULLET TRACERS ]]--
local function CreateTracer(startPos, endPos)
    if not Config.BulletTracers then return end
    
    local tracer = Instance.new("Part")
    tracer.Anchored = true
    tracer.CanCollide = false
    tracer.Material = Enum.Material.Neon
    tracer.Color = Config.TracerColor or Color3.fromRGB(255, 0, 0)
    tracer.Size = Vector3.new(0.1, 0.1, (startPos - endPos).Magnitude)
    tracer.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -tracer.Size.Z / 2)
    tracer.Parent = Workspace
    tracer.Name = "BulletTracer"
    
    table.insert(ActiveTracers, tracer)
    
    task.delay(Config.TracerDuration or 2, function()
        pcall(function()
            tracer:Destroy()
        end)
        local idx = table.find(ActiveTracers, tracer)
        if idx then
            table.remove(ActiveTracers, idx)
        end
    end)
end

-- Hook shooting for tracers
local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    -- Bullet tracers
    if Config.BulletTracers and method == "FireServer" and (self == HitRemote or self == FireRemote) then
        local camera = GetCamera()
        if camera and args[1] then
            local origin = camera.CFrame.Position
            local targetPos = args[1]
            if typeof(targetPos) == "Vector3" then
                CreateTracer(origin, targetPos)
            end
        end
    end
    
    -- Instant hit / bullet manipulation
    if Config.InstantHit and method == "FireServer" and self == HitRemote then
        if CurrentTarget and CurrentTarget.Character then
            local head = CurrentTarget.Character:FindFirstChild("Head")
            if head then
                args[1] = head.Position
                args[2] = head
            end
        end
    end
    
    return OldNamecall(self, unpack(args))
end)

--[[ AUTO FARM ]]--
local function AutoFarm()
    if not Config.AutoFarm then return end
    
    -- Auto kill for XP/Cash
    if Config.AutoFarmKills and Config.Ragebot then
        -- Ragebot handles the shooting
        Ragebot()
    end
    
    -- Auto respawn
    if Config.AutoRespawn then
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health <= 0 then
            task.wait(1)
            pcall(function()
                LocalPlayer.Character:BreakJoints()
            end)
        end
    end
end

-- Add to main update loop
local OriginalRenderStepped = Bind(RunService.RenderStepped, function()
    -- Existing code runs here
end)

-- New update loop for additional features
Bind(RunService.RenderStepped, function()
    -- Fix resync issue
    if Config.RemoveResyncBlock then
        FixPositionResync()
    end
    
    -- Ragebot
    if Config.Ragebot then
        Ragebot()
    end
    
    -- Auto Farm
    if Config.AutoFarm then
        AutoFarm()
    end
end)

-- Add UI controls for new features
local Combat = Window:Tab("Combat")

Combat:Section("Ragebot")

Combat:Toggle({
    Name = "Ragebot (Auto Shoot)",
    Flag = "Ragebot",
    Callback = function(value)
        Config.Ragebot = value
    end,
})

Combat:Slider({
    Name = "Shoot Delay",
    Flag = "RagebotDelay",
    Min = 0.01,
    Max = 0.5,
    Precise = 2,
    Default = 0.05,
    Callback = function(value)
        Config.RagebotDelay = value
    end,
})

Combat:Toggle({
    Name = "Bullet Tracers",
    Flag = "BulletTracers",
    Callback = function(value)
        Config.BulletTracers = value
    end,
})

Combat:Slider({
    Name = "Tracer Duration",
    Flag = "TracerDuration",
    Min = 0.5,
    Max = 5,
    Precise = 1,
    Default = 2,
    Callback = function(value)
        Config.TracerDuration = value
    end,
})

Combat:Toggle({
    Name = "Instant Hit (Bullet Manip)",
    Flag = "InstantHit",
    Callback = function(value)
        Config.InstantHit = value
    end,
})

Combat:Section("Auto Farm")

Combat:Toggle({
    Name = "Enable Auto Farm",
    Flag = "AutoFarm",
    Callback = function(value)
        Config.AutoFarm = value
    end,
})

Combat:Toggle({
    Name = "Auto Kill Enemies",
    Flag = "AutoFarmKills",
    Callback = function(value)
        Config.AutoFarmKills = value
    end,
})

Combat:Toggle({
    Name = "Auto Respawn",
    Flag = "AutoRespawn",
    Callback = function(value)
        Config.AutoRespawn = value
    end,
})

local Movement = Window:Tab("Movement")

Movement:Section("Movement Fixes")

Movement:Toggle({
    Name = "Remove Resync Block (FIX)",
    Flag = "RemoveResyncBlock",
    Default = true,
    Callback = function(value)
        Config.RemoveResyncBlock = value
        if value then
            FixPositionResync()
        end
    end,
})

Movement:Label("↑ Fixes 'position was resynced' issue")

-- Keybinds for new features
Library:Keybind({
    Name = "Toggle Ragebot",
    Flag = "RagebotKey",
    Default = Enum.KeyCode.R,
    Mode = "Toggle",
    Callback = function()
        Config.Ragebot = not Config.Ragebot
        Library:Notify({
            Title = "Ragebot",
            Description = Config.Ragebot and "Enabled" or "Disabled",
            Duration = 2,
        })
    end,
})

Library:Keybind({
    Name = "Toggle Auto Farm",
    Flag = "AutoFarmKey",
    Default = Enum.KeyCode.G,
    Mode = "Toggle",
    Callback = function()
        Config.AutoFarm = not Config.AutoFarm
        Library:Notify({
            Title = "Auto Farm",
            Description = Config.AutoFarm and "Enabled" or "Disabled",
            Duration = 2,
        })
    end,
})




getgenv().FixResync = function()
    Config.RemoveResyncBlock = true
    FixPositionResync()
    print("Position resync fix applied!")
end

-- Notification on load
Library:Notify({
    Title = "UNNAMED Enhanced",
    Description = "All features loaded!",
    Duration = 5,
})

print("Jonas and mae = love")
print("UNNAMED LOADED!")

