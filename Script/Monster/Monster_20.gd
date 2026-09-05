extends BaseMonster
class_name Monster20
#有鲨鱼静止为 -80 ，0
var is_firstLowHp = false
var my_shark
func monster_20():
	self.is_boss = true
	self.my_mr_name = "鲨魔王"
	self.attack_in = 60
	self.level = 25
	self.SHp = 10000
	self.Hp = self.SHp
	self.def = 100
	self.mdef = 150
	self.crit = 15
	self.miss = 5
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 450
	self.attackRange = 145
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-5,-9],
		"attackKind": "physics"
	}
	self.objattackDic["sxks"] = {
		"power": 245,
		"hurtBack":[-5,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 5,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
		}
	}	
	self.objattackDic["sxks_2"] = {
		"power": 155,
		"hurtBack":[-7,-15],
		"attackKind": "real",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 5,
			"DeBuff": true,
			"CanAdd":true,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
		}
	}	
	self.objattackDic["spzd"] = {
		"power": 400,
		"hurtBack":[-15,-15],
		"attackKind": "real",
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"CanAdd":false,
			"DeBuff": true,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "qlp",
			"value": 0
		},
		{
			"name": "zqj",
			"value": 0
		},
		{
			"name": "ttj",
			"value": 0
		}
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_20()
	Skill_1_CD = 0
	Skill_2_CD = 0
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if self.Hp <= 0:
		if my_shark != null:
			my_shark.Hp = -100
			my_shark.state = my_shark.State.Death	
func Monster_Intelligence():
	#changeHit()
	if self.Hp <= 0:
		if my_shark != null:
			my_shark.Hp = -100
			my_shark.state = my_shark.State.Death	
	if not is_firstLowHp:
		if Low_Hp():
			if self.MonsterDirection:
				my_shark = Global.Create_Monster(19,get_parent(),Vector2(self.position.x,self.position.y - 30))
			else:
				my_shark = Global.Create_Monster(19,get_parent(),Vector2(self.position.x,self.position.y - 30))
			is_firstLowHp = true
#	if not is_on_floor():
#		if not is_be_attacking:
#			stop_move()
#		return
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_2_CD <= 0:
					do_hit_3()
				elif abs(position.x - RoleProp.role_pos_x) <= 550:
					if Skill_1_CD <= 0:
						do_hit_2()
			else:
				if Skill_2_CD <= 0:
					do_hit_3()
				elif Skill_1_CD <= 0:
					do_hit_2()
				else:
					if count % 90 == 0:
						if ran_num <= attackDesire:
							attack_target()
					else:
						stop_move()
func attack_target():
	have_target()
	hit_name = "hit1"
	if not is_Fly:
		velocity.x = 0
	is_attacking = true
	if not Low_Hp():
		mr_player.play("hit1_1")
	else:
		mr_player.play("hit1_2")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	Skill_1_CD = 20
	hit_name = "sxks"
	velocity.x = 0
	is_attacking = true
	if not Low_Hp():
		mr_player.play("sxks_1")
	else:
		mr_player.play("sxks_2")
	await mr_player.animation_finished
	is_attacking = false
	
func do_hit_3():
	Skill_2_CD = 15
	velocity.x = 0
	hit_name = "spzd"
	is_attacking = true
	if not Low_Hp():
		mr_player.play("spzd_1")
	else:
		mr_player.play("spzd_2")
	await mr_player.animation_finished
	is_attacking = false
func call_pp():
	var first_position = Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y - 110)
	var par = Global.add_SpecialEffect(get_parent().get_parent(),Vector2(first_position),"Monster20Bullet_1",Vector2(1,1),false,1)
	var second_position = par.position + Vector2(0,70)
	await get_tree().create_timer(0.8,false).timeout
	Global.add_Bullet("Monster20Bullet_1",self.bullet,self.MonsterDirection,1,second_position,"spzd",self.objattackDic["spzd"])
