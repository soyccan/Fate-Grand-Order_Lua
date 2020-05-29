-- class
function Location(x, y)
    -- private members
    local _x = x
    local _y = y

    -- public members
    return {
        type = "Location",

        getX = function(self)
            return _x
        end,
        getY = function(self)
            return _y
        end,
    }
end
