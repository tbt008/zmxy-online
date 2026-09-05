extends Node2D
@onready var grades_s_how: AnimationPlayer = $GradesSHow
@onready var begin_time: Label = $GameUseTime/BeginTime
@onready var end_time: Label = $GameUseTime2/EndTime
@onready var use_time: Label = $GameUseTime3/UseTIME
@onready var hp_text: Label = $PlayerLastHp/Hp_text
@onready var most_lj_text: Label = $MostLj/MostLj_text
var Last_Time
func _ready() -> void:
	Global.removeAllBuff()
	Global.addBGM_(self,"res://Music/level/13_Game_Victory.mp3")
	get_tree().paused = false
	Global.LevelEndTime = ""
	Global.LevelEndTime = Time.get_datetime_string_from_system(false,true) as String
	var num_1 = int(Global.LevelEndTime.split(" ")[1].split(":")[0]) * 3600
	var num_2 = int(Global.LevelEndTime.split(" ")[1].split(":")[1]) * 60
	var num_3 = int(Global.LevelEndTime.split(" ")[1].split(":")[2])
	var num_4 = int(Global.LevelBeginTime.split(" ")[1].split(":")[0]) * 3600
	var num_5 = int(Global.LevelBeginTime.split(" ")[1].split(":")[1]) * 60
	var num_6 = int(Global.LevelBeginTime.split(" ")[1].split(":")[2])
	var LastNum = (num_1 + num_2 + num_3) - (num_4 + num_5 + num_6)

	Last_Time = get_lasttime(LastNum)
	if Global.CurrentLevel == "火焰山":
		if not MainSet.set_data["LevelHYS"]:
			MainSet.set_data["LevelHYS"] = true
			MemoryClass.main_bc()
			Global.AddMessageShow(Global.Windows_,"恭喜通关火焰山，解锁角色“猪八戒”！！",1.5,Vector2(470,300))
	begin_time.text = "开始时间：" + Global.LevelBeginTime
	end_time.text = "结束时间：" + Global.LevelEndTime
	use_time.text = "过关用时：" + str(Last_Time["小时"]) + ' 小时 ' + str(Last_Time["分钟"]) + ' 分钟 ' + str(Last_Time["秒"]) + " 秒 "
	hp_text.text = "剩余状态：" + str(snapped(float(RoleProp.roleprop.Hp) / float(RoleProp.roleprop.SHp) * 100,0.01)) + "%"
	most_lj_text.text = "最高连击：" + str(Global.MostLianji)
	if not MainSet.set_data["Music4"]:
		if randf_range(0,1) <= 0.05:
			if PDpj() >= 4:
				MainSet.set_data["Music4"] = true
				MemoryClass.main_bc()
				Global.AddMessageShow(Global.Windows_,"触发彩蛋，恭喜开启图四音乐！！！",1.5,Vector2(470,300))
	if Global.CurrentLevel != "":
		var PJ = PDpj()
		if PlayerData.player_data["关卡评价"].has(Global.CurrentLevel):
			if PJ >= PlayerData.player_data["关卡评价"][Global.CurrentLevel]:
				PlayerData.player_data["关卡评价"][Global.CurrentLevel] = PJ
				MemoryClass.保存游戏(Global.cd_path)
	grades_s_how.play("Show")
	
func _on_return_map_pressed() -> void:
	RoleProp.ws_value = 0
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
	MemoryClass.保存游戏(Global.cd_path)
func get_lasttime(Num):
	var Hour = floor(Num / 3600)
	var Minute = floor(Num % 3600 / 60)
	var Second = Num - Hour * 3600 - Minute * 60
	return {
		"小时": Hour,
		"分钟": Minute,
		"秒": Second,	
	}
	
	
	


func _on_more_informaition_pressed() -> void:
	Global.addAfterLevelEnd(self,Vector2(0,0))


func _on_rechallenge_pressed() -> void:
	if Global.LastLevelPath == "":
		Global.AddMessageShow(Global.Windows_,"获取关卡信息时出现错误，请手动更换关卡！！",1.5,Vector2(470,300))
	else:	
		Global.change_secen(Global.LastLevelPath)
func PDpj():
	var CurrentZT = int(snapped(float(RoleProp.roleprop.Hp) / float(RoleProp.roleprop.SHp) * 100,0.01))
	if Last_Time["分钟"] <= 2 and Global.TotalHurtCount == 0 and CurrentZT >= 95:
		return 5
	else:
		match int(Last_Time["分钟"]):
			0:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 4
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 3
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 2
				else:
					return 1
			1:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 4
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 3
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 2
				else:
					return 1
			2:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 4
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 3
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 2
				else:
					return 1
			3:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 4
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 3
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 2
				else:
					return 1
			4:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 3
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 2
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 2
				else:
					return 1
			5:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 2
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 2
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 1
				else:
					return 1
			6:
				if CurrentZT <= 100 and CurrentZT >= 85:
					return 2
				elif CurrentZT < 85 and CurrentZT >= 75:
					return 1
				elif CurrentZT < 75 and CurrentZT >= 65:
					return 1
				else:
					return 1
	return 1
func ADDpj():
	Global.AddPj(self,Vector2(65,65),PDpj())