func call_shark():
	if self.MonsterDirection:
		var shark = Global.CallFlyBullet(self.bullet,"Monster_20Bullet",1,Vector2(position.x ,position.y - 20),4000,700,"sxks_2",self.objattackDic["sxks_2"])
		shark.animated_sprite_2d.flip_h = false
		var shark_1 = Global.CallFlyBullet(self.bullet,"Monster_20Bullet",1,Vector2(position.x ,position.y - 20),4000,-700,"sxks_2",self.objattackDic["sxks_2"])
		shark_1.animated_sprite_2d.flip_h = true
	else:
		var shark = Global.CallFlyBullet(self.bullet,"Monster_20Bullet",1,Vector2(position.x ,position.y - 20),4000,-700,"sxks_2",self.objattackDic["sxks_2"])
		shark.animated_sprite_2d.flip_h = true
		var shark_1 = Global.CallFlyBullet(self.bullet,"Monster_20Bullet",1,Vector2(position.x ,position.y - 20),4000,700,"sxks_2",self.objattackDic["sxks_2"])
		shark_1.animated_sprite_2d.flip_h = false
	
func Low_Hp():
	return self.Hp <= self.SHp * 0.7
func move_left():
	monster_dir.scale.x = 1
	base_damage_box.scale.x = 1
	velocity.x = -speed * 10
	if not Low_Hp():
		mr_player.play("walk_1")
	else:
		mr_player.play("walk_2")
func move_right():
	monster_dir.scale.x = -1
	base_damage_box.scale.x = -1
	velocity.x = speed * 10
	if not Low_Hp():
		mr_player.play("walk_1")
	else:
		mr_player.play("walk_2")
func stop_move():
	velocity.x = 0
	if not Low_Hp():
		mr_player.play("wait_1")
	else:
		mr_player.play("wait_2")
	await mr_player.animation_finished
func state_hurt():
	if get_target.HitDic["hurtBack"][0] != 0 or get_target.HitDic["hurtBack"][1] != 0:
		is_be_attacking = true
		velocity.x = 0
		if not is_quiescent:
			super.be_hit_back(self.get_target)
			if not Low_Hp():
				mr_player.play("hurt_1")
			else:
				mr_player.play("hurt_2")
			await mr_player.animation_finished
			is_be_attacking = false

func changeHit():
	if not Low_Hp():
		self.objattackDic["hit1"] = {
			"power": 245,
			"hurtBack":[-5,-9],
			"attackKind": "real"
		}
		self.objattackDic["sxks"] = {
			"power": 50,
			"hurtBack":[-5,-15],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 4,
				"ReduceInterval": 0.5,
				"value": 15,
				"AttackKind": "real",
			}
		}	
		self.objattackDic["sxks_2"] = {
			"power": 70,
			"hurtBack":[-7,-15],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 4,
				"ReduceInterval": 0.5,
				"value": 15,
				"AttackKind": "real",
			}
		}	
		self.objattackDic["spzd"] = {
			"power": 500,
			"hurtBack":[-15,-15],
			"attackKind": "real",
			"addeffect":{
				"Name": "stun",
				"AddTime": 3,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
			}
		}
	else:
		self.objattackDic["hit1"] = {
			"power": 105,
			"hurtBack":[-5,-9],
			"attackKind": "physics"
		}
		self.objattackDic["sxks"] = {
			"power": 300,
			"hurtBack":[-5,-15],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 4,
				"ReduceInterval": 0.5,
				"value": 10,
				"AttackKind": "real",
			}
		}	
		self.objattackDic["sxks_2"] = {
			"power": 300,
			"hurtBack":[-7,-15],
			"attackKind": "real",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 4,
				"ReduceInterval": 0.5,
				"value": 10,
				"AttackKind": "real",
			}
		}	
		self.objattackDic["spzd"] = {
			"power": 210,
			"hurtBack":[-15,-15],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"AddTime": 3,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
			}
		}
