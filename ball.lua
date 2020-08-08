Ball = {}

function Ball.init(windowWidth, windowHeight)
    Ball.x = windowWidth / 2
    Ball.y = windowHeight / 2
    Ball.radius = windowWidth / 40
    Ball.segments = 100
end

function Ball.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", Ball.x, Ball.y, Ball.radius, Ball.segments)
end

function Ball.move()
    Ball.x, Ball.y = love.mouse.getPosition()
end