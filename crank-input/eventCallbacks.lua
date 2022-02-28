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

function playdate.cranked(change, acceleratedChange)
    speed += change / 100
    -- speed += acceleratedChange / 100
end

function playdate.crankDocked()
    print('Crank has been docked...')
end

function playdate.crankUndocked()
    print('Crank has been undocked...')
end
