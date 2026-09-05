extends BaseMonster
class_name Monster32
var get_hero:BaseHero
@onready var wing: AnimatedSprite2D = $MonsterDir/Wing

func monster_32():
	current_ = 0
	self.is_boss = true
	self.my_mr_name = "白骨精·精"
	self.attack_in = 120
	self.level = 30
	self.SHp = 20000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 30
	self.sp = 30
	self.Critreduce = 0
	self.speed = 9
	self.mysee = 300
	self.attackRange = 85
	self.attackDesire = 50
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": 350,
		"hurtBack":[-6,-9],
		"attackKind": "physics"
	}
	self.objattackDic["dmzw"] = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "EyeFix",
			"AddTime": 5,
			"CanAdd":false,
			"DeBuff": true,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["dmlhc"] = {
		"power": 280,
		"hurtBack":[-6,-8],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Bleed",
			"CanAdd":true,
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": 5 + int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "physics",
		}
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "bsxj",
			"value": 0
		},
		{
			"name": "bszj",
			"value": 0
		},
		{
			"name": "bsyz",
			"value": 0
		},
		{
			"name": "bsbc",
			"value": 0
		},
		{
			"name": "bshq",
			"value": 0
		},
	]
	self.fall_stone_pro = 0
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_32()
	Skill_1_CD = 0
	Skill_2_CD = 0
	wing.set_frame_and_progress(0,true)

func Monster_Intelligence():
	if self.current_ < 3:
		wing.set_frame_and_progress(self.current_,true)
	if not self.is_bounds:
		if abs(RoleProp.role_pos_x - position.x) < mysee:
			has_target = true
		if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
			if has_target == false:
				normal_state()
			else:
				if abs(position.x - RoleProp.role_pos_x) > attackRange:
					have_target()
					if abs(position.x - RoleProp.role_pos_x) <= 1200:
						if Skill_1_CD <= 0:
							do_hit_2()
					if abs(position.x - RoleProp.role_pos_x) <= 400:
						if Skill_2_CD <= 0:
							do_hit_3()
				else:
					if Skill_1_CD <= 0:
						do_hit_2()
					elif Skill_2_CD <= 0:
						do_hit_3()
					elif count % 60 == 0:
						attack_target()
					else:
						stop_move()
							
#复活 -15，-18，死亡复活也是
func attack_target():
	super.attack_target()

func do_hit_2():
	
	if self.current_ == 0:
		Skill_1_CD = 16
	elif self.current_ == 1:
		to_hero()
		Skill_1_CD = 10
	elif self.current_ == 2:
		to_hero()
		Skill_1_CD = 8
	hit_name = "dmzw"
	velocity.x = 0
	is_attacking = true
	mr_player.play("dmzw")
	await mr_player.animation_finished
	is_attacking = false
	
func do_hit_3():
	if self.current_ == 0:
		Skill_2_CD = 15
	elif self.current_ == 1:
		Skill_2_CD = 12
	elif self.current_ == 2:
		Skill_2_CD = 9
	velocity.x = 0
	hit_name = "dmlhc"
	is_attacking = true
	mr_player.play("dmlhc")
	await mr_player.animation_finished
	is_attacking = false

func turn_bounds():
	await get_tree().create_timer(6,false).timeout
	turn_relive()

func turn_relive():
	mr_player.play("relife")
func _on_relive_timeout() -> void:
	turn_relive()
	is_fall = false
	$Relive.stop()
func relive():
	self.current_ += 1
	match self.current_:
		1:
			Skill_1_CD = 0
			Skill_2_CD = 0
			self.my_mr_name = "白骨精·妖"
			self.SHp = 30000 
			self.Hp = self.SHp
			self.def = 150
			self.mdef = 150
			self.crit = 10
			self.attackDesire = 70
			self.objattackDic["dmlhc"] = {
				"power": 400,
				"hurtBack":[-12,-15],
				"attackKind": "magic",
				"addeffect":{
					"Name": "Bleed",
					"AddTime": 2,
					"CanAdd":true,
					"DeBuff": true,
					"ReduceInterval": 1,
					"value": 5 + int(RoleProp.roleprop.SHp * 0.01),
					"AttackKind": "physics",
				}
			}
			self.fall_pro = 0.5
			self.fall_list = [
				{
					"name": "bsxj",
					"value": 0
				},
				{
					"name": "bszj",
					"value": 0
				},
				{
					"name": "bsyz",
					"value": 0
				},
				{
					"name": "bsbc",
					"value": 0
				},
				{
					"name": "bshq",
					"value": 0
				},
			]
		2:
			Skill_1_CD = 0
			Skill_2_CD = 0
			self.my_mr_name = "白骨精·魔"
			self.SHp = 50000
			self.Hp = self.SHp
			self.def = 200
			self.mdef = 200
			self.crit = 10
			self.attackDesire = 100
			self.objattackDic["dmlhc"] = {
				"power": 400,
				"hurtBack":[-12,-19],
				"attackKind": "magic",
				"addeffect":{
					"Name": "Bleed",
					"AddTime": 2,
					"CanAdd":true,
					"DeBuff": true,
					"ReduceInterval": 0.5,
					"value": 5 + int(RoleProp.roleprop.SHp * 0.01),
					"AttackKind": "physics",
				}
			}
			self.fall_pro = 0.5
			self.fall_list = [
				{
					"name": "csgs",
					"value": 0
				},
			]
			self.fall_stone_pro = 0.3
			self.fall_stone = [
				{
					"name": "bszy",
					"value": 0
				},
			]
	self.is_bounds = false

func call_gc():
	var gc: MonsterBullet
	var PositionList: Array[Vector2] = []
	if MonsterDirection:
		PositionList = [Vector2(40,55),Vector2(140,55),Vector2(240,55),Vector2(340,55),Vector2(440,55)]
	else:
		PositionList = [Vector2(-40,55),Vector2(-140,55),Vector2(-240,55),Vector2(-340,55),Vector2(-440,55)]
	for i in PositionList:
		gc = Global.add_Bullet("Monster32Bullet",self.bullet,MonsterDirection,0.8,i + position,"dmlhc",self.objattackDic["dmlhc"])
		match self.current_:
			0:
				gc.scale.x = 1
				gc.scale.y = 0.7
			1:
				gc.scale.x = 1.2
				gc.scale.y = 1
			2:
				gc.scale.x = 1.5
				gc.scale.y = 1.5
		await get_tree().create_timer(0.2,false).timeout



func eye_fix():
	if self.position.x > RoleProp.role_pos_x:
		if Global.get_player.PlayerDir:
			if not MonsterDirection:
				add_eye_fix()
	else:
		if not Global.get_player.PlayerDir:
			if MonsterDirection:
				add_eye_fix()
func add_eye_fix():
	Global.AddBuff(get_Player.buff,{
			"Name": "EyeFix",
			"AddTime": 5,
			"ReduceInterval": 0.00,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		})
func ISBounds():
	is_bounds = true
