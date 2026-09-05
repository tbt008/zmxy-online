extends BaseHero
class_name role3
@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
var Interv: int
var My_SD: Array[RoleSpecialEffect] = []
var SYZQ = []
var SYzq
@onready var tmczx: Node2D = $TMCZX

func _ready() -> void:
	super._ready()
	super.onEqchange()
	Role_3()
func Role_3():
	RoleProp.Role1SXBJ = 0
	RoleProp.Role1SXxx = 0
	super.onEqchange()
	var level_1 = PlayerData.player_data["技能学习"]["技能1"]["等级"] + 1
	var level_2 = PlayerData.player_data["技能学习"]["技能2"]["等级"] + 1
	var level_3 = PlayerData.player_data["技能学习"]["技能3"]["等级"] + 1
	var level_4 = PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1
	var level_5 = PlayerData.player_data["技能学习"]["技能5"]["等级"] + 1
	var level_6 = PlayerData.player_data["技能学习"]["技能6"]["等级"] + 1
	var level_7 = PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1
	var level_8 = PlayerData.player_data["技能学习"]["技能8"]["等级"] + 1
	var level_9 = PlayerData.player_data["技能学习"]["技能9"]["等级"] + 1
	var level_10 = PlayerData.player_data["技能学习"]["技能10"]["等级"]
	self.objattackDic["hit1"] = {
		"power": RoleProp.roleprop.power * randf_range(0.9,1.1),
		"hurtBack":[3,-8],
		"attackKind": "physics",
		"HitInterv":3,
		"WSValue": randi_range(5,7),
	}
	self.objattackDic["hit2"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[3,-8],
		"attackKind": "physics",
		"HitInterv":3,
		"WSValue": randi_range(5,7),
	}
	self.objattackDic["hit3"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.3),
		"hurtBack":[3,-8],
		"attackKind": "physics",
		"HitInterv":3,
		"WSValue": randi_range(5,7),
	}
	self.objattackDic["sd"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": ""
	}
	self.objattackDic["zznh"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": ""
	}
	self.objattackDic["dj"] = {
		"power": RoleProp.roleprop.power * (3 + level_2 * 0.3),
		"hurtBack":[25,-20],
		"attackKind": "physics",
		"WSValue": randi_range(25,30),
		"addeffect":{
			"Name": "stun",
			"AddTime": 3 + level_10 * 0.1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true
		}
	}
	self.objattackDic["jsp"] = {
		"power": RoleProp.roleprop.power * (1.4 + level_7 * 0.1),
		"hurtBack":[4,-7],
		"attackKind": "physics",
		"WSValue": randi_range(5,7),
		"addeffect":{
			"Name": "stun",
			"AddTime": 0.5 + level_10 * 0.05,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true
		}
	}
	self.objattackDic["xgq"] = {
		"power": RoleProp.roleprop.power * (1.1 + level_3 * 0.1),
		"hurtBack":[1,-7],
		"attackKind": "physics",
		"WSValue": randi_range(18,22),
	}
	self.objattackDic["dgq"] = {
		"power": RoleProp.roleprop.power * (1.1 + level_8 * 0.1),
		"hurtBack":[10,0],
		"attackKind": "physics",
		"WSValue": randi_range(15,20),
		
	}
	self.objattackDic["syzq"] = {
		"power": RoleProp.roleprop.power * (2 + level_9 * 0.2),
		"hurtBack":[20,0],
		"attackKind": "physics",
		"WSValue": 100,
		"addeffect":{
			"Name": "stun",
			"AddTime": 2 + level_10 * 0.1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true
		}
	}
	self.objattackDic["ssp"] = {
		"power": RoleProp.roleprop.power * (0.5 + level_1 * 0.05),
		"hurtBack":[6,-7],
		"attackKind": "physics",
		"WSValue": randi_range(15,18),
	}
	self.objattackDic["tmc"] = {
		"power": RoleProp.roleprop.SHp * (0.1 + level_5 * 0.004) + RoleProp.roleprop.power * (0.15 + level_5 * 0.05),
		"hurtBack":[0,-8],
		"attackKind": "magic",
		"WSValue": randi_range(5,7),
	}
func _physics_process(delta: float) -> void:
	if My_SD.size() > 3:
		if My_SD[0] != null:
			My_SD[0].queue_free()
		My_SD.remove_at(0)

	if self.IsTMc:
		velocity.x = 0
		if is_on_floor():
			velocity.y = 0
	Role_3()
	super._physics_process(delta)
	if NoLimitBuff() :
		if Input.is_action_pressed("normalhit") and not is_be_attacking and not is_using_skills and Interv <= 0:
			match hit_count:
				0:
					do_normalhit_1()
				1:
					do_normalhit_2()
				2:
					do_normalhit_3()

				
