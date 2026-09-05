extends BaseMonster
class_name Monster132
var IsStrength: bool
var RelifTimes: int = 0
var ShouldRelive: bool = false
var CreateCount: int = randi_range(600,720)
func monster_132():
	self.is_boss = true
	self.my_mr_name = "天庭战神"
	self.attack_in = 60
	self.level = RoleProp.baseroleprop.Level + 5
	self.SHp = 300000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 200
	self.crit = 50
	self.miss = 25
	self.lucky = 115
	self.Htarget = 35
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 500
	self.attackRange = 245
	self.attackDesire = 100
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 120
	self.fall_coin = 155
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-4,-7],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 200,
		"hurtBack":[-5,-1],
		"attackKind": "magic",
		"HitProtect": 0,
		"addeffect":{
			"Name": "DefeReduce",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 1,
			"AttackKind": "",
			"DeBuff": true,
			"CanRemove": false,
			"CanAdd": false,
		}
	}
	self.fall_pro = 0.05
	self.fall_list = [
		{
			"name": "canglongjiezzs",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0.05
	self.fall_stone = [
		{
			"name": "canglonglingpo",
			"value": randi_range(1,2)
		},
	]		
func _ready() -> void:
	super._ready()
	monster_132()
	Skill_1_CD = randi_range(3,5)
	Skill_2_CD = randi_range(5,8)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if Hp > 0:
		CreateCount -= 1
		if CreateCount <= 0:
			var Shallow = Global.Create_Monster(133,get_parent(),position) as Monster133
			Shallow.MyParent = self
			CreateCount = randi_range(600,720)
			movetoplayer()
	
func Monster_Intelligence():
	if ShouldRelive:
		return
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
				if abs(position.x - RoleProp.role_pos_x) <= 560:
					if Skill_2_CD <= 0:
						do_hit_2()
			else:
				stop_move()
				if Skill_2_CD <= 0:
					do_hit_2()
				elif Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(15,18)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(11,13)
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func state_death():
	super.set_exp()
	super.set_gxp()
	velocity.x = 0
	if RelifTimes < 9:
		if not ShouldRelive:
			mr_player.play("death1")
			RelifTimes += 1
			ShouldRelive = true
	else:
		mr_player.play("death")	
		if not is_death:
			if PlayerData.player_data.has(my_mr_name):
				var Current = PlayerData.player_data[my_mr_name]
				PlayerData.player_data[my_mr_name] += 1
			is_death = true
		await mr_player.animation_finished
func Relive():
	is_fall = false
	SHp = SHp * 1.2
	Hp = SHp
	self.def += 20
	self.mdef += 20
	self.ar += 10
	self.sp += 10
	self.speed += 1
	self.ebol += 0.25
	if objattackDic.size() != 0:
		for i in objattackDic:
			if objattackDic[i].has("power"):
				objattackDic[i].power *= 1.2
	fall_pro += 0.08
	fall_stone_pro += 0.08
	ShouldRelive = false
	Skill_1_CD = 0
	Skill_2_CD = 0
	Skill_3_CD = 0
func TweenToTop():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(0,-250) + position,2)
	velocity = Vector2(0,0)

func CallBullet():
	var MaxCount: int = 15
	var Num: int = 0
	var tween = create_tween().set_parallel(true)
	while Num < MaxCount:
		var NewRotation = 360 / MaxCount
		NewRotation = NewRotation * Num
		var stabPosition = Vector2(self.position.x + sin(float(NewRotation) * PI / 180) * 300,self.position.y - 15 - cos(float(NewRotation) * PI / 180) * 300)
		var Arrow = Global.add_Bullet("Monster132Bullet",self.bullet,false,1,stabPosition,"hit2",self.objattackDic["hit2"])
		Arrow.rotation_degrees = NewRotation - 90
#		Arrow.modulate = Color(1,1,1,0)
#		tween.tween_property(Arrow,"modulate",Color(1,1,1,1),0.6)
		await get_tree().create_timer(0.05,false).timeout
		Num += 1
	
func _on_hurt_box_area_entered(area: Area2D):
	super._on_hurt_box_area_entered(area)
	var Bl: float = 0.02 + RelifTimes * 0.01
	if IsStrength:
		Global.AddBuff(RoleProp.SourcePlayer.buff,{
			"Name": "Fire",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * Bl),
			"AttackKind": "real",
			"CanAdd": true,
			"CanRemove": false
		})
		IsStrength = false
func StrengthSelf():
	IsStrength = false
	if objattackDic.size() != 0:
		for i in objattackDic:
			if objattackDic[i].has("power"):
				objattackDic[i].power *= 1.2
	for i in range(randi_range(3,6)):
		cure_hp(int(SHp * randf_range(0.01,0.02)))
		await get_tree().create_timer(0.2,false).timeout
func OnStrength():
	IsStrength = true
