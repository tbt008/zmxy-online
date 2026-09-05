extends Node2D


func _on_game_1_bg_pressed() -> void:
	MainSet.set_data["MainMenuBG"] = 1
	MemoryClass.main_bc()
func _on_game_2_bg_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 2:
		MainSet.set_data["MainMenuBG"] = 2
		MemoryClass.main_bc()
	else:
		Global.AddMessageShow(Global.Windows_,"到达二图解锁二图封面",1.5,Vector2(470,300))
func _on_game_3_bg_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 3:
		MainSet.set_data["MainMenuBG"] = 3
		MemoryClass.main_bc()
	else:
		Global.AddMessageShow(Global.Windows_,"到达三图解锁三图封面",1.5,Vector2(470,300))
func _on_close_pressed() -> void:
	queue_free()
