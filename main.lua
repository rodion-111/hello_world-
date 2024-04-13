function love.load()
    player = {}
    player.x = 200
    player.y = 300
    player.speed = 5
    player.sprint = 10
    player.startspeed = player.speed
    music = love.audio.newSource("sounds/music.mp3","stream")
    blip = love.audio.newSource("sounds/blip.wav","static")
    music:play()
    music:setLooping(true)
    player.sprite = love.graphics.newImage("sprites/parrot.png")
    
    background = love.graphics.newImage("sprites/background.png")
end
function love.update(dt)
    if love.keyboard.isDown("w") then --movement up
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("s") then -- movement down
        player.y = player.y + player.speed
    end
    if love.keyboard.isDown("a") then -- movement left
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed -- movement right
    end
    if love.keyboard.isDown("lshift") then
        player.speed = player.sprint
    else
        player.speed = player.startspeed
    end
    if love.keyboard.isDown("f") then 
        blip:play()
    end

end
function love.draw()
    love.graphics.draw(background,0,0)
    if love.keyboard.isDown("space") then
        love.graphics.print("hello world!", 300,400)
    end
    --love.graphics.print(player.speed,200,300)
    love.graphics.draw(player.sprite,player.x,player.y)
end