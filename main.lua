require('ball')

local windowWidth = WIN_WIDTH
local windowHeight = WIN_HEIGHT

local imgMoutainsBack
local moutainsBackX = 0
local imgMoutainsFront
local moutainsFrontX = 0
local imgTrees
local treesX = 0
local ground
-- local ball

moutainsBack = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
moutainsFront = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
trees = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
ground = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)

function love.load()
    -- ball = Ball
    -- ball.init(windowWidth, windowHeight)

    imgMoutainsBack = love.graphics.newImage("images/mountains_back.png")
    imgMoutainsBack:setFilter("nearest","nearest")

    imgMoutainsFront = love.graphics.newImage("images/mountains_front.png")
    imgMoutainsFront:setFilter("nearest","nearest")

    imgTrees = love.graphics.newImage("images/trees.png")
    imgTrees:setFilter("nearest","nearest")

    imgGround = love.graphics.newImage("images/ground.png")
    imgGround:setFilter("nearest","nearest")
end

function love.update(dt)
    -- ball.move()
    moutainsBackX = (moutainsBackX + 20*dt) % WIN_WIDTH
    moutainsFrontX = (moutainsFrontX + 40*dt) % WIN_WIDTH
    treesX = (treesX + 70*dt) % WIN_WIDTH
end
 
function love.draw()
    -- ball.draw()

    love.graphics.draw(imgMoutainsBack,moutainsBack,0-moutainsBackX,0)
    love.graphics.draw(imgMoutainsBack,moutainsBack,WIN_WIDTH-moutainsBackX,0)

    love.graphics.draw(imgMoutainsFront,moutainsFront,0-moutainsFrontX,0)
    love.graphics.draw(imgMoutainsFront,moutainsFront,WIN_WIDTH-moutainsFrontX,0)

    love.graphics.draw(imgTrees,trees,0-treesX,0)
    love.graphics.draw(imgTrees,trees,WIN_WIDTH-treesX,0)

    love.graphics.draw(imgGround,ground, 0, 0)
end


