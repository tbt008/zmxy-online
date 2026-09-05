extends BaseMonster
class_name Monster52

func monster_52():
	self.is_boss = false
	self.my_mr_name = "河童"
	self.attack_in = 0
	self.level = 30
	self.SHp = 2500
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 130
	self.crit = 8
	self.miss = 8
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = -20
	self.ar = 20
	self.sp = 0
	self.Critreduce = 10
	self.speed = 7
	self.mysee = 400
	self.attackRange = 120
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 75
	self.fall_coin = 40
	self.objattackDic["hit1"] = {
		"power": 130,
		"hurtBack":[-8,0],
		"attackKind": "physics",
	}
	
	self.fall_pro = 0.05
	self.fall_list = [
		{
			"name": "qssp",
			"value": 1
		},
		{
			"name": "yazfw",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	monster_52()
