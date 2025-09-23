local menu={}

function menu:load(controls)
    self.controls=controls
end

function menu:new(x,y,w,h,objs)
    local o={x=x,y=y,w=w,h=h,obj=objs}
    o.select=function()

    end
    o.deselect=function()

    end
    
    return o
end
