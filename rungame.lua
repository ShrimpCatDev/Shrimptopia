local game={}
shove.createLayer("game")

function game:enter()
    print("loading image")
    local code,body=https.request("https://hc-cdn.hel1.your-objectstorage.com/s/v3/1b148fcf4dcb55abe0601bf44f69cfe8c6630a01_screenshot_20250113_185914.png")
    local data=love.filesystem.newFileData(body,"image.png")
    image=love.graphics.newImage(data)
    print("image loaded")
    fade=0
    car=lg.newImage("assets/car.png")
    currentGame="test"
    local code,size = love.filesystem.read("games/"..currentGame.."/run.lua")

    func,err=loadstring(code)

    if not func then
        error(err)
    end

    env=require("env")
    setfenv(func,env)

    func()
    env.init()

    local lutEffect=love.graphics.newShader("assets/shader/lut.glsl")

    pal=lg.newImage("assets/lut.png")
    pal:setFilter("nearest","nearest")

    lutEffect:send("lut",pal)

    shove.removeEffect("game",lutEffect)
    shove.addEffect("game",lutEffect)
end

function game:update(dt)
    env.update(dt)
    if input:pressed("a") then
        print("loading image")
        local code,body=https.request("https://hc-cdn.hel1.your-objectstorage.com/s/v3/1b148fcf4dcb55abe0601bf44f69cfe8c6630a01_screenshot_20250113_185914.png")
        local data=love.filesystem.newFileData(body,"image.png")
        image=love.graphics.newImage(data)
        print("image loaded")
    end
end

function game:draw()
    --lg.setShader(lutEffect)
    shove.beginDraw()
        shove.beginLayer("game")
            env.draw()
            lg.draw(car,math.cos(love.timer.getTime()*8)*4,0)
            lg.draw(image,0,0)
            lg.setColor(0,0,0,fade)
            lg.rectangle("fill",0,0,96,64)
        shove.endLayer()
    shove.endDraw()
    --lg.setShader()
end

return game