extends BaseMonster
class_name Monster81

func monster_81():
	self.CHangeClamCount = 2
	self.IsSmartMonster = true
	self.SmartWaitCount = 60
	self.SmartHitCount = 60
	self.is_boss = false
	self.my_mr_name = "天兵·刀"
	self.attack_in = 10
	self.level = 35
	self.SHp = 7000
	self.Hp = self.SHp
	self.def = 160
	self.mdef = 160
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 18
	self.Toughness = 0
	self.ar = 8
	self.sp = 8
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 135
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 110
	self.fall_coin = 90
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 3,
			"ReduceInterval": 0.5,
			"value": 30,
			"AttackKind": "real",
			"CanAdd":true,
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
	monster_81()


