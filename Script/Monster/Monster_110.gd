extends BaseMonster
class_name Monster110
var Aex
var IsRush: bool

func monster_110():
	self.rush_speed = 500
	self.is_boss = true
	self.my_mr_name = "青牛精"
	self.attack_in = 90
	self.level = 50
	self.SHp = 300000
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
	self.attackRange = 235
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 300
	self.fall_coin = 335
	self.objattackDic["hit1"] = {
		"power": 300,
		"hurtBack":[-5,-9],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 400,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.4,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 800,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 1,
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
			"name": "qljzzs",
			"value": 1
		},
		{
			"name": "plpzzs",
			"value": 1
		},
		{
			"name": "ylkzzs",
			"value": 1
		},
		{
			"name": "jljzzs",
			"value": 1
		},
		{
			"name": "tljzzs",
			"value": 1
		},
	]
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_110()
	Skill_1_CD = randi_range(2,5)
	Skill_2_CD = randi_range(4,6)
func Monster_Intelligence():
	if IsRush:
		if MonsterDirection:
			velocity.x = 600
		else:
			velocity.x = -600
		return
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
				if abs(position.x - RoleProp.role_pos_x) <= 360:
					if Skill_1_CD <= 0:
						do_hit_1()
			else:
				stop_move()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_1_CD <= 0:
					do_hit_1()
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
	Skill_2_CD = randi_range(15,17)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallAex():
	var pp = Vector2(self.position.x,self.position.y)
	var tween = get_tree().create_tween()
	Aex = Global.add_Bullet("Monster110Bullet",bullet,false,1,pp,"hit2",self.objattackDic["hit2"])
	tween.tween_property(Aex,"position",get_Player.position,0.5)
	await get_tree().create_timer(2.5,false).timeout
	#return_()
func return_():
	if Aex != null:
		var tween = get_tree().create_tween()
		var pp = Vector2(self.position.x,self.position.y)
		tween.tween_property(Aex,"position",pp,0.3)
		await get_tree().create_timer(0.28,false).timeout	
		Aex.queue_free()
func call_gc():
	var gc: MonsterBullet
	var PositionList: Array[Vector2] = []
	if MonsterDirection:
		PositionList = [Vector2(40,55),Vector2(140,55),Vector2(240,55),Vector2(340,55),Vector2(440,55)]
	else:
		PositionList = [Vector2(-40,55),Vector2(-140,55),Vector2(-240,55),Vector2(-340,55),Vector2(-440,55)]
	for i in PositionList:
		gc = Global.add_Bullet("Monster32Bullet",self.bullet,MonsterDirection,1,i + position,"hit1",self.objattackDic["hit1"])
		gc.scale = Vector2(1.2,1)
		await get_tree().create_timer(0.2,false).timeout
func Begin():
	IsRush = true
func End():
	IsRush = false
