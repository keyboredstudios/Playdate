import "CoreLibs/graphics"
import "CoreLibs/ui" -- Needed for playdate.ui.crankIndicator
import "CoreLibs/timer" -- Needed for playdate.ui.crankIndicator

local gfx <const> = playdate.graphics
local ui <const> = playdate.ui

-- Crank Indicator Setup
ui.crankIndicator:start()
ui.crankIndicator.clockwise = true

function playdate.update()
    playdate.timer.updateTimers() -- Be sure to call this to update the animation.
    gfx.clear()

    if playdate.isCrankDocked() then
        -- Stop the `crankIndicator` if the player undocks it.
        ui.crankIndicator:update()
    end
end
