extends BaseMonster
class_name Monster93
var Dog:Monster72
var CallDog: bool
func monster_93():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "二郎神"
	self.attack_in = 90
	self.level = 35
	self.SHp = 140000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 500
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-8,-12],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": int(RoleProp.roleprop.SHp * 0.3 + 1000),
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 20,
		"addeffect":{
			"Name": "stun",
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
	}
	self.objattackDic["hit4"] = {
		"power": 300,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "BloodFix",
			"AddTime": 20,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}	
	}
	self.objattackDic["hit5"] = {
		"power": 300,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 8,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "shsjt",
			"value": 0
		},
	]
	self.fall_stone_pro = 0.2
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_93()
	Skill_1_CD = randi_range(3,4)
	Skill_2_CD = 10
	Skill_3_CD = 5
	Skill_4_CD = 0
	
func Monster_Intelligence():	
	if Dog == null and not CallDog:
		Dog = Global.Create_Monster(72,get_parent(),position)
		Dog.SHp = 70000
		Dog.Hp = Dog.SHp
		Dog.IsCall = true
		Dog.MyFather = self
		CallDog = true
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
#				if abs(position.x - RoleProp.role_pos_x) <= 600:
				if Skill_4_CD <= 0:
					do_hit_4()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 800:
					if Skill_3_CD <= 0:
						do_hit_3()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_4_CD <= 0:
					do_hit_4()
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
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(15,18)
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_4():
	super.to_hero()
	Skill_4_CD = randi_range(10,14)
	hit_name = "hit5"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit5")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func ADDBullet():
	var PositionList = [Vector2()]
	var Position2:Vector2
	var Tween_ = create_tween().set_parallel(true)
	if MonsterDirection:
		PositionList = [Vector2(-10,-315),Vector2(70,-70),Vector2(-65,-70)]
		Position2 = Vector2(-10,-160)
	else:
		PositionList = [Vector2(10,-315),Vector2(-70,-70),Vector2(65,-70)]
		Position2 = Vector2(10,-160)
	for i in PositionList:
		var Line = Global.add_Bullet("Monster93Bullet",self.bullet,MonsterDirection,1.6,i + position,"hit5",self.objattackDic["hit5"])
		if MonsterDirection:
			Tween_.tween_property(Line,"rotation_degrees",45,2)
		else:
			Tween_.tween_property(Line,"rotation_degrees",-45,2)
	var Line2 = Global.add_Bullet("Monster93Bullet",self.bullet,MonsterDirection,1.6,Position2 + position,"hit5",self.objattackDic["hit5"])
	Line2.scale.y = 2.2
func BloodFix_():
	if self.position.x > RoleProp.role_pos_x:
		if Global.get_player.PlayerDir:
			if not MonsterDirection:
				ADDBloodFix()
	else:
		if not Global.get_player.PlayerDir:
			if MonsterDirection:
				ADDBloodFix()
func ADDBloodFix():
	Global.AddBuff(get_Player.buff,{
			"Name": "BloodFix",
			"AddTime": 20,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		})		
