extends BaseMonster
class_name Monster141
var WHSCount: int = 0
func monster_141():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "牛魔王·魂"
	self.attack_in = 90
	self.level = 55
	self.SHp = 500000
	self.Hp = self.SHp
	self.def = 300
	self.mdef = 300
	self.crit = 30
	self.miss = 20
	self.lucky = 20
	self.Htarget = 25
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 130
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 500
	self.ebol = 0
	self.objattackDic["hit1"] = {
		"power": 300,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 0,
	}
	self.objattackDic["hit2"] = {
		"power": 1500,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "real",
			"DeBuff": true,
			"CanRemove":false,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 400,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "DefeReduce",
			"AddTime": 20,
			"ReduceInterval": 0,
			"value": 0.5,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 1000,
		"hurtBack":[0,0],
		"attackKind": "physics",
		"HitProtect": 0,
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
		}
	}
	self.objattackDic["hit5"] = {
		"power": 300,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 0,
	}
	self.objattackDic["hit6"] = {
		"power": 300,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 0,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "nmwdnhzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 0.1
	self.fall_stone = [
			{
				"name": "nmwjh",
				"value": 1
			},
	]		
func _ready() -> void:
	super._ready()
	monster_141()
	Skill_1_CD = randi_range(3,4)
	Skill_2_CD = 10
	Skill_3_CD = 5
	Skill_4_CD = 12
	Skill_5_CD = 15
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	WHSCount += 1
	if WHSCount % 600 == 0:
		var bullet = Global.add_Bullet("Monster141Bullet4",self,true,1,Vector2(0,-30),"hit6",self.objattackDic["hit6"])
		bullet.scale = Vector2(2,2)
		
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_2_CD <= 0:
					do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_1_CD <= 0:
						do_hit_1()
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
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 15
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 20
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 15
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func state_hurt():
	is_jgz = false
	if hd > 0:
		is_be_attacking = false
		return
	if randi_range(0,100) <= 10:
		is_be_attacking = true
		hit_name = "hit5"
		mr_player.play("hit5")
		await mr_player.animation_finished
		is_be_attacking = false
		return
	if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
		is_be_attacking = true
		velocity.x = 0
		if is_quiescent or is_bt:
			pass
		else:
			be_hit_back(get_target)
		if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
			mr_player.play("hurt")
			await mr_player.animation_finished
		is_be_attacking = false
func CallBullet_1():
	for i in range(8):
		var Bullet
		var Position = Vector2(position.x + randi_range(-450,500),-300)
		Bullet = Global.add_Bullet("Monster141Bullet3",self.bullet,false,0.15,Position,"hit3",self.objattackDic["hit3"])
		var lasthp = (float(SHp) - float(Hp)) / float(SHp)
		var scalevalue = float(1 + lasthp)

		Bullet.scale = Vector2(scalevalue,scalevalue)
		Bullet.look_at(get_Player.position)
		await get_tree().create_timer(0.5,false).timeout
func CallBullet_2():
	var Dis = int(Global.GetDisBetweem(self,RoleProp.SourcePlayer))
	if Dis < attackRange:
		return
	var bb
	if self.MonsterDirection:
		bb = Global.add_Bullet("Monster141Bullet2",self.bullet,false,2,Vector2(20,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		bb = Global.add_Bullet("Monster141Bullet2",self.bullet,false,2,Vector2(-20,0) + position,"hit1",self.objattackDic["hit1"])
	bb.look_at(get_Player.position)
func CallBullet_3():
	var PositionList = [
		Vector2(-300 + position.x,370),Vector2(-200 + position.x,370),Vector2(-100 + position.x,370),
		Vector2(0 + position.x,370),Vector2(100 + position.x,370),Vector2(200 + position.x,370),
		Vector2(300 + position.x,370),
	]
	for i in PositionList:
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,i,"hit2",self.objattackDic["hit2"])	
func CallBullet_4():
	Global.add_Bullet("Monster141Bullet1",self.bullet,false,1,Vector2(position.x - 1000,450),"hit4",self.objattackDic["hit4"])	
	Global.add_Bullet("Monster141Bullet1",self.bullet,true,1,Vector2(position.x + 1000,450),"hit4",self.objattackDic["hit4"])	
	
