-- Constants
local WIDTH, HEIGHT, SCALE = 1200, 800, 50

-- Shortcuts
local mouse = love.mouse

-- Variables
local grid -- The grid containing all cells with rows and columns dictated by SCALE
local cells -- An array containing all types of cells
local selectedRow, selectedColumn -- Selected row and column from the selectCell local function

-- Local functions
local function setColor(color)
    local r, g, b, a = color[1], color[2], color[3], color[4]
    -- Love2d takes RGB values of 0-1 as default instead of 0-255
    love.graphics.setColor(r/255, g/255, b/255, a)
end

local function selectCell(row, column)
    if grid.cellarray[row][column] ~= nil then
        selectedRow, selectedColumn = row, column
    else
        selectedRow, selectedColumn = nil, nil
    end
end

local function setCell(row, column, newCell)
    grid.cellarray[row][column] = newCell
end

local function getCell(addRow, addColumn)
    return grid.cellarray[selectedRow+addRow][selectedColumn+addColumn]
end

local function inBounds(row, column)
    return (row <= grid.rows and column <= grid.columns and true or false)
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
            clock = 0; -- Time since cell was last updated
            color = color; -- Color of the cell; four integer array
        }

        table.insert(self, cell)
        return cell
    end

    cells.air = cells:newCell({0, 0, 0, 0})
    cells.sand = cells:newCell({185, 125, 25})

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
        print(row, column) -- DEBUG
    end

    -- TODO
    -- Update cells
    for j=grid.columns, 1, -1 do
        for i=1, grid.rows do
            local cell = grid.cellarray[i][j]
            local x, y = (i-1)*SCALE, (j-1)*SCALE
            
            -- Cell position update
            if cell.id == 0 then -- Air
                return
            elseif cell.id == 1 then -- Sand
                if (inBounds()) then

                end
            end
        end
    end
end

function love.draw()
    -- Draw background
    setColor({20, 20, 20})
    love.graphics.rectangle('fill', 0, 0, WIDTH, HEIGHT)

    -- TODO
    -- Draw cells
    for j=1, grid.columns do
        for i=1, grid.rows do
            local cell = grid.cellarray[i][j]
            local x, y = (i-1)*SCALE, (j-1)*SCALE
            setColor(cell.color)
            love.graphics.rectangle('fill', x, y, SCALE, SCALE)

            -- DEBUGGING
            -- Draw gridlines to represent rows and columns
            setColor({60, 20, 20})
            love.graphics.rectangle('line', x, y, SCALE, SCALE)
        end
    end
end