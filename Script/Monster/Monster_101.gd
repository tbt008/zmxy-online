extends BaseMonster
class_name Monster101
var MyChild: MonsterBullet
var Count: int = 0
func monster_101():
	self.is_Fly = true
	self.is_boss = true
	self.my_mr_name = "雷震子"
	self.attack_in = 60
	self.level = 40
	self.SHp = 140000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 50
	self.miss = 25
	self.lucky = 115
	self.Htarget = 35
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 16
	self.mysee = 500
	self.attackRange = 245
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
		"power": 250,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 4,
			"ReduceInterval": 0,
			"value": 0.3,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit3"] = {
		"power": 500,
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
	self.objattackDic["hit4"] = {
		"power": 350,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "DefeReduce",
			"AddTime": 15,
			"ReduceInterval": 0,
			"value": 0.5,
			"AttackKind": "",
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.4
	self.fall_list = [
		{
			"name": "tczzs",
			"value": 1
		},
		{
			"name": "czzzs",
			"value": 1
		},
		{
			"name": "thzzs",
			"value": 1
		},
		{
			"name": "tqzzs",
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
	monster_101()
	Skill_1_CD = randi_range(8,13)
	Skill_2_CD = randi_range(5,8)
	Skill_3_CD = randi_range(0,6)
func Monster_Intelligence():
	if MyChild != null:
		Count += 1
		if Count >= 900:
			MyChild.queue_free()
	else:
		Count = 0
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if MyChild == null and Skill_1_CD <= 0:
					do_hit_1()
				if Skill_3_CD <= 0:
					do_hit_3()
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif MyChild == null and Skill_1_CD <= 0:
						do_hit_1()
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
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(11,13)
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
	
func CallBullet1():
	var positionList = [Vector2(get_Player.position.x - 420,500),Vector2(get_Player.position.x - 280,500),
	Vector2(get_Player.position.x - 140,500),Vector2(get_Player.position.x,500),Vector2(get_Player.position.x + 140,500),
	Vector2(get_Player.position.x + 280,500),Vector2(get_Player.position.x + 420,500)]
	for i in positionList:
		Global.add_Bullet("Monster101Bullet",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
func CallBullet2():
	var Bullets
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster101Bullet1",self.bullet,false,1,Vector2(35,25) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullets = Global.add_Bullet("Monster101Bullet1",self.bullet,false,1,Vector2(-35,25) + position,"hit1",self.objattackDic["hit1"])
	Bullets.look_at(get_Player.position)
func CallBullet3():
	if MyChild == null:
		MyChild = Global.add_Bullet("Monster101Bullet2",self.bullet,false,1,position,"hit2",self.objattackDic["hit2"])
func MovePlayer():
	self.position = Vector2(get_Player.position.x,get_Player.position.y)

