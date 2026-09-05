extends Node2D
@onready var csm: Sprite2D = $Hdzm/csm
var Parent

func _physics_process(delta: float) -> void:
	if Parent != null:
		if Parent is Map3:
			csm.texture = load("res://Art/Game_3/OtherMapButton/jjtj_.png")
		elif Parent is Map4:
			csm.texture = load("res://Art/Game_3/OtherMapButton/hdtt.png")
func _on_ttzstz_pressed() -> void:
	if PlayerData.ChekEqzb("头衔","xczg"):
		Global.AddMessageShow(get_parent(),"本副本不允许使用修成正果头衔！",1.5,Vector2(470,300))
		return
	if PlayerData.player_data["玩家等级"] <= 50:
		Global.AddMessageShow(get_parent(),"需要角色等级大于50级！",1.5,Vector2(470,300))
		return
	elif PlayerData.get_item_data("ttlp") == 0:
		Global.AddMessageShow(get_parent(),"需要拥有通天令牌！",1.5,Vector2(470,300))
		return
	elif not PlayerData.player_data["截教天镜"]:
		Global.AddMessageShow(get_parent(),"前置关卡要求未达到！",1.5,Vector2(470,300))
		return
	get_tree().change_scene_to_file("res://Scene/Level/Level_hdzm.tscn")

func _on_csm_pressed() -> void:
	if Parent == null:
		return
	if Parent is Map3:
			if PlayerData.player_data["玩家等级"] < 50:
				Global.AddMessageShow(get_parent(),"需要角色等级大于等于50级！",1.5,Vector2(470,300))
			elif PlayerData.get_item_data("ttlp") == 0:
				Global.AddMessageShow(get_parent(),"需要拥有通天令牌！",1.5,Vector2(470,300))
			elif not PlayerData.player_data["截教天镜"]:
				Global.AddMessageShow(get_parent(),"前置关卡要求未达到！",1.5,Vector2(470,300))
			else:
				if PlayerData.player_data["FristJiejiao"]:
					Signals.ConnectChooseBoxSignal(self,"challenge")
					Global.add_choose_text(self,Vector2(0,0),"后面关卡可能非常难，需要极高的耐心和技术，确定继续挑战吗？（截教部分关卡无法使用修成正果头衔！）",0)
				else:
#					if PlayerData.ChekEqzb("头衔","xczg"):
#						Global.AddMessageShow(get_parent(),"截教副本不允许使用修成正果头衔！",1.5,Vector2(470,300))
#						return
					get_tree().change_scene_to_file("res://Scene/Main_menu/Map_4.tscn")
	elif Parent is Map4:
		get_tree().change_scene_to_file("res://Scene/Main_menu/Map_3.tscn")
func challenge():
	PlayerData.player_data["FristJiejiao"] = false
	get_tree().change_scene_to_file("res://Scene/Main_menu/Map_4.tscn")
	MemoryClass.保存游戏(Global.cd_path)

func _on_hdgq_pressed() -> void:
	if PlayerData.ChekEqzb("头衔","xczg"):
		Global.AddMessageShow(get_parent(),"本副本不允许使用修成正果头衔！",1.5,Vector2(470,300))
		return
	if PlayerData.player_data["玩家等级"] <= 50:
		Global.AddMessageShow(get_parent(),"需要角色等级大于50级！",1.5,Vector2(470,300))
		return
	elif PlayerData.get_item_data("ttlp") == 0:
		Global.AddMessageShow(get_parent(),"需要拥有通天令牌！",1.5,Vector2(470,300))
		return
	elif not PlayerData.player_data["截教天镜"]:
		Global.AddMessageShow(get_parent(),"前置关卡要求未达到！",1.5,Vector2(470,300))
		return
	Global.Addhdgqmap(self,Vector2(0,0))

func _on_close_pressed() -> void:
	queue_free()
