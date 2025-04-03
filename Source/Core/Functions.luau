--!nocheck
--!nolint

local Functions = {}

Functions.SecureService = function(service: string): ServiceProvider
    local _game = cloneref and cloneref(game) or game
    local success, result = pcall(function()
        return cloneref and cloneref(_game:GetService(service)) or _game:GetService(service)
    end)
    return success and result or nil
end; Functions.SecureService = newcclosure and newcclosure(Functions.SecureService) or Functions.SecureService

type FunctionCallback = () -> nil
Functions.SafeHook = function(func: FunctionCallback, callback: FunctionCallback): nil
    if isfunctionhooked(func) then restorefunction(func) end
    return hookfunction(func, newcclosure(callback))
end

function Functions.GetPlayer(): Player?
    local success, result = pcall(function()
        return Functions.SecureService("Players") :: ServiceProvider
    end)
    return success and (result :: Players).LocalPlayer or nil
end

return Functions