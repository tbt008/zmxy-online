extends Control

func _physics_process(_delta: float) -> void:
	if MainSet.set_data["BackGroundMusic"] == true:
		$bg/box/BGMControl.text = "关闭音乐"
	else:
		$bg/box/BGMControl.text = "打开音乐"
	if MainSet.set_data["RoleOrMonsterHit"] == true:
		$bg/box/RoleOrMonsterControl.text = "关闭音效"
	else:
		$bg/box/RoleOrMonsterControl.text = "打开音效"
func _on_close_pressed() -> void:
	queue_free()


func _on_continue_game_pressed() -> void:
	queue_free()


func _on_continue_game_2_pressed() -> void:
	get_tree().paused = false
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

func _on_continue_game_4_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")


func _on_bgm_control_pressed() -> void:
	if MainSet.set_data["BackGroundMusic"] == true:
		MainSet.set_data["BackGroundMusic"] = false
	else:
		MainSet.set_data["BackGroundMusic"] = true
	MemoryClass.main_bc()

func _on_role_or_monster_control_pressed() -> void:
	if MainSet.set_data["RoleOrMonsterHit"] == true:
		MainSet.set_data["RoleOrMonsterHit"] = false
	else:
		MainSet.set_data["RoleOrMonsterHit"] = true
	MemoryClass.main_bc()
