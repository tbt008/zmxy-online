extends Node2D
class_name Map4
@onready var level: AnimationPlayer = $Level
@onready var level_31: TextureButton = $Level_31
@onready var level_32: TextureButton = $Level_32
@onready var level_33: TextureButton = $Level_33
@onready var level_34: TextureButton = $Level_34
@onready var level_35: TextureButton = $Level_35
@onready var level_36: TextureButton = $Level_36
@onready var level_37: TextureButton = $Level_37
@onready var level_38: TextureButton = $Level_38
@onready var level_39: TextureButton = $Level_39
@onready var level_byg: TextureButton = $Level_byg
@onready var level_esbxx: TextureButton = $Level_esbxx
@onready var level_znyy: TextureButton = $Level_znyy

var MaxPage: int = 4
var skill_target
var my_music
func _ready() -> void:
	if not MainSet.set_data["LevelTT"]:
		MainSet.set_data["LevelTT"] = true
		Global.AddMessageShow(Global.Windows_,"恭喜通到达天庭，解锁角色“沙悟净”！！",1.5,Vector2(470,300))
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
	PlayerData.player_data["Map_num"] = 4
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
	check_pass_level()
func _on_level_31_pressed() -> void:
	Global.AddLevelInfo(self,"火龙岛",Vector2(0,0),"res://Scene/Level/Level_31.tscn")


func _on_level_32_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_33_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_34_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_35_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_36_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_37_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_38_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_39_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_byg_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_level_esbxx_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return
	if PlayerData.player_data["玩家等级"] < 60:
		Global.AddMessageShow(get_parent(),"玩家等级达60级开启！！",1.5,Vector2(470,300))
		return
	if PlayerData.player_data["尾妖林"] == 0:
		Global.AddMessageShow(get_parent(),"需通关龙脊山！！",1.5,Vector2(470,300))
		return
#	Global.Add_28Ui(self,Vector2(0,0))

func _on_level_znyy_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))
	return


func _on_hdzm_pressed() -> void:
	Global.AddHDZM(self,self)
func _on_memory_class_pressed() -> void:
	MemoryClass.保存游戏(Global.cd_path)
	Global.AddMessageShow(get_parent(),"保存成功！本作品完全免费，谨防受骗上当！",1.5,Vector2(470,300))


func _on_shop_pressed() -> void:
	Global.add_SHOP(self,Vector2(0,0))


func _on_ldl_2_pressed() -> void:
	Global.add_ldl(self,Vector2(0,0))


func _on_skill_pressed() -> void:
	if skill_target == null:
		skill_target = Global.add_learn_skill(self,Vector2(0,0))
	else:
		skill_target.queue_free()


func _on_activity_pressed() -> void:
	Global.AddMessageShow(get_parent(),"敬请期待！！！！",1.5,Vector2(470,300))


func _on_task_pressed() -> void:
	Global.AddBasicTask_(self,Vector2(0,0))


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")


func _on_game_set_pressed() -> void:
	Global.Add_GameSet_(self,Vector2(0,0))


func _on_game_an_pressed() -> void:
	Global.AddGameAnnouncement(self,Vector2(0,0))


func _on_pellet_pressed() -> void:
	Global.AddBasicPellet_(self,Vector2(0,0))
	
func check_pass_level():
	if PlayerData.player_data["截教天镜"] and PlayerData.player_data.玲珑宝塔 == 1 and PlayerData.get_item_data("ttlp") != 0:
		PlayerData.player_data["火龙岛"] = 1
		level_31.disabled = false
		if PlayerData.player_data["九龙岛"] == 1:
			level_32.disabled = false
		else:
			level_32.disabled = true
		if PlayerData.player_data["龙脊山"] == 1:
			level_33.disabled = false
		else:
			level_33.disabled = true
		if PlayerData.player_data["尾妖林"] == 1:
			level_34.disabled = false
		else:
			level_34.disabled = true
		if PlayerData.player_data["仙音岛"] == 1:
			level_35.disabled = false
		else:
			level_35.disabled = true
		if PlayerData.player_data["仙幻岛"] == 1:
			level_36.disabled = false
		else:
			level_36.disabled = true
		if PlayerData.player_data["仙树岛"] == 1:
			level_37.disabled = false
		else:
			level_37.disabled = true
		if PlayerData.player_data["蓬莱岛"] == 1:
			level_38.disabled = false
		else:
			level_38.disabled = true
		if PlayerData.player_data["蓬莱仙境"] == 1:
			level_39.disabled = false
		else:
			level_39.disabled = true
		if PlayerData.player_data["碧游宫"]:
			level_byg.disabled = false
		else:
			level_byg.disabled = true
		level_byg.disabled = false
		level_esbxx.disabled = false
		level_znyy.disabled = false
	else:
		level_31.disabled = true
		level_32.disabled = true
		level_33.disabled = true
		level_34.disabled = true
		level_35.disabled = true
		level_36.disabled = true
		level_37.disabled = true
		level_38.disabled = true
		level_39.disabled = true
		level_byg.disabled = true
		level_znyy.disabled = true
		level_esbxx.disabled = true
func PlayAn(Level):
	match int(Level):
		1:
			if PlayerData.get_item_data("ttlp"):
				if not PlayerData.player_data.九龙岛 == 1:
					level.play("Level_31")
				else:
					level_31.material = null
			else:
				level_31.material = null
		2:
			if PlayerData.player_data.龙脊山 == 0 and PlayerData.player_data.九龙岛 == 1:
				level.play("Level_32")
			else:
				level_32.material = null
		3:
			if PlayerData.player_data.尾妖林 == 0 and PlayerData.player_data.龙脊山 == 1:
				level.play("Level_33")
			else:
				level_33.material = null
		4:
			if PlayerData.player_data.仙音岛 == 0 and PlayerData.player_data.尾妖林 == 1:
				level.play("Level_34")
			else:
				level_34.material = null
		5:
			if PlayerData.player_data.仙幻岛 == 0 and PlayerData.player_data.仙音岛 == 1:
				level.play("Level_35")
			else:
				level_35.material = null
		6:
			if PlayerData.player_data.仙树岛 == 0 and PlayerData.player_data.仙幻岛 == 1:
				level.play("Level_36")
			else:
				level_36.material = null
		7:
			if PlayerData.player_data.蓬莱岛 == 0 and PlayerData.player_data.仙树岛 == 1:
				level.play("Level_37")
			else:
				level_37.material = null
		8:
			if PlayerData.player_data.蓬莱仙境 == 0 and PlayerData.player_data.蓬莱岛 == 1:
				level.play("Level_38")
			else:
				level_38.material = null
		9:
			if not PlayerData.player_data["碧游宫"] and PlayerData.player_data.蓬莱仙境 == 1:
				level.play("Level_39")
			else:
				level_39.material = null


func _on_level_lhhj_pressed() -> void:
	Global.Addlhhj(self,Vector2(0,0))
