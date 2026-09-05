extends BaseMonster
class_name Monster43
var firstdoor = false
var seconddoor = false
var thirddoor = false
func monster_43():
	self.is_boss = true
	self.my_mr_name = "阎罗王"
	self.attack_in = 20
	self.level = 27
	self.SHp = 28000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 15
	self.miss = 10
	self.lucky = 40
	self.Htarget = 6
	self.Toughness = 8
	self.ar = 0
	self.sp = 0
	self.Critreduce = 5
	self.speed = 8
	self.mysee = 400
	self.attackRange = 105
	self.attackDesire = 80
	self.behit_calmtime = 0.1
	self.self_rhp = 0
	self.add_exp = 50
	self.fall_coin = 13
	self.objattackDic["hit1"] = {
		"power": 220,
		"hurtBack":[-6,-5],
		"attackKind": "physics"
	}
	self.objattackDic["gwjq"] = {
		"power": 170,
		"hurtBack":[-6,-5],
		"attackKind": "magic"
	}
	self.objattackDic["csjq"] = {
		"power": int(RoleProp.roleprop.SHp * 0.3),
		"hurtBack":[-6,-5],
		"attackKind": "physics",
		"addeffect":{
			"Name": "stun",
			"DeBuff": true,
			"AddTime": 3,
			"ReduceInterval": 0,
			"CanAdd":false,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "fygwj",
			"value": 1
		},
		{
			"name": "lchp",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	monster_43()
	Skill_1_CD = 0
	Skill_3_CD = 0
func do_hit_2():
	Skill_1_CD = 20
	hit_name = "csjq"
	velocity.x = 0
	is_attacking = true
	mr_player.play("csjq")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	velocity.x = 0
	is_attacking = true
	mr_player.play("sdgm")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_4():
	Skill_3_CD = 15
	hit_name = "gwjq"
	velocity.x = 0
	is_attacking = true
	mr_player.play("gwjq")
	await mr_player.animation_finished
	is_attacking = false	
	
func Monster_Intelligence():
	if Hp < SHp * 0.8:
		if not firstdoor:
			do_hit_3()
			Global.Create_Monster(44,get_parent(),Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y - 100))
			firstdoor = true
	if Hp < SHp * 0.6:
		if not seconddoor:
			do_hit_3()
			Global.Create_Monster(45,get_parent(),Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y - 100))
			seconddoor = true	
	if Hp < SHp * 0.4:
		if not thirddoor:
			do_hit_3()
			Global.Create_Monster(46,get_parent(),Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y - 100))
			thirddoor = true
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_2()
				elif abs(position.x - RoleProp.role_pos_x) <= 125:
					if Skill_3_CD <= 0:
						do_hit_4()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				elif Skill_3_CD <= 0:
					do_hit_4()
				elif count % 120 == 0:
					if ran_num <= attackDesire:
						attack_target()
				else:
					stop_move()

func movetorolebehind():
	if RoleProp.Directon:
		self.position.x = RoleProp.role_pos_x
	else:
		self.position.x = RoleProp.role_pos_x
	self.position.y = RoleProp.role_pos_y
	if RoleProp.role_pos_x > position.x:
		monster_dir.scale.x = -1
		base_damage_box.scale.x = -1
	else:
		monster_dir.scale.x = 1
		base_damage_box.scale.x = 1
