extends BaseMonster
class_name Monster61
#@onready var special_effect: AnimatedSprite2D = $MonsterDir/SpecialEffect
#var Num: int = 0
#var MUbei: BaseMonster
#func monster_61():
#	self.is_boss = true
#	self.my_mr_name = "五毒·平等王"
#	self.attack_in = 15
#	self.level = RoleProp.baseroleprop.Level
#	self.SHp = 1500000
#	self.Hp = self.SHp
#	self.def = 600
#	self.mdef = 600
#	self.crit = 35
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 150
#	self.sp = 150
#	self.Critreduce = 0
#	self.speed = 12
#	self.mysee = 500
#	self.attackRange = 125
#	self.attackDesire = 60
#	self.behit_calmtime = 0.3
#	self.self_rhp = 0
#	self.add_exp = 200
#	self.fall_coin = 200
#	self.objattackDic["hit1"] = {
#		"power": 738,
#		"hurtBack":[-7,-9],
#		"attackKind": "magic",
#	}
#	self.objattackDic["skill_1_1"] = {
#		"power": 2500,
#		"hurtBack":[-8,0],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "Boundground",
#			"AddTime": 5,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#			"CanRemove": false,
#		}
#	}
#	self.objattackDic["skill_1_2"] = {
#		"power": 688,
#		"hurtBack":[0,0],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "speed_down",
#			"AddTime": 5,
#			"ReduceInterval": 0,
#			"value": 0.2,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#			"CanRemove": false,
#		}
#	}
#	self.objattackDic["skill_1_3"] = {
#		"power": 588,
#		"hurtBack":[0,0],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "silent",
#			"AddTime": 5,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#			"CanRemove": false,
#		}
#	}
#	self.objattackDic["skill_1_4"] = {
#		"power": 588,
#		"hurtBack":[-5,-15],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "poision",
#			"AddTime": 5,
#			"ReduceInterval": 1,
#			"value": 60,
#			"AttackKind": "magic",
#			"DeBuff": true,
#			"CanAdd":true,
#		}
#	}
#	self.objattackDic["skill_2"] = {
#		"power": 999,
#		"hurtBack":[0,0],
#		"attackKind": "real",
#	}
#	self.objattackDic["skill_3"] = {
#		"power": 999,
#		"hurtBack":[-6,-9],
#		"attackKind": "real",
#	}
#	self.objattackDic["skill_4"] = {
#		"power": 999,
#		"hurtBack":[-6,-9],
#		"attackKind": "real",
#	}
#	self.fall_pro = 0.15
#	self.fall_list = [
#		{
#			"name": "gzyj",
#			"value": 1
#		},
#	]	
#	self.fall_stone_pro = 0
#	self.fall_stone = [
#	]	
#func _ready() -> void:
#	super._ready()
#	monster_61()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#	Skill_3_CD = 0
#	Skill_4_CD = 0
#
#func Monster_Intelligence():
#	if abs(RoleProp.role_pos_x - position.x) < mysee:
#		has_target = true
#	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
#		if has_target == false:
#			normal_state()
#		else:
#			if abs(position.x - RoleProp.role_pos_x) > attackRange:
#				have_target()
#				if abs(position.x - RoleProp.role_pos_x) <= 800:
#					if Skill_1_CD <= 0:
#						UseSkill_1()
#				if abs(position.x - RoleProp.role_pos_x) <= 600:
#					if MUbei == null:
#						if Skill_2_CD <= 0:
#							UseSkill_2()
#				if abs(position.x - RoleProp.role_pos_x) <= 400:
#					if Skill_3_CD <= 0:
#						UseSkill_3()
#				if abs(position.x - RoleProp.role_pos_x) <= 200:
#					if Skill_4_CD <= 0:
#						if SHp * 0.1 >= Hp:
#							UseSkill_4()
#			else:
#				if Skill_3_CD <= 0:
#					UseSkill_3()
#				elif Skill_1_CD <= 0:
#					UseSkill_1()
#				elif Skill_2_CD <= 0:
#					if MUbei == null:
#						if Skill_2_CD <= 0:
#							UseSkill_2()
#				elif Skill_4_CD <= 0:
#					if SHp * 0.1 >= Hp:
#						UseSkill_4()
#					elif count % 60 == 0:
#						attack_target()
#					else:
#						stop_move()
#				elif count % 60 == 0:
#					attack_target()
#				else:
#					stop_move()
#func UseSkill_1():
#	super.to_hero()
#	hit_name = "skill_1_1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func UseSkill_2():
#	Skill_2_CD = randi_range(35,45)
#	super.to_hero()
#	hit_name = "skill_1_1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_2")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func UseSkill_3():
#	Skill_3_CD = randi_range(16,20)
#	super.to_hero()
#	hit_name = "skill_3"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_3")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func UseSkill_4():
#	Skill_4_CD = 12
#	super.to_hero()
#	hit_name = "skill_4"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("Skill_4")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_1():
#	super.to_hero()
#	hit_name = "skill_1_1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1_1")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_2():
#	super.to_hero()
#	hit_name = "skill_1_2"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1_2")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_3():
#	super.to_hero()
#	hit_name = "skill_1_3"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1_3")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()	
#func do_hit_4():
#	super.to_hero()
#	hit_name = "skill_1_4"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1_4")
#	await mr_player.animation_finished
#	is_attacking = false
#	#stop_move()	
#func RndSkill():
#	Num = randi_range(0,3)
#	special_effect.frame = Num
#func ChangeSkill():
#	Skill_1_CD = randi_range(12,14)
#	match Num:
#		0:
#			do_hit_1()
#		1:
#			do_hit_2()
#		2:
#			do_hit_3()
#		3:
#			do_hit_4()
#func CallMUbei():
#	if MUbei == null:
#		MUbei = Global.Create_Monster(62,get_parent(),Vector2(490,260))
#func CallWGWbULLET():
#	for i in range(randi_range(4,6)):
#		var Position = Vector2(self.position.x,self.position.y) + Vector2(0,randi_range(-180,80))
#		var bullet_ = Global.add_Bullet("Monster61WGW",self.bullet,MonsterDirection,1,Position,"skill_1_4",self.objattackDic["skill_1_4"])
#		await get_tree().create_timer(0.1,false).timeout
#func CallTSWBullet():
#	var PP = self.position
#	var PositionList = [Vector2(-160,0) + PP,Vector2(0,0) + PP,Vector2(160,0) + PP,Vector2(-320,0) + PP,Vector2(320,0) + PP]
#	for i in range(5):
#		var Position = PositionList[i]
#		var bullet_ = Global.add_Bullet("Monster61TSw",self.bullet,MonsterDirection,1.7,Position,"skill_1_3",self.objattackDic["skill_1_3"])
#
#func CallBCWBullet():
#	var PoSITION
#	if MonsterDirection:
#		PoSITION = self.position + Vector2(200,-30)
#	else:
#		PoSITION = self.position + Vector2(-200,-30)
#	Global.add_Bullet("Monster61BCW",self.bullet,MonsterDirection,1,PoSITION,"skill_1_1",self.objattackDic["skill_1_1"])
#func CallDSWBullet():
#	var PoSITION
#	if MonsterDirection:
#		PoSITION = self.position + Vector2(200,-50)
#	else:
#		PoSITION = self.position + Vector2(-200,-50)
#	Global.add_Bullet("Monster61DSW",self.bullet,MonsterDirection,1,PoSITION,"skill_1_2",self.objattackDic["skill_1_2"])
#func _on_hit_box_area_entered(area: Area2D) -> void:
#	#print(hit_name)
#	if hit_name == "skill_4":
#		if RoleProp.roleprop.Hp <= RoleProp.roleprop.Hp * 0.2:
#			Hp = SHp * 0.2
#		else:
#			var Bl = float(Hp) / float(SHp)
#			if Bl >= 0.9:
#				Bl = 0.9
#			Hp = float(RoleProp.roleprop.Hp) / float(RoleProp.roleprop.SHp) * SHp
#			RoleProp.roleprop.Hp = RoleProp.roleprop.SHp * Bl
#	super._on_hit_box_area_entered(area)
#func CallBJ():
#	var P = self.position
#	var PositionList = [Vector2(-70,50) + P,Vector2(-95,50) + P,Vector2(-120,50) + P,Vector2(-145,50) + P,Vector2(-170,50) + P,Vector2(-195,50) + P,
#	Vector2(-220,50) + P,Vector2(-245,50) + P,Vector2(-270,50) + P,Vector2(-295,50) + P,Vector2(-320,50) + P,Vector2(-345,50) + P,Vector2(-370,50) + P
#	,Vector2(-395,50) + P,
#	Vector2(70,50) + P,Vector2(95,50) + P,Vector2(120,50) + P,Vector2(145,50) + P,Vector2(170,50) + P,Vector2(195,50) + P,
#	Vector2(220,50) + P,Vector2(245,50) + P,Vector2(270,50) + P,Vector2(295,50) + P,Vector2(320,50) + P,Vector2(345,50) + P,Vector2(370,50) + P
#	,Vector2(395,50) + P
#	]
#	for i in PositionList:
#		Global.add_Bullet("Monster_61Bullet",self.bullet,MonsterDirection,1,i,"skill_3",self.objattackDic["skill_3"])
#	pass
