extends BaseMonster
class_name Monster133
var MyParent: Monster132
var DeathCount: int = 900
func monster_133():
	self.CannotAttract = true
	self.is_boss = false
	self.NoTarget = true
	self.my_mr_name = "天庭战神幻影"
	self.attack_in = 0
	self.level = 1500
	self.SHp = 9999999999
	self.Hp = self.SHp
	self.def = 9999999
	self.mdef = 9999999
	self.crit = 50
	self.miss = 25
	self.lucky = 115
	self.Htarget = 35
	self.Toughness = 0
	self.ar = 40
	self.sp = 40
	self.Critreduce = 0
	self.speed = 0
	self.mysee = 600
	self.attackRange = 245
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 150,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []		
func _ready() -> void:
	super._ready()
	monster_133()
func _physics_process(delta: float) -> void:
	if MyParent != null:
		self.objattackDic["hit1"] = MyParent.objattackDic["hit1"]
	else:
		Hp = -10
	super._physics_process(delta)
	velocity = Vector2(0,0)
	ShouldInSky = true
	DeathCount -= 1
	if DeathCount <= 0:
		Hp = -10
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not cannotchangestatewhenattorbeatt():
		stop_move()
		if abs(position.x - RoleProp.role_pos_x) <= attackRange:
			if count % 60 == 0:
				if randi_range(0,100) < attackDesire:
					attack_target()
