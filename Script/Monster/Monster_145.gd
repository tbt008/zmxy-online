extends BaseMonster
class_name Monster145
var IsSky = false
var RoundList = []
var Rolelevel = RoleProp.baseroleprop.Level
func monster_142():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "后羿"
	self.attack_in = 90
	self.level = RoleProp.baseroleprop.Level
	self.SHp = 100000 + int(RoleProp.baseroleprop.Level * 6000)
	self.Hp = self.SHp
	self.def = 120 + int(RoleProp.baseroleprop.Level * 2)
	self.mdef = 120 + int(RoleProp.baseroleprop.Level * 2)
	self.crit = 15 + int(RoleProp.baseroleprop.Level * 0.6)
	self.miss = 15 + int(RoleProp.baseroleprop.Level * 0.3)
	self.lucky = 45 + int(RoleProp.baseroleprop.Level * 1)
	self.Htarget = 9999
	self.Toughness = 0
	self.ar = 30 + int(RoleProp.baseroleprop.Level * 0.5)
	self.sp = 30 + int(RoleProp.baseroleprop.Level * 0.5)
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 355
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = SHp * 0.02
	self.add_exp = 1
	self.fall_coin = 1
	self.ebol = 0
	self.objattackDic["hit1"] = {
		"power": 100 + int(RoleProp.baseroleprop.Level * 8),
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 0,
	}
	self.objattackDic["hit2"] = {
		"power": 300 + int(RoleProp.baseroleprop.Level * 12),
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 0,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": 0.4,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 500 + int(RoleProp.baseroleprop.Level * 15),
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 0,
		"addeffect":{
			"Name": "stun",
			"AddTime": 6,
			"ReduceInterval": 0,
			"value": 1,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
		}
	}


	self.fall_pro = 1
	self.fall_list = [
		{
			"name": "ptsryx",
			"value": 0
		}
	]
	self.fall_stone_pro = 0
	self.fall_stone = []		
func _ready() -> void:
	super._ready()
	monster_142()
	Skill_1_CD = 2
	Skill_2_CD = 5
	Skill_3_CD = 7
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
				if Skill_2_CD <= 0:
					do_hit_2()
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
						
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 15
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 20
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	var bb
	var sp = 1 + Rolelevel * 0.015
	if self.MonsterDirection:
		bb = Global.add_Bullet("Monster145Bullet1",self.bullet,false,sp,Vector2(20,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		bb = Global.add_Bullet("Monster145Bullet1",self.bullet,false,sp,Vector2(-20,0) + position,"hit1",self.objattackDic["hit1"])
	bb.scale = Vector2(2,2)
	bb.look_at(get_Player.position)
func CallBullet2():
	await get_tree().create_timer(2,false).timeout
	var sp = 0.5 + Rolelevel * 0.01
	for i in range(5):
		var Bullet
		var Position = Vector2(position.x + randi_range(-450,500),-800)
		Bullet = Global.add_Bullet("Monster145Bullet2",self.bullet,false,sp,Position,"hit2",self.objattackDic["hit2"])	
		Bullet.look_at(get_Player.position)
		await get_tree().create_timer(0.5,false).timeout
func CallBullet3():
	var sp = 1 + Rolelevel * 0.02
	var bb
	if self.MonsterDirection:
		bb = Global.add_Bullet("Monster145Bullet2",self.bullet,!self.MonsterDirection,sp,Vector2(20,0) + position,"hit2",self.objattackDic["hit2"])
		bb.rotation_degrees = -45
	else:
		bb = Global.add_Bullet("Monster145Bullet2",self.bullet,!self.MonsterDirection,sp,Vector2(-20,0) + position,"hit2",self.objattackDic["hit2"])
		bb.rotation_degrees = 45
func CallBullet4():
	var sp = 0.5 + Rolelevel * 0.01
	var bb
	if self.MonsterDirection:
		bb = Global.add_Bullet("Monster145Bullet3",self.bullet,!self.MonsterDirection,sp,Vector2(20,0) + position,"hit3",self.objattackDic["hit3"])
	else:
		bb = Global.add_Bullet("Monster145Bullet3",self.bullet,!self.MonsterDirection,sp,Vector2(-20,0) + position,"hit3",self.objattackDic["hit3"])
