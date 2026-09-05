extends BaseHero
class_name role5

@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
@onready var remove_w: Timer = $RemoveW
var Interv: int
var InSky: bool
var tllz
var CanMoveInSky:bool
var Role5EatBlood: float
func _ready() -> void:
	super._ready()
	super.onEqchange()
	Role_5()
func Role_5():
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
	Role5EatBlood = level_10 * 0.05
	RoleProp.Role1SXBJ = 0
	RoleProp.Role1SXxx = 0
	self.objattackDic["hit1"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[1,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit2"] = {
		"power": RoleProp.roleprop.power * randf_range(0.9,1.1),
		"hurtBack":[1,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit3"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[1,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit4"] = {
		"power": RoleProp.roleprop.power * randf_range(1.2,1.4),
		"hurtBack":[2,-3],
		"attackKind": "physics",
		"HitInterv":2,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["xyq"] = {
		"power": RoleProp.roleprop.power * (0.3 + (level_1 * 0.2)),
		"hurtBack":[1,-2],
		"attackKind": "physics",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["xyq_1"] = {
		"power": RoleProp.roleprop.power * (1.5 + (level_1 * 0.2)),
		"hurtBack":[25,-18],
		"attackKind": "physics",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["slq"] = {
		"power": RoleProp.roleprop.power * (2 + (level_2 * 0.12)),
		"hurtBack":[2,-40],
		"attackKind": "physics",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["blq"] = {
		"power": RoleProp.roleprop.power * (0.5 + (level_3 * 0.2)),
		"hurtBack":[30,-6],
		"attackKind": "magic",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["fhf"] = {
		"power": RoleProp.roleprop.power * (3 + (level_4 * 0.2)),
		"hurtBack":[-25,-25],
		"attackKind": "physics",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["cxq"] = {
		"power": RoleProp.roleprop.power * (0.5 + (level_5 * 0.02)),
		"hurtBack":[1,-6],
		"attackKind": "physics",
		"WSValue": randi_range(2,4)
	}
	self.objattackDic["cxq_2"] = {
		"power": 35 + RoleProp.roleprop.power * (1.5 + (level_5 * 0.02)),
		"hurtBack":[30,-18],
		"attackKind": "physics",
		"WSValue": randi_range(15,20)
	}
	self.objattackDic["llrd"] = {
		"power": RoleProp.roleprop.power * (3 + (level_6 * 0.2)),
		"hurtBack":[1,-1],
		"attackKind": "magic",
		"WSValue": randi_range(20,25)
	}
	self.objattackDic["lljy_1"] = {
		"power": 0,
		"hurtBack":[1,0],
		"attackKind": "magic",
		"WSValue": 0,
		"addeffect":{
			"Name": "lljybuff",
			"AddTime": 1.2,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["lljy"] = {
		"power": RoleProp.roleprop.power * (0.1 + (level_7 * 0.01)),
		"hurtBack":[1,-1],
		"attackKind": "magic",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["ygth"] = {
		"power": RoleProp.roleprop.power * (0.7 + (level_8 * 0.01)),
		"hurtBack":[1,-6],
		"attackKind": "physics",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["tllz"] = {
		"power": RoleProp.roleprop.power * (2.5 + (level_9 * 0.01)),
		"hurtBack":[0,0],
		"attackKind": "magic",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["yyb"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic",
		"WSValue": 5
	}
func _physics_process(delta: float) -> void:
	Role_5()
	if InSky:
		gravity = 0
	else:
		gravity = -980.0
	if Interv > 0:
		Interv -= 1
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
				3:
					do_normalhit_4()
				4:
					do_normalhit_5()
	else:
		self.CanMoveWhenUseSkill = false
		InSky = false
		self.Role5Bt = false
func do_normalhit_1():
	Interv = objattackDic["hit1"]["HitInterv"]
	super.get_hit_data("hit1")
	get_action = "hit1"
	velocity.x = 0
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
	velocity.x = 0
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
	hit_count = 3
	is_attacking = false
	return
func do_normalhit_4():
	Interv = objattackDic["hit4"]["HitInterv"]
	get_action = "hit4"
	super.get_hit_data("hit4")
	velocity.x = 0
	is_attacking = true
	role_action_player.play("hit4")
	await role_action_player.animation_finished
	hit_count = 0
	is_attacking = false
	return
func do_normalhit_5():
	Interv = objattackDic["hit3"]["HitInterv"]
	get_action = "hit5"
	super.get_hit_data("hit3")
	is_can_move_attack_in_sky()
	is_attacking = true
	role_action_player.play("hit5")
	await role_action_player.animation_finished
	hit_count = 0
	is_attacking = false
	return
func UseSLQ():
	self.Role1SkillInter["slq"] = 4.8
	velocity.x = 0
	get_action = "slq"
	is_using_skills = true
	super.get_hit_data("slq")
	is_attacking = true
	role_action_player.play("slq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func UseCXQ():
	self.Role1SkillInter["cxq"] = 14
	velocity.x = 0
	get_action = "cxq"
	is_using_skills = true
	super.get_hit_data("cxq")
	is_attacking = true
	role_action_player.play("cxq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func UseBLQ():
	self.Role1SkillInter["blq"] = 6
	velocity.x = 0
	get_action = "blq"
	is_using_skills = true
	super.get_hit_data("blq")
	is_attacking = true
	role_action_player.play("blq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func UseXYQ():
	self.Role1SkillInter["xyq"] = 6
	velocity.x = 0
	get_action = "xyq"
	is_using_skills = true
	super.get_hit_data("xyq")
	is_attacking = true
	role_action_player.play("xyq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func UseLLRD():
	self.Role1SkillInter["llrd"] = 6
	velocity.x = 0
	get_action = "llrd"
	is_using_skills = true
	super.get_hit_data("llrd")
	is_attacking = true
	role_action_player.play("llrd")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func UseLLJY():
	self.Role1SkillInter["lljy"] = 12
	velocity.x = 0
	get_action = "lljy_1"
	is_using_skills = true
	super.get_hit_data("lljy_1")
	is_attacking = true
	role_action_player.play("lljy")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func UseTLLZ():
	self.Role1SkillInter["tllz"] = 6
	velocity.x = 0
	get_action = "tllz"
	is_using_skills = true
	super.get_hit_data("tllz")
	is_attacking = true
	role_action_player.play("tllz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func UseYGTH():
	self.Role1SkillInter["ygth"] = 14
	velocity.x = 0
	get_action = "ygth"
	is_using_skills = true
	super.get_hit_data("ygth")
	is_attacking = true
	role_action_player.play("ygth")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func UseFHF():
	self.Role1SkillInter["fhf"] = 9
	velocity.x = 0
	get_action = "fhf"
	is_using_skills = true
	super.get_hit_data("fhf")
	is_attacking = true
	role_action_player.play("fhf")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
	
func SlqFly():
	velocity.x= 0 
	velocity.y = 0
	var Position = Vector2()
	if PlayerDir:
		Position = Vector2(100,-150)
	else:
		Position = Vector2(-100,-150)
	var slq = Global.addRoleBullet_(self.Bullet,Position + position,PlayerDir,"Role5Bullet1",objattackDic["slq"])
	slq.scale = Vector2(1.4,1.6)
	velocity.y = -600
func RemoveXspeed():
	velocity.x = 0
func RoleRush():
	if PlayerDir:
		velocity.x = 800
	else:
		velocity.x = -800
func RoleRush2():
	if PlayerDir:
		velocity.x = 90
	else:
		velocity.x = -90
func RoleRush4():
	if PlayerDir:
		velocity.x = 600
	else:
		velocity.x = -600
func RoleRush3():
	if PlayerDir:
		velocity.x = 1500
	else:
		velocity.x = -1500
func RoleRush5():
	if PlayerDir:
		velocity.x = 2000
	else:
		velocity.x = -2000
func UpDownSpeed():
	velocity.y = 2000
func RemoveYspeed():
	velocity.y = 0
func SkillMove():
	self.CanMoveWhenUseSkill = true
func SkillMoveOver():
	self.CanMoveWhenUseSkill = false
func Role5SkillBt():
	self.Role5Bt = true
func Role5SkillBtOver():
	self.Role5Bt = false
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(self.position.x,self.position.y - 200),0.1)
func InTheSky():
	InSky = true
func NoInTheSky():
	InSky = false
func ChangecxqHit():
	super.get_hit_data("cxq_2")
func ChangexyqHit():
	super.get_hit_data("xyq_1")
func CallBullet2():
	var Position: Vector2
	if PlayerDir:
		Position = Vector2(260,180)
	else:
		Position = Vector2(-260,180)
	var llrd = Global.addRoleBullet_(self.Bullet,Position + position,false,"Role5Bullet2",objattackDic["llrd"])	
	llrd.scale = Vector2(1.5,1.5)
func CallBullet3():
	var lljy = Global.addRoleBullet_(self.Bullet,position,PlayerDir,"Role5Bullet3",objattackDic["lljy"])	
func CallBullet4():
	if tllz != null:
		tllz.queue_free()
	tllz = Global.addRoleBullet_(self.Bullet,position - Vector2(0,20),false,"Role5Bullet4",objattackDic["tllz"])	
	tllz.scale = Vector2(1.4,1.4)
func CallBullet5():
	Global.addRoleBullet_(self.Bullet,position,!PlayerDir,"Role5Bullet5",objattackDic["ygth"])	
func add_music(idx:int):
	match idx:
		0:
			Global.addSound_(self,"res://Music/Hero/Role5/attack1.mp3")
		1:
			Global.addSound_(self,"res://Music/Hero/Role5/attack2.mp3")
		2:
			Global.addSound_(self,"res://Music/Hero/Role5/attack3.mp3")
		3:
			Global.addSound_(self,"res://Music/Hero/Role5/attack4.mp3")
		4:
			Global.addSound_(self,"res://Music/Hero/Role5/jumpAttack.mp3")
		5:
			Global.addSound_(self,"res://Music/Hero/Role5/effect3.mp3")
		6:
			Global.addSound_(self,"res://Music/Hero/Role5/effect4.mp3")
		7:
			Global.addSound_(self,"res://Music/Hero/Role5/effect2.mp3")
		8:
			Global.addSound_(self,"res://Music/Hero/Role5/effect1_1.mp3")
		9:
			Global.addSound_(self,"res://Music/Hero/Role5/effect1_2.mp3")
		10:
			Global.addSound_(self,"res://Music/Hero/Role5/effect6.mp3")
		11:
			Global.addSound_(self,"res://Music/Hero/Role5/effect8_1.mp3")
		12:
			Global.addSound_(self,"res://Music/Hero/Role5/effect8_2.mp3")
		13:
			Global.addSound_(self,"res://Music/Hero/Role5/effect9_1.mp3")
		14:
			Global.addSound_(self,"res://Music/Hero/Role5/effect9_2.mp3")
		15:
			Global.addSound_(self,"res://Music/Hero/Role5/effect7_1.mp3")
		16:
			Global.addSound_(self,"res://Music/Hero/Role5/effect7_2.mp3")
		17:
			Global.addSound_(self,"res://Music/Hero/Role5/attack.mp3")
		18:
			Global.addSound_(self,"res://Music/Hero/Role5/13_hurtStand.mp3")
func state_behit():
	self.CanMoveWhenUseSkill = false
	InSky = false
	self.Role5Bt = false
	IsInSky = false
	is_be_attacking = true
	is_using_skills = false
	role_action_player.play("hurt")
	get_action = "hurt"
	await role_action_player.animation_finished
	is_be_attacking = false
	
func _on_hit_box_area_entered(area: Area2D) -> void:
	if objattackDic.has(get_action):
		if objattackDic[get_action].has("addeffect"):
			var Monster = area.get_parent().get_parent()
			if Monster != null:
				if Monster is BaseMonster:
					Global.AddBuff(Monster.buff,objattackDic[get_action]["addeffect"])


