local game={}
shove.createLayer("game")

function game:enter()
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
end

function game:update(dt)
    env.update(dt)
end

function game:draw()
    shove.beginDraw()
        shove.beginLayer("game")
            env.draw()
        shove.endLayer()
    shove.endDraw()
end

return game