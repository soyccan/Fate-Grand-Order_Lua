require "common"

package.cpath = package.cpath .. ';/home.orig/soyccan/luaOpenCV/build/libcv.so'
local cv = require("cv")


-- class
function Region(x, y, w, h)
    -- private members
    local _x = x
    local _y = y
    local _w = w
    local _h = h

    local _exists = function(PS)
        -- for k,v in ipairs(PS) do
        --     print(k,v)
        -- end
        -- print(type(PS))
        assert(type(PS) == "string" or PS.type == "Pattern")
        if type(PS) ~= "string" then
            PS = PS:getFilename()
        end

        snapshot()

        local threshold = 0.85
        local img = cv.imread("sh.png", 0)
        local tmpl = cv.imread(PS, 0)

        local x,y = _scale(_x,_y)
        local w,h = _scale(_w,_h)
        print("_has " .. PS,x,y,w,h,'/',img.cols,img.rows)
        local sub = cv.Mat.new(img, cv.Rect(x,y,w,h))

        -- Note following are equivalent in lua: 
        -- obj.method(obj, arg) and obj:method(arg)
        -- TODO: UMat faster?
        local res = cv.Mat.zeros(sub.rows - tmpl.rows + 1, 
                                 sub.cols - tmpl.cols + 1, sub:type())
        cv.matchTemplate(sub, tmpl, res, cv.TM_CCOEFF_NORMED)

        local maxval = res:max()
        -- TODO: maxx is a mistype of maxrow, fix that in library
        local maxy = res:maxx()
        local maxx = res:maxy()
        print(PS, maxval, maxx, maxy)
        if maxval >= threshold then
            -- TODO: more accurate region than 10x10
            return Match(maxx,maxy, 10, 10)
        end
        print(PS .. ' not found')
        
        -- manually free matrix's memory
        img:release()
        tmpl:release()
        res:release()
        sub:release()

        return nil
    end

    -- public members
    return {
        type = "Region",

        getX = function(self) return _x end,
        getY = function(self) return _y end,
        getW = function(self) return _w end,
        getH = function(self) return _h end,
        setX = function(self) _x = x end,
        setY = function(self) _y = y end,
        setW = function(self) _w = w end,
        setH = function(self) _h= h end,
        
        exists = function(self, PS)
            return _exists(PS)
        end,

        has = function(self, PS)
            return _exists(PS) ~= nil
        end,

        findAll = function(self, PS)
            -- TODO: currently only return one match
            local a = {}
            table.insert(a, _exists(PS))
            return a
        end,

        save = function(self, path)
            -- TODO: store img matrix as member for performance
            local img = cv.imread("sh.png", 0)
            local x,y = _scale(_x,_y)
            local w,h = _scale(_w,_h)
            local sub = cv.Mat.new(img, cv.Rect(x,y,w,h))
            cv.imwrite(path, sub)
            sub:release()
        end,
    }
end



--
-- local Region = {}
-- package.loaded["Region"] = Region
--
-- Region.__index = Region
--
-- function Region:new(x,y,w,h)
--     o = o or {}
--     setmetatable(o,self)
--     self._x = x
--     self._y = y
--     self._w = w
--     self._h = h
--
--     return self
-- end
--
-- function Region:getX()
--     return self._x
-- end
-- function Region:getY()
--     return self._y
-- end
-- function Region:getW()
--     return self._w
-- end
-- function Region:getH()
--     return self._h
-- end


-- function Region:getCenter()
-- end
--
-- function Region:getTarget()
-- end
-- function Region:getLastMatch()
-- end
-- function Region:click()
-- end
-- function Region:find()
-- end
-- function Region:wait()
-- end
-- function Region:findAll()
-- end
-- function Region:waitVanish()
-- end
-- function Region:dragDrop()
-- end
-- function Region:type()
-- end


-- return Region
