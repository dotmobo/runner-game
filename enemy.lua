local enemy = {}
enemy.width = 36
enemy.height = 36
enemy.x = WIN_WIDTH
enemy.y = WIN_HEIGHT-enemy.height-20


function loadEnemy()
    enemy.quad = love.graphics.newQuad(0,0,enemy.width,enemy.height,enemy.width,enemy.height)
    enemy.img = love.graphics.newImage("images/enemy1.png")
    enemy.img:setFilter("nearest","nearest")
    return enemy
end

function updateEnemy(dt)
    enemy.x = (enemy.x - 390*dt) % (WIN_WIDTH)
end

function drawEnemy()
    love.graphics.draw(enemy.img,enemy.quad,enemy.x,enemy.y)
end

function resetEnemy()
    enemy.x = WIN_WIDTH
    enemy.y = WIN_HEIGHT-enemy.height-20
end