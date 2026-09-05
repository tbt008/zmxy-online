extends BaseMonster
class_name Monster84
func monster_84():
	self.is_boss = true
	self.my_mr_name = "广目天王"
	self.attack_in = 10
	self.level = 35
	self.SHp = 90000
	self.Hp = self.SHp
	self.def = 170
	self.mdef = 170
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 18
	self.Toughness = 0
	self.ar = 10
	self.sp = 10
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 300
	self.attackRange = 165
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 6,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 1,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit2"] = {
		"power": 300,
		"hurtBack":[-10,-55],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 50,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit3"] = {
		"power": 350,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 12,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit4"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 15,
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit5"] = {
		"power": 325,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 10,
	}
	self.objattackDic["hit6"] = {
		"power": 325,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 1,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "hylk",
			"value": 0
		},
		{
			"name": "qysz",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0.2
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	Skill_1_CD = 5
	Skill_2_CD = 6
	Skill_3_CD = 7
	super._ready()
	monster_84()
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_3_CD <= 0:
						do_hit_3()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_3_CD <= 0:
					do_hit_3()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,9)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(15,17)
	velocity.x = 0
	hit_name = "hit3"
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(12,14)
	velocity.x = 0
	hit_name = "hit5"
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(0,-250) + position,1.8)
	#tween.tween_property(self,"position",Vector2(0,0) + position,1.8)
	pass
func ADDFire():
	Global.add_Bullet("Monster84Bullet3",self,false,1,Vector2(0,0),"hit6",self.objattackDic["hit6"])
func call_sfjmFire():
	#Global.add_Bullet("Monster84Bullet3",self,false,1,Vector2(0,0),"hit6",self.objattackDic["hit6"])
	var FirePosition1 = [Vector2(self.position.x - 80,440),Vector2(self.position.x + 80,440)]
	var FirePosition2 = [Vector2(self.position.x - 200,440),Vector2(self.position.x + 200,440)]
	var FirePosition3 = [Vector2(self.position.x - 320,440),Vector2(self.position.x + 320,440)]
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition1[i],"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition2[i],"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition3[i],"hit3",self.objattackDic["hit3"])
func CallHL():
	var Position: Vector2
	if MonsterDirection:
		Position = Vector2(250,-35)
	else:
		Position = Vector2(-250,-35)
	var hl = Global.add_Bullet("Monster84Bullet2",self.bullet,MonsterDirection,1,Position + position,"hit4",self.objattackDic["hit4"])
	hl.scale = Vector2(0.88,0.88)
func CallFL():
	var Position: Vector2
	if MonsterDirection:
		Position = Vector2(40,-30)
	else:
		Position = Vector2(-40,-30)
	var fl = Global.add_Bullet("Monster84Bullet1",self.bullet,MonsterDirection,1,Position + position,"hit5",self.objattackDic["hit5"])
	fl.scale = Vector2(0.7,0.7)
