extends BaseMonster
class_name Monster56
@onready var zlw_special_effect_2: Node2D = $MonsterDir/zlwSpecialEffect_2
var Boss_4
var RoundList = []
var RoundPosition = [Vector2(-390,305),Vector2(-280,305),Vector2(-170,305),Vector2(-60,305),
Vector2(50,305),Vector2(160,305),Vector2(270,305),Vector2(380,305)]
var RoundPosition_2 = [Vector2(-390,305),Vector2(-280,305),Vector2(-170,305),Vector2(-60,305),
Vector2(50,305),Vector2(160,305),Vector2(270,305),Vector2(380,305)]
var JGPP = [Vector2(-370,325),Vector2(-255,325),Vector2(-140,325),Vector2(-25,325),
Vector2(90,325),Vector2(200,325),Vector2(310,325),Vector2(425,325)]
var IdxList = [0,1,2,3,4,5,6,7]
var CurrentRound: int = 8
var Throw = true
var isCall = false
var throw_cout: int = 3
var Call_stage = false
var add_shallow = false
var addcount: int = 0
var poweradd: float = 1
func monster_56():
	if get_parent().get_parent() is LevelZLDHDGQ:
		poweradd = 2
		self.is_boss = true
		self.CannotAttract = true
		self.my_mr_name = "转轮·真法"
		self.attack_in = 0
		self.level = 50
		self.SHp = 350000
		self.Hp = self.SHp
		self.def = 400
		self.mdef = 400
		self.crit = 25
		self.miss = 35
		self.lucky = 0
		self.Htarget = 0
		self.Toughness = 6
		self.ar = 0
		self.sp = 0
		self.Critreduce = 12
		self.speed = 0
		self.mysee = 0
		self.attackRange = 0
		self.attackDesire = 0
		self.behit_calmtime = 0
		self.self_rhp = 1000
		self.add_exp = 0
		self.fall_coin = 0
		self.objattackDic["hit1"] = {
			"power": 200 * poweradd,
			"hurtBack":[-1,0],
			"attackKind": "magic"
		}
		self.objattackDic["hit2"] = {
			"power": 200 * poweradd,
			"hurtBack":[-1,-25],
			"attackKind": "magic"
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "zlwdahsp1",
				"value": 3
			},
			{
				"name": "zlwdahsp2",
				"value": 3
			},
		]	
		self.fall_stone_pro = 0.5
		self.fall_stone = [
			{
				"name": "putongzlwsz",
				"value": 0
			},
		]
		return
	self.is_boss = true
	self.CannotAttract = true
	self.my_mr_name = "转轮·真法"
	self.attack_in = 0
	self.level = 30
	self.SHp = 100000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 200
	self.crit = 18
	self.miss = 15
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 10
	self.ar = 0
	self.sp = 0
	self.Critreduce = 12
	self.speed = 0
	self.mysee = 0
	self.attackRange = 0
	self.attackDesire = 0
	self.behit_calmtime = 0
	self.self_rhp = 1000
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 200 * poweradd,
		"hurtBack":[-1,0],
		"attackKind": "magic"
	}
	self.objattackDic["hit2"] = {
		"power": 200 * poweradd,
		"hurtBack":[-1,-25],
		"attackKind": "magic"
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xyq",
			"value": 0
		},
		{
			"name": "syc",
			"value": 0
		},
		{
			"name": "nyd",
			"value": 0
		},
		{
			"name": "myz",
			"value": 0
		},
		{
			"name": "shyc",
			"value": 0
		}
	]	
	self.fall_stone_pro = 0.5
	self.fall_stone = [
		{
			"name": "ttlp2",
			"value": 1
		},
	]		
func _ready() -> void:
	Skill_1_CD = 4
	super._ready()
	monster_56()
func _physics_process(delta: float) -> void:
#	if not isCall:
#		addcount += 1
#		if addcount % randi_range(90,180) == 0:
#			Otherjg()
	if get_parent().get_parent() is LevelZLDHDGQ:
		if Hp <= 0:
			if Boss_4 == null:
				Boss_4 = Global.Create_Monster(142,get_parent(),Vector2(750,320)) as Monster142
	if is_on_floor():
		velocity.y = 0
	velocity.x = 0
	super._physics_process(delta)
func Monster_Intelligence():
	#shoudADD()
	if not Call_stage:
		# 815,210 2100, 20
		var pp = get_parent().get_parent()
		if not pp is Lhhj and not pp is LevelZLDHDGQ:
			Global.addZLw_stage(pp,Vector2(815,210),1,1,2060,true)
			Global.addZLw_stage(pp,Vector2(2100, 55),1,-1,860,false)
		Call_stage = true
	if Hp <= SHp  and  Hp > SHp * 0.8:
		throw_cout = 1
		self.objattackDic["hit1"] = {
			"power": 200 * poweradd,
			"hurtBack":[-1,0],
			"attackKind": "magic"
		}
		self.objattackDic["hit2"] = {
			"power": 90 * poweradd,
			"hurtBack":[-1,-5],
			"attackKind": "magic"
		}
	if Hp <= SHp * 0.8 and  Hp > SHp * 0.6:
		throw_cout = 2
		self.objattackDic["hit1"] = {
			"power": 500 * poweradd,
			"hurtBack":[-1,0],
			"attackKind": "magic"
		}
		self.objattackDic["hit2"] = {
			"power": 300 * poweradd,
			"hurtBack":[-1,-10],
			"attackKind": "magic"
		}
	if Hp <= SHp * 0.6 and  Hp > SHp * 0.4:
		throw_cout = 3
		self.objattackDic["hit1"] = {
			"power": 900 * poweradd,
			"hurtBack":[-1,0],
			"attackKind": "magic"
		}
		self.objattackDic["hit2"] = {
			"power": 500 * poweradd,
			"hurtBack":[-1,-15],
			"attackKind": "magic"
		}
	if Hp <= SHp * 0.4:
		throw_cout = 4
		self.objattackDic["hit1"] = {
			"power": 1500 * poweradd,
			"hurtBack":[-1,0],
			"attackKind": "magic"
		}
		self.objattackDic["hit2"] = {
			"power": 700 * poweradd,
			"hurtBack":[-1,-25],
			"attackKind": "magic",
			"addeffect":{
				"Name": "speed_down",
				"AddTime": 3,
				"ReduceInterval": 0,
				"value": 0.45,
				"DeBuff": true,
				"AttackKind": "",
				"CanAdd":false,
			}
		}
	if CurrentRound <= 0:
		Throw = false
	mr_player.play("wait")
	if is_on_floor():
		velocity.y = 0
	velocity.x = 0
	if Throw:
		if Skill_1_CD <= 0:
			ThrowRound(throw_cout)
	else:
		if Skill_1_CD <= 0:
			ReturnAllRound()
