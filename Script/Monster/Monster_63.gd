extends BaseMonster
class_name Monster63
#var IsDrop = false
#var First: bool = true
#var FS: bool = false
#@onready var change_timer: Timer = $ChangeTimer
#
#@onready var special_effect: AnimatedSprite2D = $MonsterDir/SpecialEffect
#func monster_61():
#	self.is_boss = true
#	self.my_mr_name = "五毒·泰山王"
#	self.attack_in = 15
#	self.level = RoleProp.baseroleprop.Level + 1
#	self.SHp = 1000000
#	self.Hp = self.SHp
#	self.def = 400
#	self.mdef = 400
#	self.crit = 35
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 80
#	self.sp = 0
#	self.Critreduce = 0
#	self.speed = 9
#	self.mysee = 500
#	self.attackRange = 335
#	self.attackDesire = 60
#	self.behit_calmtime = 0.3
#	self.self_rhp = 0
#	self.add_exp = 200
#	self.fall_coin = 200
#	self.objattackDic["hit1"] = {
#		"power": 588,
#		"hurtBack":[-7,-9],
#		"attackKind": "magic",
#		"HitProtect": 4
#	}
#	self.objattackDic["xlyj"] = {
#		"power": 4500,
#		"hurtBack":[-8,0],
#		"attackKind": "physics",
#		"HitProtect": 25,
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 5,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"DeBuff": true,
#			"CanAdd":false,
#		}
#	}
#	self.objattackDic["zhq_1"] = {
#		"power": 588,
#		"hurtBack":[-3,0],
#		"attackKind": "physics",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "speed_down",
#			"AddTime": 2,
#			"ReduceInterval": 0,
#			"value": 0.2,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#	}
#	self.objattackDic["zhq_2"] = {
#		"power": 688,
#		"hurtBack":[0,0],
#		"attackKind": "physics",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 2,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#	}
#	self.objattackDic["zhq_3"] = {
#		"power": 888,
#		"hurtBack":[-50,-40],
#		"attackKind": "physics",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 2,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#	}
#	self.objattackDic["zhq_4"] = {
#		"power": 888,
#		"hurtBack":[-4,-40],
#		"attackKind": "physics",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 2,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#
#	}
#	self.objattackDic["zhq_5"] = {
#		"power": 688,
#		"hurtBack":[-3,-8],
#		"attackKind": "physics",
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 2,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		}
#	}
#	self.objattackDic["zhq_6"] = {
#		"power": 688,
#		"hurtBack":[-3,-8],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 2,
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
#			"name": "czyj",
#			"value": 1
#		},
#	]	
#	self.fall_stone_pro = 0
#	self.fall_stone = [
#	]	
#func _ready() -> void:
#	change_timer.start(randi_range(14,16))
#	super._ready()
#	monster_61()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#	Skill_3_CD = 0
#	Skill_4_CD = 0
#
#func Monster_Intelligence():
#	if IsDrop:
#		return
#	if Hp <= SHp * 0.5:
#		if First:
#			velocity.x = 0
#			self.scale = Vector2(1,1)
#			mr_player.play("TurnBig")
#			await mr_player.animation_finished
#			self.def = 268
#			self.mdef = 268
#			First = false
#	if abs(RoleProp.role_pos_x - position.x) < mysee:
#		has_target = true
#	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
#		if has_target == false:
#			normal_state()
#		else:
#			if abs(position.x - RoleProp.role_pos_x) > attackRange:
#				have_target()
#				if Skill_2_CD <= 0:
#					do_hit_2()
#				if Skill_3_CD <= 0:
#					do_hit_3()
#				if Skill_1_CD <= 0:
#					if abs(position.x - RoleProp.role_pos_x) <= 200:
#						do_hit_1()
#				if Skill_4_CD <= 0:
#					UseSkill_4()
#			else:
#				if Skill_2_CD <= 0:
#					do_hit_2()
#				elif Skill_3_CD <= 0:
#					do_hit_3()
#				elif Skill_1_CD <= 0:
#					do_hit_1()
#				elif Skill_4_CD <= 0:
#					UseSkill_4()
#				elif count % 120 == 0:
#					if randi_range(0,80) < 70:
#						attack_target()
#				else:
#					stop_move()
#
#func do_hit_1():
#	super.to_hero()
#	Skill_1_CD = randi_range(15,20)
#	hit_name = "zhq_2"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_1")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_2():
#	super.to_hero()
#	Skill_2_CD = randi_range(12,18)
#	hit_name = "zhq_3"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_2")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func do_hit_3():
#	super.to_hero()
#	Skill_3_CD = 25
#	hit_name = "zhq_1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_5")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func UseSkill_4():
#	IsDrop = true
#	super.to_hero()
#	Skill_4_CD = 28
#	hit_name = "zhq_6"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("skill_4_1")
#	await mr_player.animation_finished
#	#is_attacking = false
#func MoveSelfToPlayer():
#	self.position = RoleProp.role_pos
#func ChangeHitName(num):
#	match num:
#		0:
#			hit_name = "xlyj"
#		1:
#			hit_name = "zhq_1"
#		2:
#			hit_name = "zhq_2"
#		3:
#			hit_name = "zhq_3"
#		4:
#			hit_name = "zhq_4"
#		4:
#			hit_name = "zhq_4"
#func call_fly_bullet():
#	var fz
#	if self.MonsterDirection:
#		fz = Global.CallFlyBullet(self.bullet,"Monster_63Bullet",1,Vector2(position.x + 100,position.y + 15),1000,-900,"hit1",self.objattackDic["hit1"])
#	else:
#		fz = Global.CallFlyBullet(self.bullet,"Monster_63Bullet",1,Vector2(position.x - 100,position.y + 15),1000,900,"hit1",self.objattackDic["hit1"])
#		fz.animated_sprite_2d.flip_h = true
#	if First:
#		fz.scale = Vector2(1,1)
#	else:
#		fz.scale = Vector2(1.5,1.5)
#func call_fly_bullet2():
#	var fz
#	if self.MonsterDirection:
#		fz = Global.CallFlyBullet(self.bullet,"Monster63Bullet",1,Vector2(position.x + 100,position.y),300,-1500,"zhq_3",self.objattackDic["zhq_3"])
#	else:
#		fz = Global.CallFlyBullet(self.bullet,"Monster63Bullet",1,Vector2(position.x - 100,position.y),300,1500,"zhq_3",self.objattackDic["zhq_3"])
#		fz.animated_sprite_2d.flip_h = true
#	if First:
#		fz.scale = Vector2(1,1)
#	else:
#		fz.scale = Vector2(2,2)
#func ToToP():
#	var Po = Vector2(RoleProp.role_pos_x,100)
#	var tween = get_tree().create_tween()
#	tween.tween_property(self,"position",Po,0.4)
#	mr_player.play("skill_4_2")
#
#func ToDrop():
#	velocity.y += 800
#
#	mr_player.play("skill_4_3")
#	await mr_player.animation_finished
#	is_attacking = false
#	IsDrop = false
#func CallBullet():
#	var PositionList
#	if First:
#		PositionList = [Vector2(-105,70),Vector2(105,70),Vector2(0,70),Vector2(-210,70),Vector2(210,70)]
#	else:
#		PositionList = [Vector2(-140,120),Vector2(140,120),Vector2(0,120),Vector2(310,120),Vector2(-310,120)]
#	for i in PositionList:
#		var bb = Global.add_Bullet("Monster63Bullet",self.bullet,false,1,i + self.position,"zhq_1",self.objattackDic["zhq_1"])
#		if First:
#			bb.scale = Vector2(1,1)
#		else:
#			bb.scale = Vector2(1.5,1.5)
#
#
#func _on_timer_timeout() -> void:
#	if not FS:
#		FS = true
#		change_timer.start(randi_range(9,11))
#	else:
#		FS = false
#		change_timer.start(randi_range(22,25))
#	ChangeSelfColor()
#func ChangeSelfColor():
#	var TWEEN = get_tree().create_tween()
#	#print(FS)
#	if FS:
#		TWEEN.tween_property(self,"modulate",Color("00ffff"),1)
#	else:
#		TWEEN.tween_property(self,"modulate",Color("ffffff"),1)
#	pass
#func _on_hurt_box_area_entered(area: Area2D) -> void:
#	super._on_hurt_box_area_entered(area)
#	if FS:
#		if get_Player != null:
#			get_Player.effect_reducehp(self.GetHurt,"real")
#		self.GetHurt = 0
