extends BaseMonster
class_name Monster91
var IsFs: bool
var Fs: Monster91
var CallCount: int = 0
var Bl: float = 1
func monster_91():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "袁洪"
	self.attack_in = 90
	self.level = 35
	self.SHp = 130000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 10
	self.miss = 0
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 0
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 400
	self.objattackDic["hit1"] = {
		"power": 330,
		"hurtBack":[-8,-12],
		"attackKind": "physics",
		"HitProtect": 30,
	}
	self.objattackDic["hit2"] = {
		"power": int(350 * Bl),
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.4,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit3"] = {
		"power": 350,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 3,
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 0,
		"hurtBack":[-30,-50],
		"attackKind": "real",
		"HitProtect": 50,
	}
	self.objattackDic["hit5"] = {
		"power": int(RoleProp.roleprop.SHp * 10),
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 30,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove": false,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "zjbtgzzs",
			"value": 1
		},
		{
			"name": "smz",
			"value": 0
		},
		{
			"name": "jllm",
			"value": 0
		},
		{
			"name": "wsjgzzs",
			"value": 1
		},
		{
			"name": "blmqzzs",
			"value": 1
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
	monster_91()
	Skill_1_CD = randi_range(3,4)
	Skill_3_CD = 18
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,12)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
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
	Skill_3_CD = randi_range(8,12)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	Bl = 1 + float(RoleProp.roleprop.SHp - RoleProp.roleprop.Hp) / float(RoleProp.roleprop.SHp)
	match self.BaseLevel_.current_stage:
		1:
			if position.x <= 0:
				position.x = 50
			if position.x > 1100:
				position.x = 900
		2:
			if position.x <= 0:
				position.x = 50
			if position.x > 2250:
				position.x = 2100
		3:
			if position.x <= 0:
				position.x = 50
			if position.x > 3500:
				position.x = 3400
		4:
			if position.x <= 3500:
				position.x = 3600
			if position.x > 4600:
				position.x = 4500
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if Hp <= SHp * 0.65:
				if not IsFs:
					if Fs == null:
						do_hit_3()
						return
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 500:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if count % 90 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
					else:
						stop_move()
				else:
					stop_move()
func ToToP():
	var Po = Vector2(RoleProp.role_pos_x,100)
	if MonsterDirection:
		Po = Vector2(position.x,100)
	else:
		Po = Vector2(position.x,100)
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",Po,0.5)

func ToDrop():

	if MonsterDirection:
		velocity.x += 1200
	else:
		velocity.x += -1200
	velocity.y += 800
func removeve():
	velocity.x = 0
func ADDBullet2():
	var PositionList
	if MonsterDirection:
		PositionList = Vector2(25,-30)
	else:
		PositionList = Vector2(-25,-30)
	for i in range(randi_range(3,5)):
		Global.add_Bullet("Monster91Bullet2",self.bullet,MonsterDirection,1,PositionList + position,"hit3",self.objattackDic["hit3"])
		await get_tree().create_timer(0.1,false).timeout
func AddBullet():
	var PositionList = []
	if MonsterDirection:
		PositionList = [Vector2(100,75),Vector2(180,75),Vector2(260,75),Vector2(340,75)]
	else:
		PositionList = [Vector2(-100,75),Vector2(-180,75),Vector2(-260,75),Vector2(-340,75)]
	for i in PositionList:
		var lt = Global.add_Bullet("Monster91Bullet1",self.bullet,MonsterDirection,2,i + position,"hit2",self.objattackDic["hit2"])
		lt.scale.y = 1.5
		await get_tree().create_timer(0.1,false).timeout
	pass
func CallSelf():
	if Fs == null:
		Fs = Global.Create_Monster(91,get_parent(),position)
		Fs.IsFs = true
		Fs.my_mr_name = "袁洪·分身"
		Fs.SHp = int(self.SHp * 0.5)
		Fs.Hp = Fs.SHp
		Fs.fall_list = []
		Fs.fall_pro = 0
		
func state_death():
	if not IsFs:
		if Fs != null:
			Fs.Hp = -100
	hit_name = "hit5"
	if add_exp > 0 and RoleProp.baseroleprop.Level < 90:
		if PlayerData.player_data["西天王殿"]:
			if RoleProp.baseroleprop.Level < 90:
				RoleProp.baseroleprop.exp += add_exp
				PlayerData.player_data.玩家当前经验 = RoleProp.baseroleprop.exp
		else:
			if RoleProp.baseroleprop.Level < 40:
				RoleProp.baseroleprop.exp += add_exp
				PlayerData.player_data.玩家当前经验 = RoleProp.baseroleprop.exp
		add_exp = 0
	if fall_coin > 0:
		for i in range(1,4):
			var pp = position + Vector2(randi_range(-15,15),randi_range(-15,15))
			Global.AddAura(get_parent().get_parent().fall_it,pp,fall_coin)
		fall_coin = 0
	velocity.x = 0
	if IsFs:
		mr_player.play("death2")
	else:
		mr_player.play("death")
	if not is_death:
		if PlayerData.player_data.has(my_mr_name):
			var Current = PlayerData.player_data[my_mr_name]
			PlayerData.player_data[my_mr_name] += 1
		is_death = true
		await mr_player.animation_finished
		
