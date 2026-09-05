extends BaseMonster
class_name Monster1
func monster_1():
	self.is_boss = false
	self.my_mr_name = "小猴子"
	self.attack_in = 90
	self.level = 5
	self.SHp = 60
	self.Hp = self.SHp
	self.def = 50
	self.mdef = 80
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 300
	self.attackRange = 45
	self.attackDesire = 70
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 1
	self.fall_coin = 1
	self.objattackDic["hit1"] = {
		"power": 10,
		"hurtBack":[-3,-6],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.fall_pro = 0.22
	self.fall_list = [
		{
			"name": "ptxzg",
			"value": 0
		},
		{
			"name": "ptxzf",
			"value": 0
		},
		{
			"name": "ptsmz",
			"value": 0
		},
		{
			"name": "ptjs",
			"value": 0
		},
		{
			"name": "ptdp",
			"value": 0
		},
		{
			"name": "ptcs",
			"value": 0
		},
		{
			"name": "ptyyc",
			"value": 0
		},
		{
			"name": "ptcp",
			"value": 0
		},
		{
			"name": "pttq",
			"value": 0
		},
		{
			"name": "ptcf",
			"value": 0
		},
	]		
	self.fall_stone_pro = 0
	self.fall_stone = [

	]	
func _ready() -> void:
	super._ready()
	monster_1()
