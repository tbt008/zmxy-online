extends BaseMonster
class_name Monster18
var is_need_change = true
var move_le = false
var move_ri = false
func monster_18():
	self.is_boss = true
	self.my_mr_name = "蛟魔王"
	self.attack_in = 30
	self.level = 23
	self.SHp = 7000
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
	self.speed = 10
	self.mysee = 300
	self.attackRange = 95
	self.attackDesire = 90
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 165,
		"hurtBack":[-4,-9],
		"attackKind": "physics"
	}
	self.objattackDic["fhjl"] = {
		"power": 228,
		"hurtBack":[-10,-5],
		"attackKind": "real",
		"addeffect":{
			"Name": "stun",
			"AddTime": 3,
			"ReduceInterval": 0,
			"DeBuff": true,
			"CanAdd":false,
			"value": 0,
			"AttackKind": "",
		}
		
	}
	self.objattackDic["dtsz"] = {
		"power": 200,
		"hurtBack":[-22,-15],
		"attackKind": "real",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"CanAdd":false,
			"DeBuff": true,
			"value": 0.4,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xwj",
			"value": 0
		},
		{
			"name": "bxp",
			"value": 0
		},
		{
			"name": "pxk",
			"value": 0
		}
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	monster_18()
	Skill_1_CD = 0
	Skill_2_CD = 0

func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if Skill_2_CD <= 0:
				whencandoHit3()
				return
			if abs(position.x - RoleProp.role_pos_x) > attackRange:	
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if Skill_1_CD <= 0:
						do_hit_2()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				elif count % 90 == 0:
					var rad = randi_range(0,100)
					if rad <= attackDesire:
						attack_target()
				else:
					stop_move()

func do_hit_2():
	Skill_1_CD = 7
	hit_name = "fhjl"
	velocity.x = 0
	is_attacking = true
	mr_player.play("fhjl")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 15
	velocity.x = 0
	hit_name = "dtsz"
	is_attacking = true
	mr_player.play("dtsz")
	await mr_player.animation_finished
	is_attacking = false
func call_fhjl():
	if self.MonsterDirection:
		Global.add_Bullet("Monster18Bullet_1",self.bullet,self.MonsterDirection,1,Vector2(self.position.x + 80,self.position.y - 10),"fhjl",self.objattackDic["fhjl"])
	else:
		Global.add_Bullet("Monster18Bullet_1",self.bullet,self.MonsterDirection,1,Vector2(self.position.x - 80,self.position.y - 10),"fhjl",self.objattackDic["fhjl"])
func call_dtsz():
	var PositionList = []
	if self.MonsterDirection == false:
		PositionList = [Vector2(self.position.x - 120 ,self.position.y - 250),Vector2(self.position.x - 270,self.position.y - 250),
		Vector2(self.position.x - 420,self.position.y - 250),Vector2(self.position.x - 570,self.position.y - 250),
		Vector2(self.position.x - 720,self.position.y - 250)]
	else:
		PositionList = [Vector2(self.position.x + 120 ,self.position.y - 250),Vector2(self.position.x + 270,self.position.y - 250),
		Vector2(self.position.x + 420,self.position.y - 250),Vector2(self.position.x + 570,self.position.y - 250),
		Vector2(self.position.x + 720,self.position.y - 250)]
	for i in range(5):
		Global.add_Bullet("Monster18Bullet_2",self.bullet,self.MonsterDirection,1,PositionList[i],"dtsz",self.objattackDic["dtsz"])
		await get_tree().create_timer(0.32,false).timeout
func whencandoHit3():
	var pp = get_parent().get_parent()
	if Skill_1_CD <= 0:
		do_hit_2()
	elif count % 90 == 0:
		var rad = randi_range(0,100)
		if rad <= attackDesire:
			attack_target()
	elif abs(position.x - RoleProp.role_pos_x) < 170:
		if is_need_change:
			match int(pp.current_stage):
				1:
					if position.x > 750:
						move_le = true
						move_ri = false
						move_left()
					elif position.x <= 200:
						move_ri = true
						move_le = false
						move_right()
					else:
						move_le = true
						move_ri = false
						move_left()
				2:
					if position.x > 200:
						move_le = true
						move_ri = false
						move_left()
					else:
						move_ri = true
						move_le = false
						move_right()	
				3:
					if position.x > 330:
						move_le = true
						move_ri = false
						move_left()
					else:
						move_ri = true
						move_le = false
						move_right()	
				4:
					if position.x > 4330:
						move_le = true
						move_ri = false
						move_left()
					elif position.x <= 3670:
						move_ri = true
						move_le = false
						move_right()	
					else:
						move_le = true
						move_ri = false
						move_left()
			is_need_change = false
		else:
			if move_le:
				move_left()
			elif move_ri:
				move_right()	
	else:
		if abs(position.x - RoleProp.role_pos_x) >= 170:
			if RoleProp.role_pos_x > position.x:
				move_right()
			else:
				move_left()
			do_hit_3()
		
func _on_change_dir_timeout() -> void:
	is_need_change = true
