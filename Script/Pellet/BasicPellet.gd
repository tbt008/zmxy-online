extends Node2D
class_name BasicPellet
@onready var prop_stage_1: Label = $BG/AllPellet/AllPelletProp/PropStage_1
@onready var prop_stage_2: Label = $BG/AllPellet/AllPelletProp/PropStage_2
@onready var prop_stage_3: Label = $BG/AllPellet/AllPelletProp/PropStage_3
@onready var prop_stage_4: Label = $BG/AllPellet/AllPelletProp/PropStage_4
@onready var prop_stage_5: Label = $BG/AllPellet/AllPelletProp/PropStage_5
@onready var hp: Label = $BG/TotalProp/TotalProps/Hp
@onready var mp: Label = $BG/TotalProp/TotalProps/Mp
@onready var att: Label = $BG/TotalProp/TotalProps/Att
@onready var crit: Label = $BG/TotalProp/TotalProps/Crit
@onready var lucky: Label = $BG/TotalProp/TotalProps/Lucky
@onready var emp: Label = $BG/TotalProp/TotalProps/Emp
@onready var all_pellets_box: VBoxContainer = $BG/AllPelletsBox

var CurrentPelletType: String = "生命"
var CurrentInType = "smd_"
func _ready() -> void:
	set_Info()	
func set_Info():
	SetEveryPropText()
	ADDBox()
func _physics_process(delta: float) -> void:
	match CurrentPelletType:
		"生命":
			CurrentInType = "smd_"
		"魔法":
			CurrentInType = "fld_"
		"攻击":
			CurrentInType = "gjd_"
		"暴击":
			CurrentInType = "bjd_"
		"幸运":
			CurrentInType = "xyd_"
		"回魔":
			CurrentInType = "hmd_"
func SetEveryPropText():#设置丹药提供的属性
	prop_stage_1.text = "一品提供：" + str(PlayerData.player_data[str(CurrentPelletType) + "丹1"] * RoleProp.PelletProps["1品丹"][CurrentPelletType]) + str(CurrentPelletType)
	prop_stage_2.text = "二品提供：" + str(PlayerData.player_data[str(CurrentPelletType) + "丹2"] * RoleProp.PelletProps["2品丹"][CurrentPelletType]) + str(CurrentPelletType)
	prop_stage_3.text = "三品提供：" + str(PlayerData.player_data[str(CurrentPelletType) + "丹3"] * RoleProp.PelletProps["3品丹"][CurrentPelletType]) + str(CurrentPelletType)
	prop_stage_4.text = "四品提供：" + str(PlayerData.player_data[str(CurrentPelletType) + "丹4"] * RoleProp.PelletProps["4品丹"][CurrentPelletType]) + str(CurrentPelletType)
	prop_stage_5.text = "五品提供：" + str(PlayerData.player_data[str(CurrentPelletType) + "丹5"] * RoleProp.PelletProps["5品丹"][CurrentPelletType]) + str(CurrentPelletType)
	hp.text = "生命：" + str(RoleProp.GetPelletProp()[0])
	mp.text = "魔法：" + str(RoleProp.GetPelletProp()[1])
	att.text = "攻击：" + str(RoleProp.GetPelletProp()[2])
	crit.text = "暴击：" + str(RoleProp.GetPelletProp()[3])
	lucky.text = "幸运：" + str(RoleProp.GetPelletProp()[4])
	emp.text = "回魔：" + str(RoleProp.GetPelletProp()[5])
func ADDBox():
	RemoveBox()
	var NumList = [PlayerData.player_data[str(CurrentPelletType) + "丹1"]]
	for i in range(6):
		if i > 0:
			for u in range(PlayerData.player_data[str(CurrentPelletType) + "丹" + str(i)]):
				var Parent = all_pellets_box.get_node("Stage_" + str(i))
				var box = Global.AddLevelFallBox(Parent,true,true,CurrentInType + str(i),0,[],AE.AllEquipment_[CurrentInType + str(i)])
				box.set_button_icon(load_(CurrentInType + str(i)))
func RemoveBox():
	for i in range(6):
		if i > 0:
			var Parent = all_pellets_box.get_node("Stage_" + str(i))
			for u in Parent.get_children():
				u.queue_free()

func _on_hp_dy_pressed() -> void:
	CurrentPelletType = "生命"
	CurrentInType = "smd_"
	set_Info()
func _on_mp_dy_pressed() -> void:
	CurrentPelletType = "魔法"
	CurrentInType = "fld_"
	set_Info()
func _on_att_dy_pressed() -> void:
	CurrentPelletType = "攻击"
	CurrentInType = "gjd_"
	set_Info()
