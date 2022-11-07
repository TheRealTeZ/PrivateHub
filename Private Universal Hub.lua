getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Private Universal Hub",
	LoadingTitle = "Loading Private Universal Hub",
	LoadingSubtitle = "by ! Ly#0010",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Private Hub Configurations",
		FileName = "Private Universal Configs"
	},
        Discord = {
        	Enabled = false,
        	Invite = "",
        	RememberJoins = false
        },
	KeySystem = true,
	KeySettings = {
		Title = "Private Universal Hub",
		Subtitle = "Key System",
		Note = "Ask ! Ly#0010 for Key",
		FileName = "PrivateHubKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "PRUniversal"
	}
})

-- Variables

local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = game:GetService('HttpService')
local player = game.Players.LocalPlayer
local workspace = game.Workspace


-- Functions


function getPlayers()
    local table1 = {}
    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(table1, v.Name)
    end
    game.Players.PlayerAdded:Connect(
        function(a) table.insert(table1, a.Name) end)
    game.Players.PlayerRemoving:Connect(function(a)
        for i, v in pairs(table1) do
            if v == a.Name then table.remove(table1, i) end
        end
    end)
    return table1
end


local PlayerTab = Window:CreateTab("Player", 4483362458)


local Slider = PlayerTab:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 1000},
	Increment = 1,
	Suffix = "Walk Speed Value",
	CurrentValue = 16,
	Flag = "WalkSpeed",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "Jump Power",
	Range = {50, 1000},
	Increment = 1,
	Suffix = "Jump Power Value",
	CurrentValue = 50,
	Flag = "JumpPower",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "[BROKEN] Hip Height",
	Range = {1, 350},
	Increment = 1,
	Suffix = "Hip Height Value",
	CurrentValue = 1,
	Flag = "HipHeight",
	Callback = function(Value)
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "Camera Zoom",
	Range = {120, 1500},
	Increment = 1,
	Suffix = "Camera Zoom Value",
	CurrentValue = 120,
	Flag = "CameraZoom",
	Callback = function(Value)
        game.Players.LocalPlayer.CameraMaxZoomDistance = Value
	end,
})

local Dropdown = PlayerTab:CreateDropdown({
	Name = "[BROKEN] TP to Players",
	Options = getPlayers(),
	CurrentOption = getPlayers()[1],
	Flag = "PlayerTP",
	Callback = function(Option)
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
            game:GetService("Players")[v].Character.HumanoidRootPart.CFrame
	end,
})



local ESPTab = Window:CreateTab("ESP", 4483362458)



getgenv().cham = false
getgenv().nameESP = false
getgenv().boxESP = false
getgenv().esp_loaded = false
getgenv().Visibility = false



local Toggle = ESPTab:CreateToggle({
	Name = "Enable ESP",
	CurrentValue = false,
	Flag = "Enable ESP",
	Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().Visibility = Value
	end,
})

local Toggle = ESPTab:CreateToggle({
	Name = "Enable Box ESP",
	CurrentValue = false,
	Flag = "Box ESP",
	Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().boxESP = Value
	end,
})

local Toggle = ESPTab:CreateToggle({
	Name = "Enable Name ESP",
	CurrentValue = false,
	Flag = "Name ESP",
	Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().nameESP = Value
	end,
})

local Toggle = ESPTab:CreateToggle({
	Name = "Enable Chams ESP",
	CurrentValue = false,
	Flag = "Chams ESP",
	Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().cham = Value
	end,
})

local Toggle = ESPTab:CreateToggle({
	Name = "Enable Team Color",
	CurrentValue = false,
	Flag = "Team Color",
	Callback = function(Value)
        getgenv().useTeamColor = Value
	end,
})



local ServerTab = Window:CreateTab("Server", 4483362458)



local Toggle = ServerTab:CreateToggle({
	Name = "Full-Bright",
	CurrentValue = false,
	Flag = "FullBright",
	Callback = function(Value)
        if not _G.FullBrightExecuted then

            _G.FullBrightEnabled = true

            _G.NormalLightingSettings = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }

            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)

            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)

            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)

            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)

            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)

            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

            local LatestValue = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= LatestValue then
                        if not _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        else
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        end
                        LatestValue = not LatestValue
                    end
                end
            end)
        end

        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled
	end,
})

local Button = ServerTab:CreateButton({
	Name = "Rejoin Game",
	Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end,
})

local Button = ServerTab:CreateButton({
	Name = "Server Hop",
	Callback = function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

        module:Teleport(game.PlaceId)
	end,
})



local MiscTab = Window:CreateTab("Misc", 4483362458)



local Slider = MiscTab:CreateSlider({
	Name = "FPS Cap",
	Range = {0, 100},
	Increment = 10,
	Suffix = "Value",
	CurrentValue = 10,
	Flag = "FPSCap",
	Callback = function(fpsCap1)
        setfpscap(fpsCap1)
	end,
})

local Destroy GUI = MiscTab:CreateButton({
	Name = "Destroy GUI",
	Callback = function()
        Rayfield:Destroy()
	end,
})


local CreditsTab = Window:CreateTab("Credits", 4483362458)

local Paragraph = CreditsTab:CreateParagraph({Title = "Script Maker", Content = "Enzo"})
local Paragraph = CreditsTab:CreateParagraph({Title = "ESP Maker", Content = "Locus"})
local Paragraph = CreditsTab:CreateParagraph({Title = "UI Maker", Content = "Shlexware"})


Rayfield:LoadConfiguration()


game.Players.PlayerAdded:Connect(
    RayFieldLib.Flags["PlayerTP"]:Refresh(getPlayers(),true)
)

game.Players.PlayerRemoving:Connect(
    RayField.Flags["PlayerTP"]:Refresh(getPlayers(),true)
)


local MetamethodHolder = {
    AntiFlag = nil
}

MetamethodHolder.AntiFlag = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    if tostring(Method) == "PreloadAsync" and not checkcaller() then
        return
    end    
   
    return MetamethodHolder.AntiFlag(self, ...)    
end)
