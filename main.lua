function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    --librires
    anim8 = require "librires/anim8"
    -- player
    player = {}
    player.x = 200
    player.y = 300
    player.speed = 5
    player.sprint = 10
    player.startspeed = player.speed
    player.sprite = love.graphics.newImage("sprites/parrot.png")
    player.spritesheet = love.graphics.newImage("sprites/player-sheet.png")
    player.grid = anim8.newGrid(12,18,player.spritesheet:getWidth(),player.spritesheet:getHeight())
    -- player animations
    player.animation = {}
    player.animation.down = anim8.newAnimation(player.grid("1-4",1),0.2)
    player.animation.left = anim8.newAnimation(player.grid("1-4",2),0.2)
    player.animation.right = anim8.newAnimation(player.grid("1-4",3),0.2)
    player.animation.up = anim8.newAnimation(player.grid("1-4",4),0.2)
    player.anim = player.animation.left

    --Sounds
    music = love.audio.newSource("sounds/music.mp3","stream")
    blip = love.audio.newSource("sounds/blip.wav","static")
    music:play()
    music:setLooping(true)
    --background
    background = love.graphics.newImage("sprites/background.png")
end
function love.update(dt)
    ismoving = false
    
    if love.keyboard.isDown("w") then --movement up
        player.y = player.y - player.speed
        player.anim = player.animation.up
        ismoving = true
    end
    if love.keyboard.isDown("s") then -- movement down
        player.y = player.y + player.speed
        player.anim = player.animation.down
        ismoving = true
    end
    if love.keyboard.isDown("a") then -- movement left
        player.x = player.x - player.speed
        player.anim = player.animation.left
        ismoving = true
    end
    if love.keyboard.isDown("d") then -- movement right 
        player.x = player.x + player.speed
        player.anim = player.animation.right
        ismoving = true
    end
    if ismoving == false then
        player.anim:gotoFrame(2)
    end
    player.anim:update(dt)
    if love.keyboard.isDown("lshift") then
        player.speed = player.sprint
    else
        player.speed = player.startspeed
    end
    --if love.keyboard.isDown("f") then 
    --    blip:play()
    --end

end
function love.draw()
    love.graphics.draw(background,0,0)
    if love.keyboard.isDown("space") then
        love.graphics.print("hello world!", 300,400)
    end
    --love.graphics.print(player.speed,200,300)
    player.anim:draw(player.spritesheet,player.x,player.y,nil,6,nil,9,9)
end
function love.keypressed(key)
    if key == "f" then
        blip:play()
    end
end