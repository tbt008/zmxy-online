extends BaseMonster
class_name Monster70

#func monster_61():
#	self.is_boss = true
#	self.my_mr_name = "五毒·五官王"
#	self.attack_in = 15
#	self.level = RoleProp.baseroleprop.Level + 2
#	self.SHp = 1000000
#	self.Hp = self.SHp
#	self.def = 400
#	self.mdef = 400
#	self.crit = 35
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 0
#	self.sp = 0
#	self.Critreduce = 0
#	self.speed = 12
#	self.mysee = 500
#	self.attackRange = 305
#	self.attackDesire = 86
#	self.behit_calmtime = 0
#	self.self_rhp = 0
#	self.add_exp = 0
#	self.fall_coin = 0
#	self.objattackDic["hit1"] = {
#		"power": 1038,
#		"hurtBack":[-7,-9],
#		"attackKind": "magic",
#	}
#	self.objattackDic["Skill1"] = {
#		"power": 2999,
#		"hurtBack":[-6,-9],
#		"attackKind": "real",
#		"addeffect":{
#			"Name": "poision",
#			"AddTime": 3,
#			"ReduceInterval": 1,
#			"CanAdd":true,
#			"DeBuff": true,
#			"value": int(RoleProp.roleprop.SHp * 0.01),
#			"AttackKind": "magic",
#		}
#	}
#	self.fall_pro = 0.15
#	self.fall_list = [
#		{
#			"name": "szyj",
#			"value": 1
#		},
#	]	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_61()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#func do_hit_2():
#	Skill_1_CD = randi_range(10,14)
#	super.to_hero()
#	hit_name = "Skill1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("jm")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_3():
#	Skill_2_CD = randi_range(10,14)
#	super.to_hero()
#	hit_name = "Skill1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("ws")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func Monster_Intelligence():
#	if abs(RoleProp.role_pos_x - position.x) < mysee:
#		has_target = true
#	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
#		if has_target == false:
#			normal_state()
#		else:
#			if abs(position.x - RoleProp.role_pos_x) > attackRange:
#				have_target()
#				if abs(position.x - RoleProp.role_pos_x) <= 400:
#					if Skill_1_CD <= 0:
#						do_hit_2()
#				if Skill_2_CD <= 0:
#					do_hit_3()
#				if count % 90 == 0:
#					if randi_range(0,100) <= attackDesire:
#						attack_target()
#					else:
#						have_target()
#			else:
#				if Skill_1_CD <= 0:
#					do_hit_2()
#				elif Skill_2_CD <= 0:
#					do_hit_3()
#				else:
#					if count % 90 == 0:
#						if randi_range(0,100) <= attackDesire:
#							attack_target()
#						else:
#							stop_move()
#					else:
#						stop_move()
#func CallNormalHitBullet():
#	var Position: Vector2
#	if MonsterDirection:
#		Position = Vector2(50,20)
#	else:
#		Position = Vector2(-50,20)
#	Global.add_Bullet("Monster61WGW",self.bullet,MonsterDirection,1,Position + position,"hit1",self.objattackDic["hit1"])	
#
#func CallMychild():
#	var Position: Vector2
#	if MonsterDirection:
#		Position = Vector2(30,0)
#	else:
#		Position = Vector2(-30,0)
#	var Child = Global.Create_Monster(71,get_parent(),Position + position) as Monster71
#	Child.MyFather = self
#func CallJM():
#	var POList = []
#	var ShowList = [false,false,true]
#	if MonsterDirection:
#		POList = [Vector2(70,-110),Vector2(30,-100),Vector2(45,-75)]
#	else:
#		POList = [Vector2(-70,-110),Vector2(-30,-100),Vector2(-45,-75)]
#	for i in range(3):
#		var dy = Global.add_Bullet("Monster70Bullet1",self.bullet,MonsterDirection,1,POList[i] + position,"Skill1",self.objattackDic["Skill1"])	
#		dy.ShowMonster71 = ShowList[i]
