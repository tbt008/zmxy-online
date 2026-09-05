extends Node2D
var TargetBoss: String
@onready var boss_list: VBoxContainer = $BG/ColorRect/Text2/TotalList/BossList
@onready var text_3: Label = $BG/ColorRect/Text3
@onready var boss_list_1: VBoxContainer = $BG/ColorRect/Text/TotalList/BossList1
var BossList = [{"Name":"草木皆兵","Num":139},{"Name":"猕猴王","Num":4},{"Name":"禺狨王","Num":5},{"Name":"狮驼王","Num":11},{"Name":"鹏魔王","Num":12},
{"Name":"蛟魔王","Num":18},{"Name":"鲨魔王","Num":20},{"Name":"牛魔王一","Num":22},{"Name":"牛魔王二","Num":23},{"Name":"牛魔王三","Num":24}

,{"Name":"龙王","Num":6}]
var GhostList = [{"Name":"红孩儿","Num":29},{"Name":"傀儡","Num":34},{"Name":"傀儡王","Num":33},{"Name":"秦广王","Num":37},{"Name":"阎罗王","Num":43},
{"Name":"宋帝王","Num":59},{"Name":"夜叉","Num":48},{"Name":"孟婆","Num":50},{"Name":"转轮王一","Num":57},{"Name":"转轮王二","Num":55},
{"Name":"转轮王三","Num":56}]
var SkyList = [{"Name":"千里眼","Num":77},{"Name":"顺风耳","Num":78},{"Name":"猕猴王·通风","Num":96},{"Name":"增长天王","Num":83},
{"Name":"广目天王","Num":84},
{"Name":"多闻天王","Num":85},{"Name":"马天君","Num":134},{"Name":"持国天王","Num":137},{"Name":"朱子真","Num":89}
,{"Name":"袁洪","Num":91},{"Name":"二郎神","Num":93},{"Name":"土行孙","Num":100},{"Name":"雷震子","Num":101},{"Name":"哪吒","Num":102},
{"Name":"托塔天王","Num":103},{"Name":"银角大王","Num":107},{"Name":"金角大王","Num":108},{"Name":"青牛精","Num":110},
{"Name":"太白金星","Num":112},{"Name":"太上老君","Num":114},{"Name":"天庭战神","Num":132},{"Name":"牛魔王四","Num":141},{"Name":"转轮王四","Num":142}

]
func _physics_process(delta: float) -> void:
	if TargetBoss != null and TargetBoss != "":
		text_3.text = "设置" + str(TargetBoss) + "部分属性"
	else:
		text_3.text = "请选择Boss进行属性设置"

func _ready() -> void:
	Global.LHHJBossList.clear()
	AddTotalList()
func AddTotalList():
	if PlayerData.player_data["地府"]:
		for i in GhostList:
			BossList.push_back(i)
	if PlayerData.player_data["天庭"]:
		for i in SkyList:
			BossList.push_back(i)
	for i in BossList:
		Global.Addlistbutton(boss_list_1,i["Name"],self,i["Num"])
func _on_challenge_pressed() -> void:
	if Global.LHHJBossList.size() <= 0:
		Global.AddMessageShow(get_parent(),"请至少添加一个boss！！",1.5,Vector2(470,300))
		return
	get_tree().change_scene_to_file("res://Scene/Level/Level_lhhj.tscn")
func AddBoss(Name,Num):
	if Global.LHHJBossList.has(Name):#重复添加
		Global.AddMessageShow(get_parent(),"重复添加",1.5,Vector2(470,300))
		return
	Global.LHHJBossList[Name] = {
		"Num": Num,
		"Name": "",
		"Level": 0,
		"SHp": 0,
		"def": 0,
		"mdef": 0,
		"crit": 0,
		"miss": 0,
		"Toughness": 0,
		"Critreduce":0,
		"Htarget": 0,
		"lucky": 0,
		"ar": 0,
		"sp": 0,
		"speed": 0,
		"power": 0,
		"ebol": 0,
		"self_rhp": 0
	}
	Global.Addlhhjbutton(boss_list,Name,self)
func ShowProp():
	if TargetBoss != null and TargetBoss != "":
		if Global.LHHJBossList.has(TargetBoss):
			var TargetOBJ
			for i in Global.LHHJBossList[TargetBoss]:
				if i != "Num":
					TargetOBJ = get_node("BG/ColorRect/Text3/TotalList/BossList/" + str(i))
					if TargetOBJ != null:
						TargetOBJ.text = str(Global.LHHJBossList[TargetBoss][i])
			for i in Global.LHHJBossList[TargetBoss]:
				if i != "Num":
					TargetOBJ = get_node("BG/ColorRect/Text3/TotalList2/BossList/" + str(i))
					if TargetOBJ != null:
						TargetOBJ.text = str(Global.LHHJBossList[TargetBoss][i])
						
