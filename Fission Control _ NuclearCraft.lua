local GUI = require("GUI")
local component = require "component"
local sides = require "sides"
local y=0
local component = require "component"
local sides = require "sides"
local reactor = component.nc_fission_reactor
local b = 0
local function BA()
    b= component.nc_fission_reactor.GetFissionFuelTime() - component.nc_fission_reactor.GetCurrentProcessTime()
    return b
end
 
--------------------------------------------------------------------------------

local application = GUI.application()
application:addChild(GUI.panel(1, 1, application.width, application.height, 0x2D2D2D))



-- Start reactor
local Reactor1Start = application:addChild(GUI.button(2, 2, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Start Reactor"))
Reactor1Start.onTouch = function()
        component.nc_fission_reactor.activate()
	GUI.alert("Reactor Turned on!")
        y=1
       -- EmergengyHeatStopSystem()
end

-- Stop Reactor
local Reactor1Stop = application:addChild(GUI.button(2, 6, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Stop Reactor"))
Reactor1Stop.onTouch = function()
        component.nc_fission_reactor.deactivate()
	GUI.alert("Reactor Turned Off!")
        y=0
end

-- What Fuel am i Using
local FuelCheck = application:addChild(GUI.button(2, 10, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Check Fuel"))
FuelCheck.onTouch = function()
	GUI.alert(component.nc_fission_reactor.getFissionFuelName())
end

-- How how Rf am i generating
local RF = application:addChild(GUI.button(2, 14, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "RF Per tick"))
RF.onTouch = function()
	GUI.alert(component.nc_fission_reactor.getReactorProcessPower() .. " RF per Tick")
end

-- Fuel Time Left
local FTL = application:addChild(GUI.button(2, 18, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Fuel Time Left"))
FTL.onTouch = function()
	GUI.alert(b.." Seconds Left for the Fuel")
        do return end
end





--------------------------------------------------------------------------------

application:draw(true)
application:start()
