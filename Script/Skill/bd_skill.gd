extends MarginContainer
@onready var C_name_1 = $HBoxContainer/Current_e/name_1
@onready var C_name_2 = $HBoxContainer/Current_e/name_2
@onready var C_name_3 = $HBoxContainer/Current_e/name_3
@onready var C_name_4 = $HBoxContainer/Current_e/name_4
@onready var C_name_5 = $HBoxContainer/Current_e/name_5
@onready var C_name_6 = $HBoxContainer/Current_e/name_6
@onready var N_name_1 = $HBoxContainer/Next_e/name_1
@onready var N_name_2 = $HBoxContainer/Next_e/name_2
@onready var N_name_3 = $HBoxContainer/Next_e/name_3
@onready var N_name_4 = $HBoxContainer/Next_e/name_4
@onready var N_name_5 = $HBoxContainer/Next_e/name_5
@onready var N_name_6 = $HBoxContainer/Next_e/name_6
@onready var L_name_1 = $HBoxContainer/NeedLh/name_1
@onready var L_name_2 = $HBoxContainer/NeedLh/name_2
@onready var L_name_3 = $HBoxContainer/NeedLh/name_3
@onready var L_name_4 = $HBoxContainer/NeedLh/name_4
@onready var L_name_5 = $HBoxContainer/NeedLh/name_5
@onready var L_name_6 = $HBoxContainer/NeedLh/name_6

func _physics_process(_delta: float) -> void:
	set_infor()
func set_infor():
	var target = PlayerData.player_data["被动技能"]
	if target["热血"] != 0:
		C_name_1.text = "生命上限增加至 " + str(PaSkill.Rx_value[target["热血"]])
	else:
		C_name_1.text = ""
	if target["魔泉"] != 0:	
		C_name_2.text = "魔法上限增加至 " + str(PaSkill.Mq_value[target["魔泉"]])
	else:
		C_name_2.text = ""
	if target["狂暴"] != 0:	
		C_name_3.text = "暴击增加至 " + str(PaSkill.Kb_value[target["狂暴"]])
	else:
		C_name_3.text = ""
	if target["永恒"] != 0:
		C_name_4.text = "回血增加至 " + str(PaSkill.Yh_value[target["永恒"]])
	else:
		C_name_4.text = ""
	if target["辉煌"] != 0:	
		C_name_5.text = "回魔增加至 " + str(PaSkill.Hh_value[target["辉煌"]])
	else:
		C_name_5.text = ""
	if target["敏锐"] != 0:	
		C_name_6.text = "命中增加至 " + str(PaSkill.Mr_value[target["敏锐"]])
	else:
		C_name_6.text = ""
	#####################################################################
	N_name_1.text = "生命上限增加至 " + str(PaSkill.Rx_value[target["热血"] + 1])
	N_name_2.text = "魔法上限增加至 " + str(PaSkill.Mq_value[target["魔泉"] + 1])
	N_name_3.text = "暴击增加至 " + str(PaSkill.Kb_value[target["狂暴"] + 1])
	N_name_4.text = "回血增加至 " + str(PaSkill.Yh_value[target["永恒"] + 1])
	N_name_5.text = "回魔增加至 " + str(PaSkill.Hh_value[target["辉煌"] + 1])
	N_name_6.text = "命中增加至 " + str(PaSkill.Mr_value[target["敏锐"] + 1])
	
	L_name_1.text = str(PaSkill.get_lh("热血"))
	L_name_2.text = str(PaSkill.get_lh("魔泉"))
	L_name_3.text = str(PaSkill.get_lh("狂暴"))
	L_name_4.text = str(PaSkill.get_lh("永恒"))
	L_name_5.text = str(PaSkill.get_lh("辉煌"))
	L_name_6.text = str(PaSkill.get_lh("敏锐"))

func up_level(name_):
	var target = PlayerData.player_data["被动技能"]
	var have_lh = PlayerData.player_data["coin_num"]
	var need_lh = PaSkill.get_lh(name_)
	if target[name_] < PaSkill.max_level:
		if need_lh <= have_lh:
			PlayerData.player_data["coin_num"] -= need_lh
			target[name_] += 1
		else:
			Global.add_moment_text(get_parent(),Vector2(0,0),"灵魂不足！！",1)
	else:
		Global.add_moment_text(get_parent(),Vector2(0,0),"已经无法再升级了！！",1)


func _on_up_1_pressed() -> void:
	up_level("热血")
	MemoryClass.保存游戏(Global.cd_path)

func _on_up_2_pressed() -> void:
	up_level("魔泉")
	MemoryClass.保存游戏(Global.cd_path)

func _on_up_3_pressed() -> void:
	up_level("狂暴")
	MemoryClass.保存游戏(Global.cd_path)

func _on_up_4_pressed() -> void:
	up_level("永恒")
	MemoryClass.保存游戏(Global.cd_path)

func _on_up_5_pressed() -> void:
	up_level("辉煌")
	MemoryClass.保存游戏(Global.cd_path)

func _on_up_6_pressed() -> void:
	up_level("敏锐")
	MemoryClass.保存游戏(Global.cd_path)
