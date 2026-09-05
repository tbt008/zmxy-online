extends Node2D
class_name Map3
@onready var level: AnimationPlayer = $Level

@onready var level_21: TextureButton = $Level_21
@onready var level_22: TextureButton = $Level_22
@onready var level_23: TextureButton = $Level_23
@onready var level_24: TextureButton = $Level_24
@onready var level_25: TextureButton = $Level_25
@onready var level_26: TextureButton = $Level_26
@onready var level_27: TextureButton = $Level_27
@onready var level_28: TextureButton = $Level_28
@onready var level_29: TextureButton = $Level_29
@onready var level_30: TextureButton = $Level_30
@onready var level_stz: TextureButton = $Level_stz
@onready var level_dsg: TextureButton = $Level_dsg
@onready var level_hdzm: TextureButton = $Level_hdzm
@onready var level_sssl: TextureButton = $Level_sssl
@onready var smdp: TextureButton = $smdp
@onready var lsh: TextureButton = $lsh
@onready var kls: TextureButton = $kls
@onready var ghg: TextureButton = $ghg
@onready var tzhy: TextureButton = $tzhy
@onready var memory_game: TextureButton = $MemoryGame
@onready var shop: TextureButton = $Shop
@onready var ldl: TextureButton = $ldl
@onready var learn_skill: TextureButton = $LearnSkill
@onready var actity: TextureButton = $Actity
@onready var task: TextureButton = $Task
@onready var return_to_main_menu: TextureButton = $ReturnToMainMenu
@onready var game_set: TextureButton = $GameSet
var MaxPage: int = 3
var skill_target
var my_music
func _ready() -> void:
	MainSet.set_data["LevelTT"] = true
	MemoryClass.main_bc()
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
	if MainMusic.MyMainMusic == null:
		MainMusic.ADDMusic()
	Global.CurrentLevel = ""
	if not Global.IsFrist:
		Global.AddMessageShow(Global.Windows_,"欢迎进入游戏！作者：早春樱花，作品完全免费！！",1.5,Vector2(470,300))
		Global.IsFrist = true
	Global.PlayerBeHitCount = 0
	Global.LastLevelPath = ""
	Global.FB_CD = 0

	get_tree().paused = false
	PlayerData.player_data["Map_num"] = 3
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
	#check_music()
	check_pass_level()
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
	if PlayerData.player_data["天庭"] and PlayerData.player_data.转轮殿 == 1 and PlayerData.get_item_data("ttlp") != 0:
		PlayerData.player_data["九重天"] = 1
		level_21.disabled = false
		if PlayerData.player_data["天宫道"] == 1:
			level_22.disabled = false
		else:
			level_22.disabled = true
		if PlayerData.player_data["南天门"] == 1:
			level_23.disabled = false
		else:
			level_23.disabled = true
		if PlayerData.player_data["南天王殿"] == 1:
			level_24.disabled = false
		else:
			level_24.disabled = true
		if PlayerData.player_data["西天王殿"] == 1:
			level_25.disabled = false
		else:
			level_25.disabled = true
		if PlayerData.player_data["北天王殿"] == 1:
			level_26.disabled = false
		else:
			level_26.disabled = true
		if PlayerData.player_data["彩虹楼"] == 1:
			level_27.disabled = false
		else:
			level_27.disabled = true
		if PlayerData.player_data["朝会殿"] == 1:
			level_28.disabled = false
		else:
			level_28.disabled = true
		if PlayerData.player_data["凌霄宝殿"] == 1:
			level_29.disabled = false
		else:
			level_29.disabled = true
		if PlayerData.player_data["玲珑宝塔"] == 1:
			level_30.disabled = false
		else:
			level_30.disabled = true
		if PlayerData.player_data["兜率宫"] == 1:
			level_dsg.disabled = false
		else:
			level_dsg.disabled = true
		if PlayerData.player_data["截教天镜"]:
			level_hdzm.disabled = false
		else:
			level_hdzm.disabled = true
		level_stz.disabled = false
		#level_dsg.disabled = false
		level_hdzm.disabled = false
		level_sssl.disabled = false
		lsh.disabled = false
		kls.disabled = false
		ghg.disabled = false
		tzhy.disabled = false
	else:
		level_21.disabled = true
		level_22.disabled = true
		level_23.disabled = true
		level_24.disabled = true
		level_25.disabled = true
		level_26.disabled = true
		level_27.disabled = true
		level_28.disabled = true
		level_29.disabled = true
		level_30.disabled = true
		level_stz.disabled = true
		level_dsg.disabled = true
		level_hdzm.disabled = true
		level_sssl.disabled = true
		lsh.disabled = true
		kls.disabled = true
		ghg.disabled = true
		tzhy.disabled = true


func _on_level_21_pressed() -> void:
	Global.AddLevelInfo(self,"九重天",Vector2(0,0),"res://Scene/Level/Level_22.tscn")


func _on_level_22_pressed() -> void:
	Global.AddLevelInfo(self,"天宫道",Vector2(0,0),"res://Scene/Level/Level_23.tscn")


func _on_level_23_pressed() -> void:
	Global.AddLevelInfo(self,"南天门",Vector2(0,0),"res://Scene/Level/Level_24.tscn")


func _on_level_24_pressed() -> void:
	Global.AddLevelInfo(self,"南天王殿",Vector2(0,0),"res://Scene/Level/Level_25.tscn")


