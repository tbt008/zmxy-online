extends BaseMonster
class_name Monster50
var is_stop: bool = false
var CallMonsterList:Dictionary = {
	"List_0" : [18,20,23],
	"List_1" : [37,43,41]
}
var CallMonsterID: int = 0
var CallMonster: BaseMonster
var is_BeCall = false
func monster_50():
	self.is_boss = true
	self.my_mr_name = "孟婆"
	self.attack_in = 20
	self.level = 30
	self.SHp = 35000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 120
	self.crit = 18
	self.miss = 16
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 5
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 400
	self.attackRange = 255
	self.attackDesire = 80
	self.behit_calmtime = 0.1
	self.self_rhp = 0
	self.add_exp = 500
	self.fall_coin = 130
	self.objattackDic["hit1"] = {
		"power": 260,
		"hurtBack":[-8,-7],
		"attackKind": "magic"
	}
	self.objattackDic["mffd_1"] = {
		"power": int(RoleProp.roleprop.SHp * 0.05 + 100),
		"hurtBack":[-8,-5],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Ice",
			"AddTime": 4,
			"ReduceInterval": 0,
			"CanAdd":false,
			"DeBuff": true,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["mffd_2"] = {
		"power": int(RoleProp.roleprop.SHp * 0.05 + 100),
		"hurtBack":[-8,-5],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Fire",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"CanAdd":true,
			"DeBuff": true,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xhgp",
			"value": 0
		},
		{
			"name": "xhxh",
			"value": 0
		},
		{
			"name": "xhymk",
			"value": 0
		},
		{
			"name": "xhyk",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_50()
	Skill_1_CD = 0
	Skill_2_CD = 0
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if not is_stop:
		CreateMonster()
		Move()
		self.self_rhp = 0
	else:
		self.self_rhp = randi_range(150,250)
		CheckCallMonsterDeath()
		Stop()
func Monster_Intelligence():
	if is_BeCall:
		velocity.x = 0
		self.modulate = Color(1,1,1,0.0)
		$BaseDamageBox/HurtBox/HurtBox.disabled = true
		return
	else:
		if abs(RoleProp.role_pos_x - position.x) < mysee:
			has_target = true
		if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
			if has_target == false:
				normal_state()
			else:
				if not is_stop:
					if abs(self.position.x - RoleProp.role_pos_x) > attackRange:
						have_target()
						if Skill_1_CD <= 0:
							do_hit_2()
						elif Skill_2_CD <= 0:
							do_hit_3()
					else:
						if Skill_1_CD <= 0:
							do_hit_2()
						elif Skill_2_CD <= 0:
							do_hit_3()
						else:
							if count % 60 == 0:
								attack_target()
							else:
								stop_move()
func do_hit_2():
	Skill_1_CD = 12
	hit_name = "nlls"
	velocity.x = 0
	is_attacking = true
	mr_player.play("nlls")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 10
	velocity.x = 0
	is_attacking = true
	mr_player.play("mffd")
	await mr_player.animation_finished
	is_attacking = false	
func Stop():
	mr_player.play("wait")
	$BaseDamageBox/HurtBox/HurtBox.disabled = true
	self.modulate = Color(1,1,1,0.5)
func Move():
	self.modulate = Color(1,1,1,1)
func CreateMonster():
	#print("0")
	if CallMonsterID == 0:
		if Hp < SHp * 0.5:
			self.modulate = Color(1,1,1,0.5)
			$BaseDamageBox/HurtBox/HurtBox.disabled = true
			var Get_list = CallMonsterList["List_" + str(CallMonsterID)]
			var MonsterID: int = Get_list[randi_range(0,Get_list.size() - 1)]
			if CallMonster == null:
				CallMonster = Global.Create_Monster(20,get_parent(),self.position)
			StrenghBoss()
			is_stop = true
			mr_player.play("wait")
			CallMonsterID = 1
	elif CallMonsterID == 1:
		if Hp < SHp * 0.25:
			is_stop = true
			mr_player.play("wait")
			self.modulate = Color(1,1,1,0.5)
			$BaseDamageBox/HurtBox/HurtBox.disabled = true
			var Get_list = CallMonsterList["List_" + str(CallMonsterID)]
			var MonsterID: int = Get_list[randi_range(0,Get_list.size() - 1)]
			if CallMonster == null:
				CallMonster = Global.Create_Monster(43,get_parent(),self.position)
			StrenghBoss()
			CallMonsterID = 2
func CheckCallMonsterDeath():
	if CallMonster != null:
		if CallMonster.is_death:
			is_stop = false
			self.modulate = Color(1,1,1,1)
			$BaseDamageBox/HurtBox/HurtBox.disabled = false
			CallMonster = null
func add_nlls():
	Global.AddBuff(get_Player.buff,{
			"Name": "nlls",
			"AddTime": 6,
			"ReduceInterval": 0.01,
			"value": 1.2,
			"AttackKind": "magic",
			"CanAdd": true,
			"DeBuff": true,
		})
func CallBullet():
	var Bullet_
	var BulletName: String
	var Hit_name: String
	if randi_range(0,100) < 50:
		BulletName = "Monster49Bullet_1"
		Hit_name = "mffd_1"
	else:
		BulletName = "Monster49Bullet_2"
		Hit_name = "mffd_2"
	if MonsterDirection:
		Bullet_ = Global.CallChaseBullet(self.bullet,BulletName,330,4,false,Vector2(self.position.x + 220,self.position.y - 180),Hit_name,self.objattackDic[Hit_name])
	else:
		Bullet_ = Global.CallChaseBullet(self.bullet,BulletName,330,4,false,Vector2(self.position.x - 220,self.position.y - 180),Hit_name,self.objattackDic[Hit_name])
	Bullet_.scale = Vector2(2,2)
func StrenghBoss():
	if CallMonster != null:
		
		if CallMonster is Monster43:
			CallMonster.SHp = SHp
			CallMonster.my_mr_name = "邪·阎罗王"
		elif CallMonster is Monster20:
			CallMonster.my_mr_name = "邪·鲨魔王"
			CallMonster.SHp = SHp * 0.75
		CallMonster.Hp = CallMonster.SHp
		CallMonster.level = level
		CallMonster.def = def * 1.1
		CallMonster.mdef = mdef * 1.1
		CallMonster.fall_pro = 0
		CallMonster.Hp = CallMonster.SHp
		CallMonster.speed = speed
		CallMonster.modulate = Color("00ffff")
		CallMonster.fall_list = []
		if CallMonster is Monster20:
			for i in CallMonster.objattackDic:
				if CallMonster.objattackDic[i].has("power"):
					CallMonster.objattackDic[i]["power"] = randi_range(265,330)
				
func call_fly_bullet():
	if self.MonsterDirection:
		var pp = Global.CallFlyBullet(self.bullet,"Monster49Bulet",1,Vector2(position.x,position.y + 30),2500,-900,"hit1",self.objattackDic["hit1"])
		pp.animated_sprite_2d.flip_h = true
	else:
		Global.CallFlyBullet(self.bullet,"Monster49Bulet",1,Vector2(position.x ,position.y + 30),2500,900,"hit1",self.objattackDic["hit1"])
