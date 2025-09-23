return {

    --screen utils
    gameWidth=160,
    gameHeight=128,
    windowWidth=160*5,
    windowHeight=128*5,
    fullscreen=false,
    resizable=true,
    pixelperfect=true,

    --texture
    filterMin="nearest",
    filterMax="nearest",

    --input
    input={
        controls={
            up={"key:up"},
            down={"key:down"},
            left={"key:left"},
            right={"key:right"},
            a={"key:z"},
            b={"key:x"}
        },
        pairs={

        },
        joystick = love.joystick.getJoysticks()[1]
    }

}

