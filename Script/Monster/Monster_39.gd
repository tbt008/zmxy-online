extends BaseMonster
class_name Monster39
func monster_39():
	self.is_boss = false
	self.my_mr_name = "马面"
	self.attack_in = 10
	self.level = 27
	self.SHp = 2000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 8
	self.miss = 6
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 300
	self.attackRange = 145
	self.attackDesire = 70
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 60
	self.fall_coin = 25
	self.objattackDic["hit1"] = {
		"power": 98,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 3,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 1,
			"value": 30,
			"AttackKind": "physics",
		}
	}
	
	self.fall_pro = 0.03
	self.fall_list = [
		{
			"name": "gtq",
			"value": 0
		},

	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_39()

