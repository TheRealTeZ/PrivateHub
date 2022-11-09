local CoreGui = game:GetService("StarterGui")

local GameTable = {
    [6911148748] = "https://raw.githubusercontent.com/TheRealTeZ/PrivateHub/main/Car%20Driving%20Indonesia.lua",
    [9872472334] = "https://raw.githubusercontent.com/TheRealTeZ/PrivateHub/main/Evade.lua",
    [9498006165] = "https://raw.githubusercontent.com/TheRealTeZ/PrivateHub/main/Tapping%20Simulator.lua",
}




if GameTable[game.PlaceId] == nil then
    CoreGui:SetCore("SendNotification", {
        Title = "Game not supported.";
        Text = "Copy discord to clipboard.";
        Duration = 3;
    })
    
    task.delay(2, function()
        setclipboard("https://discord.gg/Scwmb8vn")
            CoreGui:SetCore("SendNotification", {
            Title = "Loading";
            Text = "Game was not supported so its now loading Private Universal Hub.";
            Duration = 3;
        })
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/TheRealTeZ/PrivateHub/main/Private%20Universal%20Hub.lua"), true))()
    end)
else
    CoreGui:SetCore("SendNotification", {
        Title = "Discord";
        Text = "We would appreciate if you joined our discord (Copied)";
        Duration = 10;
    })
    setclipboard("https://discord.gg/Scwmb8vn")
    loadstring(game:HttpGet(GameTable[game.PlaceId]))()
end
