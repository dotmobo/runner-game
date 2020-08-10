require('utils')
require('landscape')
require('player')

function love.load()
    loadLandscape()
    loadPlayer()
end

function love.update(dt)
    updateLandscape(dt)
    updatePlayer(dt)
end
 
function love.draw()
    setScale()
    drawLandscape()
    drawPlayer()
end


