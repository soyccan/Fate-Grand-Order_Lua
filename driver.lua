local Driver = {}
package.loaded["Driver"] = Driver

Driver.__index = Driver

function Driver:new(x, y)
    self = {}
    self._x = x
    self._y = y

    setmetatable(self, Driver)

    return self
end


return Driver
