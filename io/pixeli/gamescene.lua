local composer = require("composer")
local tiled = require("com.ponywolf.ponytiled")
local json = require("json")
local perspective = require("com.gymbylcoding.perspective")
local Camera = require("io.pixeli.camera")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local player
local camera

local function loadMap(mapDataDir, mapFilename)
   local mapFilename = mapDataDir .. "/" .. mapFilename
   local mapData = json.decodeFile(system.pathForFile(mapFilename, system.ResourceDirectory))
   return tiled.new(mapData, mapDataDir)
end

local function extendMapObjects(map, extensionsPkg)
   map.extensions = extensionsPkg .. "."
   map:extend("player")
end

local function loadAndExtendMap(mapDataDir, mapFilename, extensionsPkg)
   local map = loadMap(mapDataDir, mapFilename)
   extendMapObjects(map, extensionsPkg)
   return map
end

local function walkTo(event)
   print("event XY: " .. event.x .. "," .. event.y)
   local playerContentX, playerContentY = player:localToContent(0, 0)
   local dx, dy = event.x - playerContentX, event.y - playerContentY
   local targetX, targetY = player.x + dx, player.y + dy
   transition.to(player, { x=targetX, y=targetY, time=1000 })
end

local function configureWalkboxes(map)
   local walkboxLayer = map:findLayer("walkbox")
   walkboxLayer.alpha = 0.5
   walkboxLayer.isVisible = true
   walkboxLayer.isHitTestable = true
   local walkboxes = map:listTypes("walkbox")
   for _, v in ipairs(walkboxes) do
      v:addEventListener("tap", walkTo)
   end
end

function scene:createCamera(map)
   local camera = Camera:new()
   camera:addLayers(map)
   self:configureCamera(camera)
   camera:setFocus(player)
   camera:track()
   return camera
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
   local sceneGroup = self.view
   local params = event.params
   -- Code here runs when the scene is first created but has not yet appeared on screen
   local map = loadAndExtendMap(params.mapDataDir, params.mapFilename, params.extensionsPkg)
   player = map:findObject("player")
   configureWalkboxes(map)
   camera = self:createCamera(map)

   sceneGroup:insert(map) -- this doesn't have any effect?
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
