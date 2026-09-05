extends BaseMonster
class_name Monster51
var CheckCount: int = 0
func monster_51():
	self.is_boss = false
	self.my_mr_name = "沙华"
	self.attack_in = 0
	self.level = 30
	self.SHp = 3000
	self.Hp = self.SHp
	self.def = 170
	self.mdef = 130
	self.crit = 22
	self.miss = 10
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 20
	self.sp = 0
	self.Critreduce = 0
	self.speed = 7
	self.mysee = 400
	self.attackRange = 90
	self.attackDesire = 75
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 75
	self.fall_coin = 40
	self.objattackDic["hit1"] = {
		"power": 150,
		"hurtBack":[-8,0],
		"attackKind": "physics",
	}
	
	self.fall_pro = 0.05
	self.fall_list = [
		{
			"name": "lssp",
			"value": 1
		},
		{
			"name": "zshb",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	monster_51()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if CheckCount % 60 == 0:
		if check_have_mz() and Hp > 0:
			cure_hp(int(self.SHp * 0.03))
	CheckCount += 1
func check_have_mz():
	var pp = get_parent().get_parent() as BaseLevel
	for i in pp.monster.get_children():
		if i is Monster53:
			return true
	return false
