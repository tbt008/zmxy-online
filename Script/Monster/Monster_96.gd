extends BaseMonster
class_name Monster96
func monster_96():
	self.is_boss = true
	self.rush_speed = 900
	self.my_mr_name = "猕猴王·通风"
	self.attack_in = 120
	self.level = 35
	self.SHp = 60000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 10
	self.miss = 18
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 145
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 505,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"HitProtect": 8
	}
	self.objattackDic["tfhx"] = {
		"power": 90,
		"hurtBack":[-35,-2],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.8,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["jfkx"] = {
		"power": 450,
		"hurtBack":[-15,-24],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.8,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "tfljzzs",
			"value": 1
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
	super._ready()
	monster_96()
	Skill_1_CD = 7
	Skill_2_CD = 0

func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()

				if abs(position.x - RoleProp.role_pos_x) <= 550:
					if Skill_2_CD <= 0:
						do_hit_3()
			else:
				if Skill_2_CD <= 0:
					do_hit_3()
				else:
					if count % 60 == 0:
						if ran_num <= attackDesire:
							attack_target()
						else:
							stop_move()
					else:
						stop_move()

	
func do_hit_3():
	Skill_2_CD = 9
	velocity.x = 0
	hit_name = "jfkx"
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
