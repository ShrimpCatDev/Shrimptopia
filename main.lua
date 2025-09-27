require("init")

function love.load()
    https=require("https")

    font=lg.newFont("assets/font.ttf",4)
    lg.setFont(font)

    love.window.setTitle("Shrimptopia")

    gs=require("lib.hump.gamestate")
    gs.registerEvents()

    --state={}
    gs.switch(require("rungame"))
end

function love.update(dt)
    input:update(dt)
end

function love.draw()

end
