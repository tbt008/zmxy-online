extends Node2D
@onready var old_text: Label = $OldList/oldpic/sjq/OldText
@onready var new_text: Label = $NewList/newpic/sjq/NewText
@onready var add_prop_old: Label = $OldList/AddPropOld
@onready var skill_info_old: Label = $OldList/SkillInfoOld
@onready var add_prop_new: Label = $NewList/AddPropNew
@onready var skill_info_new: Label = $NewList/SkillInfoNew
@onready var item: Button = $TextureRect/Item
@onready var need: Label = $TextureRect/Need
@onready var needlh: Label = $lh/needlh
var ZhenFaType
var Father
var RealName
func _physics_process(delta: float) -> void:
	if Father != null:
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
		SetItemPic()
		SetNeedAndLhInfo()
		SetSkillInfo()
		SetAddPropText()
func SetItemPic():
	var Name = "zftps"
	item.is_in_hhgz = true
	item.set_button_icon(load_(Name))
	item.qh_level = 0
	item.wx = []
	item.EQ_prop = AE.AllEquipment_[Name]
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func SetAddPropText():
	
	var Level = PlayerData.player_data[RealName]["Level"]
	old_text.text = "阵法等级：Lv." + str(Level)
	if Level + 1 < 10:
		new_text.text = "阵法等级：Lv." + str(Level + 1)
	else:
		new_text.text = "已满级"
	match RealName:
		"森罗阵":
			add_prop_old.text = "附加属性：最终伤害减少" + str(Level) + "%"
			if Level < 10:
				add_prop_new.text = "附加属性：最终伤害减少" + str(Level + 1) + "%"
			else:
				add_prop_new.text = ""
		"落魄阵":
			add_prop_old.text = "附加属性：最终伤害增加" + str(Level) + "%"
			if Level < 10:
				add_prop_new.text = "附加属性：最终伤害增加" + str(Level + 1) + "%"
			else:
				add_prop_new.text = ""
		"腾蛇阵":
			add_prop_old.text = "附加属性：受到爆伤伤害减少" + str(Level) + "%"
			if Level < 10:
				add_prop_new.text = "附加属性：受到爆伤伤害减少" + str(Level + 1) + "%"
			else:
				add_prop_new.text = ""
		"太清阵":
			add_prop_old.text = "附加属性：造成爆伤增加" + str(Level) + "%"
			if Level < 10:
				add_prop_new.text = "附加属性：造成爆伤增加" + str(Level + 1) + "%"
			else:
				add_prop_new.text = ""
func SetSkillInfo():
	var Level = PlayerData.player_data[RealName]["Level"]
	match RealName:
		"森罗阵":
			skill_info_old.text = "森罗阵Lv." + str(Level) + '：使用后立刻获得森罗加护（自身受伤减少' + str(Level * 2) + "%，持续10秒。）"
			if Level < 10:
				skill_info_new.text = "森罗阵Lv." + str((Level + 1)) + '：使用后立刻获得森罗加护（自身受伤减少' + str((Level + 1) * 2) + "%，持续10秒。）"
			else:
				skill_info_new.text = ""
		"落魄阵":
			skill_info_old.text = "落魄阵Lv." + str(Level) + '：对进入法阵的敌人有' + str(Level * 10) + '%概率对其施加虚弱效果（造成伤害降低' + str(Level * 2) + "%），阵法存在8秒，持续10秒。"
			if Level < 10:
				skill_info_new.text = "落魄阵Lv." + str((Level + 1)) + '：对进入法阵的敌人有' + str((Level + 1) * 10) + '%概率对其施加虚弱效果（造成伤害降低' + str((Level + 1) * 2) + "%），阵法存在8秒，效果持续10秒。"
			else:
				skill_info_new.text = ""
		"腾蛇阵":
			skill_info_old.text = "腾蛇阵Lv." + str(Level) + '：自身伤害增加' + str(Level * 1.5) + "%，持续10秒。"
			if Level < 10:	
				skill_info_new.text = "腾蛇阵Lv." + str((Level + 1)) + '：自身伤害增加' + str((Level + 1) * 1.5) + "%，持续10秒。"
			else:
				skill_info_new.text = ""
		"太清阵":
			skill_info_old.text = "太清阵Lv." + str((Level + 1)) + "：每过1秒，清除处于法阵内玩家的低级负面，并恢复一定量的生命，令其1秒内不会被击退，法阵持续10秒。"
			if Level < 10:
				skill_info_new.text = "太清阵Lv." + str((Level + 1)) + "：每过1秒，清除处于法阵内玩家的低级负面，并恢复一定量的生命，令其1秒内不会被击退，法阵持续10秒。"
			else:
				skill_info_new.text = ""
func SetNeedAndLhInfo():
	var Level = PlayerData.player_data[RealName]["Level"]
	var Name = "zftps"
	var MaterialNeedValue = int(Level) * 10 + 10
	var NeedLh = int(Level) * 10000 + 1000
	var CurrentNum = int(PlayerData.get_item_data(Name))
	need.text = str(PlayerData.get_item_data(Name)) + '/' + str(MaterialNeedValue)
	if CurrentNum >= MaterialNeedValue:
		need.add_theme_color_override("font_color","00ff00")
	else:
		need.add_theme_color_override("font_color","ff0000")
	needlh.text = "灵魂：" + str(NeedLh)

func CheckFullLevel():
	var List = PlayerData.player_data[RealName]
	var Level = PlayerData.player_data[RealName]["Level"]
	var NeedLevel = 5 + Level * 5
	for i in List:
		if typeof(List[i]) == TYPE_DICTIONARY:
			if List[i]["Level"] < NeedLevel:
				return false
	return true

func _on_tupo_pressed() -> void:
	var Level = PlayerData.player_data[RealName]["Level"]
	var Name = "zftps"
	var MaterialNeedValue = int(Level) * 10 + 10
	var NeedLh = int(Level) * 10000 + 1000
	var CurrentNum: = int(PlayerData.get_item_data(Name))
	if Level >= 10:
		Global.AddMessageShow(Global.Windows_,"阵法已满级！！",1.5,Vector2(500,305))
		return
	if CurrentNum < MaterialNeedValue:
		Global.AddMessageShow(Global.Windows_,"材料不足！！",1.5,Vector2(500,305))
		return
	if PlayerData.player_data["coin_num"] < NeedLh:	
		Global.AddMessageShow(Global.Windows_,"灵魂不足！！",1.5,Vector2(500,305))	
		return
	if not CheckFullLevel():
		Global.AddMessageShow(Global.Windows_,"还有阵法未达到指定要求！！",1.5,Vector2(500,305))	
		return
	PlayerData.player_data["coin_num"] -= NeedLh
	PlayerData.remove_dj(Name,PlayerData.get_dj_page(Name),MaterialNeedValue)
	PlayerData.player_data[RealName]["Level"] += 1	
	Global.AddMessageShow(Global.Windows_,"阵法突破成功！！",1.5,Vector2(500,305))
