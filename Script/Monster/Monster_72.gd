extends BaseMonster
class_name Monster72
var MyFather: BaseMonster
var IsCall: bool
func monster_72():
	self.is_boss = true
	self.my_mr_name = "哮天犬"
	self.attack_in = 0
	self.level = 35
	self.SHp = 40000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 20
	self.miss = 18
	self.lucky = 18
	self.Htarget = 10
	self.Toughness = 10
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 400
	self.attackRange = 175
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 288,
		"hurtBack":[-7,-9],
		"attackKind": "magic",
	}
	self.objattackDic["hit2"] = {
		"power": 300,
		"hurtBack":[-7,-9],
		"attackKind": "magic",
	}
	self.objattackDic["hit3"] = {
		"power": 300,
		"hurtBack":[-7,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 5,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 0.5,
			"value": 35,
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "sichou",
			"value": randi_range(3,5)
		},
		{
			"name": "xuantie",
			"value": randi_range(3,5)
		},
		{
			"name": "tanmu",
			"value": randi_range(3,5)
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	monster_72()
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
				if abs(position.x - RoleProp.role_pos_x) <= 400:
					if Skill_2_CD <= 0:
						do_hit_2()
				if count % 120 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 60 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
						else:
							stop_move()
				else:
					stop_move()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(15,18)
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("Skill")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(10,12)
	velocity.x = 0
	hit_name = "hit2"
	is_attacking = true
	mr_player.play("Skill2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallMonsterBullet():
	var BulletName = "Monster72Bullet"
	var Position
	var PositionList = [Vector2(0,0),Vector2(0,-75),Vector2(0,75)]	
	for i in PositionList:
		Global.add_Bullet(BulletName,self.bullet,MonsterDirection,1,i + position,"hit2",self.objattackDic["hit2"])
		await get_tree().create_timer(0.3,false).timeout
func StrengthObj():
	self.cure_hp(SHp * 0.15)
	for i in self.objattackDic:
		if self.objattackDic[i].has("power"):
			self.objattackDic[i]["power"] *= 1.05
	self.crit += 10
	sp += 10
	ar += 10
	if MyFather != null:
		MyFather.cure_hp(SHp * 0.15)
		for i in MyFather.objattackDic:
			if MyFather.objattackDic[i].has("power"):
				MyFather.objattackDic[i]["power"] *= 1.05
		MyFather.crit += 5
		MyFather.sp += 5
		MyFather.ar += 5
func CallMonster():
	if not IsCall:
		var Self = Global.Create_Monster(72,get_parent(),position)
		Self.SHp = SHp * 1.5
		Self.Hp = Self.SHp
		Self.def = def * 1.2
		Self.mdef = mdef * 1.2
		Self.modulate = Color("00ffff")
		Self.my_mr_name = "邪·哮天犬"
		Self.IsCall = true
		for i in Self.objattackDic:
			if Self.objattackDic[i].has("power"):
				Self.objattackDic[i]["power"] = self.objattackDic[i]["power"] * 1.5
		IsCall = true
