--內部設定，請勿更動
--***************************************************************************
require("global")

-- dir = scriptPath()
-- dir = 'C:/Users/soyccan/Documents/Fate-Grand-Order_Lua/'
dir = '/home/soyccan/Documents/Fate-Grand-Order_Lua/'
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
Refill_Repetitions = 0

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
		Skill_Command = "c4,#,ag2hi,#,b",
		Support_SelectionMode = "preferred",
        Support_PreferredServants = "waver4.png, waver3.png, waver2.png, waver1.png",
        Support_PreferredCEs = "",
	},
    {
        Name = "Gilbox Garden",
        Skill_Command = "0,#,efl2a2g2,#,bhi2j,0,ek2",
		Support_SelectionMode = "preferred",
        Support_PreferredServants = "cba1.png",
        Support_PreferredCEs = "",
    },
    {
        Name = "Gilbox 1",
        Skill_Command = "g1i4,#,hefx31g2,#,h",
		Support_SelectionMode = "preferred",
        Support_PreferredServants = "waver4.png, waver3.png, waver2.png, waver1.png",
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
        Name = "Swim Event Honolulu Airport",
        Skill_Command = "c,#,0,def,#,0,ghi",
		Support_SelectionMode = "preferred",
		Support_PreferredServants = "swimsaber1.png, nito.png",
        Support_PreferredCEs = "",
    },
    {
        Name = "Swim Event koko",
        Skill_Command = "0,#,abcdf,#,jk2",
		Support_SelectionMode = "first",
		Support_PreferredServants = "laiguang.png, gil.png",
        Support_PreferredCEs = "",
    },
    {
        Name = "Foreigner",
        Skill_Command = "acd1,#,e,#,ac",
		Support_SelectionMode = "first",
		Support_PreferredServants = "",
        Support_PreferredCEs = "",
    },

	{
		Name = "Dust",
		Skill_Command = "cdg5,#,e5,#,abi1k14",
		Support_SelectionMode = "preferred",
		Support_PreferredServants = "merlin1.png, merlin23.png, merlin4.png, merlin_c.png"
	},
	{
		Name = "Gear",
		Skill_Command = "6,#,h6,#,bx31fed1gj46",
		Support_SelectionMode = "preferred"
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
Battle_AutoChooseTarget = 1
--自動寶具施放
Battle_NoblePhantasm = "spam"
--快速跳過死亡動畫
UnstableFastSkipDeadAnimation = 0

Withdraw_Enabled = 1

dofile(dir .. "regular.lua")
