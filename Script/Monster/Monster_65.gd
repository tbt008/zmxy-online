extends BaseMonster
class_name Monster65
#var Is_Top = false
#var Is_Drop = false
#var ZZList: Array[BaseMonster] = []
#func monster_65():
#	self.is_boss = true
#	self.my_mr_name = "五毒·都市王"
#	self.attack_in = 0
#	self.level = RoleProp.baseroleprop.Level + 2
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
#		"power": 550,
#		"hurtBack":[-4,-9],
#		"attackKind": "physics",
#		"HitProtect": 10
#	}
#	self.objattackDic["hit2_1"] = {
#		"power": 800,
#		"hurtBack":[0,0],
#		"attackKind": "physics",
#		"HitProtect": 4,
#		"addeffect":{
#			"Name": "Boundground",
#			"AddTime": 4,
#			"ReduceInterval": 0,
#			"value": 0,
#			"AttackKind": "",
#			"DeBuff": true,
#			"CanAdd":false,
#		}
#	}
#	self.objattackDic["hit2_2"] = {
#		"power": 2200,
#		"hurtBack":[0,0],
#		"attackKind": "magic",
#		"HitProtect": 25,
#		"addeffect":{
#			"Name": "stun",
#			"AddTime": 3,
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
#			"name": "zzyj",
#			"value": 1
#		},
#	]	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_65()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#	Skill_3_CD = 0
#func Monster_Intelligence():
#	if Is_Top:
#		if not Is_Drop:
#			velocity.y = -5
#		return
#	if abs(RoleProp.role_pos_x - position.x) < mysee:
#		has_target = true
#	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
#		if has_target == false:
#			normal_state()
#		else:
#			if abs(position.x - RoleProp.role_pos_x) > attackRange:
#				have_target()
#				if Skill_1_CD <= 0:
#					do_hit_1()
#				if Skill_2_CD <= 0:
#					DoSkill_2_1()
#				if Skill_3_CD <= 0:
#					do_hit_3()
#			else:
#				if Skill_2_CD <= 0:
#					DoSkill_2_1()
#				elif Skill_1_CD <= 0:
#					do_hit_1()
#				elif Skill_3_CD <= 0:
#					do_hit_3()
#				elif count % 60 == 0:
#					attack_target()
#				else:
#					stop_move()
#
#
#func ReturnBody():
#	mr_ani.position = Vector2(0,0)
#func AwaitTOtop():
#	Is_Top = true
#	Is_Drop = false
#	self.position = Vector2(self.position.x,0)
#	ReturnBody()
#func Fall():
#	#velocity.y += 800
#	Is_Top = true
#	Is_Drop = true
#	self.position = Vector2(self.position.x,0)
#func ReturnNormal():
#	ReturnBody()
#	Is_Top = false
#	Is_Drop = false
#func do_hit_1():
#	super.to_hero()
#	Skill_1_CD = randi_range(18,22)
#	hit_name = "zhq_3"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("zw")
#	await mr_player.animation_finished
#	is_attacking = false
#func DoSkill_2_1():
#	super.to_hero()
#	Skill_2_CD = randi_range(12,18)
#	hit_name = "hit1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("totop")
#	await mr_player.animation_finished
#	is_attacking = false
#func MoveToPlayerLocal():
#	self.position = RoleProp.role_pos
#func DoSkill_2_2():
#
#	super.to_hero()
#	velocity.x = 0
#	is_attacking = true
#	Skill_2_CD = randi_range(10,14)
#	self.position = Vector2(RoleProp.role_pos_x,0)
#	if randi_range(0,100) <= 30:
#		hit_name = "hit2_1"
#		mr_player.play("fall2")
#	else:
#		hit_name = "hit2_2"
#		mr_player.play("fall")
#	await mr_player.animation_finished
#	is_attacking = false
#
#func do_hit_3():
#	super.to_hero()
#	Skill_3_CD = randi_range(35,45)
#	hit_name = "hit1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("zz")
#	await mr_player.animation_finished
#	is_attacking = false
#func _on_hurt_box_area_entered(area: Area2D) -> void:
#	super._on_hurt_box_area_entered(area)
#	if randi_range(0,100) < 5:
#		Global.AddBuff(get_Player.buff,{
#			"Name": "poision",
#			"AddTime": 5,
#			"ReduceInterval": 1,
#			"value": 100,
#			"AttackKind": "real",
#			"DeBuff": true,
#			"CanAdd":true,
#		})
#func CallWang():
#	if MonsterDirection:
#		Global.AddMonster65Bullet(self.bullet,position + Vector2(240,-75))
#	else:
#		Global.AddMonster65Bullet(self.bullet,position + Vector2(-240,-75))
#func CallZZ():
#	for i in range(randi_range(2,4)):
#		Global.Create_Monster(66,get_parent(),position + Vector2(randi_range(-100,100),0))
