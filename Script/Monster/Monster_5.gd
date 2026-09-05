extends BaseMonster
class_name Monster5

func monster_5():
	self.is_boss = true
	self.my_mr_name = "禺狨王"
	self.attack_in = 120
	self.level = 13
	self.SHp = 1200
	self.Hp = self.SHp
	self.def = 50
	self.mdef = 80
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 400
	self.attackRange = 180
	self.attackDesire = 80
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 80
	self.fall_coin = 30
	self.objattackDic["hit1"] = {
		"power": 55,
		"hurtBack":[-8,-15],
		"attackKind": "physics",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0.35,
			"CanAdd":false,
			"DeBuff": true,
			"AttackKind": "",
		},
		"HitProtect": 8,
	}
	self.objattackDic["yyzl"] = {
		"power": 75,
		"hurtBack":[5,-15],
		"attackKind": "magic",
		"HitProtect": 18,
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "dsqz",
			"value": 0
		},
		{
			"name": "dsyj",
			"value": 0
		},
		{
			"name": "jmc",
			"value": 0
		},
		{
			"name": "zhj",
			"value": 0
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [

	]	
func _ready() -> void:
	super._ready()
	monster_5()
	Skill_1_CD = 0

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
					if abs(position.x - RoleProp.role_pos_x) <= 900:
						do_hit_2()
					else:
						have_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				elif count % 60 == 0:
					attack_target()
				else:
					stop_move()
func do_hit_2():
	Skill_1_CD = 15
	hit_name = "yyzl"
	velocity.x = 0
	is_attacking = true
	mr_player.play("yyzl")
	await mr_player.animation_finished
	is_attacking = false
func CallYYZL():
	var Po = Vector2(RoleProp.role_pos_x,500)
	await get_tree().create_timer(1,false).timeout
	var ly = Global.add_Bullet("Monster5Bullet",self.bullet,false,1,Po,"yyzl",self.objattackDic["yyzl"])
	ly.scale = Vector2(0.57,0.7)
