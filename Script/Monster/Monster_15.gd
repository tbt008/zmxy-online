extends BaseMonster
class_name Monster15
func monster_15():
	self.is_boss = false
	self.my_mr_name = "蟹将"
	self.attack_in = 15
	self.level = 20
	self.SHp = 600
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
	self.speed = 6
	self.mysee = 400
	self.attackRange = 80
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 35
	self.fall_coin = 10
	self.objattackDic["hit1"] = {
		"power": 30,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
	}
	self.objattackDic["qlzg"] = {
		"power": 40,
		"hurtBack":[0,0],
		"attackKind": "real",
		"addeffect":{
			"Name": "stun",
			"AddTime": 0.5,
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
	monster_15()
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
					if abs(position.x - RoleProp.role_pos_x) <= 120:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 120:
						do_hit_2()
					else:
						have_target()
				else: 
					if count % 90 == 0:
						attack_target()
					else:
						stop_move()
func do_hit_2():
	Skill_1_CD = 9
	hit_name = "qlzg"
	velocity.x = 0
	is_attacking = true
	mr_player.play("qlzg")
	await mr_player.animation_finished
	is_attacking = false
func call_boom():
	var po = self.position
	Global.add_Bullet("Monster15Bullet",self.bullet,self.MonsterDirection,0.7,po,"qlzg",self.objattackDic["qlzg"])
