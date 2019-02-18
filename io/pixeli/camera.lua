local perspective = require("com.gymbylcoding.perspective")

Camera = {}

function Camera:new(o)
   o = o or {}
   self.__index = self
   setmetatable(o, self)

   self.view = perspective.createView()
   self.layerNumForName = {}

   return o
end

function Camera:addLayers(map)
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
      self.view:add(tiledLayer, cameraLayerNum, false)
      self.layerNumForName[layerName] = cameraLayerNum
   end
end

function Camera:findLayer(name)
   return self.view:layer(self.layerNumForName[name])
end

function Camera:setBounds(bounds)
   self.view:setBounds(bounds.xMin, bounds.xMax, bounds.yMin, bounds.yMax)
end

local function calculateCameraBounds(contentBounds)
   local cameraBounds = {}
   cameraBounds.xMin = contentBounds.xMin + (display.contentWidth / 2)
   cameraBounds.yMin = contentBounds.yMin + (display.contentHeight / 2)
   cameraBounds.xMax = contentBounds.xMax - (display.contentWidth / 2)
   cameraBounds.yMax = contentBounds.yMax - (display.contentHeight / 2)
   return cameraBounds
end

function Camera:setBoundsFromLayer(name)
   local contentBounds = self:findLayer(name).contentBounds
   cameraBounds = calculateCameraBounds(contentBounds)
   self:setBounds(cameraBounds)
end

function Camera:setDamping(value)
   self.view.damping = value
end

function Camera:setFocus(obj)
   self.view:setFocus(obj)
end

function Camera:track()
   self.view:track()
end

return Camera