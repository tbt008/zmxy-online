extends BaseMonster
class_name Monster41
var already_use_mrsp = false
var is_speed_up = false
var count_: int = 0
var is_need_run = false
var need_left = false
var need_right = false
var get_parent_
func monster_41():
	self.is_boss = true
	self.my_mr_name = "判官"
	self.attack_in = 15
	self.level = 27
	self.SHp = 20000
	self.Hp = self.SHp
	self.def = 120
	self.mdef = 120
	self.crit = 0
	self.miss = 25
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 600
	self.attackRange = 800
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 270,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Fire",
			"CanAdd":true,
			"AddTime": 2,
			"DeBuff": true,
			"ReduceInterval": 1,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "lcld",
			"value": 0
		},
		{
			"name": "tsyp",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = []
func _ready() -> void:
	super._ready()
	get_parent_ = get_parent().get_parent()
	monster_41()
	Skill_1_CD = 0
	Skill_2_CD = 0
func Monster_Intelligence():
	count_ += 1
	if is_speed_up:
		self.speed = 100
		if count_ % 30 == 0:
			add_speed_up_specialbullet()
	else:
		self.speed = iniSpeed
	if not already_use_mrsp:
		do_hit_2()
	else:	
		if abs(RoleProp.role_pos_x - position.x) < mysee:
			has_target = true
		if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
			if has_target == false:
				normal_state()
			else:
				if not is_need_run:
					if Skill_1_CD <= 0:
						do_hit_3()
					elif abs(position.x - RoleProp.role_pos_x) < 300 and not is_need_run:
						if position.x > RoleProp.role_pos_x or self.position.x <= 3430:
							need_right = true
						elif position.x <= RoleProp.role_pos_x or self.position.x >= 4500:
							need_left = true
						is_need_run = true
						$Run.wait_time = 2
						$Run.start()
					elif abs(position.x - RoleProp.role_pos_x) > attackRange:
						have_target()
					else:
						if Skill_2_CD <= 0 and Skill_1_CD > 0:
							do_hit_4()
						else:
							stop_move()
				else:
					if Skill_1_CD <= 0:
						do_hit_3()
					elif Skill_2_CD <= 0 and Skill_1_CD > 0:
						do_hit_4()
					else:
						if need_left:
							move_left()
						elif need_right:
							move_right()
func do_hit_2():

	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("mrsp")
	await mr_player.animation_finished
	already_use_mrsp = true
	if get_parent_ is level15:
		get_parent_.add_ini()
	is_attacking = false
func do_hit_3():
	Skill_1_CD = 22
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("jx")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_4():
	super.to_hero()
	Skill_2_CD = 5
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit1")
	await mr_player.animation_finished
	is_attacking = false
func call_speed_up():
	is_speed_up = true
	self.miss = 35
	$SpeedUp.wait_time = randi_range(12,16)
	$SpeedUp.start()
func _on_speed_up_timeout() -> void:
	self.miss = 25
	is_speed_up = false
	$SpeedUp.stop()
func add_speed_up_specialbullet():
	if self.MonsterDirection:
		Global.add_SpecialEffect(self,Vector2(0,55),"SpeedUp",Vector2(1,1),true,1)
	else:
		Global.add_SpecialEffect(self,Vector2(0,55),"SpeedUp",Vector2(1,1),true,1)
func call_fly_bullet():
	if self.MonsterDirection:
		Global.CallFlyBullet(self.bullet,"Monster41Bullet",1,Vector2(position.x + 100,position.y),800,-300,"hit1",self.objattackDic["hit1"])
	else:
		var fz = Global.CallFlyBullet(self.bullet,"Monster41Bullet",1,Vector2(position.x - 100,position.y),800,300,"hit1",self.objattackDic["hit1"])
		fz.animated_sprite_2d.flip_h = true


func _on_run_timeout() -> void:
	is_need_run = false
	need_right = false
	need_left = false
