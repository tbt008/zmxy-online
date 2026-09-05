extends Node2D
class_name RoleSpecialEffect
@onready var special_player: AnimationPlayer = $Middle/SpecialPlayer
@onready var middle: Node2D = $Middle
var RoleList = []
var SpecialEffectName: String
var Dir: bool
var IsSet: bool
var myhccount: int
var MonsterList = []
var CureCount: int = 0
var PPl: BaseHero
var wiilQueue: bool
func _physics_process(delta: float) -> void:
	if get_parent() is BaseHero:
		PPl = get_parent()
	CureCount += 1
	if not wiilQueue:
		if SpecialEffectName == "sd2":
			PPl.Is_sdBuff = true
	if not IsSet:
		if Dir:
			middle.scale.x = -1
		else:
			middle.scale.x = 1
		special_player.play(SpecialEffectName)
		IsSet = true
	if SpecialEffectName == "myhc":
		myhccount += 1
		if myhccount % 60 == 0:
			MYHCCure()
	if SpecialEffectName == "jgz":
		for i in MonsterList:
			if i != null:
				i.velocity.y = 0
	if SpecialEffectName == "zznh":
		var Player = get_parent()
		var MList = Player.get_parent().get_parent().monster.get_children()
		for i in MList:
			if i != null:
				if i is BaseMonster:
					i.velocity.y = 0
	if SpecialEffectName == "sd2":
		if CureCount % 60 == 0:
			Role3SdCure()
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if SpecialEffectName == "jgz":
		var tween = get_tree().create_tween().set_parallel(true)
		if body is BaseMonster:
			body.is_jgz = true
			if not body.CannotAttract:
				MonsterList.push_back(body)
		for i in MonsterList:
			if i != null:
				
				i.velocity.y = 0
				tween.tween_property(i,"position",self.position + Vector2(0,-120),0.625)

	if body is BaseHero:
		RoleList.push_back(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if RoleList.has(body):
		RoleList.erase(body)

func TJGLCure():
	for i in RoleList:
		if i != null:
			if i is BaseHero:
				var level = PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1
				var TotalValue = int(RoleProp.roleprop.SHp * 0.2)
				var CureValue = 0.6 * float((RoleProp.roleprop.SHp - RoleProp.roleprop.Hp)) / float(RoleProp.roleprop.SHp) + 1
				var Value = int(TotalValue * CureValue)
				i.cure_Hp(Value)
func MYHCCure():
	for i in RoleList:
		if i != null:
			if i is BaseHero:
				var level = PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1
				var Value = int(RoleProp.roleprop.SHp * randf_range(0.04,0.05))
				i.cure_Hp(Value)
				
func AddRole3CureEffect():
	var Player = get_parent()
	Player.My_SD.push_back(Global.addRoleSpecialEffect_(Player,Vector2(0,-60),false,"sd2"))
	
func MoveMonsterToPlayer():
	var Player = get_parent()
	var MList = Player.get_parent().get_parent().monster.get_children()
	var tween = get_tree().create_tween().set_parallel(true)
	for i in MList:
		if i != null:
			if i is BaseMonster:
				if i.CannotAttract:
					return
#				if i is Monster60:
#					if i.Is_Top:
#						return
#				if not i is Monster8 and not i is Monster24 and not i is Monster25 and not i is Monster33 and not i is Monster35 and not i is Monster36 and not i is Monster38 and not i is Monster44 and not i is Monster45 and not i is Monster46 and not i is Monster47 and not i is Monster56:
				i.is_jgz = true
				tween.tween_property(i,"position",Player.position + Vector2(0,-110),0.45)
func Role3SdCure():
	var Player = get_parent()
	if Player is role3:
		var Level = PlayerData.player_data["技能学习"]["技能6"]["等级"] + 1
		var CureValue = int(6 + RoleProp.roleprop.SHp / (1000 - (20 * Level)) * (RoleProp.roleprop.R_hp / 10 + 1) + (Level))
		Player.cure_Hp(CureValue)
func Role3RemoveBuff():
	wiilQueue = true
	var Player = get_parent()
	if Player is role3:
		Player.Is_sdBuff = false
