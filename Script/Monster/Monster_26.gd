extends BaseMonster
class_name Monster26
func monster_26():
	self.rush_speed = 150
	self.is_boss = false
	self.my_mr_name = "鬼灯"
	self.attack_in = 10
	self.level = 25
	self.SHp = 1300
	self.Hp = self.SHp
	self.def = 120
	self.mdef = 120
	self.crit = 20
	self.miss = 15
	self.lucky = 0
	self.Htarget = 10
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 300
	self.attackRange = 45
	self.attackDesire = 80
	self.behit_calmtime = 0.1
	self.self_rhp = 0
	self.add_exp = 60
	self.fall_coin = 22
	self.objattackDic["hit1"] = {
		"power": 175,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 3,
			"ReduceInterval": 0.5,
			"CanAdd":true,
			"DeBuff": true,
			"value": 50,
			"AttackKind": "magic",
		}
	}
	self.fall_pro = 0.00
	self.fall_list = [
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_26()
