--!nocheck
--!nolint

local Files = {
    {
        Name = "AR2",
        Load = require("Games/AR2/Init.luau"),
        Places = {
            358276974,
            863266079
        }
    }
}

for _, Data in pairs(Files) do
    if Data.Places then
        for _, PlaceId in ipairs(Data.Places) do
            if PlaceId == game.PlaceId then
                return Data:Load()
            end
        end
    end
end