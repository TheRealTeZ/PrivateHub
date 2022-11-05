getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Private ESP",
	LoadingTitle = "! Ly Private ESP",
	LoadingSubtitle = "by Jesus",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "",
        	RememberJoins = false
        },
	KeySystem = true,
	KeySettings = {
		Title = "PrivateESP",
		Subtitle = "Private Key System",
		Note = "Ask ! Ly#0010 for Key",
		FileName = "PrivateKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "PrivateESP"
	}
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
	Flag = "Toggle1",
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
	Flag = "Toggle1",
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
	Flag = "Toggle1",
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
	Flag = "Toggle1",
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
	Flag = "Toggle1",
	Callback = function(Value)
		getgenv().useTeamColor = Value
	end,
})















local CreditsTab = Window:CreateTab("Credits", 4483362458)


local Button = CreditsTab:CreateButton({
	Name = "Destroy GUI",
	Callback = function()
		Rayfield:Destroy()
	end,
})







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
