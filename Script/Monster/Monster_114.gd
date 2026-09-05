extends BaseMonster
class_name Monster114
var IsCombo: bool
func monster_114():
	self.is_boss = true
	self.my_mr_name = "太上老君"
	self.attack_in = 90
	self.level = 50
	self.SHp = 400000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 200
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 35
	self.sp = 35
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 235
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 300
	self.fall_coin = 335
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-5,-9],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 700,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Immobilize",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 600,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 0.3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 800,
		"hurtBack":[-2,-9],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": 80,
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "doushuaiziyanzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_114()
	Skill_1_CD = randi_range(4,7)
	Skill_2_CD = randi_range(6,8)
	Skill_3_CD = randi_range(10,15)
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
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_3_CD <= 0:
						do_hit_3()
			else:
				stop_move()
				if Skill_3_CD <= 0:
					do_hit_3()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_1_CD <= 0:
					do_hit_1()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(15,18)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(10,12)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(15,17)
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet():
	if self.MonsterDirection:
		Global.add_Bullet("Monster114Bullet1",self.bullet,false,1,Vector2(65,50) + position,"hit3",self.objattackDic["hit3"])
	else:
		Global.add_Bullet("Monster114Bullet1",self.bullet,false,1,Vector2(-65,50) + position,"hit3",self.objattackDic["hit3"])
func CallBullet2():
	var PositionList1 = [Vector2(position.x + 150,500),Vector2(position.x + 0,500),Vector2(position.x - 150,500)]
	var PositionList2 = [Vector2(position.x + 300,500),Vector2(position.x - 300,500)]
	var PositionList3 = [Vector2(position.x + 450,500),Vector2(position.x - 450,500)]
	var PositionList4 = [Vector2(position.x + 600,500),Vector2(position.x - 600,500)]
	var PositionList5 = [Vector2(position.x + 750,500),Vector2(position.x - 750,500)]
	for i in PositionList1:
		Global.add_Bullet("Monster114Bullet3",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList2:
		Global.add_Bullet("Monster114Bullet3",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList3:
		Global.add_Bullet("Monster114Bullet3",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList4:
		Global.add_Bullet("Monster114Bullet3",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList5:
		Global.add_Bullet("Monster114Bullet3",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
