extends BaseMonster
class_name Monster78
var MyBrother
func monster_78():
	self.is_boss = true
	self.my_mr_name = "顺风耳"
	self.attack_in = 15
	self.level = 35
	self.SHp = 40000
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
	self.speed = 10
	self.mysee = 400
	self.attackRange = 350
	self.attackDesire = 75
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 100
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 5,
			"ReduceInterval": 0,
			"value": 0.5,
			"DeBuff": true,
			"AttackKind": "",
			"CanAdd":false,
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "xhz",
			"value": 0
		},
		{
			"name": "kys",
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
	monster_78()
	Skill_1_CD = 0

func Monster_Intelligence():
	get_monster_76()
	if MyBrother != null:
		self.def = 600
		self.mdef = 600
	else:
		self.def = 150
		self.mdef = 150
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if abs(position.x - RoleProp.role_pos_x) > attackRange:
				have_target()
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 1200:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				else:
					if count % 60 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
						else:
							stop_move()
					else:
						stop_move()

func do_hit_2():
	to_hero()
	Skill_1_CD = 5
	hit_name = "hit1"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func get_monster_76():
	if self.is_boss:
		var tta = get_parent().get_children()
		for i in tta:
			if i is Monster77:
				MyBrother = i
				
func strength():
	if MyBrother != null:
		MyBrother.cure_hp(SHp * 0.4)
		for i in MyBrother.objattackDic:
			if MyBrother.objattackDic[i].has("power"):
				MyBrother.objattackDic[i]["power"] *= 1.05
func AddChild2():
	var po:Vector2
	if MonsterDirection:
		po = Vector2(60,5)
	else:
		po = Vector2(-60,5)
	var child = Global.add_Bullet("Monster78Bullet",bullet,MonsterDirection,2,position + po,"hit1",self.objattackDic["hit1"])
