extends BaseMonster
class_name Monster77
var Round
func monster_77():
	self.is_boss = true
	self.my_mr_name = "千里眼"
	self.attack_in = 15
	self.level = 35
	self.SHp = 40000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 20
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 400
	self.attackRange = 350
	self.attackDesire = 75
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 100
	self.objattackDic["hit1"] = {
		"power": 330,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
	}
	self.objattackDic["hit2"] = {
		"power": 600,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 6,
			"ReduceInterval": 0,
			"value": 0.5,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		}
	}
	self.objattackDic["hit3"] = {
		"power": 700,
		"hurtBack":[25,-25],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "kyz",
			"value": 0
		},
		{
			"name": "kyc",
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
	super._ready()
	monster_77()
	Skill_1_CD = 0

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
					if abs(position.x - RoleProp.role_pos_x) <= 600:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				else:
					if count % 60 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
						else:
							stop_move()
					else:
						stop_move()

func do_hit_2():
	to_hero()
	Skill_1_CD = 10
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func AddChild1():
	var Rotation
	var Rotation2
	var po:Vector2
	var PositionList = []
	if MonsterDirection:
		po = Vector2(70,-20)
		Rotation = -11
		Rotation2 = 40
		PositionList = [Vector2(1400,-1000),Vector2(1200,-1000),Vector2(1000,-1000),Vector2(800,-1000),Vector2(600,-1000)]
	else:
		po = Vector2(-70,-20)
		PositionList = [Vector2(-1400,-1000),Vector2(-1200,-1000),Vector2(-1000,-1000),Vector2(-800,-1000),Vector2(-600,-1000)]
		Rotation = 11
		Rotation2 = -40
	var child = Global.add_Bullet("Monster77Bullet2",bullet,MonsterDirection,2,position + po,"hit2",self.objattackDic["hit2"])
	child.rotation_degrees = Rotation
	var dir = MonsterDirection
	await get_tree().create_timer(1,false).timeout
	for i in PositionList:
		child = Global.add_Bullet("Monster77Bullet3",bullet,dir,2,position + i,"hit3",self.objattackDic["hit3"])
		child.rotation_degrees = Rotation2
		await get_tree().create_timer(0.5,false).timeout
func AddChild2():
	var po:Vector2
	if MonsterDirection:
		po = Vector2(50,0)
	else:
		po = Vector2(-50,0)
	var child = Global.add_Bullet("Monster77Bullet1",bullet,MonsterDirection,2,position + po,"hit1",self.objattackDic["hit1"])

