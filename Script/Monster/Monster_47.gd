extends BaseMonster
class_name Monster47
var FishCount: int = 0
var pp: Vector2
var CanHit = false
func monster_47():
	self.is_boss = false
	self.CannotAttract = true
	self.my_mr_name = "鱼"
	self.attack_in = 0
	self.level = RoleProp.baseroleprop.Level
	self.SHp = 1
	self.Hp = self.SHp
	self.def = 0
	self.mdef = 0
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
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": int(RoleProp.roleprop.SHp * 0.04) + 1,
		"hurtBack":[-15,-3],
		"attackKind": "real"
	}
	self.objattackDic["hit2"] = {
		"power": int(RoleProp.roleprop.SHp * 0.04) + 1,
		"hurtBack":[-15,-3],
		"attackKind": "real",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"CanAdd":true,
			"DeBuff": true,
			"value": int(RoleProp.roleprop.SHp * 0.01) + 1,
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	monster_47()
	await get_tree().create_timer(4,false).timeout
	CanHit = true
func Monster_Intelligence():
	if CanHit:
		if FishCount > 0:
			FishCount -= 1
		if FishCount <= 0:
			CallFish()
func CallFish():
	var hit_name_: String
	if randi_range(0,100) < 30:
		hit_name_ = "hit2"
	else:
		hit_name_ = "hit1"
	for i in range(4,8):
		var Position = Vector2(randi_range(-90,90),randi_range(140,200)) + self.position
		if randi_range(0,100) < 50:
			Global.add_Bullet("Fish_1",bullet,false,1,Position,hit_name_,self.objattackDic[hit_name_])
		else:
			Global.add_Bullet("Fish_2",bullet,false,1,Position,hit_name_,self.objattackDic[hit_name_])
	FishCount = randi_range(80,160)
	
