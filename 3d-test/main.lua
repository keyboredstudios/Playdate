import "CoreLibs/3d" -- This is a hidden, undocumented library in the Playdate SDK.
import "CoreLibs/graphics"
import "import-obj"
local gfx <const> = playdate.graphics

-- Limit the FPS.
playdate.display.setRefreshRate(20)

-- Import model file. (You should be able to use any .obj file if I wrote the import script correctly XD )
local shape = importFile('./test.obj')

-- Setup 3D render scene.
local scene = scene3d.new()
scene:addShape(shape)

-- Rotate the model to a good starting place for the normals...
local rotateSpeed = math.pi/50
shape:rotateAroundX(math.pi/6)
shape:rotateAroundY(math.pi/6)

-- Set the initial camera zoom
shape:scaleBy(0.05)

-- Set the draw mode
local shouldDrawWireframe = false

function playdate.update()
    gfx.clear()

    -- Read player input.
    if playdate.buttonIsPressed('up') then
        shape:rotateAroundX(-rotateSpeed)
    end
    if playdate.buttonIsPressed('down') then
        shape:rotateAroundX(rotateSpeed)
    end
    if playdate.buttonIsPressed('left') then
        shape:rotateAroundY(-rotateSpeed)
    end
    if playdate.buttonIsPressed('right') then
        shape:rotateAroundY(rotateSpeed)
    end

    -- Scale the 3d model by the crank input
    local change, acceleratedChange = playdate.getCrankChange()
    if change > 0 then
        shape:scaleBy(1.1)
    elseif change < 0 then
        shape:scaleBy(0.9)
	end

    -- Render the 3d scene
    if shouldDrawWireframe then
        scene:drawWireframe()
    else 
	    scene:draw()
    end

    --Draw Debug
    playdate.drawFPS(0, 0)
end

-- Switch to wireframe when the "A" button is held.
function playdate.AButtonHeld()
    shouldDrawWireframe = not shouldDrawWireframe
end
