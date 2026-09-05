extends BaseMonster
class_name Monster48
var ChangeBody: bool = false
var ChangeDirCount: int = 60
func monster_48():
	self.is_boss = true
	self.my_mr_name = "夜叉"
	self.attack_in = 0
	self.level = 30
	self.SHp = 35000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 25
	self.miss = 10
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = -10
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 400
	self.attackRange = 158
	self.attackDesire = 85
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 0
	self.objattackDic["hit1"] = {
		"power": int(100 + RoleProp.roleprop.SHp * 0.02),
		"hurtBack":[0,-3],
		"attackKind": "real"
	}
	self.objattackDic["fszy"] = {
		"power": int(300 + RoleProp.roleprop.SHp * 0.02),
		"hurtBack":[0,-3],
		"attackKind": "real",
		"addeffect":{
			"Name": "Bleed",
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
			"name": "xhmj",
			"value": 0
		},
		{
			"name": "xhxc",
			"value": 0
		},
		{
			"name": "lczh",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_48()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if ChangeBody:
		self.CannotAttract = true
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if not ChangeBody:
				$BaseDamageBox/HurtBox.set_collision_mask_value(12,true)
				$BaseDamageBox/HurtBox.set_collision_mask_value(7,true)
				self.def = 150
				self.mdef = 150
				self.speed = 8
				if float(Hp) / float(SHp) <= 0.7:
					ChangeBody_()
				elif not is_be_attacking:
					super.Monster_Intelligence()
			else:
				$BaseDamageBox/HurtBox.set_collision_mask_value(12,false)
				$BaseDamageBox/HurtBox.set_collision_mask_value(7,false)
				self.def = 180
				self.mdef = 180
				self.speed = 30
				if Skill_1_CD > 0:
					if self.position.x > RoleProp.role_pos_x:
						move_right()
					else:
						move_left()
					if count % 30 == 0:
						if abs(self.position.x - RoleProp.role_pos_x) <= attackRange:
							attack_target()
				else:
					if self.position.x > RoleProp.role_pos_x:
						move_left()
					else:
						move_right()
					if Skill_1_CD <= 0:
						if abs(self.position.x - RoleProp.role_pos_x) <= 245 and abs(self.position.y - RoleProp.role_pos_y) <= 255:
							do_hit_2()
					elif count % 30 == 0:
						if abs(self.position.x - RoleProp.role_pos_x) <= attackRange:
							attack_target()

func attack_target():
	Skill_2_CD = randi_range(7,10)
	if RoleProp.role_pos_x > position.x:
		move_right()
	else:
		move_left()
	hit_name = "hit1"
	if not ChangeBody:
		velocity.x = 0
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
func ChangeBody_():
	velocity.x = 0
	mr_player.play("changeBody")
	await mr_player.animation_finished
	ChangeBody = true
func do_hit_2():
	Skill_1_CD = randi_range(7,10)
	hit_name = "fszy"
	is_attacking = true
	mr_player.play("fszy")
	await mr_player.animation_finished
	is_attacking = false	
func move_left():
	base_damage_box.scale.x = 1
	monster_dir.scale.x = 1
	velocity.x = -speed * 10
	if not ChangeBody:
		mr_player.play("walk_1")
	else:
		mr_player.play("walk_2")
func move_right():
	base_damage_box.scale.x = -1
	monster_dir.scale.x = -1
	velocity.x = speed * 10
	if not ChangeBody:
		mr_player.play("walk_1")
	else:
		mr_player.play("walk_2")
func _on_hit_box_area_entered(_area: Area2D) -> void:
	if hit_name == "fszy" or hit_name == "hit1":
		if ChangeBody:
			if hit_name == "fszy":
				cure_hp(objattackDic[hit_name]["power"] * randi_range(1,2) + int((SHp - Hp) * 0.02))
			else:
				cure_hp(objattackDic[hit_name]["power"] * randi_range(1,2) + int((SHp - Hp) * 0.01))
		else:
			cure_hp(objattackDic[hit_name]["power"] * randi_range(18,22))

