-- global variables
local ammo = 10
local times = 30
local wsA = 16
local jpA = 50
local loopWS = false
local loopJP = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "cool",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "",
   LoadingSubtitle = "by hyzh",
   ShowText = "cool", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "0x01"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local sound = Instance.new("Sound", workspace)
                    sound.SoundId = "rbxassetid://4590662766"
                    sound.Volume = _G.VolumeTime or 2
                    sound.PlayOnRemove = true
                    sound:Destroy()
Rayfield:Notify({
   Title = "Welcome!",
   Content = "you now can mooooov",
   Duration = 6.5,
   Image = 4483362458,
})

local Tab = Window:CreateTab("coooooool", 4483362458) -- Title, Image

local Slider = Tab:CreateSlider({
   Name = "ammo",
   Range = {0, 100},
   Increment = 1,
   Suffix = "ammo",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   ammo = Value
   end,
})

local Input = Tab:CreateInput({
   Name = "ammount",
   CurrentValue = "0",
   PlaceholderText = "for more precise ammounts",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   ammo = Text
   end,
})

local Inpu2t = Tab:CreateInput({
   Name = "times youll be moved forward",
   CurrentValue = "30",
   PlaceholderText = "the times",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
   times = Text
   end,
})

local Button = Tab:CreateButton({
   Name = "mooooooove",
   Callback = function()

    

    local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local camera = game.Workspace.CurrentCamera
        local teleportDirection = camera.CFrame.LookVector

      
        for i = 1, ammo do
            local newPosition = humanoidRootPart.Position + teleportDirection * times
            
            character:SetPrimaryPartCFrame(CFrame.new(newPosition))

            local newPosition = humanoidRootPart.Position + Vector3.new(0, 5, 0)

            character:SetPrimaryPartCFrame(CFrame.new(newPosition))
            wait(0.01)
        end


   end,
})

--Idk
local Tab2 = Window:CreateTab("sum other things", 4483362458)

local InputWS = Tab2:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
   PlaceholderText = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
   RemoveTextAfterFocusLost = false,
   Flag = "InputWS",
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Text
   wsA = Text
   end,
})

local InputJP = Tab2:CreateInput({
   Name = "JumpPower",
   CurrentValue = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
   PlaceholderText = game.Players.LocalPlayer.Character.Humanoid.JumpHeight,
   RemoveTextAfterFocusLost = false,
   Flag = "InputJP",
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Text
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = Text
   jpA = Text
   end,
})

local KYSBtn = Tab2:CreateButton({
   Name = "reset character",
   Callback = function()
   game.Players.LocalPlayer.Character.Humanoid.Health = -1
   end,
})

local LToggleWS = Tab2:CreateToggle({
   Name = "Loop WalkSpeed",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
   loopWS = Value
   end,
})

local LToggleJP = Tab2:CreateToggle({
   Name = "Loop JumpPower",
   CurrentValue = false,
   Flag = "Toggle2", 
   Callback = function(Value)
   loopJP = Value
   end,
})





--inf loop for sum toggles that make loops
--IF IT AINT AT THE END THEUI WONT LOAD

while 1 == 1 do
   if loopWS == true then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = wsA
      print("loopin ws")
   end
   if loopJP == true then
      game.Players.LocalPlayer.Character.Humanoid.JumpHeight = jpA
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = jpA
      print("loopin jp")
   end
   wait(1.2)
end
