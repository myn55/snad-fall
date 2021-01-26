-- Constants
local WIDTH, HEIGHT, SCALE = 1200, 800, 50

-- Shortcuts
local mouse = love.mouse

-- Variables
local grid -- The grid containing all cells with rows and columns dictated by SCALE
local cells -- An array containing all types of cells

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

    --[[Grid]]--
    grid = {
        rows = math.floor(WIDTH/SCALE);
        columns = math.floor(HEIGHT/SCALE);
        cellarray = {};
    }

    -- Initialize grid.cells as a 2D array
    for i=1, grid.rows do
        grid.cellarray[i] = {}
        for j=1, grid.columns do
            grid.cellarray[i][j] = nil
        end
    end

    -- TODO
    --[[Cells]]--
    cells = {}

    function cells:newCell()
        local cell = {
            id = #self; -- ID of the cell; depends on the order of which the newCell() is called
            age = 0; -- Total lifetime of the cell
            color = {0, 0, 0}; -- Color of the cell
        }

        table.insert(self, cell)
        return cell
    end
end

function love.update(dt)
    function love.mousepressed()
        local x, y = math.floor(mouse.getX()/SCALE), math.floor(mouse.getY()/SCALE)
        print(x, y)
    end
    
    -- TODO
    -- Update cells
end

function love.draw()
    -- Draw background
    setColor(20, 20, 20)
    love.graphics.rectangle('fill', 0, 0, WIDTH, HEIGHT)

    -- TODO
    -- Draw cells

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