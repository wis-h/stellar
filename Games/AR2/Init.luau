--!nocheck
--!nolint

return function(AR2)
    repeat task.wait() until game:IsLoaded()
    if StellarLoaded then return end

    for i,v in next, getconnections(game:GetService("ScriptContext").Error) do v:Disable() end

    local Functions = require("Core/Functions.luau")
    local Interface = require("Core/Interface.luau")
    local GetService: ServiceProvider = Functions.SecureService

    local Workspace: Workspace = GetService("Workspace")
    local Players: Players = GetService("Players")
    local ReplicatedFirst: ReplicatedFirst = GetService("ReplicatedFirst")
    local ReplicatedStorage: ReplicatedStorage = GetService("ReplicatedStorage")

    local LocalPlayer: Player = Functions.GetPlayer()
    local PlayerMouse: Mouse = LocalPlayer:GetMouse()
    local PlayerCharacter: {} = nil

    local Firearm = require(ReplicatedStorage.Client.Abstracts.ItemInitializers.Firearm)
    local Framework = require(ReplicatedFirst.Framework)
    Framework:WaitForLoaded()

    local PlayerClass = Framework.require("Classes", "Players").get()
    repeat task.wait() until PlayerClass.Character do PlayerCharacter = PlayerClass.Character end
    PlayerClass.CharacterAdded:Connect(function(c) PlayerCharacter = c end)

    local Network = Framework.require("Libraries", "Network")
    local Bullets = Framework.require("Libraries", "Bullets")
    local Discovery = Framework.require("Libraries", "Discovery")
    local Characters = Framework.require("Classes", "Characters")

    local Events = debug.getupvalue(Network.Add, 1)
    local FireBullet = debug.getupvalue(Firearm, 9)
    local AnimatedReload = debug.getupvalue(Firearm, 7)

    local SquadData = {}



    getgenv().StellarLoaded = true
end
