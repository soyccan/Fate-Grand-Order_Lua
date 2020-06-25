package.path = package.path .. ';sikulix_adapter/?.lua'
require "region"
require "location"
require "pattern"
require "match"
require "common"

local socket = require("socket")


unpack = table.unpack


local __gameArea = Region(0,0,1920,1080)
local __imagePath = 'blbla'
local __inswait = 1000


--



function typeOf(obj)
    -- TODO: how to implement this hell function?
    return obj.type
    -- return "userdata"
end

function wait(sec)
    socket.select(nil,nil,sec)
end

function toast(s)
    print(s)
end

function scriptExit(msg)
    print(msg)
    os.exit(0)
end

function clickNoScale(PSMRL)
    -- TODO: find all that need to use clickNoScale instead of click()
    assert(PSMRL.type == "Match" or PSMRL.type == 'Location')

    local cmdTap = string.format('adb shell input tap %d %d',
        PSMRL.getX(),
        PSMRL.getY())
    print('> ' .. cmdTap)
    os.execute(cmdTap)
end

-- PSMRL: Pattern/string/Match/Region/Location
function click(PSMRL)
    assert(PSMRL.type == "Match" or PSMRL.type == 'Location')

    x,y = _scale(
        PSMRL.getX(),
        PSMRL.getY())
    local cmdTap = string.format('adb shell input tap %d %d',
    x,y
    )
    print('> ' .. cmdTap)
    os.execute(cmdTap)
end

function continueClick(PSMRL, times)
    -- TODO: too slow
    for i = 1, times do
        click(PSMRL)
    end
end


-- navigation bar of the phone screen
function setImmersiveMode(enable)
end
function autoGameArea(enable)
end

function regionFindAllNoFindException(region, PS)
    return region:findAll(PS)
end

function setManualTouchParameter(maxDistance, insertWaitTimeMs)
end

function manualTouch(actionTable)
    -- argument example:
    -- actionList = { 
    -- {action = "touchDown", target = p1},
    -- {action = "wait", target = 0.2},
    -- {action = "touchMove", target = p2},
    -- {action = "touchMove", target = p3},
    -- {action = "touchUp", target = p3} }
    local x1,y1,x2,y2,w
    for k, v in ipairs(actionTable) do
        if v.action == "touchDown" then
            x1 = v.target.getX()
            y1 = v.target.getY()
        elseif v.action=="touchMove" then
            x2 = v.target.getX()
            y2 = v.target.getY()
        elseif v.action=="wait" then
        elseif v.action=='touchUp' then
        end
    end

    x1,y1 = _scale(x1,y1)
    x2,y2 = _scale(x2,y2)

    local cmd= string.format(
        'adb shell input swipe %d %d %d %d %d',
        x1, y1, x2,y2,__inswait
    )
    print('cmd: ' .. cmd)
    os.execute(cmd)
end


-- def swipe(org: (int, int), tar: (int, int), delay):
--
local function swipe(org, tar, delay)
    cmdSwipe = string.format(
        'adb shell input swipe %d %d %d %d %d',
        org[0],
        org[1],
        tar[0],
        tar[1],
        int(delay*1000)
    )
    print(cmdSwipe)
    os.execute(cmdSwipe)
end





function setImagePath(dir)
    __imagePath = dir
end


-- function Settings:setCompareDimension()
-- end
-- function setImmersiveMode()
-- end
-- function autoGameArea()
-- end
function getGameArea()
    return __gameArea
end
function setGameArea(region)
    __gameArea = region
end






-- function getAppUsableScreenSize()
-- end
-- function getRealScreenSize()
-- end
-- function setImagePath()
-- end
-- function Settings:setROI()
-- end
-- function Settings:getROI()
-- end
-- function Settings:get()
-- end
-- function usePreviousSnap()
-- end
-- function snapshot()
-- end
-- function snapshotColor()
-- end
-- function setAlternativeClick()
-- end
-- function Settings:snapSet()
-- end
--
--
--
--
--
--
--
--
-- # helper function
-- def shifter(ord: (int, int), i: int = 10, j: int = 10) -> (int, int):
--     return (ord[0] + random.randint(-i, i), ord[1] + random.randint(-j, j))
--
--
-- def split(path: str, edge: (int, int)):
--     img = Image.open(path)
--     out = img.crop((edge[0], edge[1], edge[0]+1920, edge[1]+1080))
--     out.save("tmp.png")
--
--
-- def get_sh(edge: (int, int)) -> str:
--     screenshot()
--     split("sh.png", edge)
--     return "tmp.png"
--
--
-- # OpenCV related
-- def standby(sh: str, tmp: str, threshold: float = 0.85) -> bool:
--     img = cv2.imread(sh, 0)
--     template = cv2.imread(tmp, 0)
--     res = cv2.matchTemplate(img, template, cv2.TM_CCOEFF_NORMED)
--     if (res >= threshold).any():
--         return True
--     print(tmp + ' not found')
--     #import pdb;pdb.set_trace()
--     return False
--
--
-- def check_color(sh: str, tmp: str, threshold: float = 0.8) -> bool:
--     img = cv2.imread(sh, cv2.IMREAD_COLOR)
--     template = cv2.imread(tmp, cv2.IMREAD_COLOR)
--     res = cv2.matchTemplate(img, template, cv2.TM_CCOEFF_NORMED)
--     if (res >= threshold).any():
--         return True
--     return False
--
--
-- def get_crd(sh: str, tmp: str, threshold: float = 0.85) -> [(int, int)]:
--     img = cv2.imread(sh, 0)
--     template = cv2.imread(tmp, 0)
--     res = cv2.matchTemplate(img, template, cv2.TM_CCOEFF_NORMED)
--     pos = []
--     loc = np.where(res >= threshold)
--     for pt in zip(*loc[::-1]):
--         pos.append(pt)
--     return pos
--
--
-- def get_battle_id(img_path: str):
--     # the following method is not accurate
--     # TODO: train tesseract to recognize figure of battle id
--     img = Image.open(img_path)
--     region = img.crop((1286, 15, 1378, 62))
--     THRESHOLD = 200
--     BINARY_TABLE = [0 if i < THRESHOLD else 1 for i in range(256)]
--     text = image_to_string(
--         region.convert('L').point(BINARY_TABLE, '1'),
--         config='--psm 7 --oem 3 -c tessedit_char_whitelist=/1234')
--         # config='digits --psm 7 --oem 3')
--         # config='--psm 7 --oem 3 outputbase nobatch digits')
--          #  -c tessedit_char_whitelist=/1234
--     print(text)
--     try:
--         x = int(text[0])
--         return x
--     except (IndexError, ValueError):
--         if text and text[0] == 'e': return 2 # AAAA hope it works
--         print("Failed to recognize battle id.")
--         return 0
--
--
-- def split_cards(img: str):
--     im = Image.open(img)
--     img_size = im.size
--     x = img_size[0] // 5
--     y = img_size[1] // 2 - 50
--     for i in range(5):
--         left = i*x
--         up = y
--         right = left + x
--         low = up + y
--         region = im.crop((left, up, right, low))
--         region.save(f"./temp/{i}.png")
--
--
-- # prepare for servant reo
-- def split_servant(img: str, i: int):
--     im = Image.open(img)
--     size = (138, 144, 238, 226)
--     region = im.crop(size)
--     region.save(f"./temp/_s{i}.png")
