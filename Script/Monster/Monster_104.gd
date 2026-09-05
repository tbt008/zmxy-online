extends BaseMonster
class_name Monster104


func monster_104():
	self.is_boss = false
	self.my_mr_name = "硫磺童子"
	self.attack_in = 90
	self.level = 50
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 500
	self.attackRange = 365
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 220
	self.fall_coin = 220
	self.objattackDic["hit1"] = {
		"power": 300,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": 100,
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.objattackDic["hit2"] = {
		"power": 600,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "Fire",
			"AddTime": 8,
			"ReduceInterval": 1,
			"value": 150,
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
		},
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "liuhuang",
			"value": randi_range(1,2)
		},
	]
	self.fall_stone_pro = 0.28
	self.fall_stone = [
		{
			"name": "ziyanyujin",
			"value": randi_range(1,5)
		},
	]	
func _ready() -> void:
	super._ready()
	monster_104()
func CallBullet1():
	var Bullets
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster104Bullet",self.bullet,MonsterDirection,1,Vector2(30,25) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullets = Global.add_Bullet("Monster104Bullet",self.bullet,MonsterDirection,1,Vector2(-30,25) + position,"hit1",self.objattackDic["hit1"])
func state_death():
	hit_name = "hit2"
	super.state_death()
