require('utils')
require('landscape')
require('player')
require('enemy')

local player
local enemy

function love.load()
    loadLandscape()
    player = loadPlayer()
    enemy = loadEnemy()
end

function love.update(dt)
    updateLandscape(dt)
    updatePlayer(dt)
    updateEnemy(dt)
    if collideRect(player, enemy) then
        love.event.quit()
    end
end

function love.draw()
    setScale()
    drawLandscape()
    drawPlayer()
    drawEnemy()
end


