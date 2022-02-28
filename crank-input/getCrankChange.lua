import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

local x = 0
local y = 120
local speed = 1

function playdate.update()
    gfx.clear()

    x += speed

    local change, acceleratedChange = playdate.getCrankChange()
    speed += change / 100
    -- speed += acceleratedChange / 100

    gfx.fillRect(x, y, 10, 10)
end
