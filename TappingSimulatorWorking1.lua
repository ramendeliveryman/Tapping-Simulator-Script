local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Delivery Cheats", "Serpent")


-- Main


local Main = Window:NewTab("Autofarmer")
local MainSection = Main:NewSection("AutoClicker")
local EggSection = Main:NewSection("AutoEggs")
local RebirthSection = Main:NewSection("AutoRebirths")
local UpgradeSection = Main:NewSection("AutoUpgrades")


MainSection:NewToggle("AutoClicker", "Farms Clicks", function(state)
    if state then
        spawn(function()
			getgenv().autoTap = true;
			while wait() do
				if getgenv().autoTap == true then
					game:GetService("ReplicatedStorage").Events.Tap:FireServer()
				end
			end
		end)
    else
        spawn(function()
			getgenv().autoTap = false;
		end)
    end
end)


-- Upgrades


local SelectedUp = "Basic"
local Upgrades = {
	jumpup = "jumps",
	rebup = "rebirthUpgrades",
	gemup = "gemMultiplierUpgrade",
	storageup = "storageUpgrade"
}


UpgradeSection:NewDropdown("Choose an Upgrade", "Choose an Upgrade you want to buy", Upgrades, function (currentOption)
	SelectedUp = currentOption
end)

UpgradeSection:NewToggle("Auto Upgrader", "Buys chosen Upgrade automatically", function(state)
    if state then
        spawn(function()
			getgenv().autoUp = true;
			while wait() do
				if getgenv().autoUp == true then
					local args = {[1] = SelectedUp}
					game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))
				end
			end
		end)	
    else
        spawn(function()
			getgenv().autoUp = false;
		end)		
    end
end)

UpgradeSection:NewButton("Upgrade", "Buys chosen Upgrade", function ()
	local args = {[1] = SelectedUp}
	game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))
end)


-- Eggs


local SelectedEgg = "Basic"
local Eggs = {
	BeachE = "Beach Egg",
	CloudE = "Cloud Egg",
	CoralE = "Coral Egg",
	BeeE = "Bee Egg",
	DeathE = "Death Egg",
	DesertE = "Desert Egg",
	DominusE = "Dominus Egg",
	ForestE = "Forest Egg",
	JungeE = "Jungle Egg",
	MineE = "Mine Egg",
	SnowE = "Snow Egg",
	WoodE = "Wood Egg",
	SwampE = "Swamp Egg",
	StarterE = "Starter",
	DarkE = "Dark Egg",
	MagmaE = "Magma Egg",
	UnderWorldE = "Underworld Egg",
	FireE = "Fire Egg",
	MoltenE = "Molten Egg",



}


EggSection:NewDropdown("Choose an Egg", "Choose an Egg you want to buy", Eggs, function(currentOption)
	SelectedEgg = currentOption
end)

EggSection:NewToggle("Auto Egg", "Buys automatically the selected Egg", function(state)
	if state then
        spawn(function()
			getgenv().autoEgg = true;
			while wait() do
				if getgenv().autoEgg == true then
					local args = {[1] = {},[2] = SelectedEgg,[3] = 1}
					game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
				end
			end
		end)
    else
        spawn(function()
			getgenv().autoEgg = false;
		end)
    end	
end)

EggSection:NewButton("Buy Egg", "Buys chosen Egg", function ()
	local args = {[1] = {},[2] = SelectedEgg,[3] = 1}
	game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
end)


-- Rebirth


local SelectedReb = "Basic"
local Rebs = {
	autoReb = 1,
	autoReb5 = 5,
	autoReb10 = 10,
	autoReb20 = 20,
	autoReb100 = 100,
	autoReb500 = 500,
	autoReb2000 = 2000,
	autoReb4500	 = 4500,
}


RebirthSection:NewDropdown("Value for Rebirth", "Chooses a value for your Rebirth amount", Rebs, function(currentOption)
	SelectedReb = currentOption
end)

RebirthSection:NewToggle("Auto Rebirth", "automatically rebirths chosen value", function (state)
	if state then
        spawn(function()
			getgenv().autoReb = true;
			while wait() do
				if getgenv().autoReb == true then
					local args = {[1] = SelectedReb}
					game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
				end
			end
		end)
    else
        spawn(function()
			getgenv().autoReb = false;
		end)
    end		
end)

RebirthSection:NewButton("Rebirth", "buys chosen Rebirth", function()
	local args = {[1] = SelectedReb}
	game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
end)


-- Player


local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")


PlayerSection:NewSlider("WalkSpeed", "SPEED!!!", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump Power", "JUMPPP!!", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


PlayerSection:NewButton("Anti AFK", "Prevents from getting Kicked ", function()
    print("Clicked")
end)


-- Teleporter


local Teleporter = Window:NewTab("Teleporter")
local TeleporterSection = Teleporter:NewSection("Teleporter")
local Islands = {
	Forest = "ForestIsland",
	Flower = "FlowerIsland",
	Swamp = "SwampIsland",
	Snow = "SnowIsland",
	Desert = "DesertIsland",
	Death = "DeathIsland",
    Beach = "BeachIsland",
	Crystal = "CrystalIsland",
	Cloud = "CloudIsland",
	Coral = "WaterIsland",
	DarkHeart = "DemonIsland",
	Dominus = "DominusIsland",
	Magma = "MagmaIsland"
}


TeleporterSection:NewButton("Unlock all Islands", "Teleports to all Islands", function()  
	for _,v in pairs(game:GetService("Workspace").Islands:GetChildren()) do
		if not v:FindFirstChild("Path") then
        	continue
   		end
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Path:GetModelCFrame()
		wait(0.5)
	end
end)

TeleporterSection:NewButton("Spawn", "Teleports to Spawn", function ()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 15, -481)
end)
	


TeleporterSection:NewButton("FlameHeart Island", "Teleports to FlameHeart Island", function ()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1276, 156, -2859)
end)
	

TeleporterSection:NewButton("Magma Boss", "Teleports to Magma Boss", function ()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1508, 290, -2635)
end)




TeleporterSection:NewDropdown("Teleport to an Island", "Choose a Island", Islands, function(currentOption)
    local Is = game:GetService("Workspace").Islands
	local CFrame = Is[currentOption].Path:GetModelCFrame()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
end)


-- Settings


local Settings = Window:NewTab("Settings")
local SettingsSection = Settings:NewSection("Settings")



SettingsSection:NewKeybind("UIToggle", "Opens up the UI with a Hotkey", Enum.KeyCode.RightAlt, function()
	Library:ToggleUI()
end)


local SelectedTheme = "Basic"
local Themes = {
	Light = "LightTheme",
	Dark =	"DarkTheme",
	Grape =	"GrapeTheme",
	Blood ="BloodTheme",
	Ocean = "Ocean",
	Midnight = "Midnight",
	Sentinel = "Sentinel",
	Synapse	= "Synapse",
	Serpent	= "Serpent",
}

