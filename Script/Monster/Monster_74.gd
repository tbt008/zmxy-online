extends BaseMonster
class_name Monster74
func monster_74():
	self.rush_speed = 500
	self.is_boss = false
	self.my_mr_name = "黑龟"
	self.attack_in = 15
	self.level = 35
	self.SHp = 4000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 10
	self.miss = 8
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 20
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 400
	self.attackRange = 200
	self.attackDesire = 90
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 110
	self.fall_coin = 70
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
		
	}
	self.objattackDic["hit2"] = {
		"power": 150,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "sichou",
			"value": randi_range(1,2)
		},
		{
			"name": "xuantie",
			"value": randi_range(1,2)
		},
		{
			"name": "tanmu",
			"value": randi_range(1,2)
		},
	]	
	self.fall_stone_pro = 0.1
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]	
func _ready() -> void:
	super._ready()
	monster_74()
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
					if abs(position.x - RoleProp.role_pos_x) <= 270:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 270:
						do_hit_2()
					else:
						have_target()
				else:
					if count % 90 == 0:
						attack_target()
					else:
						stop_move()

func do_hit_2():
	Skill_1_CD = 8
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
