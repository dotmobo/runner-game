local imgMoutainsBack
local moutainsBackX = 0
local imgMoutainsFront
local moutainsFrontX = 0
local imgTrees
local treesX = 0
local ground

moutainsBack = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
moutainsFront = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
trees = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)
ground = love.graphics.newQuad(0,0,WIN_WIDTH,WIN_HEIGHT,WIN_WIDTH,WIN_HEIGHT)

function loadLandscape()
    imgMoutainsBack = love.graphics.newImage("images/mountains_back.png")
    imgMoutainsBack:setFilter("nearest","nearest")

    imgMoutainsFront = love.graphics.newImage("images/mountains_front.png")
    imgMoutainsFront:setFilter("nearest","nearest")

    imgTrees = love.graphics.newImage("images/trees.png")
    imgTrees:setFilter("nearest","nearest")

    imgGround = love.graphics.newImage("images/ground.png")
    imgGround:setFilter("nearest","nearest")
end

function updateLandscape(dt)
    moutainsBackX = (moutainsBackX + 30*dt) % WIN_WIDTH
    moutainsFrontX = (moutainsFrontX + 60*dt) % WIN_WIDTH
    treesX = (treesX + 180*dt) % WIN_WIDTH
end

function drawLandscape()
    love.graphics.draw(imgMoutainsBack,moutainsBack,0-moutainsBackX,0)
    love.graphics.draw(imgMoutainsBack,moutainsBack,WIN_WIDTH-moutainsBackX,0)

    love.graphics.draw(imgMoutainsFront,moutainsFront,0-moutainsFrontX,0)
    love.graphics.draw(imgMoutainsFront,moutainsFront,WIN_WIDTH-moutainsFrontX,0)

    love.graphics.draw(imgTrees,trees,0-treesX,0)
    love.graphics.draw(imgTrees,trees,WIN_WIDTH-treesX,0)

    love.graphics.draw(imgGround,ground, 0, 0)
end