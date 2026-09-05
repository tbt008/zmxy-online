extends BaseMonster
class_name Monster9
func monster_9():
	self.is_boss = false
	self.my_mr_name = "地鼠精"
	self.attack_in = 10
	self.level = 18
	self.SHp = 450
	self.Hp = self.SHp
	self.def = 60
	self.mdef = 70
	self.crit = 8
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 7
	self.mysee = 300
	self.attackRange = 75
	self.attackDesire = 50
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 20
	self.fall_coin = 4
	self.objattackDic["hit1"] = {
		"power": 35,
		"hurtBack":[-4,-9],
		"attackKind": "physics"
	}
	
	self.fall_pro = 0.2
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
	]		
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_9()

