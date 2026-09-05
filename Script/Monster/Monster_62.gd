extends BaseMonster
class_name Monster62
#var DeathCount: int = 0
#var XYcount: int = 0
#func monster_62():
#	self.is_boss = false
#	self.CannotAttract = true
#	self.my_mr_name = "死亡墓碑"
#	self.attack_in = 0
#	self.level = RoleProp.baseroleprop.Level
#	self.SHp = 500000
#	self.Hp = self.SHp
#	self.def = 300
#	self.mdef = 300
#	self.crit = 0
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 60
#	self.sp = 60
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
#		"power": 0,
#		"hurtBack":[0,0],
#		"attackKind": "",
#	}
#	self.fall_pro = 0
#	self.fall_list = []	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_62()
#	Skill_1_CD = 0
#	Skill_2_CD = 0
#	Skill_3_CD = 0
#	Skill_4_CD = 0
#func _physics_process(delta: float) -> void:
#	velocity.x = 0
#	if not is_on_floor():
#		mr_player.play("begin")
#	else:
#		velocity.y = 0
#		if Hp > 0:
#			mr_player.play("wait")
#			DeathCount += 1
#			XYcount += 1
#			if DeathCount % 60 == 0:
#				RoleReduceProp()
#			if XYcount % 180 == 0:
#				move_playerto_boss(0.3)
#				Global.AddBuff(get_Player.buff,{
#			"Name": "speed_down",
#			"AddTime": 1,
#			"ReduceInterval": 0,
#			"value": 0.6,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		})
#	super._physics_process(delta)
#func Monster_Intelligence():
#	velocity.x = 0
#	if not is_on_floor():
#		mr_player.play("begin")
#	else:
#		velocity.y = 0
#		if Hp > 0:
#			mr_player.play("wait")
#			DeathCount += 1
#			XYcount += 1
#			if DeathCount % 60 == 0:
#				RoleReduceProp()
#			if XYcount % 180 == 0:
#				move_playerto_boss(0.3)
#				Global.AddBuff(get_Player.buff,{
#			"Name": "speed_down",
#			"AddTime": 1,
#			"ReduceInterval": 0,
#			"value": 0.6,
#			"AttackKind": "",
#			"CanAdd":false,
#			"DeBuff": true,
#		})
#func RoleReduceProp():
#	if get_Player != null:
#		if get_Player is BaseHero:
#			get_Player.effect_reducehp(randi_range(100,200),"real")
#			RoleProp.roleprop.Mp -= 20
