extends BaseMonster
class_name Monster17
func monster_17(is_boss):
	self.rush_speed = 500
	Skill_1_CD = 0
	self.my_mr_name = "龟丞相"
	if is_boss:
		self.attack_in = 30
		self.level = 20
		self.SHp = 5000
		self.Hp = self.SHp
		self.def = 90
		self.mdef = 120
		self.crit = 10
		self.miss = 5
		self.lucky = 0
		self.Htarget = 0
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 9
		self.mysee = 400
		self.attackRange = 400
		self.attackDesire = 75
		self.behit_calmtime = 0.1
		self.self_rhp = 0
		self.add_exp = 350
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": 155,
			"hurtBack":[-4,-9],
			"attackKind": "real",
			"addeffect":{
				"Name": "Ice",
				"AddTime": 1.56,
				"DeBuff": true,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
			}
		}
		self.objattackDic["xfj"] = {
			"power": 185,
			"hurtBack":[-17,-15],
			"attackKind": "magic",
			"HitProtect": 8,
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "xqzy",
				"value": 0
			},
		]
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
	else:
		self.attack_in = 10
		self.level = 23
		self.SHp = 800
		self.Hp = self.SHp
		self.def = 80
		self.mdef = 120
		self.crit = 5
		self.miss = 5
		self.lucky = 0
		self.Htarget = 1
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 9
		self.mysee = 300
		self.attackRange = 95
		self.attackDesire = 80
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 50
		self.fall_coin = 15
		self.objattackDic["hit1"] = {
			"power": 100,
			"hurtBack":[-4,-9],
			"attackKind": "real"
		}
		self.objattackDic["xfj"] = {
			"power": 35,
			"hurtBack":[-3,-15],
			"attackKind": "magic"
		}
		self.fall_pro = 0.0
		self.fall_list = [
		]	
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
func _ready() -> void:
	super._ready()
	if get_parent().get_parent() is Level1 or get_parent().get_parent() is Level7 :
		is_boss = true
	else:
		is_boss = false
	monster_17(is_boss)
func do_hit_2():
	if RoleProp.role_pos_x > position.x:
		move_right()
	else:
		move_left()
	Skill_1_CD = 14
	velocity.x = 0
	hit_name = "xfj"
	is_attacking = true
	mr_player.play("xfj")
	await mr_player.animation_finished
	is_attacking = false
	Global.AddBuff(buff,{
			"Name": "stun",
			"AddTime": randi_range(3,5),
			"ReduceInterval": 0.00,
			"value": 0,
			"AttackKind": "",
		})
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if is_boss:
				if abs(position.x - RoleProp.role_pos_x) >= attackRange:
					have_target()
					if Skill_1_CD <= 0:
						do_hit_2()
				else:
					if Skill_1_CD <= 0:
						do_hit_2()
					elif count % attack_in == 0:
						if ran_num <= attackDesire:
							attack_target()
						else:
							stop_move()
					else:
						have_target()
			elif not is_boss:
					if abs(position.x - RoleProp.role_pos_x) <= attackRange:
						if count % 60 == 0:
							if ran_num <= attackDesire:
								attack_target()
						else:
							stop_move()
					else:
						have_target()		
