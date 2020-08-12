require('utils')
require('landscape')
require('player')
require('enemy')

local player
local enemy
local score

function reset()
    score = 0
    resetPlayer()
    resetEnemy()
end

function love.load()
    -- font
    font = love.graphics.newFont(18)
    love.graphics.setFont(font)
    -- game
    loadLandscape()
    player = loadPlayer()
    enemy = loadEnemy()
    score = 0
end

function love.update(dt)
    updateLandscape(dt)
    if player.alive == true then
        updatePlayer(dt)
        updateEnemy(dt)
        if collideRect(player, enemy) then
            player.alive = false
        end
		score = score + 20*dt
	end
end

function love.draw()
    setScale()
    drawLandscape()

    if player.alive == true then
        drawPlayer()
        drawEnemy()
        -- score
	    love.graphics.print({{2/255,9/255,4/255,1}, 'score: '..math.floor(score)},8,8)
    else
        love.graphics.printf({{2/255,9/255,4/255,1}, 'Multipla Adventure'},0,WIN_HEIGHT/3,WIN_WIDTH,"center")
        love.graphics.printf({{2/255,9/255,4/255,1}, "Press to play and jump "},0,WIN_HEIGHT/3+32,WIN_WIDTH,"center")
        if score ~= 0 then
            love.graphics.printf({{2/255,9/255,4/255,1}, "your score: ".. math.floor(score)},0,WIN_HEIGHT/3+64,WIN_WIDTH,"center")
        end
    end
end


function love.keyreleased(key)
    if player.alive == false then
        reset()
    end
    if key == "escape" then
        love.event.quit()
    end
end

function love.touchreleased( id, x, y, dx, dy, pressure )
    if player.alive == false then
        reset()
    end
end