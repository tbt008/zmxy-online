extends BaseMonster
class_name Monster95
var LevelBase
var Stage = 1
func monster_95():
	self.is_boss = false
	self.my_mr_name = "天兵·锤"
	self.attack_in = 90
	self.level = 35
	self.SHp = 6000 + Stage * 3000
	self.Hp = self.SHp
	self.def = 100 + Stage * 25
	self.mdef = 100 + Stage * 25
	self.crit = 0 + Stage * 15
	self.miss = 0 + Stage * 5
	self.lucky = 0 + Stage * 15
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 15 + Stage * 10
	self.sp = 15 + Stage * 10
	self.Critreduce = 0
	self.speed = 8 + Stage * 2
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 75 + Stage * 10
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 160
	self.fall_coin = 110
	self.objattackDic["hit1"] = {
		"power": 150 + Stage * 45,
		"hurtBack":[-8,-12],
		"attackKind": "physics",
		"HitProtect": 20,
		"addeffect":{
			"Name": "stun",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0.2
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	LevelBase = get_parent().get_parent()
	if LevelBase is Levelpty:
		Stage = 0
	super._ready()
	monster_95()
