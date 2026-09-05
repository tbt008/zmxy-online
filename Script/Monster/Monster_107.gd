extends BaseMonster
class_name Monster107
func monster_107():
	self.is_boss = true
	self.my_mr_name = "银角大王"
	self.attack_in = 90
	self.level = 50
	self.SHp = 200000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 35
	self.sp = 35
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 335
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
		"power": 350,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Immobilize",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 800,
		"hurtBack":[-6,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "Boundground",
			"AddTime": 3 ,
			"ReduceInterval": 0,
			"value": 0,
			"DeBuff": true,
			"AttackKind": "",
			"CanAdd":false,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 350,
		"hurtBack":[-2,-9],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Scary",
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
			"name": "dudan",
			"value": 10
		},

	]
	self.fall_stone_pro = 0.3
	self.fall_stone = [
		{
			"name": "yjpysp",
			"value": 1
		},
	]		
func _ready() -> void:
	super._ready()
	monster_107()
	Skill_1_CD = randi_range(4,7)
	Skill_2_CD = randi_range(6,8)
	Skill_3_CD = randi_range(10,15)
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_3_CD <= 0:
					do_hit_3()
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_3_CD <= 0:
					do_hit_3()
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
func AddLine():
	if randi_range(0,100) < 50:
		Global.AddLine(self,self,"Red")
	else:
		Global.AddLine(self,self,"Blue")
func CallBullet1():
	var PositionList = []
	if self.MonsterDirection:
		PositionList = [Vector2(55,0),Vector2(25,-45),Vector2(25,45)]
	else:
		PositionList = [Vector2(-55,0),Vector2(-25,-45),Vector2(-25,45)]
	for i in PositionList:
		Global.add_Bullet("Monster107Bullet1",self.bullet,MonsterDirection,1.5,i + position,"hit1",self.objattackDic["hit1"])
func CallBullet2():
	var PositionList = []
	if self.MonsterDirection:
		PositionList = [Vector2(0,0),Vector2(-75,45),Vector2(50,45),Vector2(-75,-105),Vector2(75,25)]
	else:
		PositionList = [Vector2(0,0),Vector2(75,45),Vector2(-50,45),Vector2(75,-105),Vector2(-75,25)]
	for i in PositionList:
		Global.add_Bullet("Monster107Bullet2",self.bullet,MonsterDirection,1,i + position,"hit3",self.objattackDic["hit3"])
		await get_tree().create_timer(0.1,false).timeout
func CureHp():
	for i in range(5,8):
		cure_hp(int(SHp * randf_range(0.02,0.03)))
		await get_tree().create_timer(0.1,false).timeout
