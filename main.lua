-- Constants
local WIDTH, HEIGHT, SCALE = 1200, 800, 50

-- Shortcuts
local mouse = love.mouse

-- Variables
local grid -- The grid containing all cells with rows and columns dictated by SCALE
local cells -- An array containing all types of cells

-- Local functions
local function setColor(r, g, b, a)
    -- Love2d takes RGB values of 0-1 as default instead of 0-255
    love.graphics.setColor(r/255, g/255, b/255, a)
end

local function setCell(row, column, newCell)
    grid.cellarray[row][column] = newCell
end


-- Main
function love.load()
    -- Window settings
    love.window.setTitle("snad fall")
    love.window.setMode(WIDTH, HEIGHT, {centered = true, resizable = false})

    -- TODO
    --[[Cells]]--
    cells = {}

    function cells:newCell(color)
        local cell = {
            id = #self; -- ID of the cell; depends on the order of which the newCell() is called
            age = 0; -- Total lifetime of the cell
            color = color; -- Color of the cell; four integer array
        }

        table.insert(self, cell)
        return cell
    end

    cells.air = cells:newCell({0, 0, 0, 0})
    cells.sand = cells:newCell({185, 125, 25, 1})

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
            grid.cellarray[i][j] = cells.air
        end
    end
end
    
function love.update(dt)
    function love.mousepressed()
        local row, column = math.floor(mouse.getX()/SCALE)+1, math.floor(mouse.getY()/SCALE)+1
        setCell(row, column, cells.sand)
        print(row, column)
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
    for j=grid.columns, 1, -1 do -- TODO make draw loop start from bottom up
        for i=1, grid.rows do
            local cell = grid.cellarray[i][j]
            local x, y = (i-1)*SCALE, (j-1)*SCALE
            setColor(unpack(cell.color))
            love.graphics.rectangle('fill', x, y, SCALE, SCALE)

            -- DEBUGGING
            -- Draw gridlines to represent rows and columns
            setColor(60, 20, 20)
            love.graphics.rectangle('line', x, y, SCALE, SCALE)
        end
    end
end