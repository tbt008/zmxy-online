extends BaseMonster
class_name Monster121
var IsRush: bool
var CreateCount: int = 0
func monster_121():
	self.is_boss = true
	self.my_mr_name = "花豹圣者"
	self.attack_in = 30
	self.level = 55
	self.SHp = 800000
	self.Hp = self.SHp
	self.def = 600
	self.mdef = 600
	self.crit = 30
	self.miss = 50
	self.lucky = 60
	self.Htarget = 30
	self.Toughness = 35
	self.ar = 100
	self.sp = 100
	self.Critreduce = 0
	self.speed = 12
	self.mysee = 600
	self.attackRange = 335
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
		"power": 800,
		"hurtBack":[-7,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "lpzbuff",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0.5,
			"CanAdd":false,
			"CanRemove":false,
			"AttackKind": "",
		}
	}
	self.objattackDic["hit3"] = {
		"power": 1600,
		"hurtBack":[-1,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "stun",
			"AddTime": 2,
			"ReduceInterval": 0,
			"value": 0.4,
			"CanAdd":false,
			"CanRemove":false,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = []
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_121()
	Skill_1_CD = 6
	Skill_2_CD = 2
func _physics_process(delta: float) -> void:
	super._physics_process(delta)

func Monster_Intelligence():
	if IsRush:
		if CreateCount % 60 == 0:
			AddShallow()
		if MonsterDirection:
			velocity.x = 600	
		else:
			velocity.x = -600
		return
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
				if Skill_2_CD <= 0:
					do_hit_3()
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
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
	Skill_1_CD = 10
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func do_hit_3():
	Skill_2_CD = 10
	hit_name = "hit3"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit3")
	await mr_player.animation_finished
	is_attacking = false
func Begin():
	IsRush = true
func End():
	IsRush = false
func AddShallow():
	var WS_Effect = preload("res://Scene/Hero/Role_1/WS_Effect.tscn").instantiate()
	WS_Effect.add_child(monster_dir.duplicate())
	WS_Effect.live_time = 0.2
	WS_Effect.set("position",get("position"))
	get_parent().add_child(WS_Effect)
