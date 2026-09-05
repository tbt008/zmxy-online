extends BaseMonster
class_name Monster89
@onready var gethd: Timer = $GetHd
@onready var remove_hd_and_cure: Timer = $RemoveHdAndCure
@onready var special_effect_1: AnimatedSprite2D = $MonsterDir/SpecialEffect1

func monster_89():
	self.is_boss = true
	self.my_mr_name = "朱子真"
	self.attack_in = 90
	self.level = 35
	self.SHp = 120000
	self.Hp = self.SHp
	self.def = 180
	self.mdef = 180
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 70
	self.Toughness = 20
	self.ar = 35
	self.sp = 35
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 500
	self.attackRange = 185
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 300
	self.objattackDic["hit1"] = {
		"power": 400,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 500,
		"hurtBack":[-1,-1],
		"attackKind": "physics",
		"HitProtect": 10,
	}
	self.objattackDic["hit3"] = {
		"power": 900,
		"hurtBack":[-1,-1],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.objattackDic["hit4"] = {
		"power": hd,
		"hurtBack":[-30,-50],
		"attackKind": "real",
		"HitProtect": 50,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "zjksf",
			"value": 0
		},
		{
			"name": "zjxmczzs",
			"value": 1
		},
		{
			"name": "zjqj",
			"value": 0
		},
		{
			"name": "hljhzzs",
			"value": 1
		},
		{
			"name": "zjgp",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0.2
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]			
func _ready() -> void:
	super._ready()
	monster_89()
	Skill_1_CD = randi_range(5,8)
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,12)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(8,12)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if hd > 0:
		special_effect_1.visible = true
	else:
		special_effect_1.visible = false
func Monster_Intelligence():	
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_1()
				if abs(position.x - RoleProp.role_pos_x) <= 500:
					if Skill_2_CD <= 0:
						do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if count % 90 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif Skill_2_CD <= 0:
					do_hit_2()
				elif count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
					else:
						stop_move()
				else:
					stop_move()
func ADDBullet():
	Global.add_Bullet("Monster88Bullet2",self.bullet,MonsterDirection,1,Vector2(position.x,470),"hit3",self.objattackDic["hit3"])
	await get_tree().create_timer(0.7,false).timeout
	var PositionList = [[-180,180],[-360,360],[-540,540]]
	for i in PositionList:
		for u in i:
			Global.add_Bullet("Monster88Bullet2",self.bullet,MonsterDirection,2,Vector2(u + position.x,470),"hit3",self.objattackDic["hit3"])
		await get_tree().create_timer(0.2,false).timeout
		
func _on_get_hd_timeout() -> void:
	var tween = create_tween()
	special_effect_1.modulate = Color("ffff00")
	tween.tween_property(special_effect_1,"modulate",Color("ff0000"),8)
	get_hd(SHp * 0.05,0,0.3)
	remove_hd_and_cure.start(8)
	
func _on_remove_hd_and_cure_timeout() -> void:
	if hd > 0:
		self.objattackDic["hit4"]["power"] = int(hd)
		Global.add_Bullet("Monster88Bullet3",self.bullet,MonsterDirection,1,position,"hit4",self.objattackDic["hit4"])
		ChangeHdCureHp(1)
	gethd.start(8)
