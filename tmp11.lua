package.cpath = package.cpath .. ';/home.orig/soyccan/luaOpenCV/build/libcv.so'
local cv = require("cv")

local img=cv.imread("sh.png",0)
local tmpl = cv.imread("image_TW/support_screen.png", 0)
local res = cv.Mat.zeros(img.rows - tmpl.rows + 1, 
                         img.cols - tmpl.cols + 1, img:type())
cv.matchTemplate(img, tmpl, res, cv.TM_CCOEFF_NORMED)
local a=res:max()
local b=res:maxx()
local c=res:maxy()
print(a,b,c)
