extends BaseMonster
class_name Monster42
#3mzh：107,7,lxhjq 590,-5.5
func Monster_42():
	self.rush_speed = 900
	self.is_boss = true
	self.my_mr_name = "战神刑天"
	self.attack_in = 0
	self.level = RoleProp.baseroleprop.Level + 4
	self.SHp = 500000 + RoleProp.roleprop.SHp * 75
	self.Hp = self.SHp
	self.def = RoleProp.roleprop.Def
	self.mdef = RoleProp.roleprop.Mdef
	self.crit = RoleProp.roleprop.Crit
	self.miss = RoleProp.roleprop.Miss
	self.lucky = RoleProp.roleprop.Lucky
	self.Htarget = RoleProp.roleprop.Htarget * 2
	self.Toughness = 0
	self.ar = RoleProp.roleprop.ar
	self.sp = RoleProp.roleprop.sp
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 550
	self.attackRange = 225
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = self.SHp * 0.002
	self.add_exp = 5000
	self.fall_coin = 5000
	self.objattackDic["hit1"] = {
		"power": int(800 + RoleProp.roleprop.power),
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"HitProtect": 20,
	}
	self.objattackDic["mykl"] = {
		"power": int(350 + RoleProp.roleprop.power * 0.35),
		"hurtBack":[-4,-12],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["xmhd"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic",
	}
	self.objattackDic["sfjm"] = {
		"power": int(800 + RoleProp.roleprop.power * 0.3),
		"hurtBack":[-4,-5],
		"attackKind": "magic",
		"HitProtect": 4,
		"addeffect":{
			"Name": "stun",
			"DeBuff": true,
			"CanAdd":false,
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xtzy",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	Monster_42()
func Monster_Intelligence():
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
			if abs(position.x - RoleProp.role_pos_x) <= 295:
				if Skill_3_CD <= 0:
					if randf_range(0,1) < 0.8:
						do_hit_3()
					else:
						attack_target()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 30 == 0:
					if randf_range(0,1) < 0.7:
						attack_target()
					else:
						have_target()
				else:
					have_target()
			elif abs(position.x - RoleProp.role_pos_x) <= 500:
				if Skill_3_CD <= 0:
					if randf_range(0,1) < 0.8:
						do_hit_3()
					else:
						attack_target()
				elif count % 30 == 0:
					if randf_range(0,1) < 0.7:
						attack_target()
					else:
						have_target()
				else:
					have_target()
			elif abs(position.x - RoleProp.role_pos_x) <= 800:
				if Skill_1_CD <= 0:
					do_hit_1()
				else:
					have_target()
			else:
				have_target()
func stop_move():
	velocity.x = 0
	mr_player.play("wait")
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 6 + randi_range(0,4)
	hit_name = "xmhd"
	velocity.x = 0
	is_attacking = true
	mr_player.play("xmhd")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 15
	velocity.x = 0
	hit_name = "mykl"
	is_attacking = true
	mr_player.play("mykl")
	await mr_player.animation_finished
	is_attacking = false
	
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 20
	velocity.x = 0
	hit_name = "sfjm"
	is_attacking = true
	mr_player.play("sfjm")
	await mr_player.animation_finished
	is_attacking = false
func normal_state():
	if is_be_attacking:
		return
	if ran_num < 30:
		stop_move()
	elif ran_num >= 30 and ran_num <= 65:
		move_left()
	else:
		move_right()
func call_sfjmFire():
	var FirePosition = [Vector2(self.position.x - 180,self.position.y - 20),Vector2(self.position.x - 360,self.position.y - 20),
	Vector2(self.position.x,self.position.y - 20),Vector2(self.position.x + 180,self.position.y - 20),
	Vector2(self.position.x + 360,self.position.y - 20)]
	for i in range(5):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,2,FirePosition[i],"sfjm",self.objattackDic["sfjm"])
func call_xmhd():
	if not self.MonsterDirection:
		var hd = Global.add_SpecialEffect(self,Vector2(-50,-5),"Monster42Bullet_1",Vector2(0.5,0.9),false,0.9)
		var xw = Global.add_SpecialEffect(self,Vector2(-50,-5),"Monster42Bullet_2",Vector2(0.5,0.9),false,0.9)
		hd.set_rotation_degrees(-20)
		xw.set_rotation_degrees(-20)
	else:
		var hd = Global.add_SpecialEffect(self,Vector2(50,-5),"Monster42Bullet_1",Vector2(0.5,0.9),false,0.9)
		var xw = Global.add_SpecialEffect(self,Vector2(50,-5),"Monster42Bullet_2",Vector2(0.5,0.9),false,0.9)
		hd.set_rotation_degrees(20)
		xw.set_rotation_degrees(20)
	Global.AddBuff(get_Player.buff,{
			"Name": "speed_down",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0.5,
			"AttackKind": "magic",
			"CanAdd":false,
		})
func no_rush():
	velocity.x = 0
