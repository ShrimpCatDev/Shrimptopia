lg=love.graphics

local lgp=love.graphics.points

function lg.points(x,y)
    lgp(math.floor(x)+0.5,math.floor(y)+0.5)
end

config=require 'config'

lg.setDefaultFilter(config.filterMin,config.filterMax)

shove=require 'lib.shove'
shove.setResolution(96,64,{fitMethod="aspect",renderMode="layer",scalingFilter="nearest"})
shove.setWindowMode(800, 600, {resizable = true})

baton=require 'lib.baton'

input=baton.new(config.input)