func _on_remove_boss_pressed() -> void:
	if TargetBoss != null:
		if TargetBoss != "":
			Global.LHHJBossList.erase(TargetBoss)
			Global.AddMessageShow(get_parent(),"取消召唤" + str(TargetBoss) + "！！",1.5,Vector2(470,300))
		else:
			Global.AddMessageShow(get_parent(),"请选择要清除的boss！",1.5,Vector2(470,300))
			return
	else:
		Global.AddMessageShow(get_parent(),"请选择要清除的boss！",1.5,Vector2(470,300))
		return
	for i in boss_list.get_children():
		if i != null:
			if i.selfName == TargetBoss:
				boss_list.remove_child(i)
				i.queue_free()
	TargetBoss = ""

func _on_close_pressed() -> void:
	queue_free()
func _on_remove_all_pressed() -> void:
	Global.LHHJBossList.clear()
	for i in boss_list.get_children():
		if i != null:
			boss_list.remove_child(i)
			i.queue_free()
	TargetBoss = ""
	Global.AddMessageShow(get_parent(),"目标召唤列表已全部清除！！",1.5,Vector2(470,300))

func _on_remove_prop_pressed() -> void:
	if TargetBoss == null:
		Global.AddMessageShow(get_parent(),"请选择要清除属性的boss！",1.5,Vector2(470,300))
		return
	if TargetBoss == "":
		Global.AddMessageShow(get_parent(),"请选择要清除属性的boss！",1.5,Vector2(470,300))
		return
		
	for i in Global.LHHJBossList[TargetBoss]:
		if i != "Num":
			Global.LHHJBossList[TargetBoss][i] = 0	
	Global.AddMessageShow(get_parent(),str(TargetBoss) + "属性已重置为基础属性！！",1.5,Vector2(470,300))
func SetProp(TargetProp: String,Prop):
	if TargetBoss == null:
		Global.AddMessageShow(get_parent(),"请选择要设置属性的boss！",1.5,Vector2(470,300))
		return
	if TargetBoss == "":
		Global.AddMessageShow(get_parent(),"请选择要设置属性的boss！",1.5,Vector2(470,300))
		return
	if TargetProp != "Name" and TargetProp != "ebol":
		if not typeof(Prop) == TYPE_INT:
			Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
			return
		if Prop < 0:
			Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
			return
	elif TargetProp == "ebol":
		if not typeof(Prop) == TYPE_FLOAT and not typeof(Prop) == TYPE_INT:
			Global.AddMessageShow(get_parent(),"请输入整数或小数！",1.5,Vector2(470,300))
			return
		if Prop < 0:
			Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数或小数！",1.5,Vector2(470,300))
			return
	Global.LHHJBossList[TargetBoss][TargetProp] = Prop

func _on_dj_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("Level",int(new_text))

func _on_hp_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("SHp",int(new_text))



func _on_def_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("def",int(new_text))


func _on_mdef_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("mdef",int(new_text))


func _on_crit_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("crit",int(new_text))


func _on_miss_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("miss",int(new_text))


func _on_power_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("power",int(new_text))


func _on_lucky_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("lucky",int(new_text))


func _on_critreduce_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("Critreduce",int(new_text))
	
func _on_toughness_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("Toughness",int(new_text))


func _on_ar_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("ar",int(new_text))


func _on_sp_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("sp",int(new_text))


func _on_speed_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("speed",int(new_text))


func _on_self_rhp_text_changed(new_text: String) -> void:
	var Prop = int(new_text)
	if not typeof(Prop) == TYPE_INT:
		Global.AddMessageShow(get_parent(),"请输入整数！",1.5,Vector2(470,300))
		return
	if Prop < 0:
		Global.AddMessageShow(get_parent(),"请输入大于或等于0的整数！",1.5,Vector2(470,300))
		return
	SetProp("self_rhp",int(new_text))


func _on_help_pressed() -> void:
	Global.Addlhhjhelp(self,Vector2(0,0))


func _on_add_all_pressed() -> void:
	for i in BossList:
		AddBoss(i["Name"],i["Num"])


func _on_name_text_changed(new_text: String) -> void:
	SetProp("Name",str(new_text))


func _on_ebol_text_changed(new_text: String) -> void:
	SetProp("ebol",float(new_text))
