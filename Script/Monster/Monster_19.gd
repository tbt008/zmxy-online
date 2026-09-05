extends BaseMonster
class_name Monster19
var use_skill_2
func monster_19():
	self.is_Fly = true
	self.is_boss = false
	self.my_mr_name = "鲨鱼"
	self.attack_in = 10
	self.level = 100
	self.SHp = 1000000
	self.Hp = self.SHp
	self.def = 100
	self.mdef = 150
	self.crit = 15
	self.miss = 5
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 300
	self.attackRange = 75
	self.attackDesire = 40
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 500
	self.fall_coin = 200
	self.objattackDic["slj"] = {
		"power": 260,
		"hurtBack":[-4,-20],
		"attackKind": "real"
	}
	self.objattackDic["sytx"] = {
		"power": 115,
		"hurtBack":[-4,-9],
		"attackKind": "physics"
	}
	self.fall_pro = 0.00
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = [

	]	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	Skill_2_CD = 0
	monster_19()
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:	
			if Skill_1_CD <= 0 and abs(position.x - RoleProp.role_pos_x) <= 350:
				do_hit_1()
			elif Skill_2_CD <= 0:
				do_hit_2()
			else:
				have_target()

					
func do_hit_1():
	Skill_1_CD = randi_range(7,12)
	hit_name = "slj"
	is_attacking = true
	mr_player.play("slj")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_2():
	use_skill_2 = true
	if self.MonsterDirection:
		velocity.x += 700
	else:
		velocity.x += -700
	velocity.y = 0
	Skill_2_CD = randi_range(6,15)
	hit_name = "sytx"
	is_attacking = true
	mr_player.play("sytx")
	await mr_player.animation_finished
	is_attacking = false
	use_skill_2 = false
func call_ljf():
	var par = Global.add_SpecialEffect(get_parent().get_parent(),Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y - 50),"Monster19Bullet",Vector2(1,1),false,1)
	var xx = par.position + Vector2(0,150)
	await get_tree().create_timer(1.7,false).timeout
	Global.add_Bullet("Monster19Bullet",self.bullet,self.MonsterDirection,1,xx - Vector2(0,125),"slj",self.objattackDic["slj"])
func call_sylj():
	var pp = self.position - Vector2(0,20)
	Global.add_Bullet("Monster19Bullet_1",self.bullet,self.MonsterDirection,1,pp,"sytx",self.objattackDic["sytx"])
func have_target():
	if is_quiescent:
		return
	if is_Fly:
		mr_player.play("Fly")
		if RoleProp.role_pos_y > position.y + randi_range(125,245):
			velocity.y = speed * 8
		elif RoleProp.role_pos_y < position.y + randi_range(35,55):
			velocity.y = -speed * 8
	if RoleProp.role_pos_x > position.x + randi_range(65,85):
		move_right()
	elif RoleProp.role_pos_x < position.x - randi_range(65,85):
		move_left()
func call_boom():
	var pp = self.position - Vector2(0,0)
	Global.add_Bullet("Monster19Bullet_2",self.bullet,self.MonsterDirection,1,pp,"slj",self.objattackDic["slj"])
