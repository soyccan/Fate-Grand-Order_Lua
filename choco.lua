require("global")
require("common")

dir = '/home/soyccan/Documents/Fate-Grand-Order_Lua/'
setImagePath(dir)
GameRegion = "TW" --StageCountRegion issue comment https://github.com/29988122/Fate-Grand-Order_Lua/issues/39#issuecomment-390208639
StageCountRegion = Region(1710,25,55,60)
SupportSwipeEndClick  = Location(35,390)

package.path = package.path .. ";" .. dir .. 'modules/?.lua'

local ankuluaUtils = require("ankulua-utils")
local scaling = require("scaling")
local game = require("game")
local support = require("support")
local card = require("card")
local battle = require("battle")
local autoskill = require("autoskill")

while (true) do
    clickNoScale(Location(900, 400))
    wait(10)
    clickNoScale(Location(1100, 700))
    wait(10)
    clickNoScale(Location(900, 850))
    wait(10)
    clickNoScale(Location(1700, 50))
    wait(10)
    clickNoScale(Location(1100, 830))
    wait(10)
    clickNoScale(Location(900, 850))
    wait(10)
end
