extends BaseMonster
class_name Monster90


func monster_90():
	self.is_Fly = true
	self.is_boss = false
	self.my_mr_name = "蛇妖"
	self.attack_in = 90
	self.level = 35
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 120
	self.mdef = 150
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
	self.attackRange = 365
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 150
	self.fall_coin = 110
	self.objattackDic["hit1"] = {
		"power": 300,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "sichou",
			"value": randi_range(1,3)
		},
		{
			"name": "xuantie",
			"value": randi_range(1,3)
		},
		{
			"name": "tanmu",
			"value": randi_range(1,3)
		},
	]
	self.fall_stone_pro = 0.1
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_90()
func ADDBullet():
	var Position: Vector2
	if MonsterDirection:
		Position = Vector2(50,5)
	else:
		Position = Vector2(-50,5)
	Global.add_Bullet("Monster90Bullet",self.bullet,MonsterDirection,1,Position + position,"hit1",self.objattackDic["hit1"])
