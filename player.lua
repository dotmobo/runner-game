local player = {}
player.width = 48
player.height = 48
player.x = 72
player.y = WIN_HEIGHT-player.height-20
player.speedY = 0
player.gravity = -500
player.jumpHeight = -250
player.groundY = WIN_HEIGHT-48-20
player.alive = false


function loadPlayer()
    player.img = love.graphics.newImage("images/car.png")
    player.img:setFilter("nearest","nearest")
    player.anim = newAnimation(player.img, player.width, player.height, 0)
    player.jumpSound = love.audio.newSource("sounds/340629__mickyman5000__chainsaw-stop .wav", "static")
    return player
end

function updatePlayer(dt)
    player.anim.currentTime = player.anim.currentTime + dt*10
    -- if player.anim.currentTime >= player.anim.duration then
    --     player.anim.currentTime = player.anim.currentTime - animation.duration
    -- end

    -- android touch
    local touches = love.touch.getTouches()
    for _, touch in ipairs(touches) do
        local tx, ty = love.touch.getPosition(touch)
        if player.speedY == 0 then
            player.speedY = player.jumpHeight
        end
    end
    -- keyboard
	if love.keyboard.isDown('space') then
        if player.speedY == 0 then
            player.jumpSound:play()
            player.speedY = player.jumpHeight
        end
    end
    -- jumping
    if player.speedY ~= 0 then
		player.y = player.y + player.speedY * dt
		player.speedY = player.speedY - player.gravity * dt
	end
    -- stop jumping
    if player.y > player.groundY then
		player.speedY = 0
        player.y = player.groundY
	end
end

function drawPlayer()
    local spriteNum = math.floor(player.anim.currentTime % #player.anim.quads) + 1
    love.graphics.draw(player.anim.spriteSheet, player.anim.quads[spriteNum], player.x, player.y, 0, 1)
end

function resetPlayer()
    player.x = 72
    player.y = WIN_HEIGHT-player.height-20
    player.alive = true
    player.speedY = 0
end