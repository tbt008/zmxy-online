extends BaseMonster
class_name Monster60
var Is_Top: bool = false
var Is_Drop: bool = false
func monster_60():
	get_parent().get_parent().create_control.stop()
	
	self.is_boss = true
	self.my_mr_name = "刑天"
	self.attack_in = 15
	self.level = 30
	self.SHp = 33000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 120
	self.crit = 22
	self.miss = 15
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 500
	self.attackRange = 245
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 338,
		"hurtBack":[-7,-9],
		"attackKind": "magic",
	}
	self.objattackDic["mykl"] = {
		"power": 338,
		"hurtBack":[-8,0],
		"attackKind": "magic",
	}
	self.objattackDic["xmhd"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "",
	}
	self.objattackDic["sfjm"] = {
		"power": 688,
		"hurtBack":[-5,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 4,
			"CanAdd":false,
			"DeBuff": true,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "qtz",
			"value": 0
		},
		{
			"name": "dszk",
			"value": 0
		},
		{
			"name": "jljs",
			"value": 0
		},
		{
			"name": "lhz",
			"value": 0
		},
		{
			"name": "tpzy",
			"value": 0
		},
		{
			"name": "tpltp",
			"value": 0
		},
		{
			"name": "jlfyc",
			"value": 0
		},
		{
			"name": "jlfyj",
			"value": 0
		},
		{
			"name": "ylhq",
			"value": 0
		},
		{
			"name": "yljj",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0.15
	self.fall_stone = [
		{
			"name": "qhs_1",
			"value": randi_range(2,4)
		}
	]	
func _ready() -> void:
	monster_60()
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if Is_Top:
		self.CannotAttract = true
	else:
		self.CannotAttract = false
func Monster_Intelligence():
#	if not Is_Top:
#		if not is_on_floor():
#			if not is_be_attacking:
#				stop_move()
#			return
	if Is_Top:
		if not Is_Drop:
			velocity.y = -10
			if RoleProp.role_pos_x - position.x > 0:
				velocity.x = +200
			else:
				velocity.x -= 200
		return
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= 335:
				if Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_3_CD <= 0:
					do_hit_3()
				else:
					have_target()
			else:
				if abs(position.x - RoleProp.role_pos_x) > attackRange:
					if Skill_2_CD <= 0:
						if randi_range(0,100) < 60:
							do_hit_2()
						else:
							if count % 60 == 0:
								attack_target()
							else:
								have_target()
					else:
						if abs(position.x - RoleProp.role_pos_x) <= 260:
							if Skill_1_CD <= 0:
								do_hit_1()
						elif Skill_3_CD <= 0:
							do_hit_3()
						else:
							have_target()
				else:
					if Skill_3_CD <= 0:
						do_hit_3()
					elif Skill_1_CD <= 0:
						do_hit_1()
					elif Skill_2_CD <= 0:
						if randi_range(0,100) < 60:
							do_hit_2()
						else:
							if count % 60 == 0:
								attack_target()
							else:
								stop_move()
					else:
						if count % 60 == 0:
							attack_target()
						else:
							stop_move()
func do_hit_1():
	#super.to_hero()
	Skill_1_CD = 12
	hit_name = "mykl"
	velocity.x = 0
	is_attacking = true
	mr_player.play("mykl")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(14,18)
	hit_name = "sfjm"
	velocity.x = 0
	is_attacking = true
	mr_player.play("sfjm_1")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(6,10)
	hit_name = "xmhd"
	velocity.x = 0
	is_attacking = true
	mr_player.play("xmhd")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()	
func GoTop():
	Is_Drop = false
	Is_Top = true
	var Tween_ = get_tree().create_tween()
	Tween_.tween_property(self,"position",Vector2(self.position.x,-800),1)
func Drop():
	Is_Drop = true
	var Shallow = Global.add_SpecialEffect(self.bullet,Vector2(self.position.x,500),"Shallow",Vector2(1,1),false,1)
	Shallow.scale = Vector2(0.4,0.4)
	var Tween_ = get_tree().create_tween()
	Tween_.tween_property(Shallow,"scale",Vector2(2,2),0.6)
	await get_tree().create_timer(0.6,false).timeout
	Shallow.queue_free()
	velocity.y += 2000
	velocity.x = 0
	mr_player.play("sfjm_2")
	await mr_player.animation_finished
	Is_Top = false
func call_sfjmFire():
	var FirePosition1 = [Vector2(self.position.x - 80,self.position.y + 30),Vector2(self.position.x + 80,self.position.y + 30)]
	var FirePosition2 = [Vector2(self.position.x - 160,self.position.y + 30),Vector2(self.position.x + 160,self.position.y + 30)]
	var FirePosition3 = [Vector2(self.position.x - 240,self.position.y + 30),Vector2(self.position.x + 240,self.position.y + 30)]
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition1[i],"sfjm",self.objattackDic["sfjm"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition2[i],"sfjm",self.objattackDic["sfjm"])
	await get_tree().create_timer(0.2,false).timeout
	for i in range(2):
		Global.add_Bullet("Monster42Bullet",self.bullet,false,1.3,FirePosition3[i],"sfjm",self.objattackDic["sfjm"])
func DelayCall():
	get_parent().get_parent().create_control.stop()
	get_parent().get_parent().Monster_group["stage_1"].push_back(42)
	get_parent().get_parent().create_control.start(5)
func CallHands():
	var PositionList = []
	var OtherPo = []
	if MonsterDirection:
		OtherPo = [Vector2(37,55),Vector2(67,45),Vector2(27,25)]
		PositionList = [Vector2(37,-35),Vector2(67,-65),Vector2(27,-5)]
	else:
		OtherPo = [Vector2(-37,55),Vector2(-67,45),Vector2(-27,25)]
		PositionList = [Vector2(-37,-35),Vector2(-67,-65),Vector2(-27,-5)]
	for i in PositionList:
		Global.add_Bullet("Monster60Bullet",self,MonsterDirection,randf_range(1.1,1.3),i,"mykl",self.objattackDic["mykl"])
		await get_tree().create_timer(0.06,false).timeout
	await get_tree().create_timer(0.06,false).timeout
	for i in OtherPo:
		Global.add_Bullet("Monster60Bullet",self,MonsterDirection,1.35,i,"mykl",self.objattackDic["mykl"])
		#await get_tree().create_timer(0.06,false).timeout
