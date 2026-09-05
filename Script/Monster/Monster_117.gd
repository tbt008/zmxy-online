extends BaseMonster
class_name Monster117
func monster_117():
	self.rush_speed = 800
	self.is_Fly = true
	self.is_boss = true
	self.my_mr_name = "飞烟剑"
	self.attack_in = 60
	self.level = 55
	self.SHp = 300000
	self.Hp = self.SHp
	self.def = 350
	self.mdef = 400
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 500
	self.attackRange = 325
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 15
	self.fall_coin = 4
	self.objattackDic["hit1"] = {
		"power": 600,
		"hurtBack":[-4,-9],
		"attackKind": "real"
	}
	self.objattackDic["hit2"] = {
		"power": 500,
		"hurtBack":[-4,-9],
		"attackKind": "real"
	}
	self.fall_pro = 0
	self.fall_list = []		
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_117()
	Skill_1_CD = 10
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 250:
					if Skill_1_CD <= 0:
						do_hit_1()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 10
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
