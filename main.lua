function love.draw()
    if love.keyboard.isDown("space") then
        love.graphics.print("hello world!", 300,400)
    end
end