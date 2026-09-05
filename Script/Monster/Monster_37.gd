extends BaseMonster
class_name Monster37
func monster_37():
	self.is_boss = true
	self.my_mr_name = "秦广王"
	self.attack_in = 15
	self.level = 27
	self.SHp = 20000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 155
	self.crit = 20
	self.miss = 15
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 500
	self.attackRange = 325
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 120,
		"hurtBack":[-7,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "poision",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": 60,
			"AttackKind": "magic",
			"DeBuff": true,
			"CanAdd":true,
		}
	}
	self.objattackDic["wdzh"] = {
		"power": 30,
		"hurtBack":[0,0],
		"attackKind": "magic"
	}
	self.objattackDic["Dead"] = {
		"power": 30,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "DeadLink",
			"AddTime": 7,
			"ReduceInterval": 0,
			"value": 0,
			"DeBuff": true,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "tsyj",
			"value": 0
		},
		{
			"name": "gtc",
			"value": 0
		},

	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_37()
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
					if abs(position.x - RoleProp.role_pos_x) <= 200:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 200:
						do_hit_2()
					else:
						have_target()
				else:
					if count % 180 == 0:
						attack_target()
					else:
						stop_move()

func do_hit_2():
	Skill_1_CD = 18
	hit_name = "wdzh"
	velocity.x = 0
	is_attacking = true
	mr_player.play("wdzh")
	await mr_player.animation_finished
	is_attacking = false
func call_dd():
	if self.MonsterDirection:
		Global.CallChaseBullet(self.bullet,"Monster37Bullet",220,3,true,Vector2(self.position.x + 70,self.position.y),"hit1",self.objattackDic["hit1"])
	else:
		Global.CallChaseBullet(self.bullet,"Monster37Bullet",220,3,true,Vector2(self.position.x - 70,self.position.y),"hit1",self.objattackDic["hit1"])

func call_wdww():
	for i in range(randi_range(6,10)):
		Global.Create_Monster(38,get_parent(),Vector2(self.position.x + randi_range(0,100),self.position.y - 200))

func _on_add_deadlink_timeout() -> void:
	if not Global.is_DeadLink:
		Global.AddBuff(get_Player.buff,objattackDic["Dead"]["addeffect"])

