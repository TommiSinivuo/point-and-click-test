local composer = require("composer")
local tiled = require("com.ponywolf.ponytiled")
local json = require("json")
local perspective = require("com.gymbylcoding.perspective")
local TiledPerspective = require("io.pixeli.tiled-perspective")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local map
local player
local camera

local function loadMap()
   local mapFilename = "scene/game/map/testing.json"
   local mapData = json.decodeFile(system.pathForFile(mapFilename, system.ResourceDirectory))
   return tiled.new(mapData, "scene/game/map")
end

local function extendMapObjects(map)
   map.extensions = "scene.game.lib."
   map:extend("player")
end

local function loadAndExtendMap()
   local map = loadMap()
   extendMapObjects(map)
   return map
end

local function walkTo(event)
   local playerContentX, playerContentY = player:localToContent(0, 0)
   local dx, dy = event.x - playerContentX, event.y - playerContentY
   local targetX, targetY = player.x + dx, player.y + dy
   transition.to(player, { x=targetX, y=targetY, time=1000 })
end

local function configureWalkboxes(map)
   local walkboxLayer = map:findLayer("walkboxes")
   walkboxLayer.alpha = 0.5
   walkboxLayer.isVisible = true
   walkboxLayer.isHitTestable = true
   local walkboxes = map:listTypes("walkbox")
   for _, v in ipairs(walkboxes) do
      v:addEventListener("tap", walkTo)
   end
end

local layerNameToNumber = {}

local function getLayerNumber( name )
   return layerNameToNumber[name]
end

local function getCameraLayerByName( camera, layerName )
   return camera:layer(getLayerNumber(layerName))
end

local function createCamera(map)
   local camera = TiledPerspective:new()
   camera:load(map) 
   camera:findLayer("foreground").xParallax = 1.25
   camera:setDamping(10)
   camera:setFocus(player)
   camera:track()
   return camera
end

local function endGame()
   composer.gotoScene("scene.menu", {time = 800, effect = "crossFade"})
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen
   map = loadAndExtendMap()
   player = map:findObject("player")

   configureWalkboxes(map)

   camera = createCamera(map)

   sceneGroup:insert(map)

   local endButton = display.newText(sceneGroup, "End Game", display.contentCenterX, 32, native.systemFont, 44)
   endButton:setFillColor(0.82, 0.86, 1)

   endButton:addEventListener("tap", endGame)
end

-- show()
function scene:show(event)
   local sceneGroup = self.view
   local phase = event.phase

   if (phase == "will") then
      -- Code here runs when the scene is still off screen (but is about to come on screen)
   elseif (phase == "did") then
   -- Code here runs when the scene is entirely on screen
   end
end

-- hide()
function scene:hide(event)
   local sceneGroup = self.view
   local phase = event.phase

   if (phase == "will") then
      -- Code here runs when the scene is on screen (but is about to go off screen)
   elseif (phase == "did") then
   -- Code here runs immediately after the scene goes entirely off screen
   end
end

-- destroy()
function scene:destroy(event)
   local sceneGroup = self.view
   -- Code here runs prior to the removal of scene's view
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene
