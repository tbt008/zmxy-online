extends Node2D
class_name Map1
@onready var level_1: TextureButton = $level_1
@onready var level_2: TextureButton = $level_2
@onready var level_3: TextureButton = $level_3
@onready var level_4: TextureButton = $level_4
@onready var level_5: TextureButton = $level_5
@onready var level_6: TextureButton = $level_6
@onready var level_7: TextureButton = $level_7
@onready var level_8: TextureButton = $level_8
@onready var level_9: TextureButton = $Node2D2/Node2D/level_9
@onready var level_10: TextureButton = $level_10
@onready var level: AnimationPlayer = $Level
@onready var level2: AnimationPlayer = $Level2

var my_music
var message
var skill_target
var is_playing = false
var MaxPage: int = 1
func _ready() -> void:
	#print(MainSet.set_data["FileValue"])
	#print(PlayerData.Initialized_Data)
	#print(PlayerData.player_data)
	Global.LLBTLevel = 1
	Global.LLBTBOSSMS = false
	Global.LLBTCGMS = false
	Global.LLBTWXMS = false
	RoleProp.set_full_Hp()
	RoleProp.set_full_Mp()
	RoleProp.CurrentHp = RoleProp.roleprop.Hp
	RoleProp.CurrentMp = RoleProp.roleprop.Mp
	for i in range(11):
		PlayAn(i)
	if MainSet.set_data["CurrentLevelPage"] <= MaxPage:
		MainSet.set_data["CurrentLevelPage"] = MaxPage
		MemoryClass.main_bc()
	Global.CurrentLevel = ""
	if not Global.IsFrist:
		Global.AddMessageShow(Global.Windows_,"欢迎进入游戏！作者：早春樱花，作品完全免费！！",1.5,Vector2(470,300))
		Global.IsFrist = true
	Global.PlayerBeHitCount = 0
	Global.LastLevelPath = ""
	Global.FB_CD = 0
	get_tree().paused = false
	PlayerData.player_data["Map_num"] = 1
	MemoryClass.保存游戏(Global.cd_path)
	Global.is_Mpo = false
	Global.is_ice = false
	Global.is_poision = false
	Global.is_Fire = false
	Global.is_speed_down = false
	Global.is_stun = false
	Global.is_Bleed = false
	Global.is_EyeFix = false
	Global.is_DeadLink = false
	RoleProp.ws_value = 0
	MemoryClass.main_dq()
	if MainMusic.MyMainMusic == null:
		MainMusic.ADDMusic()
	check_pass_level()

func _on_level_1_pressed() -> void:
	#Global.Addlhhj(self,Vector2(0,0))
	#get_tree().change_scene_to_file("res://Scene/Level/Level_32.tscn")
	#Global.AddLevelInfo(self,"兜率宫",Vector2(0,0),"兜率宫")
	#Global.AddLevelInfo(self,"玲珑宝塔",Vector2(0,0),"res://Scene/Level/Level_llbt.tscn")
	#Global.AddLevelInfo(self,"花果山",Vector2(0,0),"res://Scene/Level/Level_wxzw.tscn")
	Global.AddLevelInfo(self,"花果山",Vector2(0,0),"res://Scene/Level/Level_1.tscn")
func _on_level_2_pressed() -> void:
	Global.AddLevelInfo(self,"水帘洞",Vector2(0,0),"res://Scene/Level/Level_2.tscn")
func _on_level_3_pressed() -> void:
	Global.AddLevelInfo(self,"桃花源",Vector2(0,0),"res://Scene/Level/Level_3.tscn")
func _on_level_4_pressed() -> void:
	Global.AddLevelInfo(self,"蝙蝠窟",Vector2(0,0),"res://Scene/Level/Level_4.tscn")
func _on_level_5_pressed() -> void:
	Global.AddLevelInfo(self,"七星洞",Vector2(0,0),"res://Scene/Level/Level_5.tscn")
func _on_level_6_pressed() -> void:
	Global.AddLevelInfo(self,"迦楼罗之穴",Vector2(0,0),"res://Scene/Level/Level_6.tscn")
func _on_level_7_pressed() -> void:
	Global.AddLevelInfo(self,"浅岸",Vector2(0,0),"res://Scene/Level/Level_7.tscn")
func _on_level_8_pressed() -> void:
	Global.AddLevelInfo(self,"东海",Vector2(0,0),"res://Scene/Level/Level_8.tscn")
func _on_level_9_pressed() -> void:
	Global.AddLevelInfo(self,"鲨之涡流",Vector2(0,0),"res://Scene/Level/Level_9.tscn")
func _on_level_10_pressed() -> void:
	Global.AddLevelInfo(self,"牛魔谷",Vector2(0,0),"res://Scene/Level/Level_10.tscn")
func check_music():
	if MainSet.set_data["music"] == 1:
		if my_music != null:
			my_music.queue_free()
		my_music = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy_1BGM.mp3")
	elif MainSet.set_data["music"] == 2:
		if my_music != null:
			my_music.queue_free()
		my_music = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy_2BGM.ogg")
	elif MainSet.set_data["music"] == 3:
		if my_music != null:
			my_music.queue_free()
		my_music = Global.addBGM_(self,"res://Music/MainSceneMusic/44_begin.mp3")
	elif MainSet.set_data["music"] == 4:
		if my_music != null:
			my_music.queue_free()
		my_music = Global.addBGM_(self,"res://Music/MainSceneMusic/zmxy4bg.mp3")

