import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

local posX = 0
local posY = 0

function playdate.update()
    gfx.clear()
    gfx.fillRect(posX, posY, 10, 10)
end

function playdate.AButtonDown()
    posY += 1
    posX += 1
end

function playdate.AButtonUp()
    posY -= 1
    posX -= 1
end

function playdate.AButtonHeld()
    playdate.display.setInverted( not playdate.display.getInverted() )
end

