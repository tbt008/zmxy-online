extends BaseMonster
class_name Monster45
var Curecount: int = 0
func monster_45():
	self.is_bt = true
	self.is_boss = true
	self.CannotAttract = true
	self.my_mr_name = "鬼门·贪婪"
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
	self.Toughness = 25
	self.ar = 0
	self.sp = 0
	self.Critreduce = 25
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
	self.fall_pro = 0.5
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
	monster_45()	
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
func Monster_Intelligence():
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
	if Curecount % 120 == 0:
		MonsterCureHp()
	Curecount += 1
func MonsterCureHp():
	var BaseLevel_ = get_parent().get_parent() as BaseLevel
	for i in BaseLevel_.monster.get_children():
		if i != null:
			if i is BaseMonster and not i is Monster138:
				i.cure_hp(i.SHp * 0.02)
				if i.Hp >= i.SHp:
					i.hd += i.SHp * 0.02
					i.max_hd = i.hd
