extends BaseHero
class_name role1

var use_hmz = false
@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
@onready var remove_w: Timer = $RemoveW

var is_using_hmz = false
var is_hmz_drop = false
var Skill_
var is_in_sky = false
var Hyjj = []
var Interv: int
var ShallowList: Array
var WIsPress:bool
func _ready() -> void:
	super._ready()
	super.onEqchange()
	Role_1()
func Role_1():
	super.onEqchange()
	#super.ChangeEq("qld")
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
	if level_10 == 0:
		RoleProp.Role1SXBJ = 0
		RoleProp.Role1SXxx = 0
	else:
		RoleProp.Role1SXBJ = 4 + (level_10 - 1) * 1.6
		RoleProp.Role1SXxx = 0.03 + (level_10 - 1) * 0.003
	self.objattackDic["hit1"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[2,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit2"] = {
		"power": RoleProp.roleprop.power * randf_range(0.9,1.1),
		"hurtBack":[2,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit3"] = {
		"power": RoleProp.roleprop.power * randf_range(1,1.2),
		"hurtBack":[2,0],
		"attackKind": "physics",
		"HitInterv":1,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["hit4"] = {
		"power": RoleProp.roleprop.power * randf_range(1.2,1.4),
		"hurtBack":[6,-5],
		"attackKind": "physics",
		"HitInterv":2,
		"WSValue": randi_range(3,5)
	}
	self.objattackDic["slz"] = {
		"power": RoleProp.roleprop.power * (2.5 + (level_1 * 0.12)),
		"hurtBack":[6.5,-42],
		"attackKind": "magic",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["hytj"] = {
		"power": RoleProp.roleprop.power * (0.25 + (level_2 * 0.02)),
		"hurtBack":[16,-6],
		"attackKind": "magic",
		"WSValue": randi_range(2,4)
	}
	self.objattackDic["lys"] = {
		"power": 35 + RoleProp.roleprop.power * (0.16 + (level_3 * 0.02)),
		"hurtBack":[1,1],
		"attackKind": "magic",
		"WSValue": randi_range(15,20)
	}
	self.objattackDic["lyfb"] = {
		"power": RoleProp.roleprop.power * (0.7 + (level_4 * 0.2)),
		"hurtBack":[9,-5],
		"attackKind": "magic",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["hmz_1"] = {
		"power": RoleProp.roleprop.power * randf_range((1.02 + (level_5 * 0.15)),(1.1 + (level_5 * 0.15))),
		"hurtBack":[2,-6],
		"attackKind": "physics",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["hmz_2"] = {
		"power": RoleProp.roleprop.power * randf_range((1.02 + (level_5 * 0.15)),(1.1 + (level_5 * 0.15))),
		"hurtBack":[22,18],
		"attackKind": "magic",
		"WSValue": randi_range(6,8)
	}
	self.objattackDic["hmz_3"] = {
		"power": RoleProp.roleprop.power * randf_range((3.5 + (level_5 * 0.5)),(3.8 + (level_5 * 0.5))),
		"hurtBack":[3,-28],
		"attackKind": "magic",
		"WSValue": randi_range(10,15)
	}
	self.objattackDic["zz"] = {
		"power": RoleProp.roleprop.power * (4 + (level_6 * 0.5)),
		"hurtBack":[19,0],
		"attackKind": "physics",
		"WSValue": randi_range(15,18)
	}
	self.objattackDic["qsez"] = {
		"power": RoleProp.roleprop.power * (0.07 + (level_7 * 0.02)),
		"hurtBack":[1,1],
		"attackKind": "physics",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["jdy"] = {
		"power": RoleProp.roleprop.power * (0.4 + (level_8 * 0.07)),
		"hurtBack":[35,0],
		"attackKind": "magic",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["jdy_2"] = {
		"power": RoleProp.roleprop.power * (0.4 + (level_8 * 0.07)),
		"hurtBack":[0,-45],
		"attackKind": "magic",
		"WSValue": randi_range(8,10)
	}
	self.objattackDic["hyjj"] = {
		"power": RoleProp.roleprop.power * (0.5 + (level_9 * 0.15)),
		"hurtBack":[0,0],
		"attackKind": "magic",
		"WSValue": randi_range(8,10)
	}
func _physics_process(delta: float) -> void:
	Role_1()
	Add_Shallow()#更新影子列表
	if use_hmz:
		velocity.x = 0
		velocity.y = -10
	if get_action == "hmz":
		hurt_box.disabled = true
	if is_using_hmz:
		gravity = 0
	elif is_hmz_drop:
		gravity = -2280
	else:
		gravity = -980
	if is_in_sky:
		velocity.y = -10
	super._physics_process(delta)
	if NoLimitBuff() :
		if Input.is_action_pressed("Exit"):
			remove_w.start(0.2)
			WIsPress = true
		if WIsPress:
			if Input.is_action_pressed("normalhit") and not is_be_attacking and not is_using_skills and Interv <= 0:
				get_skill("slz")
				return
			elif Input.is_action_pressed("slz") and not is_be_attacking and not is_using_skills and Interv <= 0:
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["Y"]
				if Skill_name == "jdy":
					get_skill("jdy2")
					return
			elif Input.is_action_pressed("lys") and not is_be_attacking and not is_using_skills and Interv <= 0:
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["U"]
				if Skill_name == "jdy":
					get_skill("jdy2")
					return
			elif Input.is_action_pressed("lyfb") and not is_be_attacking and not is_using_skills and Interv <= 0:
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["I"]
				if Skill_name == "jdy":
					get_skill("jdy2")
					return
			elif Input.is_action_pressed("hmz") and not is_be_attacking and not is_using_skills and Interv <= 0:
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["O"]
				if Skill_name == "jdy":
					get_skill("jdy2")
					return
			elif Input.is_action_pressed("hytj") and not is_be_attacking and not is_using_skills and Interv <= 0:
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["L"]
				if Skill_name == "jdy":
					get_skill("jdy2")
					return
		else:
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
func turn_to_wait():
	super.turn_to_wait()
func do_normalhit_1():
	Interv = objattackDic["hit1"]["HitInterv"]
	super.get_hit_data("hit1")
	get_action = "hit1"
	is_can_move_attack_in_sky()
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
func do_slz():
	self.Role1SkillInter["slz"] = 2.4
	get_action = "slz"
	is_using_skills = true
	super.get_hit_data("slz")
	is_attacking = true
	role_action_player.play("slz")
	Global.addSound_(self,"res://Music/Hero/17_Role1_hit6.mp3")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func do_hytj():
	self.Role1SkillInter["hytj"] = 3.6
	velocity.x = 0
	if action.scale.x == -1:
		velocity.x += 570
	else:
		velocity.x -= 570
	get_action = "hytj"
	is_using_skills = true
	super.get_hit_data("hytj")
	is_attacking = true
	role_action_player.play("hytj")
	Global.addSound_(self,"res://Music/Hero/8_Role1_hit6.mp3")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func do_lys():
	self.Role1SkillInter["lys"] = 2.8
	self.Role1SkillInter["hmz"] = 3.6
	velocity.x = 0
	if action.scale.x == -1:
		velocity.x += 1000
	else:
		velocity.x -= 1000
	get_action = "lys"
	is_using_skills = true
	super.get_hit_data("lys")
	is_attacking = true
	role_action_player.play("lys")
	Global.addSound_(self,"res://Music/Hero/11_Role1_hit7.mp3")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func do_lyfb():
	self.Role1SkillInter["lyfb"] = 3.2
	if is_on_floor():
		velocity.x = 0
	get_action = "lyfb"
	setShallowaction("lyfb")
	is_using_skills = true
	super.get_hit_data("lyfb")
	is_attacking = true
	role_action_player.play("lyfb")
	Global.addSound_(self,"res://Music/Hero/1_Role1_hit9.mp3")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
	return
func do_zz():
	self.Role1SkillInter["zz"] = 1.2
	velocity.x = 0
	get_action = "zz"
	setShallowaction("zz")
	is_using_skills = true
	super.get_hit_data("zz")
	is_attacking = true
	#setShallowaction("zz")
	role_action_player.play("zz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
	return	
func do_hyjj():
	self.Role1SkillInter["hyjj"] = 4.8
	velocity.x = 0
	get_action = "hyjj"
	is_using_skills = true
	super.get_hit_data("hyjj")
	is_attacking = true
	role_action_player.play("hyjj")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
	return	
func do_jdy():
	self.Role1SkillInter["jdy"] = 0
	is_jdy = true	
	if action.scale.x == -1:
		velocity.x += 1000
	else:
		velocity.x -= 1000
	velocity.y = 0
	get_action = "jdy"
	is_using_skills = true
	super.get_hit_data("jdy")
	is_attacking = true
	role_action_player.play("jdy")
	is_using_skills = false
	await role_action_player.animation_finished
	
	
	#is_jdy = true	
	turn_to_wait()
	
	is_attacking = false
	
	return	
func do_jdy_2():
	self.Role1SkillInter["jdy"] = 2.4
	velocity.x = 0
	velocity.y = -1200
	#is_jdy = true	
	velocity.x = 0
	get_action = "jdy"
	is_using_skills = true
	super.get_hit_data("jdy_2")
	is_attacking = true
	role_action_player.play("jdy_1")
	await role_action_player.animation_finished
	is_jdy = false
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
	return
func do_qsez():
	self.Role1SkillInter["qsez"] = 4.8
	velocity.x = 0
	if action.scale.x == -1:
		velocity.x += 1000
	else:
		velocity.x -= 1000
	get_action = "qsez"
	lyfb_calm = 0.8
	is_using_skills = true
	super.get_hit_data("qsez")
	is_attacking = true
	role_action_player.play("qsez")
	await role_action_player.animation_finished
	self.is_call = false
	is_jdy = false
	turn_to_wait()
	
	is_attacking = false
	is_using_skills = false
	return		
func do_hmz_pro():
	RoleBody.self_modulate = Color(1,1,1,0)
	RoleEq.self_modulate = Color(1,1,1,0)
	velocity.x = 0
	velocity.y = 0
	role_action_player.play("hmz__")
	get_action = "hmz"
	is_using_skills = true
	is_using_hmz = true
	Global.addSound_(self,"res://Music/Hero/35_Role1_hit10_1.mp3")
	var abc
	var x = 0
	if PlayerDir:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x + 25,position.y - 80),Vector2(1.15,1.15),"hmz_pro",!PlayerDir)
		if position.x < abc.position.x + 70:
			velocity.x = 470
		else:
			velocity.x = 0
		if position.y > abc.position.y - 300:
			velocity.y = -850
		else:
			velocity.y = 0
	else:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x - 25,position.y - 80),Vector2(1.15,1.15),"hmz_pro",!PlayerDir)
		if position.x > abc.position.x - 70:
			velocity.x = -470
		else:
			velocity.x = 0
		if position.y > abc.position.y - 300:
			velocity.y = -850
		else:
			velocity.y = 0
	abc.tt = self

	await get_tree().create_timer(0.26,false).timeout
	if abc != null:
		while abc.is_can_hit == false:
			await get_tree().create_timer(0.01,false).timeout
			x += 1
			if x > 0:
				do_hmz_flush()
				return
	do_hmz_one()
func do_hmz_one():
	velocity.x = 0
	velocity.y = 0
	role_action_player.play("hmz__")
	get_action = "hmz"
	is_attacking = true
	super.get_hit_data("hmz_1")
	Global.addSound_(self,"res://Music/Hero/36_Role1_hit10_2.mp3")
	role_action_player.play("hmz__")
	var abc
	if PlayerDir:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x - 25,position.y + 45),Vector2(1.17,1.17),"hmz_1",PlayerDir)
	else:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x + 25,position.y + 45),Vector2(1.17,1.17),"hmz_1",PlayerDir)
	abc.tt = self
	await get_tree().create_timer(1.44,false).timeout

	do_hmz_flush()
func do_hmz_flush():
	velocity.y = 0
	velocity.x = 0
	role_action_player.play("hmz__")
	get_action = "hmz"
	is_attacking = true
	is_using_hmz = false
	is_hmz_drop = true
	super.get_hit_data("hmz_2")
	var abc
	if PlayerDir == false:
		velocity.x = -walk_speed * 2.7
	else:
		velocity.x = walk_speed * 2.7
	if PlayerDir:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x + 65,position.y + 90),Vector2(1.1,1.1),"hmz_flush",!PlayerDir)
	else:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x - 65,position.y + 90),Vector2(1.1,1.1),"hmz_flush",!PlayerDir)
	abc.tt = self
	role_action_player.play("hmz__")
	await get_tree().create_timer(0.06,false).timeout
	while velocity.y != 0:
		await get_tree().create_timer(0.01,false).timeout
	do_hmz_two()
