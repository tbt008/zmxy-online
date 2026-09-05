extends BaseMonster
class_name Monster135
func monster_135():
	self.is_boss = false
	self.my_mr_name = "天王使者"
	self.attack_in = 90
	self.level = 35
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 175
	self.mdef = 170
	self.crit = 20
	self.miss = 0
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 0
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 600
	self.attackRange = 135
	self.attackDesire = 70
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 150
	self.objattackDic["hit1"] = {
		"power": 400,
		"hurtBack":[-3,-6],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.fall_pro = 0.0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_135()
