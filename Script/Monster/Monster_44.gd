extends BaseMonster
class_name Monster44
var MonsterList = [39,40,30,31]
var Curecount: int = 0
func monster_44():
	self.is_bt = true
	self.CannotAttract = true
	preload("res://Scene/Monster/Monster_39.tscn")
	preload("res://Scene/Monster/Monster_40.tscn")
	preload("res://Scene/Monster/Monster_28.tscn")
	preload("res://Scene/Monster/Monster_27.tscn")
	preload("res://Scene/Monster/Monster_26.tscn")
	preload("res://Scene/Monster/Monster_30.tscn")
	preload("res://Scene/Monster/Monster_31.tscn")
	preload("res://Scene/Monster/Monster_23.tscn")
	preload("res://Scene/Monster/Monster_29.tscn")
	self.is_boss = true
	self.my_mr_name = "鬼门·生灵"
	self.attack_in = 0
	self.level = 90
	self.SHp = 12000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 0
	self.mysee = 0
	self.attackRange = 0
	self.attackDesire = 0
	self.behit_calmtime = 0.0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
	}
	self.fall_pro = 1
	self.fall_list = [
		{
			"name": "yll",
			"value": randi_range(1,10)
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	monster_44()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
func Monster_Intelligence():

	if Curecount % 60 == 0:
		MonsterCall()
	Curecount += 1
func MonsterCall():
	var BaseLevel_ = get_parent().get_parent() as BaseLevel
	if BaseLevel_.monster.get_children().size() < 6:
		var ChlidMonster = MonsterList[randi_range(0,MonsterList.size() - 1)]
		var mm = Global.Create_Monster(ChlidMonster,get_parent(),Vector2(self.position.x,self.position.y - 30))
		if mm is BaseMonster:
			if mm.is_boss:
				mm.is_boss = false
			if mm.SHp > 10000:
				mm.SHp = mm.SHp * randf_range(1.2,1.8)
				mm.Hp = mm.SHp
			else:
				mm.SHp = 5000
				mm.Hp = mm.SHp
			mm.def = 150
			mm.mdef = 150
			for u in mm.objattackDic:
				if mm.objattackDic[u].has("power"):
					if mm.objattackDic[u]["power"] <= 150:
						mm.objattackDic[u]["power"] = 150
						mm.objattackDic[u]["power"] = mm.objattackDic[u]["power"] * 1.5
					else:
						mm.objattackDic[u]["power"] = mm.objattackDic[u]["power"] * 1.5
