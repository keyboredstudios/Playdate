import "CoreLibs/3d"
local file <const> = playdate.file

function importFile(path)
    local obj = file.open(path, file.kFileRead)
    local data = obj:read(file.getSize(path))
    local shape = read(data)
    return shape
end


function read(str)
    local verts = getVert(str)

    local mesh = shape3d.new()
    
    -- Note: [+-]?[0-9]*[.]?[0-9]+[/]?[+-]?[0-9]*[/]?[+-]?[0-9]* matches one of the faces including the slashes.
    -- And we repeat the search regex 3 times because there are 3 indices for each face.
    -- %s is the space between each vertex index.
    for tri in string.gmatch(str, 'f%s[+-]?[0-9]*[.]?[0-9]+[/]?[+-]?[0-9]*[/]?[+-]?[0-9]*%s[+-]?[0-9]*[.]?[0-9]+[/]?[+-]?[0-9]*[/]?[+-]?[0-9]*%s[+-]?[0-9]*[.]?[0-9]+[/]?[+-]?[0-9]*[/]?[+-]?[0-9]*') do
        local indices = {}
        for vertInd in string.gmatch(tri, '[+-]?[0-9]*[.]?[0-9]+[/]?[+-]?[0-9]*[/]?[+-]?[0-9]*') do
            -- Just grab the first value of each group. Something like in "4/1/1", we only need the "4". Or in "1//2", we only need the "1".
            local index = string.match(vertInd, '[+-]?[0-9]*[.]?[0-9]+')
            indices[#indices+1] = verts[tonumber(index)]
        end

        mesh:addFace(indices[1], indices[2], indices[3])
    end

    return mesh
end


function getVert(str)
    local verts = {}
    
    for vert in string.gmatch(str, '%v%s[+-]?[0-9]*[.]?[0-9]+%s[+-]?[0-9]*[.]?[0-9]+%s[+-]?[0-9]*[.]?[0-9]+') do
        local x,y,z = 0,0,0
        local i = 1
        for numb in string.gmatch(vert, '[+-]?[0-9]*[.]?[0-9]+') do
            if i == 1 then
                x = tonumber(numb)
            elseif i == 2 then
                y = tonumber(numb)
            else
                z = tonumber(numb)
            end
            i += 1
        end

        -- Add the new vert to the results as a `vector3d` object.
        verts[#verts+1] = vector3d.new(x, y, z)
    end

    return verts
end
