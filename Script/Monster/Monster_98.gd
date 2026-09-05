extends BaseMonster
class_name Monster98

func monster_98():
	self.is_boss = false
	self.my_mr_name = "长刀护卫"
	self.attack_in = 60
	self.level = 40
	self.SHp = 7000 + Global.LLBTLevel * 400
	self.Hp = self.SHp
	self.def = 110 + Global.LLBTLevel * 2
	self.mdef = 110 + Global.LLBTLevel * 2
	self.crit = 0 + Global.LLBTLevel * 2
	self.miss = 0 + Global.LLBTLevel * 1
	self.lucky = 0 + Global.LLBTLevel * 5
	self.Htarget = 0 + Global.LLBTLevel * 2
	self.Toughness = 0
	self.ar = 7 + Global.LLBTLevel * 1
	self.sp = 7 + Global.LLBTLevel * 1
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 500
	self.attackRange = 175
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 60  + Global.LLBTLevel * 5
	self.fall_coin = 75  + Global.LLBTLevel * 6
	self.objattackDic["hit1"] = {
		"power": 350  + Global.LLBTLevel * 5,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,

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
	self.fall_stone_pro = 0.07
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_98()
