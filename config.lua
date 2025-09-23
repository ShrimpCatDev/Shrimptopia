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

        },
        pairs={

        },
        joystick = love.joystick.getJoysticks()[1]
    }

}

