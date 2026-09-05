extends BaseMonster
class_name Monster83
func monster_83():
	self.is_boss = true
	self.my_mr_name = "增长天王"
	self.attack_in = 10
	self.level = 35
	self.SHp = 85000
	self.Hp = self.SHp
	self.def = 170
	self.mdef = 170
	self.crit = 20
	self.miss = 22
	self.lucky = 0
	self.Htarget = 18
	self.Toughness = 0
	self.ar = 10
	self.sp = 10
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 600
	self.attackRange = 175
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Ice",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit2"] = {
		"power": 150,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 12,
	}
	self.objattackDic["hit3"] = {
		"power": 325,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Ice",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit4"] = {
		"power": 325,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 9,
		"addeffect":{
			"Name": "Ice",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "qybd",
			"value": 0
		},
		{
			"name": "qyfp",
			"value": 0
		},
		{
			"name": "qysq",
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
	Skill_1_CD = 5
	Skill_2_CD = 0
	Skill_3_CD = 0
	super._ready()
	monster_83()
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
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 550:
					if Skill_3_CD <= 0:
						do_hit_3()
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
	Skill_1_CD = randi_range(12,14)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(16,18)
	velocity.x = 0
	hit_name = "hit4"
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(14,16)
	velocity.x = 0
	hit_name = "hit4"
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(0,-150) + position,1.5)
	pass

func CallArrow1():
	if get_Player == null:
		return
	var PositionList = [Vector2(0,-150),Vector2(-70,-150),Vector2(70,-150),Vector2(140,-150),Vector2(-140,-150),Vector2(210,-150),Vector2(-210,-150)]
	randomize()
	PositionList.shuffle()
	for i in PositionList:
		var desired_angle
		var Arrow = Global.add_Bullet("Monster83Bullet",self.bullet,false,2,i + position,"hit4",self.objattackDic["hit4"])
		Arrow.scale = Vector2(0.7,0.7)
		Arrow.modulate = Color(1,1,1,0)
		Arrow.look_at(get_Player.position)
		var tween = get_tree().create_tween().set_parallel(true)
		tween.tween_property(Arrow,"modulate",Color(1,1,1,1),1)
		await get_tree().create_timer(0.3,false).timeout

func CallArrow2():
	if get_Player == null:
		return
	var desired_angle = 90
	var PositionList = []
	if MonsterDirection:
		PositionList = [Vector2(0,-100),Vector2(-100,-50),Vector2(100,-0),Vector2(200,50),Vector2(-200,100)]
	else:
		PositionList = [Vector2(0,-100),Vector2(-100,-50),Vector2(100,-0),Vector2(200,50),Vector2(-200,100)]
	randomize()
	PositionList.shuffle()
	for i in PositionList:
		var Arrow = Global.add_Bullet("Monster83Bullet",self.bullet,MonsterDirection,1,i + position,"hit2",self.objattackDic["hit2"])
		Arrow.scale = Vector2(0.9,0.9)
		Arrow.modulate = Color(1,1,1,0)
		var po = Arrow.position - position
		var tween = get_tree().create_tween().set_parallel(true)
		if MonsterDirection:
			desired_angle =  - desired_angle
		tween.tween_property(Arrow,"rotation",desired_angle,1)
		tween.tween_property(Arrow,"modulate",Color(1,1,1,1),1)
		await get_tree().create_timer(randf_range(0.2,0.4),false).timeout

func CallArrow3():
	if get_Player == null:
		return
	var PositionList = [Vector2(0,-700),Vector2(-30,-800),Vector2(30,-900),Vector2(60,-700),Vector2(-60,-700),Vector2(90,-900),Vector2(-90,-800),
	Vector2(-120,-800),Vector2(120,-700),Vector2(150,-800),Vector2(-150,-800),Vector2(0,-700),Vector2(-180,-800),Vector2(180,-900),Vector2(210,-700),Vector2(-210,-700),
	Vector2(240,-900),Vector2(-240,-800),Vector2(-270,-800),Vector2(270,-700),Vector2(300,-800),Vector2(-300,-800)]
	randomize()
	PositionList.shuffle()
	for i in PositionList:
		var Arrow = Global.add_Bullet("Monster83Bullet",self.bullet,false,3.5,i + position,"hit3",self.objattackDic["hit3"])
		Arrow.scale = Vector2(1,1)
		Arrow.rotation_degrees = 90
		await get_tree().create_timer(0.1,false).timeout
		
func _on_hit_box_area_entered(area: Area2D) -> void:
	is_enter_hitBox = true
	var rro = area.get_parent().get_parent() as BaseHero
	if objattackDic != null and hit_name != null:
		if objattackDic[hit_name].has("addeffect"):
			if objattackDic[hit_name]["addeffect"].size() != 0:
				if randi_range(0,100) < 70:
					Global.AddBuff(rro.buff,objattackDic[hit_name]["addeffect"])
	
