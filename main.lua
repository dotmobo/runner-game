

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
end

function love.update(dt)
    moutainsBackX = (moutainsBackX + 20*dt) % WIN_WIDTH
    moutainsFrontX = (moutainsFrontX + 40*dt) % WIN_WIDTH
    treesX = (treesX + 70*dt) % WIN_WIDTH
    
    -- This is in charge of player jumping.
	if love.keyboard.isDown('space') then                     -- Whenever the player presses or holds down the Spacebar:
        -- The game checks if the player is on the ground. Remember that when the player is on the ground, Y-Axis Velocity = 0.
        if carYspeed == 0 then
            carYspeed = jumpHeight    -- The player's Y-Axis Velocity is set to it's Jump Height.
        end
    end

    if carYspeed ~= 0 then                                      -- The game checks if player has "jumped" and left the ground.
		carY = carY + carYspeed * dt                -- This makes the character ascend/jump.
		carYspeed = carYspeed - carGravity * dt -- This applies the gravity to the character.
	end
 
        -- This is in charge of collision, making sure that the character lands on the ground.
    if carY > carGroundY then    -- The game checks if the player has jumped.
		carYspeed = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
        carY = carGroundY    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
	end
end
 
function love.draw()
    love.graphics.draw(imgMoutainsBack,moutainsBack,0-moutainsBackX,0)
    love.graphics.draw(imgMoutainsBack,moutainsBack,WIN_WIDTH-moutainsBackX,0)

    love.graphics.draw(imgMoutainsFront,moutainsFront,0-moutainsFrontX,0)
    love.graphics.draw(imgMoutainsFront,moutainsFront,WIN_WIDTH-moutainsFrontX,0)

    love.graphics.draw(imgTrees,trees,0-treesX,0)
    love.graphics.draw(imgTrees,trees,WIN_WIDTH-treesX,0)

    love.graphics.draw(imgGround,ground, 0, 0)

    love.graphics.draw(imgCar,car, 40, carY )
end


