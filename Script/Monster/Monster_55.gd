extends BaseMonster
class_name Monster55
@onready var zlw_special_effect: Node2D = $MonsterDir/ZLWSpecialEffect
var Boss_3: Monster56
var MaxRound: int = 6
var CurrentRound: int = 6:
	set(value):
		CurrentRound = value
		zlw_special_effect.CurrentCount = CurrentRound
var RoundList: Array = []
func monster_55():
	if get_parent().get_parent() is LevelZLDHDGQ:
		self.is_boss = true
		self.my_mr_name = "转轮·圣帝"
		self.attack_in = 10
		self.level = 50
		self.SHp = 300000
		self.Hp = self.SHp
		self.def = 350
		self.mdef = 350
		self.crit = 20
		self.miss = 15
		self.lucky = 15
		self.Htarget = 15
		self.Toughness = 0
		self.ar = 0
		self.sp = 80
		self.Critreduce = 0
		self.speed = 6
		self.mysee = 400
		self.attackRange = 185
		self.attackDesire = 90
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 0
		self.fall_coin = 10
		self.objattackDic["wqml"] = {
			"power": 700,
			"hurtBack":[-6,-1],
			"attackKind": "magic"
		}
		self.objattackDic["zlls"] = {
			"power": 900,
			"hurtBack":[-8,-1],
			"attackKind": "magic"
		}
		self.objattackDic["dylh"] = {
			"power": 2000,
			"hurtBack":[-1,-1],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"AddTime": 3,
				"ReduceInterval": 0,
				"CanAdd":false,
				"DeBuff": true,
				"value": 0,
				"AttackKind": "",
			}
		}
		self.objattackDic["dyml"] = {
			"power": 2077,
			"hurtBack":[-1,-1],
			"attackKind": "magic",
			"addeffect":{
				"Name": "stun",
				"DeBuff": true,
				"AddTime": 3,
				"ReduceInterval": 0,
				"value": 0,
				"AttackKind": "",
			}
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "zlwdahsp1",
				"value": 2
			},
			{
				"name": "zlwdahsp2",
				"value": 2
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = []
		return
	self.is_boss = true
	self.my_mr_name = "转轮·圣帝"
	self.attack_in = 10
	self.level = 30
	self.SHp = 60000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 130
	self.crit = 10
	self.miss = 8
	self.lucky = 15
	self.Htarget = 15
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 6
	self.mysee = 400
	self.attackRange = 185
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 500
	self.add_exp = 1000
	self.fall_coin = 1000
	self.objattackDic["wqml"] = {
		"power": 205,
		"hurtBack":[-6,-1],
		"attackKind": "magic"
	}
	self.objattackDic["zlls"] = {
		"power": 200,
		"hurtBack":[-8,-1],
		"attackKind": "magic"
	}
	self.objattackDic["dylh"] = {
		"power": 600,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"CanAdd":false,
			"DeBuff": true,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["dyml"] = {
		"power": 577,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"DeBuff": true,
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	monster_55()
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 600:
					if Skill_3_CD <= 0:
						do_hit_3()
					else:
						if Skill_1_CD <= 0:
							do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 900:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				if Skill_3_CD <= 0:
					do_hit_3()
				else:
					if Skill_1_CD <= 0:
						if count % 100 == 0:
							do_hit_1()
						else:
							stop_move()
					elif Skill_2_CD <= 0:
						do_hit_2()
					else:
						stop_move()
		
func state_hurt():
	Set_RoundSpeed(1)
	zlw_special_effect.State = false
	super.state_hurt()
func stop_move():
	Set_RoundSpeed(1)
	zlw_special_effect.State = false
	super.stop_move()
func move_left():
	Set_RoundSpeed(1)
	zlw_special_effect.State = true
	super.move_left()
func move_right():
	Set_RoundSpeed(1)
	zlw_special_effect.State = true
	super.move_right()
func state_death():
	Set_RoundSpeed(1)
	zlw_special_effect.State = false
	super.state_death()
func do_hit_1():
	super.to_hero()
	zlw_special_effect.State = true
	Skill_1_CD = 1
	hit_name = "wqml"
	velocity.x = 0
	is_attacking = true
	mr_player.play("wqml")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	zlw_special_effect.State = false
	Skill_2_CD = 15
	velocity.x = 0
	hit_name = "zlls"
	is_attacking = true
	mr_player.play("zlls")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	zlw_special_effect.State = false
	Skill_3_CD = 17
	velocity.x = 0
	hit_name = "dylh"
	is_attacking = true
	mr_player.play("dylh")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func normal_state():
	if is_be_attacking:
		return
	if ran_num < 30:
		stop_move()
	elif ran_num >= 30 and ran_num <= 65:
		move_left()
	else:
		move_right()
func Set_RoundSpeed(value):
	zlw_special_effect.Speed = value
func setposition():
	return Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y)
func CallRound():
	var pp = Vector2(self.position.x,self.position.y)
	var tween = get_tree().create_tween()
	if CurrentRound > 0:	
		tween.set_parallel(false)	
		var Round = Global.add_Bullet("Monster55Bullet",bullet,false,1,pp,"wqml",self.objattackDic["wqml"])
		RoundList.push_back(Round)
		Round.IsThrow = true
		tween.tween_property(Round,"position",setposition(),1.5)
		CurrentRound -= 1
		await get_tree().create_timer(1.5,false).timeout
		Round.IsThrow = false
	else:
		tween.set_parallel(true)
		for i in RoundList:
			tween.tween_property(i,"position",pp,1)
			i.IsThrow = true
		await get_tree().create_timer(1.2,false).timeout
		for i in RoundList:
			i.queue_free()
		RoundList.clear()
		CurrentRound = MaxRound

func CallBullet():
	var pp
	var pp_1
	var zz_1
	var zz_2
	if MonsterDirection:
		pp = Vector2(-60,-10)
		pp_1 = Vector2(75,-28)
		zz_1 = Global.add_Bullet("Monster55Bullet_2",self,false,1,pp,"zlls",self.objattackDic["zlls"])
		zz_2 = Global.add_Bullet("Monster55Bullet_2",self,false,1,pp_1,"zlls",self.objattackDic["zlls"])
		zz_1.scale.x = -1
		zz_2.scale.x = -1
		zz_2.z_index = -1
	else:
		pp = Vector2(60,0)
		pp_1 = Vector2(-55,-25)
		zz_1 = Global.add_Bullet("Monster55Bullet_2",self,false,1,pp,"zlls",self.objattackDic["zlls"])
		zz_2 = Global.add_Bullet("Monster55Bullet_2",self,false,1,pp_1,"zlls",self.objattackDic["zlls"])
		zz_2.z_index = -1

func CallRound_():
	Global.CallFlyBullet(self.bullet,"Monster55Bullet",1,Vector2(position.x,position.y),6500,400,"dyml",self.objattackDic["dyml"])
	Global.CallFlyBullet(self.bullet,"Monster55Bullet",-1,Vector2(position.x,position.y),6500,400,"dyml",self.objattackDic["dyml"])

func CallMonster():
	if get_parent().get_parent() is level21:
		if Boss_3  == null:
			Boss_3  = Global.Create_Monster(56,get_parent(),Vector2(1450,320)) as Monster56
			var BaseLevel_ = get_parent().get_parent() as BaseLevel
	elif get_parent().get_parent() is LevelZLDHDGQ:
		if Boss_3  == null:
			Boss_3  = Global.Create_Monster(56,get_parent(),Vector2(470,320)) as Monster56
			var BaseLevel_ = get_parent().get_parent() as BaseLevel
