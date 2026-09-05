extends BaseMonster
class_name Monster14
func monster_14():
	self.is_boss = false
	self.my_mr_name = "虾兵"
	self.attack_in = 10
	self.level = 20
	self.SHp = 500
	self.Hp = self.SHp
	self.def = 80
	self.mdef = 120
	self.crit = 5
	self.miss = 5
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 300
	self.attackRange = 600
	self.attackDesire = 40
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 35
	self.fall_coin = 10
	self.objattackDic["hit1"] = {
		"power": 30,
		"hurtBack":[-3,-6],
		"attackKind": "real"
	}
	self.objattackDic["slz"] = {
		"power": 90,
		"hurtBack":[-6,-25],
		"attackKind": "real"
	}
	self.fall_pro = 0.0
	self.fall_list = [
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
	
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) < 370:
				if abs(position.x - RoleProp.role_pos_x) < 80:
					if count % 90 == 0:
						do_hit_1()
					else:
						if position.x > randi_range(15,85) + RoleProp.role_pos_x:
							move_right()
						elif position.x < RoleProp.role_pos_x - randi_range(15,85):
							move_left()
				elif count % 120 == 0:
					attack_target()
				else:	
					if position.x > randi_range(15,85) + RoleProp.role_pos_x:
						move_right()
					elif position.x < RoleProp.role_pos_x - randi_range(15,85):
						move_left()
			elif abs(position.x - RoleProp.role_pos_x) > 550:
				if count % 120 == 0:
					attack_target()
				else:
					normal_state()
			else:
				if count % 90 == 0:
					attack_target()
				else:
					stop_move()

func _ready() -> void:
	super._ready()
	monster_14()
func do_hit_1():
	if RoleProp.role_pos_x > position.x:
		move_right()
	else:
		move_left()
	hit_name = "slz"
	velocity.x = 0
	is_attacking = true
	mr_player.play("slz")
	await mr_player.animation_finished
	is_attacking = false
func call_fly_bullet():
	if self.MonsterDirection:
		Global.CallFlyBullet(self.bullet,"Monster14Bullet",-1,Vector2(position.x + 100,position.y),1500,600,"hit1",self.objattackDic["hit1"])
	else:
		Global.CallFlyBullet(self.bullet,"Monster14Bullet",1,Vector2(position.x - 100,position.y),1500,600,"hit1",self.objattackDic["hit1"])
