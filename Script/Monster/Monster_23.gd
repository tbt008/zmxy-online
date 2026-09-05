extends BaseMonster
class_name Monster23
var boss_3
var up_power = 1
func monster_23():
	if get_parent().get_parent() is LevelNMGHDGQ:
		self.is_boss = true
		self.my_mr_name = "牛魔王·人"
		self.attack_in = 15
		self.level = 50
		self.SHp = 350000
		self.Hp = self.SHp
		self.def = 335
		self.mdef = 350
		self.crit = 30
		self.miss = 25
		self.lucky = 60
		self.Htarget = 20
		self.Toughness = 10
		self.ar = 40
		self.sp = 40
		self.Critreduce = 0
		self.speed = 10
		self.mysee = 400
		self.attackRange = 170
		self.attackDesire = 90
		self.behit_calmtime = 0.3
		self.self_rhp = 0
		self.add_exp = 0
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": int(250 * up_power),
			"hurtBack":[-4,-9],
			"attackKind": "physics",
		}
		self.objattackDic["whs"] = {
			"power": int(500 * up_power),
			"hurtBack":[-4,-15],
			"attackKind": "magic"
		}
		self.objattackDic["ryzj"] = {
			"power": int(500 * up_power),
			"hurtBack":[-6,0],
			"attackKind": "magic"
		}
		self.objattackDic["mncz"] = {
			"power": int(1500 * up_power),
			"hurtBack":[-15,0],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"AddTime": 10,
				"CanAdd":true,
				"DeBuff": true,
				"DeRemove": false,
				"ReduceInterval": 0.5,
				"value": 0,
				"AttackKind": "",
			}
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "nmwdnhsp",
				"value": 3
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = []
		return
	self.is_boss = true
	self.my_mr_name = "牛魔王·人"
	self.attack_in = 15
	self.level = 25
	self.SHp = 12000
	self.Hp = self.SHp
	self.def = 100
	self.mdef = 150
	self.crit = 20
	self.miss = 8
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 400
	self.attackRange = 170
	self.attackDesire = 90
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": int(150 * up_power),
		"hurtBack":[-4,-9],
		"attackKind": "physics",
	}
	self.objattackDic["whs"] = {
		"power": int(200 * up_power),
		"hurtBack":[-4,-15],
		"attackKind": "magic"
	}
	self.objattackDic["ryzj"] = {
		"power": int(100 * up_power),
		"hurtBack":[-6,0],
		"attackKind": "magic"
	}
	self.objattackDic["mncz"] = {
		"power": int(300 * up_power),
		"hurtBack":[-15,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "magic",
		}
	}
	self.fall_pro = 0.0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_23()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if self.Hp <= 0:
		var par = get_parent().get_parent()
		if par is level10 or par is LevelNMGHDGQ:
			if boss_3 == null:
				var po:Vector2
				if par is level10:
					po = Vector2(1235,330)
				elif par is LevelNMGHDGQ:
					po = Vector2(435,330)
				boss_3 = Global.Create_Monster(24,get_parent(),po) as Monster24
				var BaseLevel_ = get_parent().get_parent() as BaseLevel
				BaseLevel_.MonsterArray.push_back(boss_3)
func Monster_Intelligence():
	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if Skill_1_CD > 0 and Skill_2_CD > 0 and Skill_3_CD > 0:
				if abs(position.x - RoleProp.role_pos_x) > attackRange:
					have_target()
				else:
					if count % 120 == 0:
						if ran_num <= attackDesire:
							attack_target()
					else:
						stop_move()
			else:
				if Skill_1_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 180:
					do_hit_2()
				elif Skill_2_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 300:
					do_hit_3()
				elif Skill_3_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 280:
					do_hit_4()
				else:
					if abs(position.x - RoleProp.role_pos_x) > attackRange:
						have_target()
					else:
						if count % 120 == 0:
							if ran_num <= attackDesire:
								attack_target()
						else:
							stop_move()
func do_hit_2():
	Skill_1_CD = 12
	hit_name = "whs"
	velocity.x = 0
	is_attacking = true
	mr_player.play("whs")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 20
	hit_name = "mncz"
	velocity.x = 0
	is_attacking = true
	mr_player.play("mncz")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_4():
	Skill_3_CD = 18
	hit_name = "ryzj"
	velocity.x = 0
	is_attacking = true
	mr_player.play("ryzj")
	await mr_player.animation_finished
	is_attacking = false
func speed_up():
	velocity.x = 0
	if self.MonsterDirection:
		velocity.x = 1000
	else:
		velocity.x = -1000
func self_cure():
	cure_hp((self.SHp - Hp) * 0.02)
	if up_power < 10:
		up_power += 0.03
	else:
		up_power = 10
	if get_parent().get_parent() is LevelNMGHDGQ:
		self.objattackDic["hit1"] = {
			"power": int(250 * up_power),
			"hurtBack":[-4,-9],
			"attackKind": "physics",
		}
		self.objattackDic["whs"] = {
			"power": int(500 * up_power),
			"hurtBack":[-4,-15],
			"attackKind": "magic"
		}
		self.objattackDic["ryzj"] = {
			"power": int(500 * up_power),
			"hurtBack":[-6,0],
			"attackKind": "magic"
		}
		self.objattackDic["mncz"] = {
			"power": int(1500 * up_power),
			"hurtBack":[-15,0],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"AddTime": 10,
				"CanAdd":true,
				"DeBuff": true,
				"DeRemove": false,
				"ReduceInterval": 0.5,
				"value": 0,
				"AttackKind": "",
			}
		}
		return
	self.objattackDic["hit1"] = {
		"power": int(150 * up_power),
		"hurtBack":[-4,-9],
		"attackKind": "physics",
	}
	self.objattackDic["whs"] = {
		"power": int(200 * up_power),
		"hurtBack":[-4,-15],
		"attackKind": "magic"
	}
	self.objattackDic["ryzj"] = {
		"power": int(100 * up_power),
		"hurtBack":[-6,0],
		"attackKind": "magic"
	}
	self.objattackDic["mncz"] = {
		"power": int(300 * up_power),
		"hurtBack":[-15,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "magic",
		}
	}
