extends TextureButton
@onready var my_num: Label = $MyNum
@onready var Name: Label = $InfoBox/Name
@onready var level_and_role: Label = $InfoBox/LevelAndRole
@onready var time: Label = $InfoBox/Time


var MyNum: int

func _physics_process(delta: float) -> void:
	SetNormalInfo()
	set_physics_process(false)
func SetNormalInfo():
	my_num.text = str(MyNum)
	if MyNum <= 6:
		if not MainSet.set_data.has("time" + str(MyNum)):
			MainSet.set_data["time" + str(MyNum)] = ""
			MemoryClass.main_bc()
			if MainSet.set_data["time" + str(MyNum)] != "":
				time.text = str(MainSet.set_data["time" + str(MyNum)])
			else:
				time.text = ""
		else:
			if MainSet.set_data["time" + str(MyNum)] != "":
				time.text = str(MainSet.set_data["time" + str(MyNum)])
			else:
				time.text = ""
		if not MainSet.set_data.has("name" + str(MyNum)):
			MainSet.set_data["name" + str(MyNum)] = ""
			MemoryClass.main_bc()
			if MainSet.set_data["name" + str(MyNum)] != "":	
				Name.text = str("名字：" + str(MainSet.set_data["name" + str(MyNum)]))
			else:
				Name.text = ""
		else:
			if MainSet.set_data["name" + str(MyNum)] != "":	
				Name.text = str("名字：" + str(MainSet.set_data["name" + str(MyNum)]))
			else:
				Name.text = ""
		if not MainSet.set_data.has("time" + str(MyNum)):	
			MainSet.set_data["time" + str(MyNum)] = ""
			MemoryClass.main_bc()
			if MainSet.set_data["time" + str(MyNum)] != "":
				level_and_role.text = "Lv：" + str(MemoryClass.得到数据("user://MyAr_" + str(MyNum) + ".json")) + '    ' + str(GeTroleNmae(MyNum))
			else:
				level_and_role.text = "空存档"
		else:
			if MainSet.set_data["time" + str(MyNum)] != "":
				level_and_role.text = "Lv：" + str(MemoryClass.得到数据("user://MyAr_" + str(MyNum) + ".json")) + '    ' + str(GeTroleNmae(MyNum))
			else:
				level_and_role.text = "空存档"
	else:
		GetOtherInfo()
func SetOtherTime():
	if MainSet.set_data["其他存档"][str(MyNum)]["time"] != "":
		time.text = str(MainSet.set_data["其他存档"][str(MyNum)]["time"])
		level_and_role.text = "Lv：" + str(MemoryClass.得到数据("user://MyAr_" + str(MyNum) + ".json")) + '    ' + str(GeTroleNmae(MyNum))
	else:
		time.text = ""
		level_and_role.text = "空存档"
func SetOtherName():
	if MainSet.set_data["其他存档"][str(MyNum)]["name"] != "":
		Name.text = str("名字：" + str(MainSet.set_data["其他存档"][str(MyNum)]["name"]))
	else:
		Name.text = ""		
func GetOtherInfo():
	if MainSet.set_data["其他存档"].has(str(MyNum)):
		SetOtherTime()
		SetOtherName()
	else:
		MainSet.set_data["其他存档"][str(MyNum)] = {"name":"","time":""}
		MemoryClass.main_bc()
		SetOtherTime()
		SetOtherName()
func GeTroleNmae(cd_num):
	var num: int
	var sz = MemoryClass.提前数据("user://MyAr_" + str(cd_num) + ".json")
	if sz.has("Myself"):
		num = MemoryClass.提前数据("user://MyAr_" + str(cd_num) + ".json")["Myself"]
	match num:
		1:
			return "悟空"
		2:
			return "唐僧"	
		3:
			return "八戒"
		4:
			return "沙僧"
		5:
			return "白龙"
	return "空存档"


func _on_pressed() -> void:
	Global.cd_path = "user://MyAr_" + str(MyNum) + ".json"
	if not MemoryClass.读取游戏(Global.cd_path):
		return
	if PlayerData.player_data.has("FileValue"):
		if float(PlayerData.player_data["FileValue"]) <= float(Global.FileNum):
			PlayerData.player_data["FileValue"] = Global.FileNum
		else:
			Global.AddMessageShow(get_parent(),"当前游戏不是最新版本，请使用最新版本游戏！！！",1.5,Vector2(470,340))
			return
	if level_and_role.text == "空存档":
		get_tree().change_scene_to_file("res://Scene/Main_menu/ChoosePlayer.tscn")
	else:
		change_to_map()
func change_to_map():
	match int(PlayerData.player_data["Map_num"]):
		1:
			get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
		2:
			if PlayerData.player_data["地府"]:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_2.tscn")
			else:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
		3:
			if PlayerData.player_data["天庭"]:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_3.tscn")
			else:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
		4:
			if PlayerData.player_data["截教天镜"]:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_4.tscn")
			else:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
func get_time():
	var date = Time.get_date_string_from_system()
	var time_ = Time.get_time_string_from_system()
	var last_time = date + " " + time_
	return last_time
