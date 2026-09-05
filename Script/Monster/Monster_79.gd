extends BaseMonster
class_name Monster79
var CurrentStage: int = 0
var IsRelif: bool
func monster_79():
	self.rush_speed = 600
	self.is_boss = true
	self.my_mr_name = "巨灵神"
	self.attack_in = 15
	self.level = 35
	self.SHp = 50000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 20
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 15
	self.mysee = 400
	self.attackRange = 200
	self.attackDesire = 90
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 100
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
		"HitProtect": 10
	}
	self.objattackDic["hit2"] = {
		"power": 300,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
		"HitProtect": 25,
		"addeffect":{
			"Name": "stun",
			"AddTime": 1.5,
			"CanAdd":false,
			"DeBuff": true,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		}
	}
	self.objattackDic["hit3"] = {
		"power": 180,
		"hurtBack":[-16,-9],
		"attackKind": "magic",
		"HitProtect": 5,
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0.2,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xhc",
			"value": 0
		},
		{
			"name": "xhp",
			"value": 0
		},
		{
			"name": "xhj",
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
	monster_79()
	Skill_1_CD = 0
	Skill_2_CD = 0

func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if abs(position.x - RoleProp.role_pos_x) <= 270:
					if Skill_1_CD <= 0:
						do_hit_2()
				if Skill_2_CD <= 0:
					do_hit_3()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_2()
				if Skill_2_CD <= 0:
					do_hit_3()
				if count % 60 == 0:
					if randi_range(0,100) <= attackDesire:
						attack_target()
						
func do_hit_2():
	to_hero()
	Skill_1_CD = 15
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	to_hero()
	Skill_2_CD = 18
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
func destroy():
	CurrentStage += 1
	if CurrentStage >= 3:
		fall_items()
		fall_medicine()
		fall_stone_()
		await mr_player.animation_finished
		self.queue_free()
	var tween = create_tween()
	match CurrentStage:
		1:
			tween.tween_property(self,"scale",Vector2(1.5,1.5),1)
			await get_tree().create_timer(0.8,false).timeout
			self.def = 180
			self.mdef = 180
			self.SHp = 60000
			self.speed = 12
			self.objattackDic["hit1"] = {
				"power": 300,
				"hurtBack":[-7,-9],
				"attackKind": "physics",
				"HitProtect": 10
			}
			self.objattackDic["hit2"] = {
				"power": 400,
				"hurtBack":[-7,-15],
				"attackKind": "magic",
				"HitProtect": 25,
				"addeffect":{
					"Name": "stun",
					"AddTime": 2,
					"ReduceInterval": 0,
					"value": 0,
					"AttackKind": "",
					"CanAdd":false,
					"DeBuff": true,
				}
			}
			self.objattackDic["hit3"] = {
				"power": 270,
				"hurtBack":[-16,-9],
				"attackKind": "magic",
				"HitProtect": 5,
				"addeffect":{
					"Name": "speed_down",
					"AddTime": 1,
					"ReduceInterval": 0,
					"value": 0.2,
					"AttackKind": "",
					"CanAdd":false,
					"DeBuff": true,
				}
			}
			set_fullHp()
		2:
			tween.tween_property(self,"scale",Vector2(2.2,2.2),1)
			await get_tree().create_timer(0.8,false).timeout
			self.def = 200
			self.mdef = 200
			self.SHp = 70000
			self.speed = 8
			self.objattackDic["hit1"] = {
				"power": 380,
				"hurtBack":[-7,-9],
				"attackKind": "physics",
				"HitProtect": 10
			}
			self.objattackDic["hit2"] = {
				"power": 500,
				"hurtBack":[-7,-15],
				"attackKind": "magic",
				"HitProtect": 25,
				"addeffect":{
					"Name": "stun",
					"AddTime": 3,
					"ReduceInterval": 0,
					"value": 0,
					"AttackKind": "",
					"CanAdd":false,
					"DeBuff": true,
				}
			}
			self.objattackDic["hit3"] = {
				"power": 330,
				"hurtBack":[-16,-9],
				"attackKind": "magic",
				"HitProtect": 5,
				"addeffect":{
					"Name": "speed_down",
					"AddTime": 2,
					"ReduceInterval": 0,
					"value": 0.5,
					"AttackKind": "",
					"CanAdd":false,
					"DeBuff": true,
				}
			}
			set_fullHp()
			
func state_hurt():
	is_jgz = false
	if CurrentStage >= 2:
		is_be_attacking = false
		return
	super.state_hurt()
