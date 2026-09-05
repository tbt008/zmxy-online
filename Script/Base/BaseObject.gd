extends CharacterBody2D
class_name BaseObject
#储存怪物，角色公用的部分，移动之类的
var walk_speed: int = 240 #行走速度
var run_speed: int #跑步速度
var gravity: float = -980.0
var direction: int
var objattackDic: Dictionary
var jump_count: int = 0
var jump_power: float = -540.0	
var hit_count:int = 0
var is_using_skills:bool = false
var is_attacking: bool = false
var is_be_attacking: bool = false
var SHp: int
var Hp: int
var is_crit: bool
var is_miss: bool
var is_ice: bool
var is_DeadLink: bool
var is_EyeFix: bool
func _physics_process(_delta: float) -> void:
	#CheckAddBuff()
	if Hp >= SHp:
		Hp = SHp
	if Hp <= 0:
		Hp = 0
func set_data():
#	walk_speed = 240
#	run_speed = 360
	gravity = -980.0
	objattackDic = {}	
	jump_count = 0
	jump_power = -540.0	
func get_hurt(hit_name):
	var hurt = objattackDic[hit_name].power
	return hurt
func get_hurt_lx(hit_name):
	var hurt_kind = objattackDic[hit_name].attackKind
	return hurt_kind
	
func CheckFashionAndAddFallPro():
	if PlayerData.player_data["时装"].size() <= 0:
		return 0.0
	else:
		if PlayerData.CheckFashionClothes("wklzyf") or PlayerData.CheckFashionClothes("tslzyf") or PlayerData.CheckFashionClothes("bjlzyf") or PlayerData.CheckFashionClothes("sslzyf"):
			return 0.05
		if PlayerData.CheckFashionClothes("wkhzyf") or PlayerData.CheckFashionClothes("tshzyf") or PlayerData.CheckFashionClothes("bjhzyf") or PlayerData.CheckFashionClothes("sshzyf"):
			return 0.08
	return 0
