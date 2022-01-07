import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

import "CoreLibs/timer"

local posX = 0
local posY = 0

function playdate.update()
    playdate.timer.updateTimers()
    gfx.clear()
    gfx.fillRect(posX, posY, 10, 10)
end

local myInputHandlers_PlayerControls = {

    upButtonDown = function()
        posY -= 1
    end,

    downButtonDown = function()
        posY += 1
    end,

    rightButtonDown = function()
        posX += 1
    end,

    leftButtonDown = function()
        posX -= 1
    end,
}

local myInputHandlers_Special = {

    AButtonDown = function()
        posY += 1
        posX += 1
    end,

    BButtonUp = function()
        posY -= 1
        posX -= 1
    end,
}


playdate.inputHandlers.push(myInputHandlers_PlayerControls)
playdate.inputHandlers.push(myInputHandlers_Special)


playdate.timer.new(3000, function()
    playdate.inputHandlers.pop()
end)

playdate.timer.new(6000, function()
    playdate.inputHandlers.pop()
end)
