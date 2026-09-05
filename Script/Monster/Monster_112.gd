extends BaseMonster
class_name Monster112
var FlashCount:int = randi_range(80,120)
func monster_112():
	self.is_boss = true
	self.my_mr_name = "太白金星"
	self.attack_in = 90
	self.level = 50
	self.SHp = 300000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 35
	self.sp = 35
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 500
	self.attackRange = 235
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 300
	self.fall_coin = 335
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-5,-9],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 1500,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Immobilize",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 1500,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
	}

	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "qlgzzs",
			"value": 1
		},
		{
			"name": "plzzzs",
			"value": 1
		},
		{
			"name": "ylfzzs",
			"value": 1
		},
		{
			"name": "jlczzs",
			"value": 1
		},
		{
			"name": "tlqzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_112()
	Skill_1_CD = randi_range(4,7)
	Skill_2_CD = randi_range(6,8)
	Skill_3_CD = randi_range(10,15)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	FlashCount -= 1
	if FlashCount <= 0:
		movetoplayer()
		FlashCount = randi_range(80,120)
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
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_3_CD <= 0:
						do_hit_3()
			else:
				stop_move()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(7,10)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(6,8)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	if self.MonsterDirection:
		Global.add_Bullet("Monster112Bullet1",self.bullet,MonsterDirection,1,Vector2(25,0) + position,"hit2",self.objattackDic["hit2"])
	else:
		Global.add_Bullet("Monster112Bullet1",self.bullet,MonsterDirection,1,Vector2(-25,0) + position,"hit2",self.objattackDic["hit2"])
func CallBullet2():
	if self.MonsterDirection:
		Global.add_Bullet("Monster112Bullet2",self.bullet,MonsterDirection,1,Vector2(70,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		Global.add_Bullet("Monster112Bullet2",self.bullet,MonsterDirection,1,Vector2(-70,0) + position,"hit1",self.objattackDic["hit1"])
func CallBullet3():
	var PositionList1 = [Vector2(position.x + 150,0),Vector2(position.x + 0,100),Vector2(position.x - 150,0)]
	var PositionList2 = [Vector2(position.x + 300,100),Vector2(position.x - 300,100)]
	var PositionList3 = [Vector2(position.x + 450,200),Vector2(position.x - 450,200)]
	var PositionList4 = [Vector2(position.x + 600,0),Vector2(position.x - 600,0)]
	for i in PositionList1:
		Global.add_Bullet("Monster112Bullet3",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList2:
		Global.add_Bullet("Monster112Bullet3",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList3:
		Global.add_Bullet("Monster112Bullet3",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in PositionList4:
		Global.add_Bullet("Monster112Bullet3",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