func _on_crit_dy_pressed() -> void:
	CurrentPelletType = "暴击"
	CurrentInType = "bjd_"
	set_Info()
func _on_lucky_dy_pressed() -> void:
	CurrentPelletType = "幸运"
	CurrentInType = "xyd_"
	set_Info()
func _on_emp_dy_pressed() -> void:
	CurrentPelletType = "回魔"
	CurrentInType = "hmd_"
	set_Info()

func _on_eat_1_pressed() -> void:
	if PlayerData.player_data[CurrentPelletType + "丹1"] < 5:
		if PlayerData.get_dj_page(str(CurrentInType) + "1") != 0:
			PlayerData.player_data[CurrentPelletType + "丹1"] += 1
			PlayerData.remove_dj(str(CurrentInType) + "1",PlayerData.get_dj_page(str(CurrentInType) + "1"),1)
			Global.AddMessageShow(Global.Windows_,"成功服用一品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,"一品" + str(CurrentPelletType) + "丹不足！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"一品" + str(CurrentPelletType) + "丹已达服用上限！！",1.5,Vector2(500,305))
	set_Info()


func _on_eat_2_pressed() -> void:
	if PlayerData.player_data[CurrentPelletType + "丹1"] < 5:
		Global.AddMessageShow(Global.Windows_,"请先服用完一品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		return
	if PlayerData.player_data[CurrentPelletType + "丹2"] < 5:
		if PlayerData.get_dj_page(str(CurrentInType) + "2") != 0:
			PlayerData.player_data[CurrentPelletType + "丹2"] += 1
			PlayerData.remove_dj(str(CurrentInType) + "2",PlayerData.get_dj_page(str(CurrentInType) + "2"),1)
			Global.AddMessageShow(Global.Windows_,"成功服用二品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,"二品" + str(CurrentPelletType) + "丹不足！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"二品" + str(CurrentPelletType) + "丹已达服用上限！！",1.5,Vector2(500,305))
		
	set_Info()

func _on_eat_3_pressed() -> void:
	if PlayerData.player_data[CurrentPelletType + "丹2"] < 5:
		Global.AddMessageShow(Global.Windows_,"请先服用完二品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		return
	if PlayerData.player_data[CurrentPelletType + "丹3"] < 5:
		if PlayerData.get_dj_page(str(CurrentInType) + "3") != 0:
			PlayerData.player_data[CurrentPelletType + "丹3"] += 1
			PlayerData.remove_dj(str(CurrentInType) + "3",PlayerData.get_dj_page(str(CurrentInType) + "3"),1)
			Global.AddMessageShow(Global.Windows_,"成功服用三品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,"三品" + str(CurrentPelletType) + "丹不足！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"三品" + str(CurrentPelletType) + "丹已达服用上限！！",1.5,Vector2(500,305))
		
	set_Info()

func _on_eat_4_pressed() -> void:
	if PlayerData.player_data[CurrentPelletType + "丹3"] < 5:
		Global.AddMessageShow(Global.Windows_,"请先服用完三品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		return
		
	if PlayerData.player_data[CurrentPelletType + "丹4"] < 5:
		if PlayerData.get_dj_page(str(CurrentInType) + "4") != 0:
			PlayerData.player_data[CurrentPelletType + "丹4"] += 1
			PlayerData.remove_dj(str(CurrentInType) + "4",PlayerData.get_dj_page(str(CurrentInType) + "4"),1)
			Global.AddMessageShow(Global.Windows_,"成功服用四品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,"四品" + str(CurrentPelletType) + "丹不足！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"四品" + str(CurrentPelletType) + "丹已达服用上限！！",1.5,Vector2(500,305))
		
	set_Info()

func _on_eat_5_pressed() -> void:
	if PlayerData.player_data[CurrentPelletType + "丹4"] < 5:
		Global.AddMessageShow(Global.Windows_,"请先服用完四品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		return
		
	if PlayerData.player_data[CurrentPelletType + "丹5"] < 5:
		if PlayerData.get_dj_page(str(CurrentInType) + "5") != 0:
			PlayerData.player_data[CurrentPelletType + "丹5"] += 1
			PlayerData.remove_dj(str(CurrentInType) + "5",PlayerData.get_dj_page(str(CurrentInType) + "5"),1)
			Global.AddMessageShow(Global.Windows_,"成功服用五品" + str(CurrentPelletType) + "丹！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,"五品" + str(CurrentPelletType) + "丹不足！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"五品" + str(CurrentPelletType) + "丹已达服用上限！！",1.5,Vector2(500,305))
		
	set_Info()

func _on_close_pressed() -> void:
	queue_free()
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc



