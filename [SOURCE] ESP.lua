local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Private Hub [W]", HidePremium = false, SaveConfig = false, IntroText ="Private ESP", ConfigFolder = "OrionTest"})


getgenv().cham = false
getgenv().nameESP = false
getgenv().boxESP = false
getgenv().esp_loaded = false
getgenv().Visibility = false


local ESPTab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


ESPTab:AddToggle({
	Name = "Enable ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().Visibility = Value
	end    
})

ESPTab:AddToggle({
	Name = "Enable Box ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().boxESP = Value
	end    
})

ESPTab:AddToggle({
	Name = "Enable Name ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().nameESP = Value
	end    
})

ESPTab:AddToggle({
	Name = "Enable Chams ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().cham = Value
	end    
})

ESPTab:AddToggle({
    Name = "Enable Team Color",
    Default = false,
    Callback = function(Value)
        getgenv().useTeamColor = Value
    end
})


local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CreditsTab:AddParagraph("Credits","! Ly#4099")

CreditsTab:AddButton({
	Name = "Destroy GUI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})


OrionLib:MakeNotification({
	Name = "Private Hub",
	Content = "Enjoy destroying kids now :))",
	Image = "rbxassetid://4483345998",
	Time = 3.5
})


OrionLib:Init()



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