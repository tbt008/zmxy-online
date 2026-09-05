extends BaseMonster
class_name Monster143
@onready var behurt: AnimationPlayer = $MonsterDir/behurt

func monster_143():
	Global.AddBuff(self.buff,{
			"Name": "SuperArmor",
			"AddTime": 99999999999,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": false,
			"CanRemove": false,
		},)
	Global.AddBuff(self.buff,{
			"Name": "NoDeBuff",
			"AddTime": 99999999999,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": false,
			"CanRemove": false,
		},)
	self.is_Fly = true
	self.is_boss = true
	self.CannotAttract = true
	self.my_mr_name = "五行祖巫"
	self.attack_in = 60
	self.level = 50
	self.SHp = 450000
	self.Hp = self.SHp
	self.def = 300
	self.mdef = 300
	self.crit = 50
	self.miss = 35
	self.lucky = 115
	self.Htarget = 35
	self.Toughness = 20
	self.ar = RoleProp.roleprop.Def * 0.5
	self.sp = RoleProp.roleprop.Mdef * 0.5
	self.Critreduce = 30
	self.speed = 16
	self.mysee = 500
	self.attackRange = 100
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 1
	self.ebol = 5
	self.objattackDic["hit1"] = {
		"power": 350,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 5,
	}
	self.objattackDic["szzw"] = {
		"power": 600,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "Ice",
			"AddTime": 1.5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove": false,
		},
	}
	self.objattackDic["hzzw"] = {
		"power": 330,
		"hurtBack":[-6,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * 0.02),
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove": false,
		}
	}
	self.objattackDic["mzzw"] = {
		"power": 300,
		"hurtBack":[-6,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "flls",
			"AddTime": 3,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SMp * 0.015),
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove": false,
		}
	}
	self.objattackDic["tzzw"] = {
		"power": 600,
		"hurtBack":[-2,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Immobilize",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
			"CanRemove": false,
		}
	}
	self.fall_pro = 0.25
	self.fall_list = [
		{
			"name": "jmzy",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []		
func _ready() -> void:
	super._ready()
	monster_143()
	Skill_1_CD = randi_range(8,13)
	Skill_2_CD = randi_range(5,8)
	Skill_3_CD = randi_range(0,6)
	Skill_4_CD = randi_range(5,8)
	Skill_5_CD = randi_range(0,6)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity.y = 0
	velocity.x = 0
	#ShouldInSky = true
	pass
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
				if Skill_4_CD <= 0:
					do_hit_4()
			else:
				stop_move()
				if Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_4_CD <= 0:
					do_hit_4()
				elif Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = 12
	hit_name = "mzzw"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = 10
	hit_name = "hzzw"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = 13
	hit_name = "szzw"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_4():
	super.to_hero()
	Skill_4_CD = 8
	hit_name = "tzzw"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit5")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	var po = position
	Global.add_Bullet("Monster143Bullet1",self.bullet,false,1, Vector2(165,85) + po,"hit1",objattackDic["hit1"])	
	Global.add_Bullet("Monster143Bullet1",self.bullet,true,1, Vector2(-155,85) + po,"hit1",objattackDic["hit1"])	
func CallBullet2():
	var po = get_Player.position
	for i in range(3):
		var smb = Global.add_Bullet("Monster143Bullet2",self.bullet,false,1, Vector2(get_Player.position.x,500),"szzw",objattackDic["szzw"])	
		smb.scale = Vector2(1,1)
		await get_tree().create_timer(1,false).timeout
func CallBullet_3():
	for i in range(5):
		var Bullet
		var Position = Vector2(position.x + randi_range(-450,500),-600)
		Bullet = Global.add_Bullet("Monster140Bullet3",self.bullet,false,0.58,Position,"hzzw",self.objattackDic["hzzw"])	
		Bullet.look_at(get_Player.position)
		await get_tree().create_timer(0.3,false).timeout
func CallBullet4():
	var PositionList_1 = [
		{"Po":Vector2(-190,-110),"Ro":140},{"Po":Vector2(-180,-100),"Ro":130},
		{"Po":Vector2(-170,-90),"Ro":120},{"Po":Vector2(-160,-80),"Ro":110}
	]
	var PositionList_2 = [
		{"Po":Vector2(190,-110),"Ro":20},{"Po":Vector2(180,-100),"Ro":30},
		{"Po":Vector2(170,-90),"Ro":40},{"Po":Vector2(160,-80),"Ro":50}
	]
	PositionList_2.reverse()
	for i in PositionList_1:
		var st = Global.add_Bullet("Monster143Bullet3",self.bullet,false,2,i["Po"] + position,"mzzw",self.objattackDic["mzzw"])	
		st.rotation_degrees = i["Ro"]
	for i in PositionList_2:
		var st = Global.add_Bullet("Monster143Bullet3",self.bullet,false,2,i["Po"] + position,"mzzw",self.objattackDic["mzzw"])	
		st.rotation_degrees = i["Ro"]
func CallBullet_5():
	Global.add_Bullet("Monster143Bullet4",self.bullet,false,1,get_Player.position,"tzzw",self.objattackDic["tzzw"])	
func _on_hurt_box_area_entered(area: Area2D) -> void:
	super._on_hurt_box_area_entered(area)
	behurt.play("hurt")
func state_death():
	super.state_death()
	if not MainSet.set_data["XiaoBaiLong"]:
		MainSet.set_data["XiaoBaiLong"] = true
		Global.AddMessageShow(Global.Windows_,"击败五行祖巫，解锁小白龙！！",1.5,Vector2(500,305))
		MemoryClass.保存游戏(Global.cd_path)
