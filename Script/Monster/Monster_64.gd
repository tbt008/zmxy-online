extends BaseMonster
class_name Monster64
#var DeathCount: int = 0
#var Hurtcount: int = 0
#var Should_FS: bool = false
#var Is_Fs = false
#var FSList = []
#var ReduceCount: int = 0
#var TotalHit: int = 0
#@onready var hurt_t_imes: Label = $Mr_blood/Big_blood/HurtTImes
#@onready var hurt_t_imes_2: Label = $Mr_blood/Big_blood/HurtTImes2
#
#func monster_64():
#	self.is_boss = true
#	self.my_mr_name = "五毒·卞城王"
#	self.attack_in = 0
#	self.level = RoleProp.baseroleprop.Level + 2
#	self.SHp = 100000
#	self.Hp = self.SHp
#	self.def = 400
#	self.mdef = 400
#	self.crit = 35
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 80
#	self.sp = 80
#	self.Critreduce = 0
#	self.speed = 11
#	self.mysee = 0
#	self.attackRange = 175
#	self.attackDesire = 0
#	self.behit_calmtime = 0
#	self.self_rhp = 0
#	self.add_exp = 0
#	self.fall_coin = 0
#	self.objattackDic["hit1"] = {
#		"power": 489,
#		"hurtBack":[0,0],
#		"attackKind": "physics",
#		"HitProtect": 6
#	}
#	self.objattackDic["jfkx"] = {
#		"power": 0,
#		"hurtBack":[0,0],
#		"attackKind": "",
#		"HitProtect": 4
#	}
#	self.objattackDic["cxcm"] = {
#		"power": 688,
#		"hurtBack":[-10,0],
#		"attackKind": "magic",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "Boundground",
#			"AddTime": 4,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#	}
#	self.fall_pro = 0.15
#	self.fall_list = [
#		{
#			"name": "xzyj",
#			"value": 1
#		},
#	]	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_64()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#	Skill_3_CD = 0
#	Skill_4_CD = 0
#
#func Monster_Intelligence():
#	if abs(RoleProp.role_pos_x - position.x) < mysee:
#		has_target = true
#	ReduceCount += 1
#	if ReduceCount % 120 == 0:
#		if Hurtcount > 0:
#
#			Hurtcount-= 1
#		if TotalHit > 0:
#			TotalHit -= 1
#
#	if Should_FS:
#		mr_player.play("ayfs")
#		return
#	if TotalHit >= randi_range(4,8):
#		if get_Player != null:
#			get_Player.effect_reducehp(int(TotalHit * randi_range(200,370)),"real")
#			cure_hp((SHp - Hp) * TotalHit * 0.01)
#			TotalHit = 0
#	if abs(position.x - RoleProp.role_pos_x) <= mysee:
#		has_target = true
#	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
#		if has_target == false:
#			normal_state()
#		else:
#			if abs(position.x - RoleProp.role_pos_x) > attackRange:
#				have_target()
#				if Skill_1_CD <= 0:
#					do_hit_1()
#			else:
#				if Skill_1_CD <= 0:
#					do_hit_1()
#				elif count % 120 == 0:
#					attack_target()
#				else:
#					stop_move()
#func do_hit_1():
#	Skill_1_CD = randi_range(8,10)
#	super.to_hero()
#	hit_name = "cxcm"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("cxcm")
#	await mr_player.animation_finished
#	is_attacking = false
#func _on_hurt_box_area_entered(area: Area2D) -> void:
#	super._on_hurt_box_area_entered(area)
#	Hurtcount += 1
#	if get_parent().get_children().size() < 6:
#		if Hurtcount >= 6:
#			if randi_range(0,100) <= 15:
#				Hurtcount = 0
#				Should_FS = true
#func CallFS():
#	if get_parent().get_children().size() < 6:
#		var FS = Global.Create_Monster(64,get_parent(),position) as Monster64
#		FS.is_boss = false
#		FS.Is_Fs = true
#		FS.fall_list.clear()
#		FS.fall_stone.clear()
#		Should_FS = false
#	else:
#		Should_FS = false
#func CallCM():
#	var Position
#	for i in range(randi_range(6,10)):
#		if MonsterDirection:
#			Position = Vector2(-115,randi_range(-65,35))
#		else:
#			Position = Vector2(115,randi_range(-65,35))
#		Global.add_Bullet("Monster64Bullet",self.bullet,MonsterDirection,1,Position + position,"cxcm",self.objattackDic["cxcm"])
#		await get_tree().create_timer(0.1,false).timeout
#
#func _on_death_timeout() -> void:
#	if Is_Fs:
#		self.Hp = -990
#func _on_hit_box_area_exited(_area: Area2D) -> void:
#	TotalHit += 1
#	super._on_hit_box_area_entered(_area)
	

