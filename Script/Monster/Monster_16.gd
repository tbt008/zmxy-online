extends BaseMonster
class_name Monster16
func monster_16():
	self.is_boss = false
	self.my_mr_name = "鱼将军"
	self.attack_in = 20
	self.level = 20
	self.SHp = 700
	self.Hp = self.SHp
	self.def = 80
	self.mdef = 120
	self.crit = 5
	self.miss = 5
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 300
	self.attackRange = 225
	self.attackDesire = 60
	self.behit_calmtime = 0.1
	self.self_rhp = 0
	self.add_exp = 50
	self.fall_coin = 13
	self.objattackDic["hit1"] = {
		"power": 30,
		"hurtBack":[-6,-5],
		"attackKind": "physics"
	}
	self.objattackDic["xzfc"] = {
		"power": 40,
		"hurtBack":[-6,-5],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 1,
			"CanAdd":false,
			"DeBuff": true,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.0
	self.fall_list = [
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_16()
	Skill_1_CD = 0
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 420:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				else: 
					if count % 90 == 0:
						attack_target()
					else:
						stop_move()
						
func do_hit_2():
	Skill_1_CD = 5
	hit_name = "xzfc"
	velocity.x = 0
	is_attacking = true
	mr_player.play("xzfc")
	await mr_player.animation_finished
	is_attacking = false						
