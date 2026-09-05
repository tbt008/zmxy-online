extends BaseMonster
class_name Monster137


func monster_137():
	self.is_Fly = true
	self.is_boss = true
	self.my_mr_name = "持国天王"
	self.attack_in = 90
	self.level = 35
	self.SHp = 110000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 20
	self.miss = 20
	self.lucky = 0
	self.Htarget = 20
	self.Toughness = 20
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 13
	self.mysee = 500
	self.attackRange = 145
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 200
	self.fall_coin = 135
	self.objattackDic["hit1"] = {
		"power": 300,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "silent",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		}
	}
	self.objattackDic["hit2"] = {
		"power": 350,
		"hurtBack":[-2,-4],
		"attackKind": "magic",
		"HitProtect": 10,
		"addeffect":{
			"Name": "stun",
			"AddTime": 4,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"DeBuff": true,
			"CanAdd":false,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "tdlzjzzs",
			"value": 1
		},

	]
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_137()
func Monster_Intelligence():
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) >= attackRange:
				have_target()
				if Skill_1_CD <= 0:
					do_hit_1()
			else:
				stop_move()
				if Skill_1_CD <= 0:
					do_hit_1()
				if count % 60 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(10,12)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func Call():
	Global.Create_Monster(136,get_parent(),get_Player.position)
	var PositionList = [get_Player.position + Vector2(-100,-100),get_Player.position + Vector2(0,-100),get_Player.position + Vector2(100,-100)]
	for i in PositionList:
		Global.add_Bullet("Monster137Bullet1",self.bullet,false,1,i,"hit2",self.objattackDic["hit2"])
