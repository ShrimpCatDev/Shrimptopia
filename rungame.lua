local game={}
shove.createLayer("game")

function game:enter()
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
    --=fade=fade+dt*0.1
    if input:pressed("a") then
        fade=0
    end
end

function game:draw()
    --lg.setShader(lutEffect)
    shove.beginDraw()
        shove.beginLayer("game")
            env.draw()
            lg.draw(car,0,0)
            lg.setColor(0,0,0,fade)
            lg.rectangle("fill",0,0,96,64)
        shove.endLayer()
    shove.endDraw()
    --lg.setShader()
end

return game