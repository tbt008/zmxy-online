extends Node2D


func _on_dsgyc_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Level/Level_dsg_1.tscn")


func _on_dsgyc_2_pressed() -> void:
	if PlayerData.player_data["兜率宫1"] == 1:
		get_tree().change_scene_to_file("res://Scene/Level/Level_dsg_2.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先通过兜率宫一层",1.5,Vector2(470,300))


func _on_dsgyc_3_pressed() -> void:
	if PlayerData.player_data["兜率宫2"] == 1:
		get_tree().change_scene_to_file("res://Scene/Level/Level_dsg_3.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先通过兜率宫地下一层",1.5,Vector2(470,300))


func _on_dsgyc_4_pressed() -> void:
	if PlayerData.player_data["兜率宫3"] == 1:
		get_tree().change_scene_to_file("res://Scene/Level/Level_dsg_4.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先通过兜率宫地下二层",1.5,Vector2(470,300))


func _on_dsgyc_5_pressed() -> void:
	if PlayerData.player_data["兜率宫4"] == 1:
		get_tree().change_scene_to_file("res://Scene/Level/Level_dsg_5.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先通过兜率宫地下三层",1.5,Vector2(470,300))


func _on_close_pressed() -> void:
	queue_free()
