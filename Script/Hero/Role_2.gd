extends BaseHero
class_name role2
@onready var hurt_box = $base_damagebox/HurtBox/HurtBox
var Interv: int
var ShallowList: Array

var jhsj_1
var jhsj_2
var SGQ
var smpox
var myhc
func _ready() -> void:
	super._ready()
	super.onEqchange()
	Role_2()
func Role_2():
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
		"hurtBack":[4,-6],
		"attackKind": "magic",
		"HitInterv":1,
		"WSValue": randi_range(2,4)
	}
	self.objattackDic["blb"] = {
		"power": RoleProp.roleprop.power * (0.5 + (level_1 * 0.05)),
		"hurtBack":[15,-10],
		"attackKind": "magic",
		"WSValue": randi_range(15,18)
	}
	self.objattackDic["xbz"] = {
		"power": RoleProp.roleprop.power * (0.75 + (level_2 * 0.075)),
		"hurtBack":[8,-13],
		"attackKind": "magic",
		"WSValue": randi_range(10,12),
		"addeffect":{
			"Name": "Ice",
			"AddTime": 1 + level_10 * 0.1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true
		}
	}
	self.objattackDic["shy"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic"
	}
	self.objattackDic["tjgl"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic"
	}
	self.objattackDic["jgz"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic"
	}
	self.objattackDic["smb"] = {
		"power": RoleProp.roleprop.power * (6.4 + level_5 * 0.6),
		"hurtBack":[3,-8],
		"attackKind": "magic",
		"WSValue": randi_range(25,30),
		"addeffect":{
			"Name": "Ice",
			"AddTime": 2 + level_10 * 0.1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true
		}
	}
	self.objattackDic["sgq"] = {
		"power": RoleProp.roleprop.power * (0.15 + (level_6 * 0.02)),
		"hurtBack":[3,-8],
		"attackKind": "magic",
		"WSValue": 1,
	}
	self.objattackDic["jhsj"] = {
		"power": RoleProp.roleprop.power * (0.8 + (level_9 * 0.1)),
		"hurtBack":[3,-8],
		"attackKind": "magic",
		"WSValue": randi_range(10,15),
	}
	self.objattackDic["myhc"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic"
	}

func _physics_process(delta: float) -> void:
	
	if SMB1 != null:
		smpox = SMB1.position
	else:
		IsUseSMB = false
	if self.IsInSky:
		self.gravity = 0
		if IsUseSMB:
			velocity.y = -160
		else:
			velocity.y = 0
	else:
		self.gravity = -980
	Role_2()
	super._physics_process(delta)
	if NoLimitBuff() :
		if Input.is_action_pressed("normalhit") and not is_be_attacking and not is_using_skills and Interv <= 0:
				do_normalhit_1()
		if SMB1 != null:
			await get_tree().create_timer(0.15,false).timeout
			if Input.is_action_pressed("slz"):
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["Y"]
				if Skill_name == "smb":
					Skill_SMB2()
			if Input.is_action_pressed("lys"):
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["U"]
				if Skill_name == "smb":
					Skill_SMB2()
			if Input.is_action_pressed("lyfb"):
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["I"]
				if Skill_name == "smb":
					Skill_SMB2()
			if Input.is_action_pressed("hmz"):
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["O"]
				if Skill_name == "smb":
					Skill_SMB2()
			if Input.is_action_pressed("hytj"):
				var Skill_name = PlayerData.player_data["技能学习"]["技能键位"]["L"]
				if Skill_name == "smb":
					Skill_SMB2()
