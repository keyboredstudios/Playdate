import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

function playdate.update()
    gfx.clear()

    local percent = playdate.getCrankPosition() / 360
    gfx.fillRect(0, 0,  400 * percent, 10)
end
