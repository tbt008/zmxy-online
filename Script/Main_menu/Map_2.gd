extends Node2D
class_name Map2
@onready var level_11: TextureButton = $Level_11
@onready var level_12: TextureButton = $Level_12
@onready var level_13: TextureButton = $Level_13
@onready var level_14: TextureButton = $Level_14
@onready var level_15: TextureButton = $Level_15
@onready var level_16: TextureButton = $Level_16
@onready var level_17: TextureButton = $Level_17
@onready var level_18: TextureButton = $Level_18
@onready var level_19: TextureButton = $Level_19
@onready var level_20: TextureButton = $Level_20
@onready var level_lxdy: TextureButton = $Level_lxdy
@onready var level: AnimationPlayer = $level
@onready var level_nmg: TextureButton = $Level_nmg

var MaxPage: int = 2
var skill_target
var my_music
func _ready() -> void:
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
	PlayerData.player_data["Map_num"] = 2
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
func _on_changetomain_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")

func _on_ld_l_pressed() -> void:
	Global.add_ldl(self,Vector2(0,0))

func _on_memory_game_pressed() -> void:
	MemoryClass.保存游戏(Global.cd_path)
	Global.AddMessageShow(get_parent(),"保存成功！本作品完全免费，谨防受骗上当！",1.5,Vector2(470,300))
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
		
func check_pass_level():

	if PlayerData.get_dj_page("mjlp") != 0 and PlayerData.player_data["地府"]:
		if PlayerData.player_data.牛魔谷 == 1 and PlayerData.get_dj_page("mjlp") != 0 and PlayerData.player_data["地府"]:
			level_11.disabled = false
		else:
			level_11.disabled = true
		if PlayerData.player_data.无常巷 == 1:
			level_12.disabled = false
		else:
			level_12.disabled = true
		if PlayerData.player_data.鬼门关 == 1:
			level_13.disabled = false
		else:
			level_13.disabled = true
		if PlayerData.player_data.接引院 == 1:
			level_14.disabled = false
		else:
			level_14.disabled = true
		if PlayerData.player_data.判官府 == 1:
			level_15.disabled = false
		else:
			level_15.disabled = true
		if PlayerData.player_data.阎罗殿 == 1:
			level_16.disabled = false
		else:
			level_16.disabled = true
		if PlayerData.player_data.忘川河 == 1:
			level_17.disabled = false
		else:
			level_17.disabled = true
		if PlayerData.player_data.奈何桥 == 1:
			level_18.disabled = false
		else:
			level_18.disabled = true
		if PlayerData.player_data.望乡台 == 1:
			level_19.disabled = false
		else:
			level_19.disabled = true
		if PlayerData.player_data.转轮殿 == 1:
			level_20.disabled = false
		else:
			level_20.disabled = true
	else:
		level_11.disabled = true
		level_12.disabled = true
		level_13.disabled = true
		level_14.disabled = true
		level_15.disabled = true
		level_16.disabled = true
		level_17.disabled = true
		level_18.disabled = true
		level_19.disabled = true
		level_20.disabled = true
		level_lxdy.disabled = true
	if PlayerData.player_data["天庭"]:
		$Tianting.visible = true
		$Tianting/Changetott.disabled = false
	else:
		$Tianting.visible = false
		$Tianting/Changetott.disabled = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")


func _on_level_11_pressed() -> void:
	Global.AddLevelInfo(self,"鬼城",Vector2(0,0),"res://Scene/Level/Level_11.tscn")

func _on_level_12_pressed() -> void:
	Global.AddLevelInfo(self,"无常巷",Vector2(0,0),"res://Scene/Level/Level_12.tscn")


func _on_level_13_pressed() -> void:
	Global.AddLevelInfo(self,"鬼门关",Vector2(0,0),"res://Scene/Level/Level_13.tscn")


func _on_level_14_pressed() -> void:
	Global.AddLevelInfo(self,"接引院",Vector2(0,0),"res://Scene/Level/Level_14.tscn")


func _on_level_15_pressed() -> void:
	Global.AddLevelInfo(self,"判官府",Vector2(0,0),"res://Scene/Level/Level_15.tscn")


