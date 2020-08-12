local enemy = {}
enemy.width = 36
enemy.height = 36
enemy.groundY = 20
enemy.x = WIN_WIDTH
enemy.y = WIN_HEIGHT-enemy.height-enemy.groundY
enemy.speedX = 200
enemy.extraX = 200
enemy.speedXMin = 200
enemy.speedXMax = 700


function loadEnemy()
    enemy.quad = love.graphics.newQuad(0,0,enemy.width,enemy.height,enemy.width,enemy.height)
    enemy.img = love.graphics.newImage("images/enemy1.png")
    enemy.img:setFilter("nearest","nearest")
    return enemy
end

function updateEnemy(dt)
    if enemy.x > WIN_WIDTH then
        enemy.speedX = math.random(enemy.speedXMin, enemy.speedXMax)
    end
    enemy.x = (enemy.x - enemy.speedX*dt) % (WIN_WIDTH + enemy.extraX)
end

function drawEnemy()
    love.graphics.draw(enemy.img,enemy.quad,enemy.x,enemy.y)
end

function resetEnemy()
    enemy.x = WIN_WIDTH
    enemy.y = WIN_HEIGHT-enemy.height-enemy.groundY
end