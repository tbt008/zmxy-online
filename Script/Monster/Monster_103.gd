extends BaseMonster
class_name Monster103
var MyChild: MonsterBullet
func monster_103():
	self.is_boss = true
	self.my_mr_name = "托塔天王"
	self.attack_in = 60
	self.level = 40
	self.SHp = 180000
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
		"power": 300,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 355,
		"hurtBack":[-20,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.4,
			"AttackKind": "",
			"CanRemove": false,
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit3"] = {
		"power": int(200 + RoleProp.roleprop.SHp * 0.3),
		"hurtBack":[-18,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "stun",
			"AddTime": 10,
			"ReduceInterval": 0,
			"value": 400,
			"AttackKind": "real",
			"CanRemove": false,
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 200,
		"hurtBack":[-6,-8],
		"attackKind": "real",
		"HitProtect": 10,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "llyzzs",
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
	monster_103()
	Skill_1_CD = randi_range(3,5)
	Skill_2_CD = randi_range(5,8)
	Skill_3_CD = randi_range(0,6)
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
				if abs(position.x - RoleProp.role_pos_x) <= 270:	
					if Skill_3_CD <= 0:
						do_hit_3()
				if abs(position.x - RoleProp.role_pos_x) <= 360:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(15,18)
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
	Skill_3_CD = randi_range(10,12)
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	if self.MonsterDirection:
		Global.CallFlyBullet(self.bullet,"Monster103Bullet",1,Vector2(position.x + 50,position.y + 30),600,-700,"hit1",self.objattackDic["hit1"])
	else:
		var fz = Global.CallFlyBullet(self.bullet,"Monster103Bullet",1,Vector2(position.x - 50,position.y + 30),600,700,"hit1",self.objattackDic["hit1"])
		fz.animated_sprite_2d.flip_h = true
func CallBullet2():
	var BoolList = [true,false]
	for i in BoolList:
		Global.add_Bullet("Monster103Bullet3",self.bullet,i,2,Vector2(0,-50) + position,"hit2",self.objattackDic["hit2"])
	await get_tree().create_timer(0.4,false).timeout
	for i in BoolList:
		Global.add_Bullet("Monster103Bullet3",self.bullet,i,2,Vector2(0,-50) + position,"hit2",self.objattackDic["hit2"])
	await get_tree().create_timer(0.4,false).timeout
	for i in BoolList:
		Global.add_Bullet("Monster103Bullet3",self.bullet,i,2,Vector2(0,-50) + position,"hit2",self.objattackDic["hit2"])
	await get_tree().create_timer(0.4,false).timeout
func CallBullet3():
	await get_tree().create_timer(4,false).timeout
	var po = Vector2(get_Player.position.x,70)
	await get_tree().create_timer(0.2,false).timeout
	Global.add_Bullet("Monster103Bullet1",self.bullet,false,1,po,"hit3",self.objattackDic["hit3"])
func _on_hit_box_area_entered(area: Area2D) -> void:
	if hit_name == "hit4":
		Global.add_Bullet("Monster103Bullet2",self.bullet,false,1,get_Player.position,"hit4",self.objattackDic["hit4"])
	super._on_hit_box_area_entered(area)

