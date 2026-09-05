extends BaseMonster
class_name Monster67
func monster_67():
	self.is_boss = true
	self.my_mr_name = "楚江王"
	self.attack_in = 0
	self.level = 35
	self.SHp = 35000
	self.Hp = self.SHp
	self.def = 130
	self.mdef = 120
	self.crit = 5
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 500
	self.attackRange = 175
	self.attackDesire = 0
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 150,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"HitProtect": 15
	}
	self.objattackDic["hit2"] = {
		"power": 150,
		"hurtBack":[0,0],
		"attackKind": "physics",
		"HitProtect": 4,
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 3,
			"ReduceInterval": 1,
			"value": 20,
			"DeBuff": true,
			"AttackKind": "real",
			"CanAdd":true,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 160,
		"hurtBack":[-10,-22],
		"attackKind": "magic",
		"HitProtect": 8,
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "dzj",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_67()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_1()
				if Skill_2_CD <= 0:
					do_hit_2()
				if Skill_3_CD <= 0:
					do_hit_3()
				if count % 120 == 0:
					attack_target()
			else:
				if Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_3_CD <= 0:
					do_hit_3()
				elif count % 60 == 0:
					attack_target()
				else:
					stop_move()
						
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,10)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("cjwlj")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(5,7)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("szzh")
	await mr_player.animation_finished
	is_attacking = false
	
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(12,16)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("wjl")
	await mr_player.animation_finished
	is_attacking = false
	
func _on_hit_box_area_exited(_area: Area2D) -> void:
	var Xx = 5 * (1 - float(Hp) / float(SHp)) + randi_range(0,1)
	self.cure_hp(Xx * objattackDic[hit_name]["power"])
	super._on_hit_box_area_entered(_area)

func CallBullet():
	var PositionList = []
	if randi_range(0,100) < 30:
		#await get_tree().create_timer(2,false).timeout
		if not MonsterDirection:
			PositionList = [Vector2(-80,70),Vector2(-180,70),Vector2(-280,70),Vector2(-380,70),Vector2(-480,70),Vector2(-580,70)]
		else:
			PositionList = [Vector2(80,70),Vector2(180,70),Vector2(280,70),Vector2(380,70),Vector2(480,70),Vector2(580,70)]
		for i in PositionList:
			Global.add_Bullet("Monster67Bullet",self.bullet,MonsterDirection,1,i + position,"hit3",self.objattackDic["hit3"])
			await get_tree().create_timer(0.2,false).timeout
	else:
		await get_tree().create_timer(2,false).timeout
		PositionList = [Vector2(1050,510),Vector2(1210,510),Vector2(1370,510),Vector2(1530,510),Vector2(1690,510),Vector2(1850,510)]
		for i in PositionList:
			Global.add_Bullet("Monster67Bullet",self.bullet,MonsterDirection,1,i,"hit3",self.objattackDic["hit3"])
		await get_tree().create_timer(2,false).timeout
		PositionList = [Vector2(1110,510),Vector2(1240,510),Vector2(1370,510),Vector2(1500,510),Vector2(1630,510),Vector2(1760,510),
		Vector2(1890,510),Vector2(2020,510)]
		for i in PositionList:
			Global.add_Bullet("Monster67Bullet",self.bullet,MonsterDirection,1,i,"hit3",self.objattackDic["hit3"])
func CallSZ():
	var SZ = Global.Create_Monster(68,get_parent(),position) as Monster68
	SZ.Myfather = self
	
