extends BaseMonster
class_name Monster49
var is_stop: bool = false
var CallMonsterList:Dictionary = {
	"List_0" : [4,5,11],
	"List_1" : [28,30,31]
}
var CallMonsterID: int = 0
var CallMonster: BaseMonster
var is_cr: bool = false
func monster_49():
	self.is_boss = true
	self.my_mr_name = "孟婆"
	self.attack_in = 20
	self.level = 30
	self.SHp = 30000
	self.Hp = self.SHp
	self.def = 125
	self.mdef = 125
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 5
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 7
	self.mysee = 400
	self.attackRange = 225
	self.attackDesire = 80
	self.behit_calmtime = 0.1
	self.self_rhp = 0
	self.add_exp = 50
	self.fall_coin = 13
	self.objattackDic["hit1"] = {
		"power": 240,
		"hurtBack":[-8,-7],
		"attackKind": "magic"
	}
	self.objattackDic["mffd_1"] = {
		"power": int(RoleProp.roleprop.SHp * 0.03 + 200),
		"hurtBack":[-8,-5],
		"attackKind": "magic",

	}
	self.objattackDic["mffd_2"] = {
		"power": int(RoleProp.roleprop.SHp * 0.03 + 200),
		"hurtBack":[-8,-5],
		"attackKind": "magic",

	}
	self.fall_pro = 0.0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_49()
	Skill_1_CD = 0
	Skill_2_CD = 0
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if is_stop:
				CheckCallMonsterDeath()
				Stop()
			else:
				CreateMonster()
				Move()
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
						if count % 120 == 0:
							attack_target()
						else:
							stop_move()
func do_hit_2():
	Skill_1_CD = 15
	velocity.x = 0
	is_attacking = true
	mr_player.play("nlls")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 18
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
			CallMonster = Global.Create_Monster(18,get_parent(),self.position)
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
			CallMonster = Global.Create_Monster(37,get_parent(),self.position)
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
			"AddTime": 4,
			"ReduceInterval": 0.01,
			"value": 1,
			"DeBuff": true,
			"AttackKind": "magic",
			"CanAdd":true,
		})
func CallBullet():
	var Bullet_
	if MonsterDirection:
		Bullet_ = Global.CallChaseBullet(self.bullet,"Monster49Bullet_1",280,3,false,Vector2(self.position.x + 220,self.position.y - 180),"mffd_1",self.objattackDic["mffd_1"])
	else:
		Bullet_ = Global.CallChaseBullet(self.bullet,"Monster49Bullet_1",280,3,false,Vector2(self.position.x - 220,self.position.y - 180),"mffd_1",self.objattackDic["mffd_1"])
	Bullet_.scale = Vector2(2,2)
func StrenghBoss():
	if CallMonster != null:
		#CallMonster.is_boss = false
		CallMonster.SHp = 20000
		CallMonster.Hp = CallMonster.SHp
		CallMonster.level = RoleProp.baseroleprop.Level - 2
		CallMonster.def = 100
		CallMonster.mdef = 100
		CallMonster.Hp = CallMonster.SHp
		CallMonster.fall_pro = 0
		CallMonster.use_parent_material = true
		#print(CallMonster.get_material())
		if CallMonster is Monster18:
			CallMonster.my_mr_name = "邪·蛟魔王"
		elif CallMonster is Monster37:
			CallMonster.my_mr_name = "邪·秦广王"
		CallMonster.modulate = Color("00ffff")
		for i in CallMonster.objattackDic:
			if CallMonster.objattackDic[i].has("power"):
				CallMonster.objattackDic[i]["power"] = randi_range(265,330)
				
func call_fly_bullet():
	if self.MonsterDirection:
		var pp = Global.CallFlyBullet(self.bullet,"Monster49Bulet",1,Vector2(position.x + 80,position.y + 30),2500,-800,"hit1",self.objattackDic["hit1"])
		pp.animated_sprite_2d.flip_h = true
	else:
		Global.CallFlyBullet(self.bullet,"Monster49Bulet",1,Vector2(position.x - 80,position.y + 30),2500,800,"hit1",self.objattackDic["hit1"])
func LocalLevel():
	var pp = get_parent().get_parent() as BaseLevel
	if pp is Level19:
		if pp.mm == null:
			pp.can_notpass = true
			pp.ck_hero.disabled = true
