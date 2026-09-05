extends BaseMonster
class_name Monster144
var ShouldChase:bool = false
@onready var normal_walk_timer: Timer = $NormalWalkTimer
@onready var jcqb: RayCast2D = $jcqb
@onready var jumpcd: Timer = $Jumpcd
@onready var qbtimer: Timer = $qbtimer
@onready var can_jumpqb: RayCast2D = $CanJumpqb

enum WangWang {
	MoveLeft,
	MoveRight,
	QBMoveLeft,
	QBMoveRight,
	Jump,
	Smile,
	Dance,
	Cry,
	Wait,
	NormalWalk,
	Chase
	
}
var WangState = WangWang.NormalWalk
var IsJump: bool
func monster_144():
	self.CannotAttract = true
	self.is_boss = false
	self.my_mr_name = "汪汪"
	self.attack_in = 10
	self.level = 1000
	self.SHp = 1000
	self.Hp = self.SHp
	self.def = 0
	self.mdef = 0
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 400
	self.attackRange = 200
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 225,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		}
	self.fall_pro = 0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []			
func _ready() -> void:
	super._ready()
	monster_144()
func Monster_Intelligence():
	if qb():
		if qbtimer.is_stopped():
			qbtimer.start(3)
		if monster_dir.scale.x == 1:
			WangState = WangWang.QBMoveRight
		else:
			WangState = WangWang.QBMoveLeft
		
	match WangState:
		WangWang.Wait:
			stop_move()
		WangWang.Dance:
			do_hit_2()
		WangWang.MoveLeft:
			move_left()	
		WangWang.MoveRight:
			move_right()
		WangWang.QBMoveLeft:
			move_left()	
		WangWang.QBMoveRight:
			move_right()	
		WangWang.Jump:
			Jump()
		WangWang.Smile:
			attack_target()
		WangWang.Cry:
			do_hit_3()
		WangWang.NormalWalk:
			normal_state()
		WangWang.Chase:
			have_target()
func move_left():
	base_damage_box.scale.x = 1
	monster_dir.scale.x = 1
	velocity.x = -speed * 10
	if not IsJump:
		mr_player.play("walk")
func move_right():
	base_damage_box.scale.x = -1
	monster_dir.scale.x = -1
	velocity.x = speed * 10
	if not IsJump:
		mr_player.play("walk")
func have_target():
	if not $RayCast2D.get_collider():
		Jump()
	if can_jumpqb.get_collider():
		#if randi_range(0,100) < 70:
		Jump()
	if randi_range(0,100) < 25 and jumpcd.time_left <= 0:
		Jump()
	else:
		if RoleProp.role_pos_x > position.x + randi_range(65,85):
			move_right()
		elif RoleProp.role_pos_x < position.x - randi_range(65,85):
			move_left()
		else:
			stop_move()	
func Jump():
	if jumpcd.time_left <= 0:
		randomize()
		jumpcd.start(randi_range(1,4))
		IsJump = true
		if monster_dir.scale.x == 1:
			velocity.x = -speed * 18
		else:
			velocity.x = speed * 18
		velocity.y = -randi_range(400,900)
		mr_player.play("jump")
		await mr_player.animation_finished
	IsJump = false
	WangState = WangWang.NormalWalk
func normal_state():
	if not $RayCast2D.get_collider():
		Jump()
	if can_jumpqb.get_collider():
		#if randi_range(0,100) < 70:
		Jump()
	if randi_range(0,100) < 25 and jumpcd.time_left <= 0:
		Jump()
	else:
		if ran_num < 10:
			stop_move()
		elif ran_num >= 10 and ran_num <= 55:
			move_left()
		else:
			move_right()
func qb():
	return jcqb.get_collider()
func CheckHp(i:float):
	return Hp >= SHp * i
func attack_target():
	super.to_hero()
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("smile")
	await mr_player.animation_finished
	is_attacking = false
	#WangState = WangWang.NormalWalk
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(12,14)
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("scary")
	await mr_player.animation_finished
	is_attacking = false
	WangState = WangWang.NormalWalk
func do_hit_2():
	super.to_hero()
	Skill_2_CD = randi_range(16,18)
	velocity.x = 0
	hit_name = "hit1"
	is_attacking = true
	mr_player.play("dance")
	await mr_player.animation_finished
	is_attacking = false
	WangState = WangWang.NormalWalk
func do_hit_3():
	super.to_hero()
	Skill_3_CD = randi_range(14,16)
	velocity.x = 0
	hit_name = "hit1"
	is_attacking = true
	mr_player.play("cry")
	await mr_player.animation_finished
	is_attacking = false
	WangState = WangWang.NormalWalk


func _on_normal_walk_timer_timeout() -> void:
	if abs(RoleProp.role_pos_x - position.x) > 600:
		if randi_range(0,100) < 30:
			WangState = WangWang.Cry
		else:
			WangState = WangWang.Chase
	else:
		randomize()
		var aa = randi_range(0,100)
		if abs(RoleProp.role_pos_x - position.x) > 500:
			if aa < 70:
				WangState = WangWang.NormalWalk
			else:
				WangState = WangWang.Chase
		else:
			if aa < 70:
				WangState = WangWang.NormalWalk
			else:
				if aa > 75:
					WangState = WangWang.Smile
				else:
					WangState = WangWang.Dance


func _on_qbtimer_timeout() -> void:
	if abs(RoleProp.role_pos_x - position.x) > 500:
		WangState = WangWang.Cry
	else:
		randomize()
		var aa = randi_range(0,100)
		if aa > 30:
			if aa < 50:
				WangState = WangWang.NormalWalk
			else:
				WangState = WangWang.Chase
		else:
			if aa < 5:
				WangState = WangWang.Dance
			else:
				WangState = WangWang.Smile
func reduce_hp(value: int):
	return
func HurtReduceHp(value,target):
	return
