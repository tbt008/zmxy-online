extends BaseMonster
class_name Monster12
var is_eggs = false
var is_play = false
var relive_effect
var is_set = false
var is_rush = false
var po: Vector2
var CureCount: int = 0
var velocity_: Vector2:
	set(val):
		velocity_ = val
		rotation = velocity_.angle()
func monster_12():
	self.is_Fly = false
	self.is_boss = true
	self.my_mr_name = "鹏魔王"
	self.attack_in = 120
	self.level = 20
	self.SHp = 4500
	self.Hp = self.SHp
	self.def = 80
	self.mdef = 80
	self.crit = 10
	self.miss = 5
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 10
	self.mysee = 300
	self.attackRange = 85
	self.attackDesire = 60
	self.behit_calmtime = 0.4
	self.self_rhp = 0
	self.add_exp = 100
	self.fall_coin = 30
	self.objattackDic["hit1"] = {
		"power": 70,
		"hurtBack":[-4,-9],
		"attackKind": "real"
	}
	self.objattackDic["bshn"] = {
		"power": 110,
		"hurtBack":[0,0],
		"attackKind": "real",
		"addeffect":{
			"Name": "Fire",
			"AddTime": 4,
			"ReduceInterval": 1,
			"CanAdd":true,
			"DeBuff": true,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "magic",
		}
	}
	self.objattackDic["hydd"] = {
		"power": 35,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Fire",
			"AddTime": 4,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "magic",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
			{
				"name": "jcjs",
				"value": 0
			},
			{
				"name": "jcsz",
				"value": 0
			},
			{
				"name": "jclj",
				"value": 0
			},
		]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_12()
	Skill_1_CD = 0
	Skill_2_CD = 0

func Monster_Intelligence():
	if is_Fly:
		self.attackRange = 300
	else:
		self.attackRange = 85

	if is_on_floor():
		mr_ani.rotation = 0
	if is_eggs:
		return
	if Global.is_Fire:
		self.self_rhp = 200
	else:
		self.self_rhp = 0
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				match is_Fly:
					true:
						if Skill_2_CD <= 0:
							use_skill_4()
							is_rush = true
						elif count % 60 == 0:
							do_hit_3()
						else:
							have_target()
					false:
						if abs(position.x - RoleProp.role_pos_x) <= 800:
							if Skill_1_CD <= 0:
								do_hit_2()
			else:
				match is_Fly:
					true:
						if Skill_2_CD <= 0:
							use_skill_4()
							is_rush = true
						elif count % 60 == 0:
							do_hit_3()
						else:
							have_target()
					false:
						if Skill_1_CD <= 0:
							do_hit_2()
						elif count % 60 == 0:
							attack_target()
						else:
							stop_move()

func do_hit_2():
	Skill_1_CD = 2
	hit_name = "hydd"
	velocity.x = 0
	is_attacking = true
	mr_player.play("FloorSkill")
	await mr_player.animation_finished
	is_attacking = false
#上面这俩是陆地	
func do_hit_3():
	velocity.x = 0
	hit_name = "hydd"
	is_attacking = true
	mr_player.play("FlySkill")
	await mr_player.animation_finished
	is_attacking = false
func use_skill_4():
	Skill_2_CD = 15
	var sspo = [Vector2(RoleProp.role_pos_x + 100, - 200),Vector2(RoleProp.role_pos_x - 100, - 200),
	Vector2(RoleProp.role_pos_x + 100,- 200),Vector2(RoleProp.role_pos_x - 100,-200)]
	for i in range(4):
		po = Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y)
		var ppx = sspo[i].x
		var ppy = sspo[i].y
		if ppx <= 0 :
			ppx = 10
		if ppx >= 4500:
			ppx = 4400
		self.position = Vector2(ppx,ppy)
		await get_tree().create_timer(1).timeout
	is_rush = false
func do_hit_4():
	Skill_2_CD = 18
	hit_name = "bshn"
	is_attacking = true
	mr_player.play("FlyBirds")
	await mr_player.animation_finished
	velocity.y = 0
	is_attacking = false
