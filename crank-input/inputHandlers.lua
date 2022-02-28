import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

local x = 0
local y = 120
local speed = 1

function playdate.update()
    gfx.clear()
    x += speed
    gfx.fillRect(x, y, 10, 10)
end

local crankInputHandler = {
    cranked = function(change, acceleratedChange)
        speed += change / 100
        -- speed += acceleratedChange / 100
    end,

    crankDocked = function()
        print('InputHandler: Crank has been docked...')
    end,
    
    crankUndocked = function()
        print('InputHandler: Crank has been undocked...')
    end,
}

playdate.inputHandlers.push(crankInputHandler)
