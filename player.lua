local imgCar
local animCar
local carY = WIN_HEIGHT-48-20
local carYspeed = 0
local jumpHeight = -250
local carGravity = -500
local carGroundY = WIN_HEIGHT-48-20

function loadPlayer()
    imgCar = love.graphics.newImage("images/car.png")
    imgCar:setFilter("nearest","nearest")
    animCar = newAnimation(imgCar, 48, 48, 0)
end

function updatePlayer(dt)
    animCar.currentTime = animCar.currentTime + dt*10
    -- if animCar.currentTime >= animCar.duration then
    --     animCar.currentTime = animCar.currentTime - animation.duration
    -- end
    
    -- android touch
    local touches = love.touch.getTouches()
    for _, touch in ipairs(touches) do
        local tx, ty = love.touch.getPosition(touch)
        if carYspeed == 0 then
            carYspeed = jumpHeight
        end
    end
    -- keyboard
	if love.keyboard.isDown('space') then
        if carYspeed == 0 then
            carYspeed = jumpHeight
        end
    end
    -- jumping
    if carYspeed ~= 0 then
		carY = carY + carYspeed * dt
		carYspeed = carYspeed - carGravity * dt
	end
    -- stop jumping
    if carY > carGroundY then
		carYspeed = 0
        carY = carGroundY
	end
end

function drawPlayer()
    -- love.graphics.draw(imgCar,car, 40, carY )
    local spriteNum = math.floor(animCar.currentTime % #animCar.quads) + 1
    love.graphics.draw(animCar.spriteSheet, animCar.quads[spriteNum], 40, carY, 0, 1)
end