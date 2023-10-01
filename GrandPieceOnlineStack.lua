pcall(function()

    function AntiDetect()
            pcall(function()
                game:GetService("StarterPlayer").StarterPlayerScripts.FROSTHUB_DETECTION.Disabled = true
                game:GetService("Players").LocalPlayer.PlayerScripts.FROSTHUB_DETECTION.Disabled = true
                end)
            end
    AntiDetect()
    
    local plr = game.Players.LocalPlayer
    
    local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
    local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
    local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/ImperorLegend/Linoriax/main/test'))()
    local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
    
    local Window = Library:CreateWindow({
        Title = 'Universe Hub',
        Center = true,
        AutoShow = true,
    })
    
    local Tabs = {
        Main = Window:AddTab('Main'),
        Stacks = Window:AddTab('Fruit'),
    
        ['Settings'] = Window:AddTab('Settings'),
     
     }
     local Farming = Tabs.Main:AddLeftGroupbox('Farm')
     local Teleports = Tabs.Main:AddRightGroupbox('Teleports')
     local Miscs = Tabs.Main:AddLeftGroupbox('Misc')
     local SunaSuna = Tabs.Stacks:AddRightGroupbox('Suna-Suna')
     local GomuGomu = Tabs.Stacks:AddLeftGroupbox('Gomu-Gomu')
     local MeraMera = Tabs.Stacks:AddRightGroupbox('Mera-Mera')
     local PikaPika = Tabs.Stacks:AddLeftGroupbox('Pika-Pika')
     local PawPaw = Tabs.Stacks:AddRightGroupbox('Paw-Paw')
     local YukiYuki = Tabs.Stacks:AddLeftGroupbox('Yuki-Yuki')
     local HieHie = Tabs.Stacks:AddRightGroupbox('Hie-Hie')
     local OpeOpe = Tabs.Stacks:AddLeftGroupbox('Ope-Ope')


     local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')
    
     Miscs:AddToggle('WhiteScreen', {
       Text = 'White Screen (FPS)',
       Default = false,
       Callback = function(state)
          if state then
             game:GetService("RunService"):Set3dRenderingEnabled(false)
          else
             game:GetService("RunService"):Set3dRenderingEnabled(true)
          end
       end
    })
    
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    local performanceBackup = {}
    
    local function EnablePerformanceMode()
        performanceBackup.WaterWaveSize = t.WaterWaveSize
        performanceBackup.WaterWaveSpeed = t.WaterWaveSpeed
        performanceBackup.WaterReflectance = t.WaterReflectance
        performanceBackup.WaterTransparency = t.WaterTransparency
        performanceBackup.GlobalShadows = l.GlobalShadows
        performanceBackup.FogEnd = l.FogEnd
        performanceBackup.Brightness = l.Brightness
        performanceBackup.QualityLevel = settings().Rendering.QualityLevel
    
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
    
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                performanceBackup[v] = {
                    Material = v.Material,
                    Reflectance = v.Reflectance
                }
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                performanceBackup[v] = {
                    Transparency = v.Transparency
                }
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                performanceBackup[v] = {
                    Lifetime = v.Lifetime
                }
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                performanceBackup[v] = {
                    BlastPressure = v.BlastPressure,
                    BlastRadius = v.BlastRadius
                }
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                performanceBackup[v] = {
                    Enabled = v.Enabled
                }
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                performanceBackup[v] = {
                    Material = v.Material,
                    Reflectance = v.Reflectance,
                    TextureID = v.TextureID
                }
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            end
        end
    
        for i, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                performanceBackup[e] = {
                    Enabled = e.Enabled
                }
                e.Enabled = false
            end
        end
    end
    
    local function DisablePerformanceMode()
        t.WaterWaveSize = performanceBackup.WaterWaveSize
        t.WaterWaveSpeed = performanceBackup.WaterWaveSpeed
        t.WaterReflectance = performanceBackup.WaterReflectance
        t.WaterTransparency = performanceBackup.WaterTransparency
        l.GlobalShadows = performanceBackup.GlobalShadows
        l.FogEnd = performanceBackup.FogEnd
        l.Brightness = performanceBackup.Brightness
        settings().Rendering.QualityLevel = performanceBackup.QualityLevel
    
        for object, backup in pairs(performanceBackup) do
            if typeof(object) == "Instance" then
                if object:IsA("Part") or object:IsA("Union") or object:IsA("CornerWedgePart") or object:IsA("TrussPart") then
                    object.Material = backup.Material
                    object.Reflectance = backup.Reflectance
                elseif object:IsA("Decal") or object:IsA("Texture") then
                    object.Transparency = backup.Transparency
                elseif object:IsA("ParticleEmitter") or object:IsA("Trail") then
                    object.Lifetime = backup.Lifetime
                elseif object:IsA("Explosion") then
                    object.BlastPressure = backup.BlastPressure
                    object.BlastRadius = backup.BlastRadius
                elseif object:IsA("Fire") or object:IsA("SpotLight") or object:IsA("Smoke") then
                    object.Enabled = backup.Enabled
                elseif object:IsA("MeshPart") then
                    object.Material = backup.Material
                    object.Reflectance = backup.Reflectance
                    object.TextureID = backup.TextureID
                elseif object:IsA("BlurEffect") or object:IsA("SunRaysEffect") or object:IsA("ColorCorrectionEffect") or object:IsA("BloomEffect") or object:IsA("DepthOfFieldEffect") then
                    object.Enabled = backup.Enabled
                end
            end
        end
    
        performanceBackup = {}
    end
    
    Miscs:AddToggle('PerformanceMode', {
        Text = 'Performance Mode',
        Default = false,
        Callback = function(state)
            if state then
                EnablePerformanceMode()
            else
                DisablePerformanceMode()
            end
        end
    })
    
    Miscs:AddToggle('Anti Fall', {
        Text = 'Anti Fall',
        Callback = function(ToggleState)
        if ToggleState then
            antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
            antifall.Velocity = Vector3.new(0, 0, 0)
        else
            if antifall then
                antifall:Destroy()
                antifall = nil
            end
        end
    end
    })
    
    local function NoclipFunction()
        task.wait()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
    end
    
    Miscs:AddToggle('Noclip', {
    Text = 'Noclip',
    Callback = function(ToggleState)
    NoclipEnabled = ToggleState
    while NoclipEnabled do
        NoclipFunction()
        task.wait()
    end
    for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide == false then
            part.CanCollide = true
        end
    end
    end
    })
    
    Miscs:AddToggle('Enable SkyWalk', {
        Text = 'Enable SkyWalk',
        Callback = function(isEnabled)
        pcall(function()
            local player = game.Players.LocalPlayer
            local stats = game:GetService("ReplicatedStorage")["Stats"..player.Name].Skills
            stats.skyWalk.Value = isEnabled
        end)
    end
    })
    
    local coatBubbleEnabled = false
    
    local function criarCoatBubble()
        pcall(function()
            local coatBubble = Instance.new('Part', game.Workspace.PlayerCharacters[plr.Name])
            coatBubble.Name = [[coatBubble]]
            coatBubble.AssemblyAngularVelocity = Vector3.new(0.000001464240085624624, -5.8524470941115e-15, 9.883792699838523e-07)
            coatBubble.AssemblyCenterOfMass = Vector3.new(5678.16650390625, 3.668407440185547, -16462.451171875)
            coatBubble.AssemblyLinearVelocity = Vector3.new(4.0199552131525706e-07, 0.00001299245468544541, -5.955385518063849e-07)
            coatBubble.AssemblyMass = 14.130248069763184
            coatBubble.BottomSurface = Enum.SurfaceType.Smooth
            coatBubble.BrickColor = BrickColor.new('Pastel Blue')
            coatBubble.CFrame = CFrame.new(5678.18994, 4.22468519, -16462.4727, 0.671212554, 0.0133095523, -0.741145372, 5.60245361e-09, 0.999838829, 0.0179551952, 0.741264939, -0.0120517546, 0.671104372)
            coatBubble.CanCollide = false
            coatBubble.CastShadow = false
            coatBubble.Color = Color3.new(0.501961, 0.733333, 0.858824)
            coatBubble.CurrentPhysicalProperties = PhysicalProperties.new(2.40300012, 0.25, 0.200000003, 1, 1)
            coatBubble.EnableFluidForces = false
            coatBubble.ExtentsCFrame = CFrame.new(5678.18994, 4.22468519, -16462.4727, 0.671212554, 0.0133095523, -0.741145372, 5.60245361e-09, 0.999838829, 0.0179551952, 0.741264939, -0.0120517546, 0.671104372)
            coatBubble.ExtentsSize = Vector3.new(1, 1, 1)
            coatBubble.Mass = 0
            coatBubble.Material = Enum.Material.Glass
            coatBubble.Reflectance = 5
            coatBubble.Rotation = Vector3.new(-1.5329999923706055, -47.82899856567383, -1.1360000371932983)
            coatBubble.Size = Vector3.new(1, 1, 1)
            coatBubble.TopSurface = Enum.SurfaceType.Smooth
            coatBubble.Transparency = 0.5
        end)
    end
    
    local function destruirCoatBubble()
        local coatBubble = game.Workspace.PlayerCharacters[plr.Name]:FindFirstChild("coatBubble")
        if coatBubble then
            coatBubble:Destroy()
        end
    end
    
    Miscs:AddToggle('Fruit Swim', {
        Text = 'Fruit Swim',
        Callback = function(enabled)
        coatBubbleEnabled = enabled
    
        if enabled then
            criarCoatBubble()
        else
            destruirCoatBubble()
        end
    end})

    
    
    local BypassEnabled1 = false
        
    local function BypassFunction1()
        pcall(function()
        local ohString1 = "Sky Walk2"
        local player = game.Players.LocalPlayer
        local ohTable2 = {
            ["char"] = workspace.PlayerCharacters[player.Name],
            ["cf"] = workspace.PlayerCharacters[player.Name].HumanoidRootPart.CFrame
        }
        
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)            
        task.wait(1)
    end)
    end

    Miscs:AddButton('Delete Lava', function()
        pcall(function()
            if workspace.Islands["Rose Kingdom"].Factory.Lava then
                workspace.Islands["Rose Kingdom"].Factory.Lava:Destroy()
                print("O objeto 'Lava' foi removido com sucesso.")
            else
                print("O objeto 'Lava' não foi encontrado.")
            end
            end)
    end)
    
    
    Teleports:AddToggle('Speed Bypass', {
        Text = 'Speed Bypass',
        Callback = function(ToggleState1)
        pcall(function()
        BypassEnabled1 = ToggleState1
        while BypassEnabled1 do
            BypassFunction1()
            wait()
        end
    end)
    end})
    
    Teleports:AddButton('Instant Teleport Fishman Cave', function()
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = CFrame.new(5639.86865, -92.762001, -16611.4688)
    end)

    local function Farm()
        pcall(function()
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Rifle")
        wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    
        getgenv().Speed = 125
        local finalDestination = CFrame.new(Vector3.new(7878, -2089, -17111))
        local tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new((finalDestination.p - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p).Magnitude / getgenv().Speed, Enum.EasingStyle.Linear),
            {CFrame = finalDestination}
        )
        tween:Play()
        tween.Completed:Wait()
    
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local function getAngleBetweenPoints(pointA, pointB)
            local direction = (pointB - pointA).unit
            local angle = math.deg(math.atan2(direction.Z, direction.X))
            return angle
        end
        local enemyHeadPosition = game:GetService("Workspace").NPCs["Fishman Karate User"].Head and game:GetService("Workspace").NPCs["Fishman Karate User"].Head.Position
        if enemyHeadPosition then
            local playerPosition = humanoidRootPart.Position
            local angleBetweenPositions = getAngleBetweenPoints(playerPosition, enemyHeadPosition)
            local adjustedAngles = CFrame.new(playerPosition, enemyHeadPosition).lookVector
            local argsReload = {
                [1] = "reload",
                [2] = {
                    ["Gun"] = "Rifle"
                }
            }
            game:GetService("ReplicatedStorage").Events.CIcklcon.gunFunctions:InvokeServer(unpack(argsReload))
            task.wait()
            local argsFire = {
                [1] = "fire",
                [2] = {
                    ["Start"] = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + adjustedAngles),
                    ["Gun"] = "Rifle",
                    ["joe"] = "true",
                    ["Position"] = enemyHeadPosition,
                    ["Angle"] = angleBetweenPositions,
            }
        }
        game:GetService("ReplicatedStorage").Events.CIcklcon:FireServer(unpack(argsFire))
    end   
    end)
    end
    
    local toggleActive = false
    
    Farming:AddToggle('Fishman No Quest (Rifle)', {
    Text = 'Fishman No Quest (Rifle)',
    Callback = function(active)
    pcall(function()
    toggleActive = active
    while toggleActive do
        Farm()
        task.wait()
    end
    end)
    end})

    local function SunaStack()
        pcall(function() 
            local ohString1 = "Desert Spada"
            local ohTable2 = {
                ["cf"] = CFrame.new()
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
            end)
    end
    
    local SunaDesertStack = false

    SunaSuna:AddToggle('Suna Stack (Desert Spada)', {
        Text = 'Suna Stack (Desert Spada)',
        Callback = function(active)
        pcall(function()
        SunaDesertStack = active
        while SunaDesertStack do
            SunaStack()
            task.wait()
        end
        end)
        end})

        SunaSuna:AddLabel('Desert Spada Release'):AddKeyPicker('KeyPicker', {
        Default = 'G',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function() 
                local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                local playerName = game.Players.LocalPlayer.Name
                local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Suna-Suna.Desert Spada"
            
                for i, remote in ipairs(remotes) do
                    if remote.Name == remoteName then
                        pcall(function()
                            local args = {
                                [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            }
            
                            remote:FireServer(unpack(args))
                        end)
                    end
                end
            end)            
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })

    local function GomuBloon()
        pcall(function()
        local ohString1 = "Gomu-Gomu no Balloon"
        local ohTable2 = {
            ["cf"] = CFrame.new()
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
        end)
        end
        
        GomuGomu:AddToggle('Gomu -50% Damage', {
            Text = 'Gomu -50% Damage',
            Callback = function(GomuBallon)
                    pcall(function()
                    toggleActive = GomuBallon
                    while toggleActive do
                    GomuBloon()
                    task.wait()
                end
            end)
        end})


        local function GomuInsta()
            pcall(function()
                local ohString1 = "Gomu-Gomu no Gatling"
                local ohTable2 = {
                    ["cf"] = CFrame.new()
                }
                
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
        end)
    end
    
    GomuGomu:AddToggle('Gomu Auto Gatling (Instant Gatling)', {
        Text = 'Gomu Auto Gatling (Instant Gatling)',
        Callback = function(GomuGatling)
                pcall(function()
                toggleActive = GomuGatling
                while toggleActive do
                GomuInsta()
                task.wait()
            end
        end)
    end})

    local function GomuPistolAim()
        pcall(function()
            local ohString1 = "Gomu-Gomu no Pistol"
            local player = game.Players.LocalPlayer
            local playerCharacter = game.Workspace.PlayerCharacters[player.Name]
            local humanoidRootPart = playerCharacter:WaitForChild("HumanoidRootPart")
            local function getDistance(point1, point2)
                return (point1 - point2).Magnitude
            end
            local closestPlayer = nil
            local closestDistance = 125
            for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherCharacter = game.Workspace.PlayerCharacters[otherPlayer.Name]
                    local otherHumanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                    if otherHumanoidRootPart then
                        local distance = getDistance(humanoidRootPart.Position, otherHumanoidRootPart.Position)
                        if distance <= closestDistance then
                            closestPlayer = otherPlayer
                            closestDistance = distance
                        end
                    end
                end
            end
            if closestPlayer then
                local ohTable2 = {
                    ["targetCF"] = humanoidRootPart.CFrame,
                    ["armCF"] = humanoidRootPart.CFrame,
                    ["handCF"] = humanoidRootPart.CFrame,
                    ["target"] = game.Workspace.PlayerCharacters[closestPlayer.Name],
                    ["cf"] = humanoidRootPart.CFrame
                }
        
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
            end
        end)    
        end

        GomuGomu:AddToggle('Gomu Auto Attack Closest Player (Instant Pistol)', {
            Text = 'Gomu Auto Attack Closest Player (Instant Pistol)',
            Callback = function(GomuPistol)
                pcall(function()
            toggleActive = GomuPistol
            while toggleActive do
                GomuPistolAim()
                task.wait()
            end
        end)
    end})


local function MeraHikenS()
                pcall(function()
                    local args = {
                        [1] = "Hiken"
                    }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

MeraMera:AddToggle('Mera Hiken Stack', {
                Text = 'Mera Hiken Stack',
                Callback = function(MeraHikenStack)
                pcall(function()
                toggleActive = MeraHikenStack
                while toggleActive do
                    MeraHikenS()
                    task.wait()
                end
            end)
        end})

        MeraMera:AddLabel('Mera Hiken Release'):AddKeyPicker('KeyPicker', {
            Default = '',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Test',
            NoUI = false,
            Callback = function()
                pcall(function()
                    local players = game:GetService("Players"):GetPlayers()
                    local remotePath = "ServerScriptService.Skills.Skills.SkillContainer.Mera-Mera.Hiken"
        
                    for _, player in ipairs(players) do
                        local playerRemote = game:GetService("ReplicatedStorage").PlayerRemotes:FindFirstChild(player.Name .. "|" .. remotePath)
        
                        if playerRemote then
                            playerRemote:InvokeAllAsync()
                        else
                            -- Faz nada
                        end
                    end
                end)
            end,
            ChangedCallback = function(New)
                print('Keybind changed!', New)
            end
        })
        
        local function MeraPillarS()
            pcall(function()
        local args = {
            [1] = "Flame Pillar"
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
        end

MeraMera:AddToggle('Mera Pillar Stack', {
            Text = 'Mera Pillar Stack',
            Callback = function(MeraPillarStack)
            pcall(function()
            toggleActive = MeraPillarStack
            while toggleActive do
            MeraPillarS()
            task.wait()
        end
    end)
end})

MeraMera:AddLabel('Mera Pillar Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local players = game:GetService("Players"):GetPlayers()
            local remotePath = "ServerScriptService.Skills.Skills.SkillContainer.Mera-Mera.Flame Pillar"

            for _, player in ipairs(players) do
                local playerRemote = game:GetService("ReplicatedStorage").PlayerRemotes:FindFirstChild(player.Name .. "|" .. remotePath)

                if playerRemote then
                    playerRemote:InvokeAllAsync()
                else
                    -- Faz nada
                end
            end
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function PikaLungeS()
    pcall(function()
        local ohString1 = "Light Lunge"
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1)
        end)
    end
    
    PikaPika:AddToggle('Pika Lunge Stack', {
        Text = 'Pika Lunge Stack',
        Callback = function(PikaLunge)
                pcall(function()
                toggleActive = PikaLunge
                while toggleActive do
                    PikaLungeS()
            task.wait()
        end
    end)
end})

PikaPika:AddLabel('Light Lunge Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")

            local function encontrarJogadorMaisProximo()
                local players = Players:GetPlayers()
                local currentPlayer = Players.LocalPlayer
                local closestPlayer = nil
                local shortestDistance = 100

                for _, player in ipairs(players) do
                    if player ~= currentPlayer then
                        local character = player.Character
                        if character and character:FindFirstChild("Humanoid") then
                            local distance = (currentPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end

                return closestPlayer
            end

            local players = Players:GetPlayers()

            for _, plr in ipairs(players) do
                local closestPlayer = encontrarJogadorMaisProximo()

                if closestPlayer then
                    local args = {
                        [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    }

                    local skillName = plr.name .. "|ServerScriptService.Skills.Skills.SkillContainer.Pika-Pika.Light Lunge"

                    local remote = ReplicatedStorage.PlayerRemotes:FindFirstChild(skillName)

                    if remote then
                        remote:FireServer(unpack(args))
                    end
                end
            end
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function PikaKickS()
    pcall(function()
        local args = {
            [1] = "Light Kick"
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        task.wait()
        end)
    end
    
PikaPika:AddToggle('Pika Kick Stack', {
        Text = 'Pika Kick Stack',
        Callback = function(PikaKickStack)
                pcall(function()
                toggleActive = PikaKickStack
                while toggleActive do
            PikaKickS()
            task.wait()
        end
    end)
end})

PikaPika:AddLabel('Pika Kick Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local skillFolder = game:GetService("ReplicatedStorage").PlayerRemotes
            local player = game.Players.LocalPlayer
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart then
                local position = humanoidRootPart.Position

                for _, skillItem in ipairs(skillFolder:GetChildren()) do
                    pcall(function()
                        local args = {
                            [1] = position,
                            [2] = CFrame.new(position + Vector3.new(0, 5, 0)) * CFrame.Angles(-3.002415418624878, -0.557424008846283, 2.430689811706543)
                        }

                        skillItem:FireServer(unpack(args))
                    end)
                end
            else
                warn("HumanoidRootPart not found!")
            end
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function InfRay()
    pcall(function()
        local args = {
        [1] = "Light Ray",
        [2] = {
            ["pos"] = Vector3.new(9475.990234375, 12.788227081298828, -7034.09814453125)
        }
    }
    
    game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

PikaPika:AddToggle('Pika Infinite LightRay', {
    Text = 'Pika Infinite LightRay',
    Callback = function(InfiniteRay)
    pcall(function()
        toggleActive = InfiniteRay
        while toggleActive do
            InfRay()
            task.wait(10)
        end
    end)
end})

local function PawCannonS()
    pcall(function()
        local args = {
            [1] = "Paw Cannon",
            [2] = CFrame.new(-0, 0, -0) * CFrame.Angles(-0.0215043593198061, 0.4616168439388275, 0.015874940901994705)
        }
        
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

PawPaw:AddToggle('Paw Cannon Stack', {
    Text = 'Paw Cannon Stack',
    Callback = function(PawCannonStack)
    pcall(function()
        toggleActive = PawCannonStack
        while toggleActive do
            PawCannonS()
            task.wait()
        end
    end)
end})

PawPaw:AddLabel('Paw Cannon Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local player = game.Players.LocalPlayer
            local playerName = player.Name
            local humanoidRootPart = player.Character.HumanoidRootPart
            local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
            local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
            local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Paw-Paw.Paw Cannon"
            local args = {
                [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
            }
            remotes:FindFirstChild(eventName):FireServer(unpack(args))
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function PawBombS()
    pcall(function()
        local args = {
            [1] = "Paw Bomb",
            [2] = CFrame.new(0, 0, 0) * CFrame.Angles(-1.2786227464675903, -0.8662163615226746, -1.19479238986969)
        }
        
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

PawPaw:AddToggle('Paw Bomb Stack', {
    Text = 'Paw Bomb Stack',
    Callback = function(PawBombStack)
    pcall(function()
        toggleActive = PawBombStack
        while toggleActive do
            PawBombS()
            task.wait()
        end
    end)
end})

PawPaw:AddLabel('Paw Bomb Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local player = game.Players.LocalPlayer
            local playerName = player.Name
            local humanoidRootPart = player.Character.HumanoidRootPart
            local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
            local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
            local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Paw-Paw.Paw Bomb"
            local args = {
                [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
            }
            remotes:FindFirstChild(eventName):FireServer(unpack(args))
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function YukiSnowGustS()
    pcall(function()
        local args = {
            [1] = "Snow Gust"
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

YukiYuki:AddToggle('Yuki Snow Gust Stack', {
    Text = 'Yuki Snow Gust Stack',
    Callback = function(YukiGustStack)
pcall(function()
    toggleActive = YukiGustStack
    while toggleActive do
        YukiSnowGustS()
        task.wait()
    end
end)
end})

YukiYuki:AddLabel('Snow Gust Release'):AddKeyPicker('KeyPicker', {
    Default = '',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Test',
    NoUI = false,
    Callback = function()
        pcall(function()
            local player = game.Players.LocalPlayer
            local playerName = player.Name
            local humanoidRootPart = player.Character.HumanoidRootPart
            local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
            local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
            local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Yuki-Yuki.Snow Gust"
            local args = {
                [1] = CFrame.new(position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            }
            remotes:FindFirstChild(eventName):FireServer(unpack(args))
        end)
    end,
    ChangedCallback = function(New)
        print('Keybind changed!', New)
    end
})

local function YukiSnowStormStack()
    pcall(function()
        local args = {
            [1] = "Snow Storm"
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
    end)
end

local function YukiSnowStormStop()
    pcall(function()
        local player = game.Players.LocalPlayer
        local playerName = player.Name
        local humanoidRootPart = player.Character.HumanoidRootPart
        local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
        local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
        local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Yuki-Yuki.Snow Storm"
        local args = {
            [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
        }
        remotes:FindFirstChild(eventName):FireServer(unpack(args))
    end)
end

local isYukiSnowStormActive = false

local function StartYukiSnowStormLoop()
    pcall(function()
    while isYukiSnowStormActive do
        YukiSnowStormStack()
        task.wait()
    end
end)
end

YukiYuki:AddToggle('Infinite Yuki Snow Storm', {
    Text = 'Infinite Yuki Snow Storm',
    Callback = function(toggleState)
    isYukiSnowStormActive = toggleState
    pcall(function()
    if isYukiSnowStormActive then
        StartYukiSnowStormLoop()
    else
        YukiSnowStormStop()
    end
end)
end})

local function HieAttack()
    pcall(function()
        local ohString1 = "Ice Partisan"
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local playerPosition = humanoidRootPart.Position
        local playerOrientation = humanoidRootPart.CFrame:pointToObjectSpace(playerPosition)
        local newCF = CFrame.new(
            playerPosition + Vector3.new(0, 6, 0),
            playerPosition + playerOrientation * Vector3.new(0, 0, -1)
        )
        local ohTable2 = {
            ["cf"] = newCF
        }
    game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
end)
end

local toggleActive1 = false

HieHie:AddToggle('Hie Auto Attack', {
Text = 'Hie Auto Attack',
Callback = function(active1)
pcall(function()
toggleActive1 = active1
while toggleActive1 do
HieAttack()
task.wait(.3)
end
end)
end})

local function OpeKill()
    pcall(function()
        local ohString1 = "Radio Knife"
        local ohTable2 = {
            ["cf"] = CFrame.new()
        }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
    end)
end

local OpeInstaKill = false

OpeOpe:AddToggle('Ope Insta Kill', {
    Text = 'Ope Insta Kill',
    Callback = function(active)
    pcall(function()
        OpeInstaKill = active
    while OpeInstaKill do
        OpeKill()
        task.wait()
    end
    end)
    end})

    Library:OnUnload(function()
       print('Unloaded!')
       Library.Unloaded = true
    end)
    
    MenuGroup:AddButton('Unload', function() Library:Unload() end)
    MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'LeftControl', NoUI = true, Text = 'Menu keybind' })
    
    Library.ToggleKeybind = Options.MenuKeybind
    
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    
    SaveManager:IgnoreThemeSettings()
    
    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
    
    SaveManager:SetFolder('UniverseHub')
    
    end)
