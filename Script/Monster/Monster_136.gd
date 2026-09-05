extends BaseMonster
class_name Monster136

func monster_136():
	self.is_Fly = true
	self.is_boss = false
	self.my_mr_name = "持国傀儡"
	self.attack_in = 90
	self.level = 35
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 170
	self.mdef = 170
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 500
	self.attackRange = 145
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 135
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
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
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_136()
