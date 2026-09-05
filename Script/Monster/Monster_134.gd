extends BaseMonster
class_name Monster134
func monster_134():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "马天君"
	self.attack_in = 90
	self.level = 35
	self.SHp = 100000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 20
	self.miss = 0
	self.lucky = 40
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 400,
		"hurtBack":[-8,-12],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 350,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 20,
		"addeffect":{
			"Name": "silent",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}	
	}
	self.objattackDic["hit3"] = {
		"power": 400,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "silent",
			"AddTime": 5,
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
			"name": "mgzhzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 1
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
	monster_134()
	Skill_1_CD = randi_range(3,4)
	Skill_2_CD = 10
	Skill_3_CD = 5
	Skill_4_CD = 0
	
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_1_CD <= 0:
						do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
					else:
						stop_move()
				else:
					stop_move()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(10,12)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	do_hit_2()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(8,12)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	if self.MonsterDirection:
		Global.add_Bullet("Monster134Bullet",self.bullet,MonsterDirection,1,Vector2(125,50) + position,"hit2",self.objattackDic["hit2"])
	else:
		Global.add_Bullet("Monster134Bullet",self.bullet,MonsterDirection,1,Vector2(-125,50) + position,"hit2",self.objattackDic["hit2"])
func CallBullet2():
	var PositionList = [{"position":Vector2(125,50),"dir":true},{"position":Vector2(-125,50),"dir":false}]
	for i in range((3)):
		for u in PositionList:
			Global.add_Bullet("Monster134Bullet",self.bullet,u["dir"],1,u["position"] + position,"hit3",self.objattackDic["hit3"])
		await get_tree().create_timer(0.2,false).timeout
