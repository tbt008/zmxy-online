extends BaseMonster
class_name Monster119
var CureBl: float = 1
func monster_119():
	self.is_boss = false
	self.my_mr_name = "噩梦炼气师"
	self.attack_in = 30
	self.level = 55
	self.SHp = 40000
	self.Hp = self.SHp
	self.def = 355
	self.mdef = 365
	self.crit = 28
	self.miss = 28
	self.lucky = 40
	self.Htarget = 0
	self.Toughness = 35
	self.ar = 65
	self.sp = 65
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 600
	self.attackRange = 135
	self.attackDesire = 85
	self.behit_calmtime = 0.4
	self.self_rhp = 0
	self.add_exp = 100
	self.fall_coin = 30
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
		"HitProtect": 15,
	}
	self.objattackDic["hit2"] = {
		"power": 700,
		"hurtBack":[0,0],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0,
			"CanAdd":true,
			"CanRemove":false,
			"AttackKind": "",
		}
	}
	self.objattackDic["hit3"] = {
		"power": 800,
		"hurtBack":[-7,0],
		"attackKind": "magic",
	}
	self.fall_pro = 0.5
	self.fall_list = []
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_119()
	Skill_1_CD = 6
	Skill_2_CD = 8
func _physics_process(delta: float) -> void:
	super._physics_process(delta)

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
					do_hit_2()
				if abs(position.x - RoleProp.role_pos_x) <= 270:
					if Skill_2_CD <= 0:
						do_hit_3()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				elif Skill_2_CD <= 0:
					do_hit_3()
				elif count % 60 == 0:
					var rad = randi_range(0,100)
					if rad <= attackDesire:
						attack_target()
				else:
					stop_move()
func do_hit_2():
	Skill_1_CD = 6
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 8
	velocity.x = 0
	hit_name = "hit3"
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
func StrengthSelf():
	for i in objattackDic:
		if objattackDic[i].has("power"):
			objattackDic[i].power *= 1.2
	CureBl += 0.5
	def += 10
	mdef += 10
func _on_hit_box_area_exited(_area: Area2D) -> void:
	super._on_hit_box_area_entered(_area)
	if hit_name == "hit3":
		cure_hp(SHp * 0.1 * CureBl)
	
