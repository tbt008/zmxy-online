extends Node2D
@onready var ceng_shu_text: Label = $BG/CengShuText
var Max
var CurrentCengShu: int = 1
func _physics_process(delta: float) -> void:
	Max = int(PlayerData.player_data["玲珑宝塔层数"])
	if Max >= 24:
		Max = 24
	ceng_shu_text.text = str(CurrentCengShu) + '/' + str(Max)
func _on_wxms_pressed() -> void:
	Global.LLBTBOSSMS = false
	Global.LLBTCGMS = false
	Global.LLBTWXMS = true
	
	get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")

func _on_cgms_pressed() -> void:
	Global.LLBTBOSSMS = false
	Global.LLBTCGMS = true
	Global.LLBTWXMS = false
	get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")


func _on_tztxs_pressed() -> void:
	if PlayerData.player_data["玲珑宝塔层数"] > 6:
		Global.LLBTLevel = 6
		Global.LLBTBOSSMS = true
		Global.LLBTWXMS = false
		Global.LLBTCGMS = false
		get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先至少到达第7层！！",1.5,Vector2(470,300))


func _on_tslzz_pressed() -> void:
	if PlayerData.player_data["玲珑宝塔层数"] > 12:
		Global.LLBTLevel = 12
		Global.LLBTBOSSMS = true
		Global.LLBTWXMS = false
		Global.LLBTCGMS = false
		get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先至少到达第13层！！",1.5,Vector2(470,300))


func _on_tznz_pressed() -> void:
	if PlayerData.player_data["玲珑宝塔层数"] > 18:
		Global.LLBTLevel = 18
		Global.LLBTBOSSMS = true
		Global.LLBTWXMS = false
		Global.LLBTCGMS = false
		get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先至少到达第19层！！",1.5,Vector2(470,300))


func _on_tztttw_pressed() -> void:
	if PlayerData.player_data["玲珑宝塔层数"] >= 25:
		Global.LLBTLevel = 24
		Global.LLBTBOSSMS = true
		Global.LLBTWXMS = false
		Global.LLBTCGMS = false
		get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")
	else:
		Global.AddMessageShow(Global.Windows_,"请先通关玲珑塔！！",1.5,Vector2(470,300))


func _on_close_pressed() -> void:
	queue_free()


func _on_help_pressed() -> void:
	Global.AddMessageShow(Global.Windows_,"玲珑塔帮助还没做！！",1.5,Vector2(470,300))
	pass # Replace with function body.


func _on_cure_pressed() -> void:
	if CurrentCengShu >= PlayerData.player_data["玲珑宝塔层数"] or CurrentCengShu >= 24:
		Global.AddMessageShow(Global.Windows_,"已达当前通关最高层数！！",1.5,Vector2(470,300))
		return
	CurrentCengShu += 1
		


func _on_reduce_pressed() -> void:
	if CurrentCengShu <= 1:
		Global.AddMessageShow(Global.Windows_,"最低传送至1层！！",1.5,Vector2(470,300))
		return
	CurrentCengShu -= 1


func _on_change_pressed() -> void:
	if CurrentCengShu > PlayerData.player_data["玲珑宝塔层数"]:
		Global.AddMessageShow(Global.Windows_,"超出最高限制层数！！",1.5,Vector2(470,300))
		return
	if CurrentCengShu < 1:
		Global.AddMessageShow(Global.Windows_,"低于最低限制层数！！",1.5,Vector2(470,300))
		return
	Global.LLBTCGMS = true
	Global.LLBTLevel = CurrentCengShu
	get_tree().change_scene_to_file("res://Scene/Level/Level_llbt.tscn")
