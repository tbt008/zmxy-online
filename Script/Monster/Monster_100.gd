extends BaseMonster
class_name Monster100

func monster_100():
	self.rush_speed = 600
	self.is_boss = true
	self.my_mr_name = "土行孙"
	self.attack_in = 60
	self.level = 40
	self.SHp = 120000
	self.Hp = self.SHp
	self.def = 165
	self.mdef = 165
	self.crit = 35
	self.miss = 25
	self.lucky = 15
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 145
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 120
	self.fall_coin = 155
	self.objattackDic["hit1"] = {
		"power": 350,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 350,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit3"] = {
		"power": 400,
		"hurtBack":[-6,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "stun",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "eyzzs",
			"value": 1
		},
		{
			"name": "tzzzs",
			"value": 1
		},
		{
			"name": "yjzzs",
			"value": 1
		},
		{
			"name": "zezzs",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
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
func _ready() -> void:
	super._ready()
	monster_100()
	Skill_1_CD = 0
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
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,10)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(11,13)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func MovePlayer():
	self.position = Vector2(get_Player.position.x,410)
	self.position.x = get_Player.position.x
func rush():
	if self.MonsterDirection:
		velocity.x = rush_speed
	else:
		velocity.x = -rush_speed
