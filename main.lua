require('utils')

local windowWidth = WIN_WIDTH
local windowHeight = WIN_HEIGHT

local imgMoutainsBack
local moutainsBackX = 0
local imgMoutainsFront
local moutainsFrontX = 0
local imgTrees
local treesX = 0
local ground

local imgCar
local animCar
local carY = WIN_HEIGHT-48-20
local carYspeed = 0
local jumpHeight = -250
local carGravity = -500
local carGroundY = WIN_HEIGHT-48-20

moutainsBack = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
moutainsFront = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
trees = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
ground = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)

car = love.graphics.newQuad(0,0,48,48,48,48)


function love.load()
    imgMoutainsBack = love.graphics.newImage("images/mountains_back.png")
    imgMoutainsBack:setFilter("nearest","nearest")

    imgMoutainsFront = love.graphics.newImage("images/mountains_front.png")
    imgMoutainsFront:setFilter("nearest","nearest")

    imgTrees = love.graphics.newImage("images/trees.png")
    imgTrees:setFilter("nearest","nearest")

    imgGround = love.graphics.newImage("images/ground.png")
    imgGround:setFilter("nearest","nearest")

    imgCar = love.graphics.newImage("images/car.png")
    imgCar:setFilter("nearest","nearest")
    animCar = newAnimation(imgCar, 48, 48, 0)
end

function love.update(dt)
    moutainsBackX = (moutainsBackX + 20*dt) % WIN_WIDTH
    moutainsFrontX = (moutainsFrontX + 40*dt) % WIN_WIDTH
    treesX = (treesX + 70*dt) % WIN_WIDTH

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
 
function love.draw()
    local scale = love.graphics.getWidth() / WIN_WIDTH
    local scaleY = love.graphics.getHeight() / WIN_HEIGHT
    if scaleY < scale then scale = scaleY end
    love.graphics.scale(scale)

    love.graphics.draw(imgMoutainsBack,moutainsBack,0-moutainsBackX,0)
    love.graphics.draw(imgMoutainsBack,moutainsBack,WIN_WIDTH-moutainsBackX,0)

    love.graphics.draw(imgMoutainsFront,moutainsFront,0-moutainsFrontX,0)
    love.graphics.draw(imgMoutainsFront,moutainsFront,WIN_WIDTH-moutainsFrontX,0)

    love.graphics.draw(imgTrees,trees,0-treesX,0)
    love.graphics.draw(imgTrees,trees,WIN_WIDTH-treesX,0)

    love.graphics.draw(imgGround,ground, 0, 0)

    -- love.graphics.draw(imgCar,car, 40, carY )
    local spriteNum = math.floor(animCar.currentTime % #animCar.quads) + 1
    love.graphics.draw(animCar.spriteSheet, animCar.quads[spriteNum], 40, carY, 0, 1)
end


