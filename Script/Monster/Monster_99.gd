extends BaseMonster
class_name Monster99

func monster_99():
	self.is_boss = false
	self.is_Fly = true
	self.my_mr_name = "黑雕护卫"
	self.attack_in = 60
	self.level = 40
	self.SHp = 8000 + Global.LLBTLevel * 350
	self.Hp = self.SHp
	self.def = 90 + Global.LLBTLevel * 2
	self.mdef = 90 + Global.LLBTLevel * 2
	self.crit = 0 + Global.LLBTLevel * 1.5
	self.miss = 0 + Global.LLBTLevel * 1
	self.lucky = 0 + Global.LLBTLevel * 10
	self.Htarget = 0 + Global.LLBTLevel * 1
	self.Toughness = 0
	self.ar = 7 + Global.LLBTLevel * 1
	self.sp = 7 + Global.LLBTLevel * 1
	self.Critreduce = 0
	self.speed = 15
	self.mysee = 500
	self.attackRange = 255
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 60  + Global.LLBTLevel * 5
	self.fall_coin = 70  + Global.LLBTLevel * 6
	self.objattackDic["hit1"] = {
		"power": 270  + Global.LLBTLevel * 10,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,

	}
	self.fall_pro = 0.5
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
	monster_99()
func CallBullet():
	var Bullets
	
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster99Bullet",self.bullet,false,1,Vector2(40,20) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullets = Global.add_Bullet("Monster99Bullet",self.bullet,false,1,Vector2(-40,20) + position,"hit1",self.objattackDic["hit1"])
	Bullets.look_at(get_Player.position)
	
