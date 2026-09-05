extends BaseMonster
class_name Monster140
var ShouldFly: bool
var Sword_: Monster117
var FireRound: Monster116
var IsCall: bool
var OnsetEatblood: bool
var RemoveBlood: bool
func monster_140():
	self.rush_speed = 400
	#焰中仙
	self.is_boss = true
	self.my_mr_name = "焰中仙"
	self.attack_in = 90
	self.level = 55
	self.SHp = 500000
	self.Hp = self.SHp
	self.def = 400
	self.mdef = 400
	self.crit = 20
	self.miss = 40
	self.lucky = 50
	self.Htarget = 15
	self.Toughness = 0
	self.ar = 50
	self.sp = 50
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 500
	self.attackRange = 325
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 500
	self.ebol = 0
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 450,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.5,
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove":false,
			"AttackKind": "",
		},
	}
	self.objattackDic["hit3"] = {
		"power": 550,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 9,
	}
	self.objattackDic["hit4"] = {
		"power": 800,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 3,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * 0.02),
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove":false,
			"AttackKind": "magic",
		},
	}
	self.objattackDic["hit5"] = {
		"power": 800,
		"hurtBack":[0,0],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "DefeReduce",
			"AddTime": 10,
			"ReduceInterval": 0,
			"value": 0.3,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
			"CanAdd":false,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "qszzs",
			"value": 1
		},
		{
			"name": "ytzzs",
			"value": 1
		},
		{
			"name": "llzzs",
			"value": 1
		},
		{
			"name": "rczzs",
			"value": 1
		},
		{
			"name": "ldzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 0
	self.fall_stone = []		
func _ready() -> void:
	super._ready()
	monster_140()
	Skill_1_CD = randi_range(3,4)
	Skill_2_CD = 10
	Skill_3_CD = 5
	Skill_4_CD = 12
	Skill_5_CD = 15
func _physics_process(delta: float) -> void:

	super._physics_process(delta)
	if not IsCall:
#		if Hp <= SHp * 0.7:
		if Sword_ == null:
			Sword_ = Global.Create_Monster(117,get_parent(),self.position)
		if FireRound == null:
			FireRound = Global.Create_Monster(116,get_parent(),self.position)
		IsCall = true
	if Sword_ != null or FireRound != null:
		ebol = 10
	else:
		ebol = 1
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_5_CD <= 0:
					do_hit_5()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 450:
					if Skill_4_CD <= 0:
						do_hit_4()
				if abs(position.x - RoleProp.role_pos_x) <= 500:
					if Skill_3_CD <= 0:
						do_hit_3()
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_3_CD <= 0:
					do_hit_3()
				if Skill_4_CD <= 0:
					do_hit_4()
				if Skill_5_CD <= 0:
					do_hit_5()
				if count % 90 == 0:
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
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 24
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 20
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_4():
	super.to_hero()
	Skill_4_CD = 15
	hit_name = "hit5"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit5")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_5():
	super.to_hero()
	Skill_5_CD = 14
	hit_name = "hit5"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit6")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func MoveToTopAndFacePlayer():
	velocity.y = 0
	var tween = create_tween().set_parallel(true)
	var Po = Vector2(position.x,position.y - 350)
	if position.y -350 <= -100:
		Po = Vector2(position.x,-100)
	tween.tween_property(self,"position",Po,0.2)
	var TargetDegrees = -position.angle_to(get_Player.position)
	tween.tween_property(self,"rotation",TargetDegrees,0.2)
	ShouldInSky = true
func tweentotop():
	velocity.y = 0
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self,"position",Vector2(position.x,-100),0.2)
	velocity.y = 0
	ShouldInSky = true
func NotMovePlayer():
	if position.x > get_Player.position.x:
		velocity.x = 2500
	else:
		velocity.x = -2500
func RemoveSpeedx():
	velocity.x = 0
func Drop():
	ShouldInSky = false
func CallBullet_1():
	var bb
	if self.MonsterDirection:
		bb = Global.add_Bullet("Monster140Bullet1",self.bullet,true,2.5,Vector2(20,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		bb = Global.add_Bullet("Monster140Bullet1",self.bullet,true,2.5,Vector2(-20,0) + position,"hit1",self.objattackDic["hit1"])
	bb.look_at(get_Player.position)
func CallBullet_2():
	var Bullet
	if self.MonsterDirection:
		Bullet = Global.add_Bullet("Monster140Bullet2",self.bullet,false,0.3,Vector2(80,0) + position,"hit2",self.objattackDic["hit2"])
	else:
		Bullet = Global.add_Bullet("Monster140Bullet2",self.bullet,false,0.3,Vector2(-80,0) + position,"hit2",self.objattackDic["hit2"])	
		Bullet.bullet_ani.flip_v = true
	Bullet.look_at(get_Player.position)

func CallBullet_3():
	for i in range(12):
		var Bullet
		var Position = Vector2(position.x + randi_range(-450,500),-300)
		Bullet = Global.add_Bullet("Monster140Bullet3",self.bullet,false,0.58,Position,"hit4",self.objattackDic["hit4"])	
		Bullet.look_at(get_Player.position)
		await get_tree().create_timer(0.3,false).timeout
func CallBullet_4():
	var PositionList = [
		Vector2(-500 + position.x,500),Vector2(-400 + position.x,500),Vector2(-300 + position.x,500),
		Vector2(-200 + position.x,500),Vector2(-100 + position.x,500),Vector2(100 + position.x,500),
		Vector2(200 + position.x,500),Vector2(300 + position.x,500),Vector2(400 + position.x,500),
		Vector2(500 + position.x,500)
	]
	for i in PositionList:
		Global.add_Bullet("Monster140Bullet4",self.bullet,false,1,i,"hit5",self.objattackDic["hit5"])	
func ToSky():
	velocity.y = 0
	ShouldInSky = true
	velocity.y = 0
func CheckPlayer():
	if self.position.x > RoleProp.role_pos_x:
		if Global.get_player.PlayerDir:
			if not MonsterDirection:
				move_playerto_boss(0.5)
				Global.AddBuff(get_Player.buff,{
						"Name": "stun",
						"AddTime": 4,
						"ReduceInterval": 0,
						"value": 0,
						"AttackKind": "",
						"CanAdd":false,
						"CanRemove":false,
						"DeBuff": true,
					})	
	else:
		if not Global.get_player.PlayerDir:
			if MonsterDirection:
				move_playerto_boss(0.5)
				Global.AddBuff(get_Player.buff,{
						"Name": "stun",
						"AddTime": 4,
						"ReduceInterval": 0,
						"value": 0,
						"AttackKind": "",
						"CanAdd":false,
						"CanRemove":false,
						"DeBuff": true,
					})	
func reduce_hp(value: int):
	if Sword_ != null or FireRound != null:
		if value > 0:
			value *= 0.5
	super.reduce_hp(value)

func HurtReduceHp(value,target):
	if Sword_ != null or FireRound != null:
		if value > 0:
			value *= 0.5
	super.HurtReduceHp(value,target)