func do_hmz_two():
	self.Role1SkillInter["hmz"] = 4.8
	#self.Role1SkillInter["lys"] = 0.8
	role_action_player.play("hmz__")
	get_action = "hmz"
	is_attacking = true
	Global.addSound_(self,"res://Music/Hero/37_Role1_hit10_4.mp3")
	velocity.x = 0
	velocity.y = 0
	super.get_hit_data("hmz_3")
	var abc
	var sc_x
	var sc_y
	var shake_power
	var shake_time
	if RoleProp.is_ws_state:
		shake_time = 6
		shake_power = 40
		sc_x = 2.2
		sc_y = 3.2
	else:
		shake_time = 5
		shake_power = 30
		sc_x = 1.5
		sc_y = 2.2
	if PlayerDir:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x + 0,position.y),Vector2(sc_x,sc_y),"hmz_2",PlayerDir)
	else:
		abc = Global.add_SpecialEffectBullet(self.Bullet,Vector2(position.x - 0,position.y),Vector2(sc_x,sc_y),"hmz_2",PlayerDir)
	abc.tt = self
	#get_parent().get_parent().shake(0,5,1,60,0,0.01)
	var baselevel = get_parent().get_parent() as BaseLevel
	baselevel.shake_(shake_power,shake_time,0.01)
	await get_tree().create_timer(0.65,false).timeout
	is_using_skills = false
	is_attacking = false
	is_hmz_drop = false
	RoleBody.self_modulate = Color(1,1,1,1)
	RoleEq.self_modulate = Color(1,1,1,1)
	#role_action_player.play("wait")
	role_action_player.play("hmz__")
	turn_to_wait()