func _on_bc_game_pressed() -> void:
	MemoryClass.保存游戏(Global.cd_path)
	Global.AddMessageShow(get_parent(),"保存成功！本作品完全免费，谨防受骗上当！",1.5,Vector2(470,300))
func _on_skill_learn_pressed() -> void:
	if skill_target == null:
		skill_target = Global.add_learn_skill(self,Vector2(0,0))
	else:
		skill_target.queue_free()
func check_pass_level():
	if PlayerData.player_data.水帘洞 == 1:
		level_2.disabled = false
	else:
		level_2.disabled = true
	if PlayerData.player_data.桃花源 == 1:
		level_3.disabled = false
	else:
		level_3.disabled = true
	if PlayerData.player_data.蝙蝠窟 == 1:
		level_4.disabled = false
	else:
		level_4.disabled = true
	if PlayerData.player_data.七星洞 == 1:
		level_5.disabled = false
	else:
		level_5.disabled = true
	if PlayerData.player_data.迦楼罗之穴 == 1:
		level_6.disabled = false
	else:
		level_6.disabled = true
	if PlayerData.player_data.浅岸 == 1:
		level_7.disabled = false
	else:
		level_7.disabled = true
	if PlayerData.player_data.东海 == 1:
		level_8.disabled = false
	else:
		level_8.disabled = true
	if PlayerData.player_data.鲨之涡流 == 1:
		level_9.disabled = false
	else:
		level_9.disabled = true
	if PlayerData.player_data.牛魔谷 == 1:
		level_10.disabled = false
	else:
		level_10.disabled = true
	if PlayerData.player_data["地府"]:
		$next.disabled = false
		$next.visible = true
	else:
		$next.disabled = true
		$next.visible = false


func _on_ldl_pressed() -> void:
		Global.add_ldl(self,Vector2(0,0))
func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Map_2.tscn")

func _on_turn_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")


func _on_shop_pressed() -> void:
	Global.add_SHOP(self,Vector2(0,0))

func add_text(text,parent):
	if message == null:
		message = Global.add_touch_text(parent,Vector2(80,0),text)
func remove_text():
	if message != null:
		message.queue_free()
func PlayAn(Level):
	match int(Level):
		1:
			if PlayerData.player_data.水帘洞 == 0:
				level.play("Level1")
			else:
				level_1.material = null
		2:
			if PlayerData.player_data.桃花源 == 0 and PlayerData.player_data.水帘洞 == 1:
				level.play("level2")
			else:
				level_2.material = null
		3:
			if PlayerData.player_data.蝙蝠窟 == 0 and PlayerData.player_data.桃花源 == 1:
				level.play("level3")
			else:
				level_3.material = null
		4:
			if PlayerData.player_data.七星洞 == 0 and PlayerData.player_data.蝙蝠窟 == 1:
				level.play("level4")
			else:
				level_4.material = null
		5:
			if PlayerData.player_data.迦楼罗之穴 == 0 and PlayerData.player_data.七星洞 == 1:
				level.play("level5")
			else:
				level_5.material = null
		6:
			if PlayerData.player_data.浅岸 == 0 and PlayerData.player_data.迦楼罗之穴 == 1:
				level.play("level6")
			else:
				level_6.material = null
		7:
			if PlayerData.player_data.东海 == 0 and PlayerData.player_data.浅岸 == 1:
				level.play("level7")
			else:
				level_7.material = null
		8:
			if PlayerData.player_data.鲨之涡流 == 0 and PlayerData.player_data.东海 == 1:
				level.play("level8")
			else:
				level_8.material = null
		9:
			if PlayerData.player_data.鲨之涡流 == 1:
				level2.play("szwl")

		10:
			if not PlayerData.player_data["地府"] and PlayerData.player_data.牛魔谷 == 1:
				level.play("level10")
			else:
				level_10.material = null
func _on_level_1_mouse_entered() -> void:
	pass
func _on_level_1_mouse_exited() -> void:
	if not level_1.disabled:
		PlayAn(1)
func _on_level_2_mouse_entered() -> void:
	pass
func _on_level_2_mouse_exited() -> void:
	if not level_2.disabled:
		PlayAn(2)


func _on_level_3_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_3_mouse_exited() -> void:
	if not level_3.disabled:
		PlayAn(3)


func _on_level_4_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_4_mouse_exited() -> void:
	if not level_4.disabled:
		PlayAn(4)


func _on_level_5_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_5_mouse_exited() -> void:
	if not level_5.disabled:
		PlayAn(5)


func _on_level_6_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_6_mouse_exited() -> void:
	if not level_6.disabled:
		PlayAn(6)


func _on_level_7_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_7_mouse_exited() -> void:
	if not level_7.disabled:
		PlayAn(7)


func _on_level_8_mouse_entered() -> void:
	pass # Replace with function body.


func _on_level_8_mouse_exited() -> void:
	if not level_8.disabled:
		PlayAn(8)


func _on_level_9_mouse_entered() -> void:
	if not level_9.disabled:
		level2.play("szwl2")


func _on_level_9_mouse_exited() -> void:
	if not level_9.disabled:
		level2.play("szwl")


func _on_level_10_mouse_entered() -> void:
	pass


func _on_level_10_mouse_exited() -> void:
	if not level_8.disabled:
		PlayAn(10)


func _on_task_pressed() -> void:
	Global.AddBasicTask_(self,Vector2(0,0))


func _on_game_an_pressed() -> void:
	Global.AddGameAnnouncement(self,Vector2(0,0))


func _on_level_lhhj_pressed() -> void:
	Global.Addlhhj(self,Vector2(0,0))
