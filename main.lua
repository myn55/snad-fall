-- Constants
local WIDTH, HEIGHT, SCALE = 1200, 800, 50

-- Variables
local background -- The background of the entire window
local grid -- The grid containing all cells with rows and columns dictated by SCALE

-- Local functions
local function setColor(r, g, b)
    -- Love2d takes RGB values of 0-1 as default instead of 0-255
    love.graphics.setColor(r/255, g/255, b/255)
end

-- Main
function love.load()
    -- Window settings
    love.window.setTitle("snad fall")
    love.window.setMode(WIDTH, HEIGHT, {centered = true, resizable = false})

    --[[Background]]--
    background = {
        color = {20, 20, 20};
    }

    --[[Grid]]--
    grid = {
        rows = math.floor(WIDTH/SCALE);
        columns = math.floor(HEIGHT/SCALE);
        cells = {};
    }

    -- Initialize grid.cells as a 2D array
    for i=1, grid.rows do
        grid.cells[i] = {}
        for j=1, grid.columns do
            grid.cells[i][j] = nil
        end
    end
end

function love.update(dt)
    
end

function love.draw()
    -- Draw background
    setColor(unpack(background.color))
    love.graphics.rectangle('fill', 0, 0, WIDTH, HEIGHT)

    -- DEBUGGING
    -- Draw gridlines to represent rows and columns
    setColor(60, 20, 20)
    for i=1, grid.rows do
        for j=1, grid.columns do
            local x, y = (i-1)*SCALE, (j-1)*SCALE
            love.graphics.rectangle('line', x, y, SCALE, SCALE)
        end
    end
end