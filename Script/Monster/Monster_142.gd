extends BaseMonster
class_name Monster142
var IsSky = false
var RoundList = []
func monster_142():
	self.rush_speed = 400
	self.is_boss = true
	self.my_mr_name = "遮迦越罗"
	self.attack_in = 90
	self.level = 55
	self.SHp = 500000
	self.Hp = self.SHp
	self.def = 400
	self.mdef = 400
	self.crit = 30
	self.miss = 20
	self.lucky = 20
	self.Htarget = 25
	self.Toughness = 0
	self.ar = 60
	self.sp = 60
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 160
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 500
	self.ebol = 0
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 0,
	}
	self.objattackDic["hit2"] = {
		"power": 1500,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 0,
	}
	self.objattackDic["hit3"] = {
		"power": 650,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 0,
		"addeffect":{
			"Name": "DefeReduce",
			"AddTime": 20,
			"ReduceInterval": 0,
			"value": 1,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove":false,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 600,
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
		"power": 1500,
		"hurtBack":[0,0],
		"attackKind": "magic",
		"HitProtect": 0,
	}
	self.objattackDic["hit6"] = {
		"power": 600,
		"hurtBack":[0,0],
		"attackKind": "real",
		"HitProtect": 0,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "zlwdahsp3",
			"value": 1
		}
	]
	self.fall_stone_pro = 0.2
	self.fall_stone = [
		{
			"name": "zlwdahzzs",
			"value": 1
		}
	]		
func _ready() -> void:
	super._ready()
	monster_142()
	Skill_1_CD = 2
	Skill_2_CD = 5
	Skill_3_CD = 7
	Skill_4_CD = 9
	Skill_5_CD = 11
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if IsSky == true:
		gravity = 0
		velocity.y = 0
	else:
		gravity = -980.0
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_4_CD <= 0:
					do_hit_4()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_3_CD <= 0:
					do_hit_3()
				if Skill_5_CD <= 0:
					do_hit_5()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_3_CD <= 0:
					do_hit_3()
				if Skill_4_CD <= 0:
					do_hit_4()
				if Skill_5_CD <= 0:
					do_hit_5()
	
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 2
	velocity.x = 0
	hit_name = "hit1"
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 15
	velocity.x = 0
	hit_name = "hit2"
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 17
	velocity.x = 0
	hit_name = "hit3"
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_4():
	super.to_hero()
	Skill_4_CD = 13
	velocity.x = 0
	hit_name = "hit6"
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()	
func do_hit_5():
	super.to_hero()
	Skill_5_CD = 20
	velocity.x = 0
	hit_name = "hit5"
	is_attacking = true
	mr_player.play("hit5")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()		
func TweenToTop():
	ShouldInSky = true
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(0,-250) + position,0.2)
func TweenToTop2():
	ShouldInSky = true
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(position.x,100),1)
func drop():
	ShouldInSky = false
func CallBullet1():
	var Round = Global.add_Bullet("Monster142Bullet1",self.bullet,false,1,position,"hit1",self.objattackDic["hit1"])
	var tween = create_tween()
	tween.tween_property(Round,"position",RoleProp.SourcePlayer.position,0.5)
func CallBullet3():
	var PositionList = [Vector2(-400 + position.x,470),
	Vector2(-300 + position.x,470),Vector2(-200 + position.x,470),
	Vector2(-100 + position.x,470),Vector2(position.x,470),Vector2(100 + position.x,470),
	Vector2(200 + position.x,470),Vector2(300 + position.x,470),Vector2(400 + position.x,470)]
	for i in PositionList:
		Global.add_Bullet("Monster56Bullet",self.bullet,false,1,i,"hit3",self.objattackDic["hit3"])
func CallBullet4():
	var MaxCount: int = 10
	var Num: int = 0
	var tween = create_tween().set_parallel(true)
	var PositionList = []
	while Num < MaxCount:
		var NewRotation = 360 / MaxCount
		NewRotation = NewRotation * Num
		var stabPosition = Vector2(self.position.x + sin(float(NewRotation) * PI / 180) * 150,self.position.y - 15 - cos(float(NewRotation) * PI / 180) * 150)
		PositionList.push_back(stabPosition)
		Num += 1
	if not MonsterDirection:
		PositionList.reverse()
	for i in PositionList:
		var stab = Global.add_Bullet("Monster142Bullet2",self.bullet,false,1,i,"hit4",self.objattackDic["hit4"])
		await get_tree().create_timer(0.2,false).timeout
func CallBullet5():
	var PositionList = [Vector2(-400 + position.x,450),
	Vector2(-300 + position.x,450),Vector2(-200 + position.x,450),
	Vector2(-100 + position.x,450),Vector2(position.x,450),Vector2(100 + position.x,450),
	Vector2(200 + position.x,450),Vector2(300 + position.x,450),Vector2(400 + position.x,450),Vector2(500 + position.x,450)]
	randomize()
	var CountTime = PositionList.size() * 0.1
	PositionList.shuffle()
	for i in PositionList:
		var Round = Global.add_Bullet("Monster55Bullet",self.bullet,false,1,position,"hit5",self.objattackDic["hit5"])
		RoundList.push_back(Round)
		var tween = create_tween()
		tween.tween_property(Round,"position",i,1)
		await get_tree().create_timer(0.1,false).timeout
	await get_tree().create_timer(2,false).timeout
	for i in RoundList:
		if i != null:
			var tween = create_tween()
			tween.tween_property(i,"position",self.position,1)
	await get_tree().create_timer(CountTime,false).timeout		
	for i in RoundList:
		i.queue_free()
	RoundList.clear()
