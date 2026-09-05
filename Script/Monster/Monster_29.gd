extends BaseMonster
class_name Monster29
#3mzh：107,7,lxhjq 590,-5.5
func monster_29():
	self.is_boss = true
	self.my_mr_name = "魔·红孩儿"
	self.attack_in = 10
	self.level = RoleProp.baseroleprop.Level + 2
	self.SHp = 5000 + RoleProp.roleprop.SHp * 10
	self.Hp = self.SHp
	self.def = 65 + RoleProp.roleprop.Def
	self.mdef = 65 + RoleProp.roleprop.Mdef
	self.crit = 10
	self.miss = 5
	self.lucky = 15
	self.Htarget = 15
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 300
	self.attackRange = 165
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 100
	self.fall_coin = 100
	self.objattackDic["hit1"] = {
		"power": int(40 + RoleProp.roleprop.power * 0.2),
		"hurtBack":[-3,-5],
		"attackKind": "physics"
	}
	self.objattackDic["lxhjq"] = {
		"power": int(50 + RoleProp.roleprop.power * 0.6),
		"hurtBack":[-3,-5],
		"attackKind": "magic"
	}
	self.objattackDic["tghs"] = {
		"power": int(60 + RoleProp.roleprop.power * 0.4),
		"hurtBack":[-3,-5],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"CanAdd": false,
			"DeBuff": true,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["smzh"] = {
		"power": int(20 + RoleProp.roleprop.power * 0.12),
		"hurtBack":[-3,-5],
		"attackKind": "real",
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"CanAdd":true,
			"ReduceInterval": 0.5,
			"DeBuff": true,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "jgj",
			"value": 0
		},
		{
			"name": "ssj",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0.9
	self.fall_stone = [
		{
			"name": "mjlp",
			"value": 0
		},
		]	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	monster_29()
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 1600:
					if Skill_3_CD <= 0:
						do_hit_3()
				if abs(position.x - RoleProp.role_pos_x) <= 270:
					if Skill_1_CD <= 0:
						do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 200:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				if Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 60 == 0:
					var rad = randi_range(0,100)
					if rad <= attackDesire:
						attack_target()
				else:
					stop_move()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 16
	hit_name = "smzh"
	velocity.x = 0
	is_attacking = true
	mr_player.play("smzh")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 18
	velocity.x = 0
	hit_name = "tghs"
	is_attacking = true
	mr_player.play("tghs")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 12
	velocity.x = 0
	hit_name = "lxhjq"
	is_attacking = true
	mr_player.play("lxhjq")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func normal_state():
	if is_be_attacking:
		return
	if ran_num < 30:
		stop_move()
	elif ran_num >= 30 and ran_num <= 65:
		move_left()
	else:
		move_right()
func CallLXHJQ():
	var Po:Vector2
	if MonsterDirection:
		Po = Vector2(90,-15) + position
	else:
		Po = Vector2(-90,-15) + position
	Global.add_Bullet("Monster29Bullet",self.bullet,self.MonsterDirection,1,Po,"lxhjq",self.objattackDic["lxhjq"])		
