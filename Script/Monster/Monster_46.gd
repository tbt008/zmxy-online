extends BaseMonster
class_name Monster46
var Curecount: int = 0
var DeBuffList = [
	{
		"Name": "stun",
		"AddTime": 2,
		"ReduceInterval": 0,
		"value": 0,
		"AttackKind": "",
		"CanAdd":false,
		"DeBuff": true,
	},
	{
		"Name": "Ice",
		"AddTime": 2,
		"ReduceInterval": 0,
		"value": 0,
		"AttackKind": "",
		"CanAdd":false,
		"DeBuff": true,
	},
	{
		"Name": "Fire",
		"AddTime": 5,
		"ReduceInterval": 1,
		"value": int(RoleProp.roleprop.SHp * 0.01),
		"AttackKind": "real",
		"CanAdd":true,
		"DeBuff": true,
	},
	{
		"Name": "poision",
		"AddTime": 5,
		"ReduceInterval": 1,
		"value": int(RoleProp.roleprop.SHp * 0.02),
		"AttackKind": "magic",
		"CanAdd":true,
		"DeBuff": true,
	}
]
func monster_46():
	self.is_bt = true
	self.is_boss = true
	self.CannotAttract = true
	self.my_mr_name = "鬼门·地狱"
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
	monster_46()
	Curecount = 0
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
func Monster_Intelligence():
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0
	if Curecount % 60 == 0:
		RoleReduceHp()
	if Curecount % 600 == 0:
		RoleAddDeBuff()
	Curecount += 1
func RoleReduceHp():
	if not PlayerData.ChekEqzb("头衔","sxyr"):
		get_Player.effect_reducehp(int(RoleProp.roleprop.SHp * 0.01),"real")
func RoleAddDeBuff():
	Global.AddBuff(get_Player.buff,DeBuffList[randi_range(0,3)])
