local ammo = 10



local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "cool",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "",
   LoadingSubtitle = "by hyzh",
   ShowText = "cool", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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

local Button = Tab:CreateButton({
   Name = "mooooooove",
   Callback = function()

    

    local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local camera = game.Workspace.CurrentCamera
        local teleportDirection = camera.CFrame.LookVector

      
        for i = 1, ammo do
            local newPosition = humanoidRootPart.Position + teleportDirection * 30
            
            character:SetPrimaryPartCFrame(CFrame.new(newPosition))

            local newPosition = humanoidRootPart.Position + Vector3.new(0, 5, 0)

            character:SetPrimaryPartCFrame(CFrame.new(newPosition))
            wait(0.01)
        end


   end,
})
