--[[ Shortcuts ]]--
local function setColor(r, g, b)
    love.graphics.setColor(r/255, g/255, b/255)
end


--[[ Main ]]--

-- Constants
local scale = 8
local width, height = 1200, 800

function love.load()
    love.window.setTitle("snad fall")
    love.window.setMode(width, height, {centered = true, resizable = false})
end

function love.update(dt)
    
end

function love.draw()
    
end