func state_behit():
	super.state_behit()
func fly():
	is_in_sky = true
	#gravity = 0
func reset():
	is_in_sky = false
	gravity = -980.0
func add_music(idx):
	match idx:
		0:
			Global.addSound_(self,"res://Music/Hero/40_Role1_hit1AndHit2.mp3")
		1:
			Global.addSound_(self,"res://Music/Hero/39_Role1_hit3AndHit4.mp3")
		2:
			Global.addSound_(self,"res://Music/Hero/38_Role1_hit5.mp3")
		3:
			Global.addSound_(self,"res://Music/Hero/18_Role1_hit14.mp3")
		4:
			Global.addSound_(self,"res://Music/Hero/45_Role1_hit12_1.mp3")
		5:
			Global.addSound_(self,"res://Music/Hero/42_Role1_hit11.mp3")
		6:
			Global.addSound_(self,"res://Music/Hero/26_Role1_hit13_1.mp3")
		7:
			Global.addSound_(self,"res://Music/Hero/59_Role1_dead.mp3")
func call_hyjj():
	for i in Hyjj:
		if i == null:
			Hyjj.erase(i)
	if Hyjj.size() < 3:
		Hyjj.push_back(Global.addRoleBullet_1(self.Bullet,Vector2(100,0),"hyjj",self.objattackDic["hyjj"]))
func Add_Shallow():
	var pp = self.get_parent()
	ShallowList = pp.get_children()
func setShallowaction(action_: String):
	var power = self.objattackDic[action_]["power"] * (0.7 + (PlayerData.player_data["技能学习"]["技能7"]["等级"] + 1) * 0.03)
	if ShallowList.size() != 0:
		for i in ShallowList:
			if i != null:
				if i is Role1Shallow:
					i.action = action_
					i.HitDic = self.objattackDic[action_]
					i.HitDic["power"] =  power


func _on_nor_mal_hit_interv_timeout() -> void:
	Interv -= 1


func _on_remove_w_timeout() -> void:
	WIsPress = false
func removeSpeed():
	velocity.x = 0

	
