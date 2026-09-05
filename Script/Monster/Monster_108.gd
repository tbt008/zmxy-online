extends BaseMonster
class_name Monster108
var IsCombo: bool
func monster_108():
	self.is_boss = true
	self.my_mr_name = "金角大王"
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
		"power": 500,
		"hurtBack":[-5,-9],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 520,
		"hurtBack":[-2,-1],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.objattackDic["hit3"] = {
		"power": int(1000 + RoleProp.roleprop.SHp * 0.35),
		"hurtBack":[-6,-1],
		"attackKind": "real",
		"HitProtect": 5,
	}
	self.objattackDic["hit4"] = {
		"power": 450,
		"hurtBack":[-2,-9],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
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
			"name": "yjpyasp",
			"value": 1
		},
	]
	self.fall_stone_pro = 0.0
	self.fall_stone = [
		{
			"name": "ziyanyujin",
			"value": randi_range(1,5)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_108()
	Skill_1_CD = randi_range(4,7)
	Skill_2_CD = randi_range(6,8)
	Skill_3_CD = randi_range(10,15)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
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
				if Skill_2_CD <= 0:
					do_hit_2()
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
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	IsCombo = true
	super.to_hero()
	Skill_1_CD = 7
	hit_name = "hit2"
	velocity.x = 0
	velocity.y = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 15
	hit_name = "hit3"
	velocity.x = 0
	velocity.y = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 10
	hit_name = "hit4"
	velocity.x = 0
	velocity.y = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func TweenToPalyer():
	var tween = create_tween()
	tween.tween_property(self,"position",get_Player.position,0.2)
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(position.x,-100),0.4)
func ToDrop():
	velocity.y = 0
	#gravity = -980.0
	velocity.y = 1600
	pass
func NoCombo():
	ShouldInSky = false
func _on_hurt_box_area_entered(area: Area2D) -> void:
	ShouldInSky = false
	super._on_hurt_box_area_entered(area)
func movetoplayer():
	self.position.x = get_Player.position.x
func CallBullet1():
	var PositionList = [{}]
	if self.MonsterDirection:
		PositionList = [{"position":Vector2(50,0),"Scale":Vector2(0.5,0.5)},{"position":Vector2(90,0),"Scale":Vector2(0.7,0.7)},
		{"position":Vector2(130,0),"Scale":Vector2(1,1)}]
	else:
		PositionList = [{"position":Vector2(-50,0),"Scale":Vector2(0.5,0.5)},{"position":Vector2(-90,0),"Scale":Vector2(0.7,0.7)},
		{"position":Vector2(-130,0),"Scale":Vector2(1,1)}]
	for i in PositionList:
		var Bullet = Global.add_Bullet("Monster108Bullet2",self,MonsterDirection,1,i["position"],"hit4",self.objattackDic["hit4"])
		Bullet.scale = i["Scale"]
		await get_tree().create_timer(0.1,false).timeout
func CallBullet2():
	var Bullet
	if self.MonsterDirection:
		Bullet = Global.add_Bullet("Monster108Bullet1",self.bullet,false,1,Vector2(100,25) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullet = Global.add_Bullet("Monster108Bullet1",self.bullet,false,1,Vector2(-100,25) + position,"hit1",self.objattackDic["hit1"])
	Bullet.look_at(get_Player.position)
func CheckPlayer():
	if self.position.x > RoleProp.role_pos_x:
		if Global.get_player.PlayerDir:
			if not MonsterDirection:
				move_playerto_boss(0.5)
	else:
		if not Global.get_player.PlayerDir:
			if MonsterDirection:
				move_playerto_boss(0.5)
