extends Node
var need_lhList = [5000,10000,15000,20000,25000,30000,35000]
var Rx_value = [0,200,300,400,500,600,700,800]
var Mq_value = [0,100,130,160,200,240,280,350]
var Kb_value = [0,2,3,4,5,6,7,8]
var Yh_value = [0,2,3,4,5,6,7,8]
var Hh_value = [0,2,3,4,5,6,7,8]
var Mr_value = [0,2,3,4,5,6,7,8]
var max_level = 6
func _physics_process(_delta: float) -> void:
	get_passiveSkill_properies()
func get_passiveSkill_properies():
	var target = PlayerData.player_data["被动技能"]
	if target["热血"] < PaSkill.max_level:
		RoleProp.Paslprop.SHp = PaSkill.Rx_value[target["热血"]]
	else:
		RoleProp.Paslprop.SHp = PaSkill.Rx_value[PaSkill.max_level]
		
	if target["魔泉"] < PaSkill.max_level:
		RoleProp.Paslprop.SMp = PaSkill.Mq_value[target["魔泉"]]
	else:
		RoleProp.Paslprop.SMp = PaSkill.Mq_value[PaSkill.max_level]
		
	if target["狂暴"] < PaSkill.max_level:
		RoleProp.Paslprop.Crit = PaSkill.Kb_value[target["狂暴"]]
	else:
		RoleProp.Paslprop.Crit = PaSkill.Kb_value[PaSkill.max_level]
		
	if target["永恒"] < PaSkill.max_level:
		RoleProp.Paslprop.R_hp = PaSkill.Yh_value[target["永恒"]]
	else:
		RoleProp.Paslprop.R_hp = PaSkill.Yh_value[PaSkill.max_level]
		
	if target["辉煌"] < PaSkill.max_level:
		RoleProp.Paslprop.R_mp = PaSkill.Hh_value[target["辉煌"]]
	else:
		RoleProp.Paslprop.R_mp = PaSkill.Hh_value[PaSkill.max_level]
		
	if target["敏锐"] < PaSkill.max_level:
		RoleProp.Paslprop.Htarget = PaSkill.Mr_value[target["敏锐"]]
	else:
		RoleProp.Paslprop.Htarget = PaSkill.Mr_value[PaSkill.max_level]
func get_lh(name_):
	var get_level = PlayerData.player_data["被动技能"][name_]
	
	return need_lhList[get_level]

