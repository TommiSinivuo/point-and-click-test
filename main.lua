-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")

function runUnitTestSuites()
   require "testmain"
end

if system.getInfo( "environment" ) == "simulator" then
   runUnitTestSuites()
end

-- hide statusbar
display.setStatusBar(display.HiddenStatusBar)

-- seed the random number generator
math.randomseed(os.time())

-- Reserve channel 1 for background music
audio.reserveChannels(1)

-- go to the menu scene
composer.gotoScene("scene.game")
