require "region"

-- class
function Match(x, y, w, h)
    -- private members
    
    -- inherit base class
    local base = Region(x, y, w, h)

    -- override public members
    base.type = "Match"

    return base
end

-- package.cpath = package.cpath .. ';./libcv.so'
-- local cv2 = require("cv")
--
-- local
--
-- local Match = {}
-- package.loaded["Match"] = Match
--
-- Match.__index = Match
--
-- function Match:new(x,y,w,h)
--     o = o or {}
--     setmetatable(o,self)
--
--     return self
-- end
--
--
-- return Match

