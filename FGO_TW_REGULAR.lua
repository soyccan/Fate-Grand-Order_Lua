--內部設定，請勿更動
--***************************************************************************
require("global")

os.execute('timeout 10 adb connect 127.0.0.1:62001')

local handle = io.popen('pwd')
dir = handle:read("*a"):gsub('\n', '/')
handle:close()

setImagePath(dir)
GameRegion = "TW" --StageCountRegion issue comment https://github.com/29988122/Fate-Grand-Order_Lua/issues/39#issuecomment-390208639
StageCountRegion = Region(1710,25,55,60)
SupportSwipeEndClick  = Location(35,390)

--Initalize for user input listnames
Autoskill_List = {}
for i = 1, 10 do
    Autoskill_List[i] = {}
    for j = 1, 2 do
        Autoskill_List[i][j] = 0
    end
end
--***************************************************************************



--腳本設定說明請參照： https://github.com/29988122/Fate-Grand-Order_Lua/wiki/Script-configuration-正體中文/
--***************************************************************************
--自動補體
Refill_Enabled = 1
Refill_Resource = "All Apples"
Refill_Repetitions = 20

--自動選擇好友從者
-- first,manual/friend/preferred
Support_SelectionMode = "preferred"
Support_SwipesPerUpdate = 10
Support_MaxUpdates = 3
Support_FallbackTo = "first"
Support_FriendsOnly = 0
Support_FriendNames = ""
Support_PreferredServants = "waver4.png, waver3.png, waver2.png, waver1.png"
Support_PreferredCEs = "*chaldea_lunchtime.png"

--Bond CE Get
StopAfterBond10 = 0--[[
	This option is switched to 1 if you want to stop the script after retreiving a Bond 10 CE card
	TODO: move this explanation to documentation
--]]

--BoostItem
BoostItem_SelectionMode = "disabled" --[[
	possible values: disabled, 1, 2 or 3
	if you want to use this, make sure "Confirm Use of Boost Item" is off

	TODO: move this explanation to the documentation
--]]

StorySkip = 1 --[[
	People really want this feature.
]]

--自動施放技能
Enable_Autoskill = 1
Skill_Confirmation = 0
Skill_Command = ""

--自動技能列表
Enable_Autoskill_List = 1

Autoskill_List =
{
	{
		Name = "Daily Routine",
		Skill_Command = "c4,#,aceg2hi2,#,bk1",
		Support_SelectionMode = "first",
        Support_PreferredServants = "cba1.png, waver4.png, waver3.png, waver2.png, waver1.png",
        Support_PreferredCEs = "",
	},
    {
        Name = "Random",
        Skill_Command = "",
		Support_SelectionMode = "first",
		Support_PreferredServants = "",
        Support_PreferredCEs = "",
    },
    {
        Name = "20210423",
		Skill_Command = "c4,#,aeg2i2,#,cbhk1",
		Support_SelectionMode = "first",
		Support_PreferredServants = "",
        Support_PreferredCEs = "",
    }
}

-- apply autoskill list
-- note index starts from 1
local ch = 1
Skill_Command = Autoskill_List[ch].Skill_Command
Support_SelectionMode = Autoskill_List[ch].Support_SelectionMode
Support_PreferredServants = Autoskill_List[ch].Support_PreferredServants
Support_PreferredCEs = Autoskill_List[ch].Support_PreferredCEs
print("Using " .. Autoskill_List[ch].Name)


--自訂卡片選擇優先順序
Battle_CardPriority = "BAQ"
--自動選擇目標
Battle_AutoChooseTarget = 0
--自動寶具施放
Battle_NoblePhantasm = "spam"
--快速跳過死亡動畫
UnstableFastSkipDeadAnimation = 0

Withdraw_Enabled = 1

dofile(dir .. "regular.lua")
