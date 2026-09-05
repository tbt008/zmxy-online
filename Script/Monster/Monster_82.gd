extends BaseMonster
class_name Monster82
func monster_82():
	self.CHangeClamCount = 3
	self.IsSmartMonster = true
	self.SmartWaitCount = 60
	self.SmartHitCount = 40
	self.is_boss = false
	self.my_mr_name = "天兵·弓"
	self.attack_in = 10
	self.level = 35
	self.SHp = 6000
	self.Hp = self.SHp
	self.def = 130
	self.mdef = 130
	self.crit = 25
	self.miss = 0
	self.lucky = 0
	self.Htarget = 58
	self.Toughness = 0
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 800
	self.attackRange = 355
	self.attackDesire = 85
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 110
	self.fall_coin = 90
	self.objattackDic["hit1"] = {
		"power": 325,
		"hurtBack":[-15,-12],
		"attackKind": "physics",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0.7,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.3
	self.fall_list = [
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
	self.fall_stone_pro = 0.1
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]	
func _ready() -> void:
	super._ready()
	monster_82()

func ADDBullet():
	var TargetPosition: Vector2
	if MonsterDirection:
		TargetPosition = Vector2(30,5)
	else:
		TargetPosition = Vector2(-30,5)
	var Arrow = Global.add_Bullet("Monster82Bullet",self.bullet,MonsterDirection,1,TargetPosition + position,"hit1",self.objattackDic["hit1"])
	Arrow.scale = Vector2(0.7,0.7)