func ThrowRound(value):
	isCall = false
	Skill_1_CD = randi_range(3,5)
	var i = 0
	var IDxList = [0,1,2,3,4,5,6,7]
	var tween = get_tree().create_tween().set_parallel(true)
	for u in range(value):
		if CurrentRound > 0:
			var Round = Global.add_Bullet("Monster55Bullet",bullet,false,1,position,"hit1",self.objattackDic["hit1"])
			RoundList.push_back(Round)
			CurrentRound -= 1
	for u in RoundList:
		if IDxList.size() > 0:
			var get_num = IDxList.pick_random()
			var pp = RoundPosition[get_num] + position
			u.IsThrow = true
			tween.tween_property(u,"position",pp,2)
			u.is_throw_close.start(2)
			IDxList.erase(get_num)
	zlw_special_effect_2.CurrentCount -= value
	if zlw_special_effect_2.CurrentCount <= 0:
		zlw_special_effect_2.CurrentCount = 0
	#CurrentRound -= value
	if CurrentRound <= 0:
		CurrentRound = 0
	
func ReturnAllRound():
	Skill_1_CD = randi_range(3,5)
	IdxList = [0,1,2,3,4,5,6,7]
	var tween = get_tree().create_tween().set_parallel(true)
	if RoundList.size() > 0:
		for i in RoundList:
			if i != null:
				i.IsThrow = true
				tween.tween_property(i,"position",position,1)
				#add_WSEffect(i)
	await get_tree().create_timer(1.2,false).timeout
	for i in RoundList:
		if i != null:
			i.queue_free()
	RoundList.clear()	
	if not isCall:
		isCall = true
		CallJG(throw_cout)	
	CurrentRound = 8
	zlw_special_effect_2.CurrentCount = 8

func CallJG(lx):
	JGPP = [Vector2(-370,325),Vector2(-255,325),Vector2(-140,325),Vector2(-25,325),
				Vector2(90,325),Vector2(200,325),Vector2(310,325),Vector2(425,325)]
	var list = []	
	var jg:float		
	match lx:
		1:
			list = [Vector2(-370,325),Vector2(425,325)]
			jg = 0.01
		2:
			list = [Vector2(-370,325),Vector2(-25,325),Vector2(90,325),Vector2(425,325)]
			jg = 0.02
		3:
			list = [Vector2(-370,325),Vector2(-255,325),Vector2(-25,325),Vector2(90,325),Vector2(310,325),Vector2(425,325)]
			jg = 0.02
		4:
			list = [Vector2(-255,325),Vector2(-140,325),Vector2(-25,325),
				Vector2(90,325),Vector2(200,325),Vector2(310,325),Vector2(425,325)]
			jg = 0.4
			list.reverse()
			for i in list:
				Global.add_Bullet("Monster56Bullet",bullet,false,1,i + position,"hit2",self.objattackDic["hit2"])
				await get_tree().create_timer(jg,false).timeout
			await get_tree().create_timer(1.8,false).timeout	
			list = [Vector2(-370,325),Vector2(-255,325),Vector2(-140,325),Vector2(-25,325),
				Vector2(90,325),Vector2(200,325),Vector2(310,325)]
			for i in list:
				Global.add_Bullet("Monster56Bullet",bullet,false,1,i + position,"hit2",self.objattackDic["hit2"])
				await get_tree().create_timer(jg,false).timeout
			await get_tree().create_timer(1.8,false).timeout
			list = [Vector2(-370,325),Vector2(-255,325),Vector2(-140,325),Vector2(200,325),Vector2(310,325),Vector2(425,325)]
			for i in list:
				Global.add_Bullet("Monster56Bullet",bullet,false,1,i + position,"hit2",self.objattackDic["hit2"])
				await get_tree().create_timer(0,false).timeout
			await get_tree().create_timer(1.8,false).timeout
			list = [Vector2(-255,325),Vector2(-140,325),Vector2(-25,325),
				Vector2(90,325),Vector2(200,325),Vector2(310,325)]
			for i in list:
				Global.add_Bullet("Monster56Bullet",bullet,false,1,i + position,"hit2",self.objattackDic["hit2"])
				await get_tree().create_timer(0,false).timeout
			await get_tree().create_timer(2,false).timeout
			Throw = true	
			return
	for i in list:
		Global.add_Bullet("Monster56Bullet",bullet,false,1,i + position,"hit2",self.objattackDic["hit2"])
		await get_tree().create_timer(jg,false).timeout
	Throw = true	
	pass

func Otherjg():

	for i in range(randi_range(3,throw_cout * 2)):
		Global.add_Bullet("Monster56Bullet",bullet,false,1,Vector2(randi_range(-370,425),325) + position,"hit2",self.objattackDic["hit2"])
