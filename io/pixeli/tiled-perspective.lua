local perspective = require("com.gymbylcoding.perspective")

TiledPerspective = {}

function TiledPerspective:new(o)
   o = o or {}
   self.__index = self
   setmetatable(o, self)

   self.camera = perspective.createView()
   self.layerNumForName = {}

   return o
end

function TiledPerspective:load(map)
   -- perspective.lua does some really weird stuff behind the curtains
   -- For some reason it mutates the 'map' table, removing every display group
   -- that is added to perspective. This is why looping the Tiled layers have
   -- to be done so that we first assign the total layer count to a variable
   -- (because map.numChildren changes dynamically while we loop) and then
   -- always take the first layer (because the previously added layer is popped
   -- from the table) and add it to perspective.
   -- Also, layer 1 seems to work differently in perpective (parallax settings won't apply),
   -- so therefore we use number 2 as the smallest layer number. The layer number doesn't
   -- really matter, as long as they're in the correct order.
   local layerCount = map.numChildren
   for layerNum=1, layerCount do
      local layerName = map[1].name
      local cameraLayerNum = layerCount - (layerNum - 2)
      print( layerNum .. ": " .. layerName .. " (" .. cameraLayerNum .. ")" )
      local tiledLayer = map:findLayer(layerName)
      self.camera:add(tiledLayer, cameraLayerNum, false)
      self.layerNumForName[layerName] = cameraLayerNum
   end
end

function TiledPerspective:findLayer(name)
   return self.camera:layer(self.layerNumForName[name])
end

function TiledPerspective:setDamping(value)
   self.camera.damping = value
end

function TiledPerspective:setFocus(obj)
   self.camera:setFocus(obj)
end

function TiledPerspective:track()
   self.camera:track()
end

return TiledPerspective