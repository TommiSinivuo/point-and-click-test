local scene = require("io.pixeli.gamescene")

function scene:configureCamera(camera)
   camera:setBoundsFromLayer("background")
   camera:findLayer("foreground").xParallax = 1.5
   camera:setDamping(10)
end

return scene