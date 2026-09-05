extends BaseMonster
class_name Monster28
func monster_28(is_boss_):
	self.my_mr_name = "守夜人"
	if is_boss_:
		self.attack_in = 30
		self.level = 25
		self.SHp = 15000
		self.Hp = self.SHp
		self.def = 120
		self.mdef = 150
		self.crit = 35
		self.miss = 18
		self.lucky = 0
		self.Htarget = 10
		self.Toughness = 10
		self.ar = 20
		self.sp = 20
		self.Critreduce = 0
		self.speed = 6
		self.mysee = 400
		self.attackRange = 135
		self.attackDesire = 100
		self.behit_calmtime = 0.1
		self.self_rhp = 0
		self.add_exp = 200
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": 180,
			"hurtBack":[-6,-9],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 2,
				"ReduceInterval": 0.5,
				"CanAdd":true,
				"DeBuff": true,
				"value": int(RoleProp.roleprop.SHp * 0.02),
				"AttackKind": "magic",
			}
		}
		self.objattackDic["hsg"] = {
			"power": 90 + RoleProp.roleprop.SHp * 0.08,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Fire",
				"AddTime": 4,
				"ReduceInterval": 0.5,
				"CanAdd":true,
				"DeBuff": true,
				"value": int(RoleProp.roleprop.SHp * 0.02),
				"AttackKind": "magic",
			}
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "lzp",
				"value": 0
			},
			{
				"name": "jmy",
				"value": 0
			}
		]	
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
	else:
		self.attack_in = 10
		self.level = 27
		self.SHp = 2000
		self.Hp = self.SHp
		self.def = 150
		self.mdef = 150
		self.crit = 10
		self.miss = 10
		self.lucky = 0
		self.Htarget = 8
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 7
		self.mysee = 300
		self.attackRange = 135
		self.attackDesire = 100
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 60
		self.fall_coin = 25
		self.objattackDic["hit1"] = {
			"power": 90,
			"hurtBack":[-6,-9],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Bleed",
				"AddTime": 1,
				"ReduceInterval": 0.5,
				"CanAdd":true,
				"DeBuff": true,
				"value": int(RoleProp.roleprop.SHp * 0.02),
				"AttackKind": "magic",
			}
		}
		self.objattackDic["hsg"] = {
			"power": 40 + RoleProp.roleprop.SHp * 0.04,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"addeffect":{
				"Name": "Fire",
				"AddTime": 1,
				"ReduceInterval": 0.5,
				"CanAdd":true,
				"DeBuff": true,
				"value": int(RoleProp.roleprop.SHp * 0.02),
				"AttackKind": "magic",
			}
		}
		self.fall_pro = 0
		self.fall_list = [

		]	
		self.fall_stone_pro = 0
		self.fall_stone = [
		]	
func _ready() -> void:
	super._ready()
	if get_parent().get_parent().name == "Level_11":
		is_boss = true
	else:
		is_boss = false
	monster_28(is_boss)
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 330:
						do_hit_2()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				elif count % 90 == 0:
					if ran_num <= attackDesire:
						attack_target()
				else:
					stop_move()

func do_hit_2():
	Skill_1_CD = 8
	hit_name = "hsg"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hsg")
	await mr_player.animation_finished
	is_attacking = false				
func call_Bullet_1():
	if self.MonsterDirection:
		var po = Vector2(self.position.x + 40,self.position.y + 20)
		Global.add_Bullet("Monster28Bullet_2",self.bullet,self.MonsterDirection,1,po,"hit1",self.objattackDic["hit1"])
		await get_tree().create_timer(0.3,false).timeout
		Global.add_Bullet("Monster28Bullet_2",self.bullet,self.MonsterDirection,1,po + Vector2(randi_range(40,50),0),"hit1",self.objattackDic["hit1"])
	else:
		var po = Vector2(self.position.x - 40,self.position.y + 20)
		Global.add_Bullet("Monster28Bullet_2",self.bullet,self.MonsterDirection,1,po,"hit1",self.objattackDic["hit1"])
		Global.add_Bullet("Monster28Bullet_2",self.bullet,self.MonsterDirection,1,po + Vector2(randi_range(-40,-50),0),"hit1",self.objattackDic["hit1"])
func call_Bullet_2():
	if self.MonsterDirection:
		Global.CallFlyBullet(self.bullet,"Monster28Bullet_1",1,Vector2(position.x,position.y),900,-200,"hsg",self.objattackDic["hsg"])
	else:
		Global.CallFlyBullet(self.bullet,"Monster28Bullet_1",1,Vector2(position.x,position.y),900,200,"hsg",self.objattackDic["hsg"])
