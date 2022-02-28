import "CoreLibs/crank"
import "CoreLibs/graphics"
local gfx <const> = playdate.graphics

local x = 0
local y = 120
local speed = 1

function playdate.update()
    gfx.clear()

    x += speed

    local crankTicks = playdate.getCrankTicks(6)
    if crankTicks == 1 then
        print('cranked')
    elseif crankTicks == -1 then
        print('-cranked')
    end 
    
    speed += crankTicks

    gfx.fillRect(x, y, 10, 10)
end
