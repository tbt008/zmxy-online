extends BaseMonster
class_name Monster10
func monster_10():
	self.is_boss = false
	self.my_mr_name = "妖狮"
	self.attack_in = 15
	self.level = 18
	self.SHp = 500
	self.Hp = self.SHp
	self.def = 60
	self.mdef = 70
	self.crit = 8
	self.miss = 4
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 7
	self.mysee = 400
	self.attackRange = 70
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 20
	self.fall_coin = 4
	self.objattackDic["hit1"] = {
		"power": 30,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
	}
	self.objattackDic["dmfd"] = {
		"power": 40,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"CanAdd":true,
			"DeBuff": true,
			"value": 6,
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.2
	self.fall_list = [
		{
			"name": "ptxzg",
			"value": 0
		},
		{
			"name": "ptxzf",
			"value": 0
		},
		{
			"name": "ptsmz",
			"value": 0
		},
		{
			"name": "ptjs",
			"value": 0
		},
		{
			"name": "ptdp",
			"value": 0
		},
		{
			"name": "ptcs",
			"value": 0
		},
		{
			"name": "ptyyc",
			"value": 0
		},
		{
			"name": "ptcp",
			"value": 0
		},
	]		
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_10()
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
	hit_name = "dmfd"
	velocity.x = 0
	is_attacking = true
	mr_player.play("dmfd")
	await mr_player.animation_finished
	is_attacking = false
func call_Knife():
	if self.MonsterDirection:
		Global.add_Bullet("Knife",self.bullet,self.MonsterDirection,1,Vector2(self.position.x + 220,self.position.y),"dmfd",self.objattackDic["dmfd"])
	else:
		Global.add_Bullet("Knife",self.bullet,self.MonsterDirection,1,Vector2(self.position.x - 220,self.position.y),"dmfd",self.objattackDic["dmfd"])
