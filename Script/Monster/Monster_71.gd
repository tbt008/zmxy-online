extends BaseMonster
class_name Monster71
#var MyFather: Monster70
#var HitCount: int = 0
#var DeathCount: int = 0
#func monster_71():
#	self.is_boss = false
#	self.CannotAttract = true
#	self.my_mr_name = "剧毒蛇杖"
#	self.attack_in = 0
#	self.level = RoleProp.baseroleprop.Level + 2
#	self.SHp = 120000
#	self.Hp = self.SHp
#	self.def = 400
#	self.mdef = 400
#	self.crit = 0
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 0
#	self.sp = 0
#	self.Critreduce = 0
#	self.speed = 0
#	self.mysee = 0
#	self.attackRange = 0
#	self.attackDesire = 0
#	self.behit_calmtime = 0
#	self.self_rhp = 0
#	self.add_exp = 0
#	self.fall_coin = 0
#	self.objattackDic["hit1"] = {
#		"power": 738,
#		"hurtBack":[-7,-9],
#		"attackKind": "magic",
#		"addeffect":{
#			"Name": "poision",
#			"AddTime": 3,
#			"ReduceInterval": 1,
#			"CanAdd":true,
#			"DeBuff": true,
#			"value": int(RoleProp.roleprop.SHp * 0.01),
#			"AttackKind": "magic",
#		}
#	}
#	self.fall_pro = 0
#	self.fall_list = []	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_71()
#
#func Monster_Intelligence():
#	velocity.x = 0
#	HitCount += 1
#	DeathCount += 1
#	if HitCount % 60 == 0 and DeathCount < 900 :
#		mr_player.play("Hit")
#	if DeathCount == 900:
#		FatherCureHp()
#		mr_player.play("death")
#func FatherCureHp():
#	if MyFather != null:
#		MyFather.cure_hp(MyFather.SHp * 0.05)
#
#func CallBullet():
#	var Position: Vector2
#	if MonsterDirection:
#		Position = Vector2(35,-35)
#	else:
#		Position = Vector2(-34,-35)
#	Global.add_Bullet("Monster71Bullet",self.bullet,MonsterDirection,1,Position + position,"hit1",self.objattackDic["hit1"])	
#func state_hurt():
#	return