func do_normalhit_1():
	Interv = objattackDic["hit1"]["HitInterv"]
	super.get_hit_data("hit1")
	get_action = "hit1"
	is_can_move_attack_in_sky()
	is_attacking = true
	role_action_player.play("hit1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	return
func Skill_Blb():
	self.Role1SkillInter["blb"] = 2.4
	velocity.x = 0
	get_action = "blb"
	is_using_skills = true
	super.get_hit_data("blb")
	is_attacking = true
	role_action_player.play("blb")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
	
func Skill_XBZ():
	self.Role1SkillInter["xbz"] = 1.2
	velocity.x = 0
	get_action = "xbz"
	is_using_skills = true
	super.get_hit_data("xbz")
	is_attacking = true
	if MyShallow != null:
		MyShallow.SkillName = "tjgl"
		MyShallow.ShouldUseSkill = true
	role_action_player.play("xbz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func Skill_SGQ():
	self.Role1SkillInter["sgq"] = 1.2
	velocity.x = 0
	get_action = "sgq"
	is_using_skills = true
	super.get_hit_data("sgq")
	is_attacking = true
	role_action_player.play("sgq")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func Skill_JHSJ():
	self.Role1SkillInter["jhsj"] = 2.4
	velocity.x = 0
	get_action = "jhsj"
	is_using_skills = true
	super.get_hit_data("jhsj")
	is_attacking = true
	if MyShallow != null:
		MyShallow.SkillName = "jhsj"
		MyShallow.ShouldUseSkill = true
	role_action_player.play("jhsj")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func Skill_Tjgl():
	self.Role1SkillInter["tjgl"] = 4.8
	velocity.x = 0
	get_action = "tjgl"
	is_using_skills = true
	super.get_hit_data("tjgl")
	is_attacking = true
	if MyShallow != null:
		MyShallow.SkillName = "xbz"
		MyShallow.ShouldUseSkill = true
	role_action_player.play("tjgl")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func Skill_MYHC():
	self.Role1SkillInter["myhc"] = 4.8
	velocity.x = 0
	get_action = "myhc"
	is_using_skills = true
	super.get_hit_data("myhc")
	is_attacking = true
	role_action_player.play("myhc")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false
func Skill_SHY():
	self.Role1SkillInter["shy"] = 2.4
	#velocity.x = 0
	get_action = "shy"
	is_using_skills = true
	super.get_hit_data("shy")
	is_attacking = true
	role_action_player.play("shy")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_JGZ():
	self.Role1SkillInter["jgz"] = 2.4
	#velocity.x = 0
	get_action = "jgz"
	is_using_skills = true
	super.get_hit_data("jgz")
	is_attacking = true
	role_action_player.play("jgz")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_SMB():
	IsUseSMB = true
	self.Role1SkillInter["smb"] = 1.2
	velocity.x = 0
	get_action = "smb"
	is_using_skills = true
	super.get_hit_data("smb")
	is_attacking = true
	role_action_player.play("smb_1")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func Skill_SMB2():
	IsUseSMB = false
	self.Role1SkillInter["smb"] = 1.2
	velocity.x = 0
	velocity.y = 0
	get_action = "smb"
	is_using_skills = true
	super.get_hit_data("smb")
	is_attacking = true
	role_action_player.play("smb_2")
	await role_action_player.animation_finished
	turn_to_wait()
	is_attacking = false
	is_using_skills = false	
func AddNormalHitEffect():
	var Position = Vector2()
	
	if PlayerDir:
		Position = Vector2(10,15)
	else:
		Position = Vector2(-10,15)
	Global.addRoleBullet_(self.Bullet,Position + position,PlayerDir,"Role2Bullet1",objattackDic["hit1"])
func AddBLb():
	var Position = Vector2()
	if PlayerDir:
		Position = Vector2(15,0)
	else:
		Position = Vector2(-15,0)
	Global.addRoleBullet_(self.Bullet,Position + position,PlayerDir,"Role2Bullet2",objattackDic["blb"])
func Addsgq():
	var Position = Vector2()
	if PlayerDir:
		Position = Vector2(35,-20)
	else:
		Position = Vector2(-35,-20)
	if SGQ == null:
		SGQ = Global.addRoleBullet_(self.Bullet,Position + position,PlayerDir,"Role2Bullet5",objattackDic["sgq"])
		SGQ.scale = Vector2(2,2)
	else:
		SGQ.queue_free()
		SGQ = Global.addRoleBullet_(self.Bullet,Position + position,PlayerDir,"Role2Bullet5",objattackDic["sgq"])
		SGQ.scale = Vector2(2,2)
func AddXBZ():
	var PositionList = [Vector2(-80,-15)]
	var ScaleList = [Vector2(1,1),Vector2(1.3,1.3),Vector2(1.5,1.5)]
	if !PlayerDir:
		PositionList = [Vector2(-80,-15),Vector2(-175,-20),Vector2(-275,-25)]
	else:
		PositionList = [Vector2(80,-15),Vector2(175,-20),Vector2(275,-25)]
	for i in PositionList.size():
		var xbz = Global.addRoleBullet_(self.Bullet,PositionList[i] + position,PlayerDir,"Role2Bullet3",objattackDic["xbz"])
		xbz.scale = ScaleList[i]
		await get_tree().create_timer(0.2,false).timeout
func AddSMb_1():
	if !PlayerDir:
		SMB1 = Global.addSMBEffect(self.Bullet,position + Vector2(-100,25),PlayerDir)
	else:
		SMB1 = Global.addSMBEffect(self.Bullet,position + Vector2(100,25),PlayerDir)
func AddSMb_2():
	Global.addRoleBullet_(self.Bullet,smpox + Vector2(0,-180),PlayerDir,"Role2Bullet4",objattackDic["smb"])

func AddShallow():
	if MyShallow == null:
		MyShallow = Global.addRole2Shallow(self.Bullet,position,PlayerDir)
	else:
		if not MyShallow.ShouldUseSkill:
			position = MyShallow.position
			MyShallow.queue_free()
func SelfCure():
	var level = PlayerData.player_data["技能学习"]["技能4"]["等级"] + 1
	var TotalValue = int(RoleProp.roleprop.SHp * 0.2 + level * 0.02)
	CureValue = 0.6 * float((RoleProp.roleprop.SHp - RoleProp.roleprop.Hp)) / float(RoleProp.roleprop.SHp) + 1
	var Value = int(TotalValue * CureHpValue)
	cure_Hp(Value)
func AddTJGL():
	var tjgl = Global.addRoleSpecialEffect_(self.Bullet,position + Vector2(0,-35),false,"tjgl")
	tjgl.show_behind_parent = true
func AddMYHC():
	if myhc != null:
		myhc.queue_free()
		myhc = Global.addRoleSpecialEffect_(self,Vector2(0,-30),false,"myhc")
	else:
		myhc = Global.addRoleSpecialEffect_(self,Vector2(0,-30),false,"myhc")
func AddJGZ():
	if !PlayerDir:
		Global.addRoleSpecialEffect_(self.Bullet,position + Vector2(-210,0),false,"jgz")
	else:
		Global.addRoleSpecialEffect_(self.Bullet,position + Vector2(210,0),false,"jgz")
		
func AddJHSJ():
	if !PlayerDir:
		jhsj_1 = Global.addRoleSpecialEffect_(self,Vector2(-20,-15),PlayerDir,"jhsj")
	else:
		jhsj_1 = Global.addRoleSpecialEffect_(self,Vector2(20,-15),PlayerDir,"jhsj")
func AddJHSJ2():
	var Position = Vector2()
	if PlayerDir:
		Position = Vector2(0,-10)
	else:
		Position = Vector2(0,-10)
	jhsj_2 = Global.addRoleBullet_(self,Position,PlayerDir,"Role2Bullet6",objattackDic["jhsj"])
	jhsj_2.show_behind_parent = true
func _on_normal_hit_reduce_timeout() -> void:
	Interv -= 1
func ADDMusic(num):
	match num:
		1:#普攻
			Global.addSound_(self,"res://Music/Hero/58_Role2_hit1.mp3")
		2:#冰龙波
			Global.addSound_(self,"res://Music/Hero/59_Role2_hit2.mp3")
		3:#天降甘露
			Global.addSound_(self,"res://Music/Hero/57_Role2_hit8.mp3")
		4:#玄冰阵
			Global.addSound_(self,"res://Music/Hero/60_Role2_hit3.mp3")			
		5:#水幻影
			Global.addSound_(self,"res://Music/Hero/51_Role2_hit10.mp3")	
		6:#水魔爆
			Global.addSound_(self,"res://Music/Hero/11_Role2_hit4.mp3")	
		7:#沐浴回春
			Global.addSound_(self,"res://Music/Hero/32_Role2_hit6.mp3")	
		8:#紧箍咒
			Global.addSound_(self,"res://Music/Hero/40_Role2_hit7.mp3")	
		9:#九环圣经
			Global.addSound_(self,"res://Music/Hero/39_Role2_hit9.mp3")	
		10:#九环圣经
			Global.addSound_(self,"res://Music/Hero/75_Role2_dead.mp3")
func AddShake(power,time,inter):
	var baselevel = get_parent().get_parent() as BaseLevel
	baselevel.shake_(power,time,inter)
func state_behit():
	if jhsj_1 != null:
		jhsj_1.queue_free()
	if jhsj_2 != null:
		jhsj_2.queue_free()
	IsUseSMB = false
	if SMB1 != null:
		SMB1.ShouldDeath = true
	is_using_skills
	IsInSky = false
	is_be_attacking = true
	role_action_player.play("hurt")
	get_action = "hurt"
	await role_action_player.animation_finished
	is_be_attacking = false
func ResetSMB():
	IsUseSMB = false
func EmoveSMB1():
	if SMB1 != null:
		SMB1.queue_free()
	pass
func removespeedy():
	velocity.y = 0
