local useprev = false

function snapshot()
    if not useprev then
        os.execute('timeout 10 adb shell screencap -p /sdcard/sh.png')
        os.execute('timeout 10 adb pull /sdcard/sh.png .')
        useprev = true
    end
end

function usePreviousSnap(use)
    useprev = use
end

--------------
Settings = {}

function Settings:setCompareDimension(compareByWidth,pixels)
    self.compareByWidth = compareByWidth
    self.imgpix = pixels
end

function Settings:setScriptDimension(compareByWidth,pixels)
    self.compareByWidth = compareByWidth
    self.scriptpix = pixels
end
------------- end Settings

function _scale(x, y)
    -- if Settings.compareByWidth then
    return x * Settings.imgpix // Settings.scriptpix , y *  Settings.imgpix // Settings.scriptpix
end
