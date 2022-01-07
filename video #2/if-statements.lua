import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

local posX = 0
local posY = 0

function playdate.update()
    gfx.clear()

    if playdate.buttonIsPressed('up') then
        posY -= 1
    end

    if playdate.buttonIsPressed('down') then
        posY += 1
    end

    if playdate.buttonIsPressed('right') then
        posX += 1
    end

    if playdate.buttonIsPressed('left') then
        posX -= 1
    end
    
    gfx.fillRect(posX, posY, 10, 10)
end
