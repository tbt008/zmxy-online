extends Control
var is_change

func _on_z_1_pressed() -> void:
	MainSet.set_data["music"] = 1
	MemoryClass.main_bc()
	is_change = true

func _on_z_2_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 2:
		MainSet.set_data["music"] = 2
		MemoryClass.main_bc()
		is_change = true
	else:
		Global.AddMessageShow(Global.Windows_,"到达二图解锁二图背景音乐",1.5,Vector2(470,300))
func _on_z_3_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 3:
		MainSet.set_data["music"] = 3
		MemoryClass.main_bc()
		is_change = true
	else:
		Global.AddMessageShow(Global.Windows_,"到达三图解锁三图背景音乐",1.5,Vector2(470,300))


func _on_close_pressed() -> void:
	queue_free()


func _on_z_4_pressed() -> void:
	if MainSet.set_data["Music4"]:
		MainSet.set_data["music"] = 4
		MemoryClass.main_bc()
		is_change = true
	else:
		Global.AddMessageShow(Global.Windows_,"还未开启四图音乐哦，快去游戏中寻找一下吧~",1.5,Vector2(470,300))