func _on_level_25_pressed() -> void:
	Global.AddLevelInfo(self,"西天王殿",Vector2(0,0),"res://Scene/Level/Level_26.tscn")


func _on_level_26_pressed() -> void:
	Global.AddLevelInfo(self,"北天王殿",Vector2(0,0),"res://Scene/Level/Level_27.tscn")


func _on_level_27_pressed() -> void:
	Global.AddLevelInfo(self,"彩虹楼",Vector2(0,0),"res://Scene/Level/Level_28.tscn")

func _on_level_28_pressed() -> void:
	Global.AddLevelInfo(self,"朝会殿",Vector2(0,0),"res://Scene/Level/Level_29.tscn")


func _on_level_29_pressed() -> void:
	Global.AddLevelInfo(self,"凌霄宝殿",Vector2(0,0),"res://Scene/Level/Level_30.tscn")


func _on_level_30_pressed() -> void:
	Global.AddLevelInfo(self,"玲珑宝塔",Vector2(0,0),"res://Scene/Level/Level_llbt.tscn")

func _on_level_stz_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_level_dsg_pressed() -> void:
	if PlayerData.player_data.兜率宫 == 0:
		Global.AddMessageShow(get_parent(),"需通关玲珑宝塔！",1.5,Vector2(470,300))
	else:
		Global.AddLevelInfo(self,"兜率宫",Vector2(0,0),"兜率宫")

func _on_level_hdzm_pressed() -> void:
	if PlayerData.player_data.截教天镜 == false:
		Global.AddMessageShow(get_parent(),"需通关兜率宫！",1.5,Vector2(470,300))
	else:
		Global.AddHDZM(self,self)
func _on_level_sssl_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_smdp_pressed() -> void:
	Global.AddMysteryShop(self,Vector2(0,0))


func _on_lsh_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_kls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Level/Level_kls.tscn")


func _on_ghg_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_tzhy_pressed() -> void:
	if PlayerData.player_data["玩家等级"] < 40:
		Global.AddMessageShow(get_parent(),"需要角色等级大于等于40级！",1.5,Vector2(470,300))
		return
	Global.change_secen("res://Scene/Level/Level_tzhy.tscn")


func _on_memory_game_pressed() -> void:
	MemoryClass.保存游戏(Global.cd_path)
	Global.AddMessageShow(get_parent(),"保存成功！本作品完全免费，谨防受骗上当！",1.5,Vector2(470,300))


func _on_shop_pressed() -> void:
	Global.add_SHOP(self,Vector2(0,0))


func _on_ldl_pressed() -> void:
	Global.add_ldl(self,Vector2(0,0))


func _on_learn_skill_pressed() -> void:
	if skill_target == null:
		skill_target = Global.add_learn_skill(self,Vector2(0,0))
	else:
		skill_target.queue_free()


func _on_actity_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_task_pressed() -> void:
	Global.AddBasicTask_(self,Vector2(0,0))


func _on_return_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")


func _on_game_set_pressed() -> void:
	Global.Add_GameSet_(self,Vector2(0,0))


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Map_2.tscn")


func _on_game_an_pressed() -> void:
	Global.AddGameAnnouncement(self,Vector2(0,0))


func _on_pellet_pressed() -> void:
	Global.AddBasicPellet_(self,Vector2(0,0))
func PlayAn(Level):
	
	match int(Level):
		1:
			if PlayerData.get_item_data("ttlp"):
				if not PlayerData.player_data.天宫道 == 1:
					level.play("Level_21")
				else:
					level_21.material = null
			else:
				level_21.material = null
		2:
			if PlayerData.player_data.南天门 == 0 and PlayerData.player_data.天宫道 == 1:
				level.play("Level_22")
			else:
				level_22.material = null
		3:
			if PlayerData.player_data.南天王殿 == 0 and PlayerData.player_data.南天门 == 1:
				level.play("Level_23")
			else:
				level_23.material = null
		4:
			if PlayerData.player_data.西天王殿 == 0 and PlayerData.player_data.南天王殿 == 1:
				level.play("Level_24")
			else:
				level_24.material = null
		5:
			if PlayerData.player_data.北天王殿 == 0 and PlayerData.player_data.西天王殿 == 1:
				level.play("Level_25")
			else:
				level_25.material = null
		6:
			if PlayerData.player_data.彩虹楼 == 0 and PlayerData.player_data.北天王殿 == 1:
				level.play("Level_26")
			else:
				level_26.material = null
		7:
			if PlayerData.player_data.朝会殿 == 0 and PlayerData.player_data.彩虹楼 == 1:
				level.play("Level_27")
			else:
				level_27.material = null
		8:
			if PlayerData.player_data.凌霄宝殿 == 0 and PlayerData.player_data.朝会殿 == 1:
				level.play("Level_28")
			else:
				level_28.material = null
		9:
			if PlayerData.player_data.玲珑宝塔 == 0 and PlayerData.player_data.凌霄宝殿 == 1:
				level.play("Level_29")
			else:
				level_28.material = null
		10:
			if not PlayerData.player_data["截教天镜"] and PlayerData.player_data.玲珑宝塔 == 1 and not PlayerData.player_data.兜率宫 == 1:
				level.play("Level_30")
			else:
				level_29.material = null


func _on_level_lhhj_pressed() -> void:
	Global.Addlhhj(self,Vector2(0,0))