#这俩是飞行
func call_Fire():
	if self.MonsterDirection == false:
		var posi = Vector2(self.position.x - 180,self.position.y)
		var aa = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var bb = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var cc = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		aa.set_rotation_degrees(-30)
		bb.set_rotation_degrees(0)
		cc.set_rotation_degrees(30)
	else:
		var posi = Vector2(self.position.x + 180,self.position.y)
		var aa = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var bb = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var cc = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		aa.set_rotation_degrees(30)
		bb.set_rotation_degrees(0)
		cc.set_rotation_degrees(-30)	
func call_Fire_fly():
	if self.MonsterDirection == false:
		var posi = Vector2(self.position.x - 210,self.position.y + 150)
		var aa = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var bb = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var cc = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		aa.set_rotation_degrees(-30)
		bb.set_rotation_degrees(0)
		cc.set_rotation_degrees(30)
	else:
		var posi = Vector2(self.position.x + 210,self.position.y + 150)
		var aa = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var bb = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		var cc = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,posi,"hydd",self.objattackDic["hydd"])
		aa.set_rotation_degrees(30)
		bb.set_rotation_degrees(0)
		cc.set_rotation_degrees(-30)	
func protect_Fire():
	var po = Vector2(RoleProp.role_pos_x + 90,RoleProp.role_pos_y + 120)
	var aa = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,po,"hydd",self.objattackDic["hydd"])
	var bb = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,po,"hydd",self.objattackDic["hydd"])
	var cc = Global.add_Bullet("Monster12Bullet",self.bullet,self.MonsterDirection,1,po,"hydd",self.objattackDic["hydd"])
	aa.set_rotation_degrees(30)
	bb.set_rotation_degrees(0)
	cc.set_rotation_degrees(-30)	
func state_hurt():
	if not is_eggs:
		super.state_hurt()

func _physics_process(delta: float) -> void:
	if super.CheckPlayerHaveDebuff("Fire"):
		if CureCount % 60 == 0:
			cure_hp(150)
		CureCount += 1
	if not is_set:
		if not is_Fly:
			$Change_zt.wait_time = randi_range(8,10)
			$Change_zt.start()
		else:
			$Change_zt.wait_time = randi_range(15,17)
			$Change_zt.start()
		is_set = true
	super._physics_process(delta)
	if Hp <= SHp * 0.2:
		is_eggs = true
	check_eggs()
	if is_rush:
		bshn(po,delta)
func bshn(pp: Vector2,delta):
	var desired_angle = position.direction_to(pp).angle()
	var cur_angle = lerp_angle(rotation,desired_angle,0.02)
	velocity_ = Vector2.RIGHT.rotated(cur_angle) * 1200
	position += velocity_ * delta
	do_hit_4()
func check_eggs():
	if not is_eggs:
		self.def = 80
		self.mdef = 80
		Monster_Intelligence()
	else:
		is_Fly = false
		velocity.x = 0
		self.def = 200
		self.mdef = 200
		if is_play == false:
			mr_player.play("Eggs")
			is_play = true
			await mr_player.animation_finished
			$Relive.wait_time = 7
			$Relive.start()
func relive_Effect():
	if mr_ani.flip_h == false:
		relive_effect = Global.add_SpecialEffect(self,Vector2(20,0),"Relife",Vector2(1,1),false,1)
	else:
		relive_effect = Global.add_SpecialEffect(self,Vector2(-20,0),"Relife",Vector2(1,1),false,1)
func _on_relive_timeout() -> void:
	if Hp <= 0:
		return
	self.SHp = self.SHp * 1.5
	self.Hp = self.SHp
	def += 10
	mdef += 10
	$Relive.stop()
	relive_Effect()
	await relive_effect == null
	is_eggs = false
	is_play = false
	

func _on_create_timeout() -> void:
	if is_eggs:
		protect_Fire()


func _on_change_zt_timeout() -> void:
	if is_Fly:
		is_Fly = false
	else:
		is_Fly = true
	is_set = false



func _on_hn__timeout() -> void:
	pass # Replace with function body.
func have_target():
	if is_quiescent:
		return
	if is_Fly:
		if RoleProp.role_pos_y > position.y + 500 :
			move_down()
		elif RoleProp.role_pos_y < position.y + 240:
			move_up()
	if RoleProp.role_pos_x > position.x + randi_range(25,85):
		move_right()
	elif RoleProp.role_pos_x < position.x - randi_range(25,85):
		move_left()
