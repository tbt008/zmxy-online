extends Node2D
class_name BaseLevel
var is_two_scene

#单独一个场景，到时间自动召唤即可，推关的话，
@onready var monster: Node2D = $Monster
@onready var hero: Node2D = $Hero
@onready var exit: AnimatedSprite2D = $exit
@onready var exit_2: CollisionShape2D = $exit/exit2/exit
@onready var fall_it = $fall_items
@onready var create_control: Timer = $create_control
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var lj_tt: Node2D = $CanvasLayer/lj_tt
@onready var end: ParallaxLayer = $BackGround/End
@onready var front: ParallaxLayer = $BackGround/front
@onready var floor_2: ParallaxLayer = $BackGround/floor_2
@onready var monster_blood: VBoxContainer = $CanvasLayer/MonsterBlood
@onready var create_1: Node2D = $Create_1
@onready var create_2: Node2D = $Create_2
@onready var create_3: Node2D = $Create_3
@onready var create_4: Node2D = $Create_4

var is_set_smooth
var mr: BaseMonster
var Role_
var my_camera
var role_information#角色属性框技能
var level_stage
var can_exit = false
var current_stage = 0
var back_target 
var Monster_group = {
	"stage_1": [],
	"stage_2": [],
	"stage_3": [],
	"stage_4": [],
}
var Monster_position_x = {
	"stage_1": [],
	"stage_2": [],
	"stage_3": [],
	"stage_4": [],
}
var Monster_position_y = {
	"stage_1": [],
	"stage_2": [],
	"stage_3": [],
	"stage_4": [],
}
var MonsterArray: Array = []#怪物列表
var can_create: bool
var mr_num = 0

func _ready() -> void:
	if not self is Level20:
		RoleProp.ws_value = 0
	create_control.wait_time = MainSet.set_data["CreateMonsterSpeed"]
	MainMusic.RemoveMusic()
	if not Global.Is_Show:
		$CanvasLayer/zmPLAYER.play("gdzm")
		Global.Is_Show = true
		pass
	Global.Is_Show = true
	Global.FB_CD = -10
	Global.LastLevelPath = str(self.scene_file_path)
	removeAllRecords()
	Global.LevelBeginTime = Time.get_datetime_string_from_system(false,true)
	var RoleId = PlayerData.player_data["Myself"]
	Role_ = Global.call_hero("role_" + str(RoleId),hero,Vector2(100,340),false)
	if role_information == null:
		role_information = Global.add_role_information(self,Vector2(0,0))
		role_information.z_index = 10
		
	if Role_ != null:
		Role_.action.scale.x = -1
		Role_.base_damagebox.scale.x = -1
		my_camera = Global.add_Camera(Role_,Vector2(0,0),1100)
		my_camera.max_left = 0
		my_camera.max_top = 0
		my_camera.max_bottom = 590
		await get_tree().create_timer(0.1,false).timeout
		#my_camera.reset_smoothing()
		my_camera.limit_smoothed = true
		my_camera.position_smoothing_enabled = true
	PlayerData.ADDIniBuff()
func _physics_process(_delta: float) -> void:
	#print(current_stage)
	change_mysee()
	if current_stage >= 1:
		if not is_two_scene:
			if Monster_group["stage_2"].size() == 0 and Monster_group["stage_3"].size() == 0 and Monster_group["stage_4"].size() == 0:
				if one_check_can_exit():
					exit.visible = true
					exit_2.disabled = false
			else:
				if check_can_exit():
					exit.visible = true
					exit_2.disabled = false
		else:
			if Monster_group["stage_2"].size() == 0 and Monster_group["stage_3"].size() == 0 and Monster_group["stage_4"].size() == 0:
				if one_check_can_exit():
					exit.visible = true
					exit_2.disabled = false
					#add_tg(level_stage)
	if can_exit:
		if Input.is_action_just_pressed("Exit"):
			if self is Level19:
				if self.Canthro:
					add_tg(level_stage)
			else:
				add_tg(level_stage)
			if self is Level17:
				Global.change_secen("res://Scene/Level/Level_sdwfb.tscn")
				return
			if self is Level22:
				Global.change_secen("res://Scene/Level/Level_xtqfb.tscn")
				return
			if self is level10 or self is level21:
				if MainSet.set_data["剧情跳过"]:
					get_tree().change_scene_to_file("res://Scene/Level/victory.tscn")
				else:
					get_tree().change_scene_to_file("res://Scene/Main_menu/Game_over_1.tscn")
			elif self is Level19:
				if self.Canthro:
					get_tree().change_scene_to_file("res://Scene/Level/victory.tscn")
				else:
					RoleProp.CurrentHp = RoleProp.roleprop.Hp
					RoleProp.CurrentMp = RoleProp.roleprop.Mp
					get_tree().change_scene_to_file("res://Scene/Level/Level_20.tscn")
			elif self is Level20:
				RoleProp.CurrentHp = RoleProp.roleprop.Hp
				RoleProp.CurrentMp = RoleProp.roleprop.Mp
				get_tree().change_scene_to_file("res://Scene/Level/Level_20.tscn")
			else:	
				get_tree().change_scene_to_file("res://Scene/Level/victory.tscn")
	if Role_ == null:
		if my_camera != null:
			my_camera.queue_free()
	set_through()
