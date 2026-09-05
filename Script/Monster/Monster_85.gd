extends BaseMonster
class_name Monster85
@onready var special_effect_1: AnimatedSprite2D = $MonsterDir/SpecialEffect1
var TotalHit: int
var IsHD: bool
var HitCount: int = 0
func monster_85():
	self.is_boss = true
	self.my_mr_name = "多闻天王"
	self.attack_in = 10
	self.level = 35
	self.SHp = 100000
	self.Hp = self.SHp
	self.def = 170
	self.mdef = 170
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 18
	self.Toughness = 0
	self.ar = 10
	self.sp = 10
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 300
	self.attackRange = 165
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 6,
		"addeffect":{
			"Name": "poision",
			"AddTime": 1,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit2"] = {
		"power": 305,
		"hurtBack":[-10,-55],
		"attackKind": "real",
		"HitProtect": 10,
		"addeffect":{
			"Name": "poision",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 50,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit3"] = {
		"power": 300,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 8,
		"addeffect":{
			"Name": "poision",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 50,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit4"] = {
		"power": 325,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 15,
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit5"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 18,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0.55,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit6"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "real",
		"HitProtect": 1,
		"addeffect":{
			"Name": "poision",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 80,
			"AttackKind": "real",
			"CanAdd":true,
			"DeBuff": true,
		},
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "hylc",
			"value": 0
		},
		{
			"name": "hylz",
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
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	super._ready()
	monster_85()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if hd > 0:
		special_effect_1.visible = true
	else:
		special_effect_1.visible = false
	if HitCount >= 6:
		IsHD = true
		special_effect_1.visible = true
		HitCount = 0
	if IsHD:
		get_hd(SHp * 0.05,0,0.3)
		$ChangeHDtoSELF.start(8)
		IsHD = false
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
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_2_CD <= 0:
						do_hit_2()
				if Skill_1_CD <= 0:
					do_hit_1()
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
	Skill_1_CD = randi_range(12,15)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(8,10)
	velocity.x = 0
	hit_name = "hit3"
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(14,16)
	velocity.x = 0
	hit_name = "hit5"
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(0,-250) + position,1.8)
	#tween.tween_property(self,"position",Vector2(0,0) + position,1.8)
	pass
func call_ltwj():
	var FirePosition1 = [Vector2(self.position.x - 80,240),Vector2(self.position.x + 80,240)]
	var FirePosition2 = [Vector2(self.position.x - 200,240),Vector2(self.position.x + 200,240)]
	var FirePosition3 = [Vector2(self.position.x - 320,240),Vector2(self.position.x + 320,240)]
	for i in range(2):
		Global.add_Bullet("Monster85Bullet1",self.bullet,false,1.3,FirePosition1[i],"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster85Bullet1",self.bullet,false,1.3,FirePosition2[i],"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster85Bullet1",self.bullet,false,1.3,FirePosition3[i],"hit3",self.objattackDic["hit3"])
func ADDBullet():
	var TargetPosition: Vector2
	if MonsterDirection:
		TargetPosition = Vector2(55,5)
	else:
		TargetPosition = Vector2(-55,5)
	var Arrow = Global.add_Bullet("Monster85Bullet3",self.bullet,MonsterDirection,1,TargetPosition + position,"hit1",self.objattackDic["hit1"])
func ADDsd():
	var PositionList = [Vector2(-380,-45),Vector2(-190,-45),Vector2(0,-45),Vector2(190,-45),Vector2(380,-45)]
	for i in PositionList:
		Global.add_Bullet("Monster85Bullet2",self.bullet,MonsterDirection,1,i + position,"hit5",self.objattackDic["hit5"])
func _on_hit_box_area_entered(area: Area2D) -> void:
	super._on_hit_box_area_entered(area)
	HitCount += 1


func _on_change_h_dto_self_timeout() -> void:
	if hd > 0:
		ChangeHdCureHp(1.2)
