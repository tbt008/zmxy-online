extends BaseMonster
class_name Monster4
func monster_4():
	self.is_boss = true
	self.my_mr_name = "猕猴王"
	self.attack_in = 120
	self.level = 10
	self.SHp = 600
	self.Hp = self.SHp
	self.def = 50
	self.mdef = 80
	self.crit = 5
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 500
	self.attackRange = 115
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 50
	self.fall_coin = 20
	self.objattackDic["hit1"] = {
		"power": 55,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"HitProtect": 8
	}
	self.objattackDic["tfhx"] = {
		"power": 90,
		"hurtBack":[-20,-8],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0.6,
			"CanAdd":false,
			"DeBuff": true,
			"AttackKind": "",
		}
	}
	self.objattackDic["jfkx"] = {
		"power": 80,
		"hurtBack":[3,-18],
		"attackKind": "magic",
		"HitProtect": 18,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "dszy",
			"value": 0
		},
		{
			"name": "dslq",
			"value": 0
		},
		{
			"name": "dshp",
			"value": 0
		},
		{
			"name": "dslj",
			"value": 0
		}
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_4()
	Skill_1_CD = 0
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
			if Skill_1_CD > 0 and Skill_2_CD > 0:
				if abs(position.x - RoleProp.role_pos_x) > attackRange:
					have_target()
				else:
					if count % attack_in == 0:
						if ran_num <= attackDesire:
							attack_target()
					else:
						stop_move()
			else:
				if Skill_1_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 350:
					do_hit_2()
				elif Skill_2_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 180:
					do_hit_3()
				else:
					if abs(position.x - RoleProp.role_pos_x) > attackRange:
						have_target()
					else:
						if count % 60 == 0:
							if ran_num <= attackDesire:
								attack_target()
						else:
							stop_move()
func do_hit_2():
	Skill_1_CD = 8
	hit_name = "tfhx"
	velocity.x = 0
	is_attacking = true
	mr_player.play("tfhx")
	await mr_player.animation_finished
	is_attacking = false
	
func do_hit_3():
	Skill_2_CD = 11
	velocity.x = 0
	hit_name = "jfkx"
	is_attacking = true
	mr_player.play("jfkx")
	var baselevel = get_parent().get_parent() as BaseLevel
	baselevel.shake_(25,6,0.02)
	await mr_player.animation_finished
	is_attacking = false
func call_tfhx():
	var tf
	var dir = -1
	var speed = 1000
	var distance = 900
	var skill_name = "Monster4Bullet"
	var name_ = "tfhx"
	var hit_dic = self.objattackDic["tfhx"]
	var position_: Vector2
	position_ = Vector2(self.position.x,self.position.y)
	if self.MonsterDirection:
		Global.CallFlyBullet(self.bullet,skill_name,dir,position_,distance,speed,name_,hit_dic)
	else:
		Global.CallFlyBullet(self.bullet,skill_name,dir,position_,distance,-speed,name_,hit_dic)

