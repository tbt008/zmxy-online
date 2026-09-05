extends BaseMonster
class_name Monster34
var should_death = false
func monster_34():
	self.is_boss = true
	self.my_mr_name = "傀儡"
	self.attack_in = 120
	self.level = 999
	self.SHp = 999999999
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 8
	self.miss = 10
	self.lucky = 20
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 400
	self.attackRange = 260
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 240,
		"hurtBack":[-8,-15],
		"attackKind": "real",
	}
	self.fall_pro = 0.0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_34()
	Skill_1_CD = 0


