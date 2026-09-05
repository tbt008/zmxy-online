extends BaseMonster
class_name Monster_59
var RoleBeHitCount = Global.PlayerBeHitCount
func monster_59(BeHitCount):
	self.is_boss = true
	self.my_mr_name = "宋帝王"
	self.attack_in = 10
	self.level = 30
	self.SHp = 19000 + BeHitCount * 8000
	self.Hp = self.SHp
	self.def = 125 + BeHitCount * 15
	self.mdef = 95 + BeHitCount * 15
	self.crit = 5 + BeHitCount * 0.2
	self.miss = 5 + BeHitCount * 0.8
	self.lucky = 5 + BeHitCount * 0.5
	self.Htarget = 5 + BeHitCount * 0.5
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 400
	self.attackRange = 185
	self.attackDesire = 50 + BeHitCount * 1.5
	self.behit_calmtime = 0.2
	self.self_rhp = BeHitCount * 70
	self.add_exp = 100
	self.fall_coin = 100
	self.objattackDic["hit1"] = {
		"power": 128 + BeHitCount * 25,
		"hurtBack":[-6,-1],
		"attackKind": "physics",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 2 + BeHitCount * 0.5,
			"ReduceInterval": 0.5,
			"value": 15 + BeHitCount * 5,
			"AttackKind": "real",
			"DeBuff": true,
			"CanAdd":true,
		}
	}
	self.objattackDic["zmhy"] = {
		"power": 128 + BeHitCount * 25,
		"hurtBack":[0,-18],
		"attackKind": "magic",
		"addeffect":{
			"Name": "silent",
			"AddTime": 4 + BeHitCount * 0.3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		}
	}
	self.objattackDic["zzzy"] = {
		"power": 333 + BeHitCount * 20,
		"hurtBack":[-12,-1],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Boundground",
			"AddTime": 3 + BeHitCount * 0.5,
			"ReduceInterval": 0,
			"value": 0,
			"DeBuff": true,
			"AttackKind": "",
			"CanAdd":false,
		}
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
	RoleBeHitCount = Global.PlayerBeHitCount
	monster_59(RoleBeHitCount)
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
				if abs(position.x - RoleProp.role_pos_x) <= 900:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				else:
					if count % 40 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
						else:
							normal_state()
					else:
						stop_move()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(14,17)
	hit_name = "zmhy"
	velocity.x = 0
	is_attacking = true
	mr_player.play("zmhy")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(10,14)
	velocity.x = 0
	hit_name = "zzzy"
	is_attacking = true
	mr_player.play("zzzy")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func Call_ZZZY():
	var BulletName = "Monster59Bullet_1"
	var Position
	if MonsterDirection:
		Position = Vector2(420,randi_range(-130,130)) + self.position
		Global.add_Bullet(BulletName,self.bullet,true,1,Position,"zzzy",self.objattackDic["zzzy"])
	else:
		Position = Vector2(-420,randi_range(-130,130)) + self.position
		Global.add_Bullet(BulletName,self.bullet,false,1,Position,"zzzy",self.objattackDic["zzzy"])

func CallZZHY():
	var Num = 3 + int(RoleBeHitCount / 3)
	for i in range(Num):
		var Position = Vector2(get_Player.position.x + randi_range(-140,140),500)
		Global.add_Bullet("Monster59Bullet_2",self.bullet,false,1,Position,"zmhy",self.objattackDic["zmhy"])
func state_hurt():
	is_jgz = false
	if RoleBeHitCount >= 13:
		is_be_attacking = false
		return
	super.state_hurt()