func _on_level_16_pressed() -> void:
	Global.AddLevelInfo(self,"阎罗殿",Vector2(0,0),"res://Scene/Level/Level_16.tscn")

func _on_level_17_pressed() -> void:
	Global.AddLevelInfo(self,"忘川河",Vector2(0,0),"res://Scene/Level/Level_17.tscn")


func _on_level_18_pressed() -> void:
	Global.AddLevelInfo(self,"奈何桥",Vector2(0,0),"res://Scene/Level/Level_18.tscn")


func _on_level_19_pressed() -> void:
	Global.AddLevelInfo(self,"望乡台",Vector2(0,0),"res://Scene/Level/Level_19.tscn")


func _on_level_20_pressed() -> void:
	Global.AddLevelInfo(self,"转轮殿",Vector2(0,0),"res://Scene/Level/Level_21.tscn")


func _on_level_nmg_pressed() -> void:
	Global.AddLevelInfo(self,"火焰山",Vector2(0,0),"res://Scene/Level/Level_nmg.tscn")

func _on_level_lxdy_pressed() -> void:
	Global.AddMessageShow(get_parent(),"螺旋地狱不开放！！",1.5,Vector2(470,300))

func _on_shop_pressed() -> void:
	Global.add_SHOP(self,Vector2(0,0))


func _on_activity_pressed() -> void:
	Global.AddBasicTask_(self,Vector2(0,0))

func _on_learn_skill_pressed() -> void:
	if skill_target == null:
		skill_target = Global.add_learn_skill(self,Vector2(0,0))
	else:
		skill_target.queue_free()

func PlayAn(Level):
	match int(Level):

		1:
			if PlayerData.get_dj_page("mjlp"):
				level_nmg.material = null
				if not PlayerData.player_data.无常巷 == 1:
					level.play("level11")
				else:
					level_11.material = null
			else:
				level_11.material = null
				level.play("levelnmg")

		2:
			if PlayerData.player_data.鬼门关 == 0 and PlayerData.player_data.无常巷 == 1:
				level.play("level12")
			else:
				level_12.material = null
		3:
			if PlayerData.player_data.接引院 == 0 and PlayerData.player_data.鬼门关 == 1:
				level.play("level13")
			else:
				level_13.material = null
		4:
			if PlayerData.player_data.判官府 == 0 and PlayerData.player_data.接引院 == 1:
				level.play("level14")
			else:
				level_14.material = null
		5:
			if PlayerData.player_data.阎罗殿 == 0 and PlayerData.player_data.判官府 == 1:
				level.play("level15")
			else:
				level_15.material = null
		6:
			if PlayerData.player_data.忘川河 == 0 and PlayerData.player_data.阎罗殿 == 1:
				level.play("level16")
			else:
				level_16.material = null
		7:
			if PlayerData.player_data.奈何桥 == 0 and PlayerData.player_data.忘川河 == 1:
				level.play("level17")
			else:
				level_17.material = null
		8:
			if PlayerData.player_data.望乡台 == 0 and PlayerData.player_data.奈何桥 == 1:
				level.play("level18")
			else:
				level_18.material = null
		9:
			if PlayerData.player_data.转轮殿 == 0 and PlayerData.player_data.望乡台 == 1:
				level.play("level19")
			else:
				level_18.material = null
		10:
			if not PlayerData.player_data["天庭"] and PlayerData.player_data.转轮殿 == 1:
				level.play("level20")
			else:
				level_19.material = null
func _on_changetott_pressed() -> void:

	if PlayerData.CheckPass("天庭"):
		get_tree().change_scene_to_file("res://Scene/Main_menu/Map_3.tscn")
	else:
		if PlayerData.player_data.转轮殿 != 1:
			Global.AddMessageShow(get_parent(),"需要通关转轮殿！！",1.5,Vector2(470,300))
		elif PlayerData.get_item_data("ttlp") == 0:
			Global.AddMessageShow(get_parent(),"需要通天令牌！！",1.5,Vector2(470,300))


func _on_game_an_pressed() -> void:
	Global.AddGameAnnouncement(self,Vector2(0,0))


func _on_level_lhhj_pressed() -> void:
	Global.Addlhhj(self,Vector2(0,0))
