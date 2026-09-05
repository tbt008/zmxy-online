extends Node2D
class_name Strength
@onready var lh_text = $need_lh/lh
@onready var old_zb = $old_zb/old_zb
@onready var new_zb = $new_zb/new_zb
@onready var n_q_1: Button = $n_q_1/n_q_1
@onready var n_q_2: Button = $n_q_2/n_q_2
@onready var num_b1 = $n_q_1/n_q_1/number
@onready var num_b2 = $n_q_2/n_q_2/number2
var old_zb_name = "empty"
var new_zb_name = "empty"
var qhs_1_name = "empty"
var qhs_2_name = "empty"
var Data = {}
var qh_level = -1
var qhs_1_num = 0
var qhs_2_num = 0
var need_lh: int
func _ready() -> void:
	n_q_1.is_in_ldl_gz = true
	n_q_2.is_in_ldl_gz = true
	old_zb.is_in_ldl_gz = true
	new_zb.is_in_ldl_gz = true
func _physics_process(_delta: float) -> void:
	n_q_1.is_in_ldl_gz = true
	n_q_2.is_in_ldl_gz = true
	old_zb.is_in_ldl_gz = true
	new_zb.is_in_ldl_gz = true
	if MLdl.qh_list["名字"] != "":
		old_zb_name = MLdl.qh_list["名字"]
	get_qhs_name()
	set_color()
	set_str_info()
	qh_level = MLdl.qh_list["强化等级"]
	Data = MLdl.qh_list["Data"]
func set_str_info():
	new_zb_name = old_zb_name
	n_q_1.set_button_icon(load_(str(qhs_1_name)))
	n_q_2.set_button_icon(load_(str(qhs_2_name)))
	old_zb.set_button_icon(load_(str(old_zb_name)))
	old_zb.qh_level = qh_level
	old_zb.EQ_prop = Data
	new_zb.set_button_icon(load_(str(new_zb_name)))
	new_zb.EQ_prop = Data
	new_zb.qh_level = qh_level + 1
	if qhs_1_num > 0:
		num_b1.text = str(PlayerData.get_item_data(qhs_1_name)) + "/" + str(qhs_1_num)
	else:
		num_b1.text = ""
	if qhs_2_num > 0:
		num_b2.text = str(PlayerData.get_item_data(qhs_2_name)) + "/" + str(qhs_2_num)
	else:
		num_b2.text = ""
	lh_text.text = str(need_lh)
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func set_color():
	if PlayerData.get_item_data(qhs_1_name) < qhs_1_num:
		num_b1.add_theme_color_override("font_color",Color("FF0000"))
	else:
		num_b1.add_theme_color_override("font_color",Color("00FF00"))
	if PlayerData.get_item_data(qhs_2_name) < qhs_2_num:
		num_b2.add_theme_color_override("font_color",Color("FF0000"))
	else:
		num_b2.add_theme_color_override("font_color",Color("00FF00"))
func _on_qh__pressed() -> void:
	if old_zb_name == "empty" or new_zb_name == "empty":
		Global.AddMessageShow(Global.Windows_,"请先选择一件装备！！！",1.5,Vector2(470,295))
		return
	var Type = AE.AllEquipment_[MLdl.qh_list["名字"]]["品质"]
	var MaxLevel: int = 0
	match Type:
		"普通","优秀","精良","史诗":
			MaxLevel = 3
		"玄冥","邪灵","魂器":
			MaxLevel = 5
		"传说":
			MaxLevel = 6
		"神器":
			MaxLevel = 7
	if MLdl.qh_list["强化等级"] >= MaxLevel :
		Global.AddMessageShow(get_parent(),str(Type) + "品质装备最高强化" + str(MaxLevel) + "级！！",1.5,Vector2(15,-45))
		return
	if MLdl.qh_list["强化等级"] < 7 :
		old_zb_name = MLdl.qh_list["名字"]
	else:
		Global.AddMessageShow(get_parent(),"装备等级已达最高等级！！无法继续强化！",1.5,Vector2(15,-45))
		return
	if PlayerData.get_item_data(qhs_1_name) >= qhs_1_num and PlayerData.get_item_data(qhs_2_name) >= qhs_2_num:
		if PlayerData.player_data["coin_num"] >= need_lh:	
			PlayerData.player_data["装备列表"]["页码" + str(MLdl.qh_list["页码"])][MLdl.qh_list["位置"]]["强化等级"] += 1
			PlayerData.player_data["coin_num"] -= need_lh
			PlayerData.remove_dj(qhs_1_name,PlayerData.get_dj_page(qhs_1_name),qhs_1_num)
			PlayerData.remove_dj(qhs_2_name,PlayerData.get_dj_page(qhs_2_name),qhs_2_num)
			Global.AddMessageShow(get_parent(),"强化成功！！",1.5,Vector2(15,-45))
			remove_infomation()
		else:
			Global.AddMessageShow(get_parent(),"灵魂不足！无法强化！！",1.5,Vector2(15,-45))
	else:
		Global.AddMessageShow(get_parent(),"强化石数量不足！！",1.5,Vector2(15,-45))
	MemoryClass.保存游戏(Global.cd_path)
func get_qhs_name():
	match qh_level:
		-1:
			qhs_1_name = "empty"
			qhs_2_name = "empty"
			qhs_1_num = 0
			qhs_2_num = 0
			need_lh = int("???")
		0:
			qhs_1_name = "qhs_1"#12
			qhs_2_name = "qhs_2"
			qhs_1_num = 4
			qhs_2_num = 2
			need_lh = 300 * qh_level
		1:#15
			qhs_1_name = "qhs_1"
			qhs_2_name = "qhs_2"
			qhs_1_num = 6
			qhs_2_num = 4
			need_lh = 300 * qh_level
		2:#33
			qhs_1_name = "qhs_2"
			qhs_2_name = "qhs_3"
			qhs_1_num = 9
			qhs_2_num = 6
			need_lh = 300 * qh_level
		3:#57
			qhs_1_name = "qhs_2"
			qhs_2_name = "qhs_3"
			qhs_1_num = 12
			qhs_2_num = 9
			need_lh = 300 * qh_level
		4:#84
			qhs_1_name = "qhs_2"
			qhs_2_name = "qhs_3"
			qhs_1_num = 18
			qhs_2_num = 12
			need_lh = 1500
		5:#111
			qhs_1_name = "qhs_3"
			qhs_2_name = "qhs_4"
			qhs_1_num = 24
			qhs_2_num = 18
			need_lh = 20000
		6:#141
			qhs_1_name = "qhs_3"
			qhs_2_name = "qhs_4"
			qhs_1_num = 60
			qhs_2_num = 36
			need_lh = 100000
		7:#174
			qhs_1_name = "qhs_3"
			qhs_2_name = "qhs_4"
			qhs_1_num = 40
			qhs_2_num = 18
			need_lh = 10000
func remove_infomation():
	old_zb_name = "empty"
	new_zb_name = "empty"
	qhs_1_name = "empty"
	qhs_2_name = "empty"
	qh_level = -1
	qhs_1_num = 0
	qhs_2_num = 0
	MLdl.qh_list["名字"] = ""
	MLdl.qh_list["强化等级"] = -1
	MLdl.qh_list["页码"] = 0
	MLdl.qh_list["位置"] = 0
	MemoryClass.保存游戏(Global.cd_path)
