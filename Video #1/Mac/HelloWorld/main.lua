import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

local posX = 0
local posY = 0

function playdate.update()
    gfx.clear()
    posX += 1
    posY += 1
    gfx.fillRect(posX, posY, 10, 10)
end