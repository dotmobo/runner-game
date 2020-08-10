function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end

function setScale()
    local scale = love.graphics.getWidth() / WIN_WIDTH
    local scaleY = love.graphics.getHeight() / WIN_HEIGHT
    if scaleY < scale then scale = scaleY end
    love.graphics.scale(scale)
end