func do_normalhit_1():
	Interv = objattackDic["hit1"]["HitInterv"]
	super.get_hit_data("hit1")
	get_action = "hit1"
	is_attacking = true
	role_action_player.play("hit1")
	await role_action_player.animation_finished
	turn_to_wait()
	hit_count = 1
	is_attacking = false
	return
func do_normalhit_2():
	Interv = objattackDic["hit2"]["HitInterv"]
	get_action = "hit2"
	super.get_hit_data("hit2")
	is_can_move_attack_in_sky()
	#velocity.x = 0
	is_attacking = true
	role_action_player.play("hit2")
	await role_action_player.animation_finished
	hit_count = 2
	is_attacking = false
	return
func do_normalhit_3():
	Interv = objattackDic["hit3"]["HitInterv"]
	get_action = "hit3"
	super.get_hit_data("hit3")
	velocity.x = 0
	is_attacking = true	
	role_action_player.play("hit3")
	await role_action_player.animation_finished
	hit_count = 0
	is_attacking = false
	return
func Skill_SD():
	self.Role1SkillInter["sd"] = 1.2
	#velocity.x = 0
	get_action = "sd"
	is_using_skills = true
	super.get_hit_data("sd")
	is_attacking = true
	role_action_player.play("sd")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_ZZNH():
	self.Role1SkillInter["zznh"] = 2
	#velocity.x = 0
	get_action = "zznh"
	is_using_skills = true
	super.get_hit_data("zznh")
	is_attacking = true
	role_action_player.play("zznh")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_DJ():
	self.Role1SkillInter["dj"] = 1.2
	velocity.x = 0
	get_action = "dj"
	is_using_skills = true
	super.get_hit_data("dj")
	is_attacking = true
	role_action_player.play("dj")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_JSP():
	self.Role1SkillInter["jsp"] = 6
	velocity.x = 0
	get_action = "jsp"
	is_using_skills = true
	super.get_hit_data("jsp")
	is_attacking = true
	role_action_player.play("jsp")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_SSP():
	self.Role1SkillInter["ssp"] = 4.8
	velocity.x = 0
	get_action = "ssp"
	is_using_skills = true
	super.get_hit_data("ssp")
	is_attacking = true
	role_action_player.play("ssp")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_XGQ():
	self.Role1SkillInter["xgq"] = 6
	velocity.x = 0
	get_action = "xgq"
	is_using_skills = true
	super.get_hit_data("xgq")
	is_attacking = true
	role_action_player.play("xgq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_DGQ():
	self.Role1SkillInter["dgq"] = 7.2
	velocity.x = 0
	get_action = "dgq"
	is_using_skills = true
	super.get_hit_data("dgq")
	is_attacking = true
	role_action_player.play("dgq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_TMC():
	self.IsTMc = true
	self.Role1SkillInter["tmc"] = 2.4
	velocity.x = 0
	get_action = "tmc"
	is_using_skills = true
	super.get_hit_data("tmc")
	is_attacking = true
	role_action_player.play("tmc")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_TMC2():
	#print("123")
	self.Role1SkillInter["tmc"] = 1.2
	velocity.x = 0
	get_action = "tmc"
	is_using_skills = true
	super.get_hit_data("tmc")
	is_attacking = true
	role_action_player.play("tmc2")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_SYZQ():
	self.Role1SkillInter["syzq"] = 6
	velocity.x = 0
	get_action = "syzq"
	is_using_skills = true
	super.get_hit_data("syzq")
	is_attacking = true
	role_action_player.play("syzq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func _on_inter_timeout() -> void:
	Interv -= 1
func add_music(idx):
	match idx:
		0:
			Global.addSound_(self,"res://Music/Hero/71_Role3_hit1.mp3")
		1:
			Global.addSound_(self,"res://Music/Hero/70_Role3_hit2.mp3")
		2:
			Global.addSound_(self,"res://Music/Hero/69_Role3_hit3.mp3")
		3:#圣盾
			Global.addSound_(self,"res://Music/Hero/Role3/16_Role3_hit5.mp3")
		4:#碎石破
			Global.addSound_(self,"res://Music/Hero/Role3/10_Role3_hit8.mp3")
		5:#圣域之墙
			Global.addSound_(self,"res://Music/Hero/Role3/14_Role3_hit7.mp3")
		6:#战争怒吼
			Global.addSound_(self,"res://Music/Hero/Role3/31_Role3_hit6.mp3")
		7:#巨石破
			Global.addSound_(self,"res://Music/Hero/Role3/38_Role3_hit9.mp3")
		8:#盾击
			Global.addSound_(self,"res://Music/Hero/Role3/53_Role3_hit4.mp3")
		9:#地滚球
			Global.addSound_(self,"res://Music/Hero/Role3/56_Role3_hit10.mp3")
		10:#旋滚球
			Global.addSound_(self,"res://Music/Hero/Role3/67_Role3_hit11.mp3")
		11:#土魔刺
			Global.addSound_(self,"res://Music/Hero/Role3/74_Role3_hit12_1.mp3")
		12:#圣域之墙
			Global.addSound_(self,"res://Music/Hero/Role3/14_Role3_hit7.mp3")	
		13:#土魔刺2
			Global.addSound_(self,"res://Music/Hero/Role3/52_Role3_hit12_2.mp3")
		14:#九环圣经
			Global.addSound_(self,"res://Music/Hero/72_Role3_dead.mp3")
func AddSD():
	Global.addRoleSpecialEffect_(self,Vector2(0,0),false,"sd")
	
func AddZZNH():
	if PlayerDir:
		Global.addRoleSpecialEffect_(self,Vector2(30,-30),false,"zznh")		
	else:
		Global.addRoleSpecialEffect_(self,Vector2(-30,-30),false,"zznh")		
func _on_hit_box_area_entered(area: Area2D) -> void:
	var Target = area.get_parent().get_parent()
	if Target is BaseMonster:
		if PlayerData.player_data["技能学习"]["技能10"]["等级"] <= 0:
			return
		if get_action == "dj":
			if randi_range(0,100) > 10 + PlayerData.player_data["技能学习"]["技能10"]["等级"] * 1:
				return
		elif get_action == "jsp":
			if randi_range(0,100) > PlayerData.player_data["技能学习"]["技能10"]["等级"] * 0.4:
				return
		elif get_action == "syzq":
			if randi_range(0,100) > 8 + PlayerData.player_data["技能学习"]["技能10"]["等级"] * 0.5:
				return
		else:
			return
		if HitDic.has("addeffect"):
			Global.AddBuff(Target.buff,HitDic["addeffect"])
func CallSYZQ():
	var pp
	if PlayerDir:
		pp = Vector2(64,-44) + position	
	else:
		pp = Vector2(-64,-44) + position
	if SYzq == null:
		SYzq = Global.addRoleBullet_(self.Bullet,pp,PlayerDir,"Role3Bullet1",objattackDic["syzq"])
	else:
		SYzq.queue_free()
		SYzq = Global.addRoleBullet_(self.Bullet,pp,PlayerDir,"Role3Bullet1",objattackDic["syzq"])
func AddSSP():
	var PositionList = []
	var ScaleList = [Vector2(1,1),Vector2(1.6,1.6),Vector2(2,2),Vector2(2.5,2.5)]
	if !PlayerDir:
		PositionList = [Vector2(-70,15),Vector2(-145,5),Vector2(-235,5),Vector2(-345,5)]
	else:
		PositionList = [Vector2(70,15),Vector2(145,5),Vector2(235,5),Vector2(345,5)]
	for i in PositionList.size():
		var xbz = Global.addRoleBullet_(self.Bullet,PositionList[i] + position,PlayerDir,"Role3Bullet2",objattackDic["ssp"])
		xbz.scale = ScaleList[i]
		await get_tree().create_timer(0.2,false).timeout	
func AddTMC():
	var MaxCount: int = 10
	if RoleProp.is_ws_state:
		MaxCount = 20
	var Num: int = 0
	var tween = create_tween().set_parallel(true)
	while Num < MaxCount:
		var NewRotation = 360 / MaxCount
		NewRotation = NewRotation * Num
		var stabPosition = Vector2(self.position.x + sin(float(NewRotation) * PI / 180) * 100,self.position.y - 15 - cos(float(NewRotation) * PI / 180) * 100)
		var stab = Global.addRoleBullet_(self.Bullet,stabPosition,false,"Role3Bullet3",objattackDic["tmc"])
		stab.rotation_degrees = NewRotation - 90
		stab.modulate = Color(1,1,1,0)
		tween.tween_property(stab,"modulate",Color(1,1,1,1),0.6)
		Num += 1
		#print(stab.rotation_degrees)
	pass
func Rush():
	if PlayerDir:
		velocity.x += 600
	else:
		velocity.x -= 600

func removetmc():
	self.IsTMc = false