func set_through():
	pass
func level_create_monster(stage):
	
	var mr_xh = Monster_group["stage_" + str(stage)][0]
	var mr_loc_x = Monster_position_x["stage_" + str(stage)][0]
	var mr_loc_y = Monster_position_y["stage_" + str(stage)][0]
	Monster_group["stage_" + str(stage)].remove_at(0)
	Monster_position_x["stage_" + str(stage)].remove_at(0)
	Monster_position_y["stage_" + str(stage)].remove_at(0)
	if mr_num <= Monster_group["stage_" + str(stage)].size():
		mr = Global.Create_Monster(mr_xh,monster,Vector2(mr_loc_x,mr_loc_y))
		can_create = false
func change_mysee():

	if my_camera != null:
		if self is Level22:
			my_camera.max_right = 937
			return
		if current_stage >= 1:
			if self is Level17:
				if current_stage == 1:
					my_camera.max_right = 2250
				if current_stage == 2:
					my_camera.max_right = 3550
				if current_stage == 3:
					my_camera.max_right = 4650
			elif check_can_pass():
				if not is_two_scene:
					if current_stage == 1:
						my_camera.max_right = 2250
					if current_stage == 2:
						my_camera.max_right = 3550
					if current_stage == 3:
						my_camera.max_right = 4650
				else:
					if current_stage == 1:
						my_camera.max_right = 1870
					if current_stage == 2:
						pass

					
func check_monster_death():
	if MonsterArray != []:
		for i in MonsterArray:
			if i != null:
				if i is BaseMonster:
					if i.death():
						MonsterArray.erase(i)
				else:
					MonsterArray.erase(i)
					#i.queue_free()
			else:

				MonsterArray.erase(i)
func check_can_create(stage):
	return monster.get_children().size() < 6 and Monster_group["stage_" + str(stage)].size() > 0
func _on_create_control_timeout() -> void:
	if Role_ != null:
		if not is_two_scene:#正常的四模块地图
			if Role_.position.x < 1600 and current_stage == 0:
				current_stage = 1
			if Role_.position.x >= 1600 and Role_.position.x < 2700 and current_stage == 1:
				current_stage = 2
			if Role_.position.x >= 2700 and Role_.position.x < 4000 and current_stage == 2:
				current_stage = 3
			if Role_.position.x >= 4000 and current_stage == 3:
				current_stage = 4
		else:#牛魔谷类似的两模块地图
			if Role_.position.x < 1000 and current_stage == 0:
				current_stage = 1
			if Role_.position.x >= 1300 and Role_.position.x < 2700 and current_stage == 1:
				current_stage = 2
			if Role_.position.x >= 2700 and Role_.position.x < 4000 and current_stage == 2:
				current_stage = 3
			if Role_.position.x >= 4000 and current_stage == 3:
				current_stage = 4
	if check_can_create(current_stage):
		level_create_monster(current_stage)
func check_can_pass():
	return Monster_group["stage_" + str(current_stage)].size() == 0 and $Monster.get_child_count() == 0

func check_can_exit():
	return Monster_group["stage_" + str(current_stage)].size() == 0 and current_stage == 4 and $Monster.get_child_count() == 0

