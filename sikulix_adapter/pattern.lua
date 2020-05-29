-- class
function Pattern(path)
    -- private members
    local _path = path

    -- public members
    return {
        type = "Pattern",

        similar = function(self, similarity)
            -- TODO: set min similarity
            return self
        end,

        getFilename = function(self)
            return _path
        end,
    }
end

--
-- local Pattern = {}
-- package.loaded["Pattern"] = Pattern
--
-- Pattern.__index = Pattern
--
-- function Pattern:new(filename)
--     o = o or {}
--     setmetatable(o,self)
--     self._filename = filename
--
--     return self
-- end


-- function Pattern:mask()
-- end
-- function Pattern:similar()
-- end
-- function Pattern:targetOffset()
-- end
-- function Pattern:getTargetOffset()
-- end


-- return Pattern
