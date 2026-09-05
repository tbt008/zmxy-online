extends BaseMonster
class_name Monster57
var RoundSpeed:int = 230
var RoundChaseTime:float = 2.3
var RoundThrowCOUNT: int = 2
var RoundList = []
var Boss_2: Monster55
func monster_57():
	if get_parent().get_parent() is LevelZLDHDGQ:
		self.is_Fly = true
		self.is_boss = true
		self.my_mr_name = "转轮·圣王"
		self.attack_in = 120
		self.level = 50
		self.SHp = 250000
		self.Hp = self.SHp
		self.def = 350
		self.mdef = 380
		self.crit = 25
		self.miss = 8
		self.lucky = 15
		self.Htarget = 15
		self.Toughness = 0
		self.ar = 30
		self.sp = 70
		self.Critreduce = 0
		self.speed = 10
		self.mysee = 300
		self.attackRange = 600
		self.attackDesire = 90
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 1000
		self.fall_coin = 1000
		self.objattackDic["hit1"] = {
			"power": 600,
			"hurtBack":[-4,-9],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"AddTime": randi_range(2,3),
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
				"CanAdd":false,
				"DeBuff": true,
			}
		}
		self.objattackDic["hit1_1"] = {
			"power": 660,
			"hurtBack":[-4,-9],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Ice",
				"AddTime": randi_range(2,3),
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
				"CanAdd":false,
				"DeBuff": true,
			}
		}
		self.objattackDic["hit1_2"] = {
			"power": 680,
			"hurtBack":[-4,-9],
			"attackKind": "magic",
			"addeffect":{
				"Name": "poision",
				"AddTime": randi_range(2,3),
				"ReduceInterval": randf_range(0.6,1),
				"value": randi_range(40,60),
				"AttackKind": "magic",
				"CanAdd":true,
				"DeBuff": true,
			}
		}
		self.objattackDic["hit1_3"] = {
			"power": 520,
			"hurtBack":[-4,-9],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Fire",
				"AddTime": randi_range(2,3),
				"ReduceInterval": randf_range(0.6,1),
				"value": randi_range(40,60),
				"AttackKind": "magic",
				"CanAdd":true,
				"DeBuff": true,
			}
		}
		self.objattackDic["dmzhl"] = {
			"power": 600,
			"hurtBack":[-8,0],
			"attackKind": "magic"
		}
		self.objattackDic["dmgz"] = {
			"power": 800,
			"hurtBack":[0,-7],
			"attackKind": "magic"
		}
		self.fall_pro = 0.5
		self.fall_list = [
				{
					"name": "zlwdahsp1",
					"value": 1
				},
				{
					"name": "zlwdahsp2",
					"value": 1
				},
		]
		return
	self.is_Fly = true
	self.is_boss = true
	self.my_mr_name = "转轮·圣王"
	self.attack_in = 120
	self.level = 30
	self.SHp = 30000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 100
	self.crit = 25
	self.miss = 8
	self.lucky = 15
	self.Htarget = 15
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 300
	self.attackRange = 600
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 1000
	self.fall_coin = 1000
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": randi_range(2,3),
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit1_1"] = {
		"power": 220,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Ice",
			"AddTime": randi_range(2,3),
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit1_2"] = {
		"power": 240,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "poision",
			"AddTime": randi_range(2,3),
			"ReduceInterval": randf_range(0.6,1),
			"value": randi_range(40,60),
			"AttackKind": "magic",
			"CanAdd":true,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit1_3"] = {
		"power": 260,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Fire",
			"AddTime": randi_range(2,3),
			"ReduceInterval": randf_range(0.6,1),
			"value": randi_range(40,60),
			"AttackKind": "magic",
			"CanAdd":true,
			"DeBuff": true,
		}
	}
	self.objattackDic["dmzhl"] = {
		"power": 300,
		"hurtBack":[-8,0],
		"attackKind": "magic"
	}
	self.objattackDic["dmgz"] = {
		"power": 400,
		"hurtBack":[0,-7],
		"attackKind": "magic"
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	monster_57()
func Monster_Intelligence():
	ChangeProperies()
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if Skill_1_CD <= 0:
				UseSkill()
			elif follow_Hero():
				have_target()
			elif count % attack_in == 0:
				attack_target()
			else:
				normal_state()
func NormalHit():
	super.to_hero()
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func UseSkill():
	super.to_hero()
	Skill_1_CD = randi_range(10,14)
	hit_name = "dmzhl"
	velocity.x = 0
	is_attacking = true
	mr_player.play("dmzhl")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func ChangeProperies():
	if Hp >= SHp * 0.8 and Hp <= SHp:
		attack_in = 180
		RoundSpeed = 230
		RoundChaseTime = 2.3
		RoundThrowCOUNT = 2
	elif Hp >= SHp * 0.6 and Hp <= SHp * 0.8:
		attack_in = 150
		RoundSpeed = 260
		RoundChaseTime = 2.6
		RoundThrowCOUNT = 3
	elif Hp >= SHp * 0.4 and Hp <= SHp * 0.6:
		attack_in = 120
		RoundSpeed = 300
		RoundChaseTime = 3
		RoundThrowCOUNT = 3
	elif Hp >= SHp * 0.2 and Hp <= SHp * 0.4:
		attack_in = 100
		RoundSpeed = 300
		RoundChaseTime = 4
		RoundThrowCOUNT = 4
	elif Hp >= 0 and Hp <= SHp * 0.2:
		attack_in = 100
		RoundSpeed = 300
		RoundChaseTime = 5
		RoundThrowCOUNT = 5
func CallRound():
	var RoundPositionList = []
	var tween = get_tree().create_tween().set_parallel(true)
	for i in range(RoundThrowCOUNT):
		var round = Global.add_Bullet("Monster57Bullet",bullet,false,1,position,"dmzhl",self.objattackDic["dmzhl"])
		RoundList.push_back(round)
	for i in RoundList:
		if i != null:
			var pp = Vector2(get_Player.position.x + randi_range(-220,220),500)
			tween.tween_property(i,"position",pp,0.35)
	RoundList.clear()
func normalBullet():
	var Bullet
	var BulletName: String
	var Hit_name: String
	var Position = Vector2(self.position.x,self.position.y + 15)
	var RndNum = randi_range(0,100)
	if RndNum <= 100 and RndNum >= 75:
		BulletName = "Monster57Bullet"
		Hit_name = "hit1"
	elif RndNum < 75 and RndNum >= 50:
		BulletName = "Monster57Bullet2"
		Hit_name = "hit1_1"
	elif RndNum < 50 and RndNum >= 25:
		BulletName = "Monster57Bullet3"
		Hit_name = "hit1_2"
	else:
		BulletName = "Monster57Bullet4"
		Hit_name = "hit1_3"
	if MonsterDirection:
		Bullet = Global.CallChaseBullet(self.bullet,BulletName,RoundSpeed,RoundChaseTime,false,Position,Hit_name,self.objattackDic[Hit_name])
	else:
		Bullet = Global.CallChaseBullet(self.bullet,BulletName,RoundSpeed,RoundChaseTime,false,Position,Hit_name,self.objattackDic[Hit_name])
	Bullet.scale = Vector2(0.5,0.5)
func CallMonster():
	if get_parent().get_parent() is level21:
		if Boss_2  == null:
			Boss_2  = Global.Create_Monster(55,get_parent(),Vector2(1450,320)) as Monster55
			var BaseLevel_ = get_parent().get_parent() as BaseLevel
	elif get_parent().get_parent() is LevelZLDHDGQ:
		if Boss_2  == null:
			Boss_2  = Global.Create_Monster(55,get_parent(),Vector2(750,320)) as Monster55
			var BaseLevel_ = get_parent().get_parent() as BaseLevel