func one_check_can_exit():
	return Monster_group["stage_" + str(current_stage)].size() == 0 and $Monster.get_child_count() == 0

func alwaysCanPass():
	return true
func _on_exit_2_body_entered(_body: Node2D) -> void:
	can_exit = true
func _on_exit_2_body_exited(_body: Node2D) -> void:
	can_exit = false
func _on_timer_timeout() -> void:
	if not role_information.is_full_ws() and not RoleProp.is_ws_state:
		RoleProp.ws_value -= 0.2
	if RoleProp.is_ws_state:
		RoleProp.ws_value -= 4
func add_tg(level):
	match level:
		1:
			PlayerData.player_data.水帘洞 = 1
		2:
			PlayerData.player_data.桃花源 = 1
		3:
			PlayerData.player_data.蝙蝠窟 = 1
		4:
			PlayerData.player_data.七星洞 = 1
		5:
			PlayerData.player_data.迦楼罗之穴 = 1
		6:
			PlayerData.player_data.浅岸 = 1
		7:
			PlayerData.player_data.东海 = 1
		8:
			PlayerData.player_data.鲨之涡流 = 1
		9:
			PlayerData.player_data.牛魔谷 = 1
		10:
			PlayerData.player_data["地府"] = true
		11:
			PlayerData.player_data.无常巷 = 1
		12:
			PlayerData.player_data.鬼门关 = 1
		13:
			PlayerData.player_data.接引院 = 1
		14:
			PlayerData.player_data.判官府 = 1
		15:
			PlayerData.player_data.阎罗殿 = 1
		16:
			PlayerData.player_data.忘川河 = 1
		17:
			PlayerData.player_data.奈何桥 = 1
		18:
			PlayerData.player_data.望乡台 = 1
		19:
			PlayerData.player_data.转轮殿 = 1
		20:
			PlayerData.player_data["天庭"] = true
		21:
			PlayerData.player_data.天宫道 = 1
		22:
			PlayerData.player_data.南天门 = 1
		23:
			PlayerData.player_data.南天王殿 = 1
		24:
			PlayerData.player_data.西天王殿 = 1
		25:
			PlayerData.player_data.北天王殿 = 1
		26:
			PlayerData.player_data.彩虹楼 = 1
		27:
			PlayerData.player_data.朝会殿 = 1
		28:
			PlayerData.player_data.凌霄宝殿 = 1
		29:
			PlayerData.player_data.玲珑宝塔 = 1
		30:
			PlayerData.player_data.兜率宫 = 1
		31:
			PlayerData.player_data.兜率宫1 = 1
		32:
			PlayerData.player_data.兜率宫2 = 1
		33:
			PlayerData.player_data.兜率宫3 = 1
		34:
			PlayerData.player_data.兜率宫4 = 1
		35:
			PlayerData.player_data["截教天镜"] = true
		36:
			PlayerData.player_data.九龙岛 = 1
		37:
			PlayerData.player_data.龙脊山 = 1
		38:
			PlayerData.player_data.尾妖林 = 1
		39:
			PlayerData.player_data.仙音岛 = 1
		40:
			PlayerData.player_data.仙幻岛 = 1
		41:
			PlayerData.player_data.仙树岛 = 1
		42:
			PlayerData.player_data.蓬莱岛 = 1
		43:
			PlayerData.player_data.蓬莱仙境 = 1
		44:
			PlayerData.player_data["碧游宫"] = true
			
func shake_(strength: float,times: int,inte: float):
	if my_camera != null:
		my_camera.Shake(strength,times,inte)
func removeAllRecords():
	Global.LevelBeginTime = ""
	Global.MostLianji = 0
	Global.LastPropHp = 0	
	Global.TotalRoleHurt = 0
	Global.TotalCureHp = 0
	Global.TotalPhyHit = 0
	Global.TotalMagHit = 0
	Global.TotalRealHit = 0
	Global.TotalPhyHurt = 0
	Global.TotalMagHurt = 0
	Global.TotalRealHurt = 0
	Global.TotalHurtCount = 0
	Global.TotalHitCount = 0
	Global.TotalRoleHit = 0
	Global.TotalCritCount = 0
	Global.TotalMissCount = 0
