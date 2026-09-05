extends Node2D
@onready var up_button: TextureRect = $UpButton
@onready var down_button: TextureRect = $DownButton
@onready var level_info_old: Label = $PropInfoBg/OldPropList/LevelInfo_old
@onready var prop_info_old: Label = $PropInfoBg/OldPropList/PropInfo_old
@onready var level_info_new: Label = $PropInfoBg/NewPropList/LevelInfo_new
@onready var prop_info_new: Label = $PropInfoBg/NewPropList/PropInfo_new
@onready var need_num: Label = $DownButton/Title/NeedNum
@onready var needlh: Label = $lh/needlh

var ZhenFaType
var RealName
var Father
func _physics_process(delta: float) -> void:
	if Father != null:
		SetBoxInfo()
		SetLevelInfo()
		SetNeedAndLhInfo()
	
func SetLevelInfo():
	ZhenFaType = Father.CurrentZhenFaName
	match ZhenFaType:
		"slz":
			RealName = "森罗阵"
		"lpz":
			RealName = "落魄阵"
		"tsz":
			RealName = "腾蛇阵"
		"tqz":
			RealName = "太清阵"
	var Level = int(PlayerData.player_data[RealName][str(Father.CurrentNum)]["Level"])
	var PropType = RoleProp.ZhenFaProps[RealName][str(Father.CurrentNum)]["Type"]	
	if int(Level) <= 50:
		level_info_old.text = "Lv." + str(Level)
		prop_info_old.text = str(PropType) + "+" + str(RoleProp.GetZFLocProp(RealName,Father.CurrentNum))
	else:
		level_info_old.text = "已满级"
		prop_info_old.text = "已满级"
	if int(Level) + 1 <= 50:
		level_info_new.text = "Lv." + str(Level + 1)
		prop_info_new.text = str(PropType) + "+" + str(RoleProp.GetNextLevelProp(RealName,Father.CurrentNum))
	else:
		prop_info_new.text = "已满级"
		level_info_new.text = "已满级"
func SetNeedAndLhInfo():
	var Level = int(PlayerData.player_data[RealName][str(Father.CurrentNum)]["Level"])
	var Name = PlayerData.player_data[RealName][str(Father.CurrentNum)]["InName"]
	var MaterialNeedValue = int(Level / 5) + 1
	var NeedLh = int(Level / 5) * 1000 + 1000
	var CurrentNum = int(PlayerData.get_item_data(Name))
	need_num.text = str(PlayerData.get_item_data(Name)) + '/' + str(MaterialNeedValue)
	if CurrentNum >= MaterialNeedValue:
		need_num.add_theme_color_override("font_color","00ff00")
	else:
		need_num.add_theme_color_override("font_color","ff0000")
	needlh.text = "灵魂：" + str(NeedLh)
func SetBoxInfo():
	up_button.Father = Father
	up_button.NotShow = true
	up_button.LocNum = Father.CurrentNum
	down_button.Father = Father
	down_button.LocNum = Father.CurrentNum
	down_button.NotShow = true

func _on_cure_level_pressed() -> void:
	var Level = int(PlayerData.player_data[RealName][str(Father.CurrentNum)]["Level"])
	var Name = PlayerData.player_data[RealName][str(Father.CurrentNum)]["InName"]
	var MaterialNeedValue = int(Level / 5) + 1
	var NeedLh = int(Level / 5) * 1000 + 1000
	var CurrentNum: = int(PlayerData.get_item_data(Name))
	if Level >= 50:
		Global.AddMessageShow(Global.Windows_,"已满级！！",1.5,Vector2(500,305))
		return
	if CurrentNum < MaterialNeedValue:
		Global.AddMessageShow(Global.Windows_,"材料不足！！",1.5,Vector2(500,305))
		return
	if PlayerData.player_data["coin_num"] < NeedLh:	
		Global.AddMessageShow(Global.Windows_,"灵魂不足！！",1.5,Vector2(500,305))	
		return
	PlayerData.player_data["coin_num"] -= NeedLh
	PlayerData.remove_dj(Name,PlayerData.get_dj_page(Name),MaterialNeedValue)
	PlayerData.player_data[RealName][str(Father.CurrentNum)]["Level"] += 1	
	Global.AddMessageShow(Global.Windows_,"升级成功！！",1.5,Vector2(500,305))
	
