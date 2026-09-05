extends BaseMonster
class_name Monster102
var MyChild: MonsterBullet
func monster_101():
	self.is_boss = true
	self.my_mr_name = "哪吒"
	self.attack_in = 60
	self.level = 40
	self.SHp = 150000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 50
	self.miss = 25
	self.lucky = 115
	self.Htarget = 35
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 16
	self.mysee = 500
	self.attackRange = 245
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 120
	self.fall_coin = 155
	self.objattackDic["hit1"] = {
		"power": 350,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 405,
		"hurtBack":[-20,-1],
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
		},
	}
	self.objattackDic["hit3"] = {
		"power": 650,
		"hurtBack":[-18,-1],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 400,
			"AttackKind": "real",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit4"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "",
		"HitProtect": 0,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "rls",
			"value": 1
		},
		{
			"name": "ryzzs",
			"value": 1
		},
		{
			"name": "tszzs",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
		{
			"name": "sichou",
			"value": randi_range(1,2)
		},
		{
			"name": "xuantie",
			"value": randi_range(1,2)
		},
		{
			"name": "tanmu",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_101()
	Skill_1_CD = randi_range(3,5)
	Skill_2_CD = randi_range(5,8)
	Skill_3_CD = randi_range(0,6)
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
				if Skill_3_CD <= 0:
					do_hit_3()
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_3_CD <= 0:
					do_hit_3()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(6,7)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(11,13)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(20,25)
	hit_name = "hit4"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit4")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet1():
	var Bullets
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster102Bullet",self.bullet,false,0.6,Vector2(50,0) + position,"hit2",self.objattackDic["hit2"])
	else:
		Bullets = Global.add_Bullet("Monster102Bullet",self.bullet,false,0.6,Vector2(-50,0) + position,"hit2",self.objattackDic["hit2"])
	Bullets.look_at(get_Player.position)
func CallBullet2():
	var Bullets
	var BulletList = []
	if self.MonsterDirection:
		BulletList = [Vector2(0,0),Vector2(50,0)]
	else:
		BulletList = [Vector2(0,0),Vector2(-50,0)]
	for i in BulletList:
		Bullets = Global.add_Bullet("Monster102Bullet1",self.bullet,false,1,i + position,"hit3",self.objattackDic["hit3"])
		Bullets.look_at(get_Player.position)
		await get_tree().create_timer(0.2,false).timeout
func CallBullet3():
	MyChild = Global.add_Bullet("Monster102Bullet2",self,false,1,Vector2(0,0),"hit3",self.objattackDic["hit3"])
