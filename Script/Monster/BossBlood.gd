extends TextureProgressBar
class_name BossBlood
@onready var boss_blood: TextureProgressBar = $"."
@onready var blood_under: TextureRect = $BloodUnder
@onready var monster_name: Label = $MonsterName
@onready var blood_value: Label = $BloodValue
@onready var blood_uder_bar: TextureProgressBar = $BloodUderBar
@onready var protect_bar: TextureProgressBar = $ProtectBar
@onready var protect_under: TextureRect = $ProtectBar/ProtectUnder
@onready var protect_name: Label = $ProtectBar/ProtectName
@onready var protect_value: Label = $ProtectBar/ProtectValue
@onready var buff_list: HBoxContainer = $BuffList
var GetObj: BaseMonster
var BigBarHpCHange:
	set(vl):
		BigBarHpCHange = vl
		on_HpChange(BigBarHpCHange)
func _physics_process(delta: float) -> void:
	for i in Global.AllBuffList:
		SetBuffIconInfo(i)
	if GetObj != null:
		boss_blood.value = float(GetObj.Hp) / float(GetObj.SHp)
		BigBarHpCHange = float(GetObj.Hp) / float(GetObj.SHp)
		monster_name.text = str(GetObj.my_mr_name)
		if MainSet.set_data["MonsterBloodTextSHow"]:
			blood_value.text = str(GetObj.Hp) + '/' + str(GetObj.SHp) + '(' + str(snapped(float(GetObj.Hp) / float(GetObj.SHp),0.001) * 100) + "%)"
		else:
			blood_value.text = ""
		ProtectBarControl()		
	else:
		self.queue_free()
func on_HpChange(value_):
	if not MainSet.set_data["HpBarDelay"]:
		blood_uder_bar.value = 0
		return
	create_tween().tween_property(blood_uder_bar,"value",value_,0.7)
func ProtectBarControl():
	if GetObj.is_boss:
		if GetObj.hd > 0:
			protect_bar.visible = true
		else:
			protect_bar.visible = false
		protect_bar.value = float(GetObj.hd) / float(GetObj.max_hd)
		protect_value.text = "护盾：" + str(GetObj.hd)
func SetBuffIconInfo(Name):
	if GetObj == null:
		return
	var IsHave: bool#是否拥有
	var Count: int = 1#拥有个数
	var BuffInfo = {
		"Name": Name,
		"value": 0.0,#伤害值
		"AddTime": 0.0,#添加时间
		"ReduceInterval": 0.0,#扣除伤害间隔
		"AttackKind": "",#伤害类型
		"HaveCount": 0#拥有次数
	}
	for i in GetObj.buff.get_children():
		for u in i.BuffInfo:
			if not BuffInfo.has(u):
				BuffInfo[u] = i.BuffInfo[u]
		if i.BuffInfo["Name"] == Name:
			IsHave = true
			BuffInfo["HaveCount"] += 1
			if i.BuffInfo.has("CanAdd"):
				if i.BuffInfo["CanAdd"]:
					BuffInfo["value"] += i.BuffInfo["value"]
				else:
					BuffInfo["value"] = i.BuffInfo["value"]
			else:
				BuffInfo["value"] = i.BuffInfo["value"]
			if i.BuffInfo.has("ReduceInterval"):
				BuffInfo["ReduceInterval"] = i.BuffInfo["ReduceInterval"]
			if not i.IsCheck:
				BuffInfo["AttackKind"] = i.BuffInfo["AttackKind"]
				#BuffInfo["ReduceInterval"] = i.BuffInfo["ReduceInterval"]
				BuffInfo["AddTime"] = i.BuffInfo["AddTime"]
				buff_list.get_node(Name).buff_icon_remove.start(BuffInfo["AddTime"])
				buff_list.get_node(Name).DataList = BuffInfo
				i.IsCheck = true
			buff_list.get_node(Name).DataList = BuffInfo
	
	buff_list.get_node(Name).visible = IsHave
