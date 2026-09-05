extends BaseMonster
class_name Monster6
var htl
func monster_6():
	self.is_boss = true
	if RoleProp.baseroleprop.Level < 21:
		self.my_mr_name = "龙王·低"
		self.attack_in = 15
		self.level = 18
		self.SHp = 6000
		self.Hp = self.SHp
		self.def = 90
		self.mdef = 90
		self.crit = 0
		self.miss = 0
		self.lucky = 0
		self.Htarget = 0
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 11
		self.mysee = 600
		self.attackRange = 160
		self.attackDesire = 80
		self.behit_calmtime = 0.4
		self.self_rhp = 0
		self.add_exp = 20
		self.fall_coin = 100
		self.objattackDic["hit1"] = {
			"power": 70,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"HitProtect": 8,
		}
		self.objattackDic["qnbx"] = {
			"power": 100,
			"hurtBack":[0,0],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Ice",
				"AddTime": 4,
				"ReduceInterval": 0,
				"value": 0,
				"CanAdd":false,
				"DeBuff": true,
				"AttackKind": "",
			},
			"HitProtect": 8,
		}
		self.objattackDic["qnhb"] = {
			"power": 95,
			"hurtBack":[-4,-15],
			"attackKind": "magic",
			"HitProtect": 8,
		}
		self.objattackDic["htsl"] = {
			"power": 90,
			"hurtBack":[-2,-25],
			"attackKind": "magic",
			"HitProtect": 8,
		}
		self.fall_pro = 0.4
		self.fall_list = [
			{
				"name":"qld",
				"value": 0
			},
			{
				"name":"hdc",
				"value": 0
			},
			{
				"name":"bhz",
				"value": 0
			},
			{
				"name":"zhp",
				"value": 0
			},
			{
				"name":"twq",
				"value": 0
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
	else:
		self.my_mr_name = "龙王·高"
		self.attack_in = 15
		self.level = 27
		self.SHp = 15000
		self.Hp = self.SHp
		self.def = 110
		self.mdef = 160
		self.crit = 5
		self.miss = 0
		self.lucky = 15
		self.Htarget = 10
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 11
		self.mysee = 600
		self.attackRange = 160
		self.attackDesire = 100
		self.behit_calmtime = 0.4
		self.self_rhp = 0
		self.add_exp = 200
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": 180,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"HitProtect": 8,
		}
		self.objattackDic["qnbx"] = {
			"power": 150,
			"hurtBack":[0,0],
			"attackKind": "real",
			"HitProtect": 8,
			"addeffect":{
				"Name": "Ice",
				"AddTime": 5,
				"ReduceInterval": 0,
				"value": 0,
				"CanAdd":false,
				"DeBuff": true,
				"AttackKind": "",
			}
		}
		self.objattackDic["qnhb"] = {
			"power": 120,
			"hurtBack":[-8,-25],
			"attackKind": "real",
			"HitProtect": 8,
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 5,
				"ReduceInterval": 0.5,
				"CanAdd":true,
				"value": 20,
				"AttackKind": "real",
			}
		}
		self.objattackDic["htsl"] = {
			"power": 100,
			"hurtBack":[-2,-25],
			"attackKind": "real",
			"HitProtect": 8,
		}
		self.fall_pro = 0.4
		self.fall_list = [
			{
				"name":"ryjgb",
				"value": 0
			},
			{
				"name":"jcdp",
				"value": 0
			},
			{
				"name":"jhcz",
				"value": 0
			},
			{
				"name":"qxsh",
				"value": 0
			},
			{
				"name":"jlxmc",
				"value": 0
			},
			{
				"name":"qthbq",
				"value": 0
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
func _ready() -> void:
	super._ready()
	monster_6()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	#set_hd(3000,3000)
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_3_CD <= 0:
					do_hit_4()
				if Skill_1_CD <= 0:
					do_hit_2()
				if Skill_2_CD <= 0:
					do_hit_3()
				if count % 90 == 0:
					do_hit_1()
			else:
				if Skill_3_CD <= 0:
					do_hit_4()
				elif Skill_1_CD <= 0:
					do_hit_2()
				elif Skill_2_CD <= 0:
					do_hit_3()
				elif count % 90 == 0:
					var rad = randi_range(0,100)
					if rad <= attackDesire:
						do_hit_1()
				else:
					stop_move()
func do_hit_1():
	if RoleProp.role_pos_x > position.x:
		move_right()
	else:
		move_left()
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
	return
func do_hit_2():
	hit_name = "qnbx"
	velocity.x = 0
	is_attacking = true
	mr_player.play("qnbx")
	await mr_player.animation_finished
	Skill_1_CD = 19
	is_attacking = false
	return
func do_hit_3():
	hit_name = "qnhb"
	velocity.x = 0
	velocity.y = -5
	is_attacking = true
	mr_player.play("qnhb")
	await mr_player.animation_finished
	Skill_2_CD = 16
	is_attacking = false
	return
func do_hit_4():
	hit_name = "htsl"
	velocity.x = 0
	is_attacking = true
	mr_player.play("htsl")
	await mr_player.animation_finished
	Skill_3_CD = 12
	is_attacking = false
	return
func call_m6_bullet():
	var fz
	var dir = self.MonsterDirection
	if dir:
		fz = Global.CallFlyBullet(self.bullet,"Monster6Bullet",1,Vector2(position.x + 100,position.y),1000,-3400,"hit1",self.objattackDic["hit1"])
		fz.animated_sprite_2d.flip_v = true
	else:
		fz = Global.CallFlyBullet(self.bullet,"Monster6Bullet",1,Vector2(position.x - 100,position.y),1000,3400,"hit1",self.objattackDic["hit1"])
		fz.animated_sprite_2d.flip_v = false
func CallBFX():
	var PositionList = [Vector2(-182,65),Vector2(-91,65),Vector2(0,65),Vector2(91,65),Vector2(182,65)]
	var GetPo = []
	if RoleProp.baseroleprop.Level >= 21:
		for i in PositionList:
			GetPo.push_back(i + RoleProp.role_pos)
		await get_tree().create_timer(1.6,false).timeout
		for i in GetPo:
			Global.add_Bullet("Monster6Bullet3",self.bullet,false,1,i,"qnbx",self.objattackDic["qnbx"])
	else:
		await get_tree().create_timer(1.2,false).timeout
		for i in PositionList:
			Global.add_Bullet("Monster6Bullet3",self.bullet,false,1,i + position,"qnbx",self.objattackDic["qnbx"])
func m6_hb_effect_2():
	var dir = self.MonsterDirection
	var position_x = [self.position.x,self.position.x - 110,self.position.x + 110 ,self.position.x - 290
	,self.position.x + 290,self.position.x - 400,self.position.x + 400,self.position.x - 510,self.position.x + 510]
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[0],self.position.y),"qnhb",self.objattackDic["qnhb"])
	await get_tree().create_timer(0.2).timeout
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[1],self.position.y),"qnhb",self.objattackDic["qnhb"])
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[2],self.position.y),"qnhb",self.objattackDic["qnhb"])
	await get_tree().create_timer(0.2).timeout
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[3],self.position.y),"qnhb",self.objattackDic["qnhb"])
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[4],self.position.y),"qnhb",self.objattackDic["qnhb"])
	await get_tree().create_timer(0.2).timeout
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[5],self.position.y),"qnhb",self.objattackDic["qnhb"])
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[6],self.position.y),"qnhb",self.objattackDic["qnhb"])
	await get_tree().create_timer(0.2).timeout
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[7],self.position.y),"qnhb",self.objattackDic["qnhb"])
	Global.add_Bullet("qnhb_2",self.bullet,dir,1.2,Vector2(position_x[8],self.position.y),"qnhb",self.objattackDic["qnhb"])
func m6_hb_effect_3():
	var dir = self.MonsterDirection
	if dir:
		Global.add_Bullet("htsl",self.bullet,dir,2,Vector2(RoleProp.role_pos_x,self.position.y),"htsl",self.objattackDic["htsl"])
	else:
		Global.add_Bullet("htsl",self.bullet,dir,1,Vector2(RoleProp.role_pos_x,self.position.y),"htsl",self.objattackDic["htsl"])
