extends BaseMonster
class_name Monster76
var Round
func monster_76():
	self.is_boss = false
	self.my_mr_name = "巫鹰"
	self.attack_in = 15
	self.level = 35
	self.SHp = 5000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 150
	self.crit = 18
	self.miss = 8
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 20
	self.ar = 25
	self.sp = 25
	self.Critreduce = 0
	self.speed = 11
	self.mysee = 400
	self.attackRange = 350
	self.attackDesire = 90
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 110
	self.fall_coin = 70
	self.objattackDic["hit1"] = {
		"power": 200,
		"hurtBack":[-7,-9],
		"attackKind": "physics",
	}
	self.objattackDic["hit2"] = {
		"power": 180,
		"hurtBack":[-7,-15],
		"attackKind": "magic",
		"addeffect":{
			"Name": "speed_down",
			"AddTime": 2,
			"ReduceInterval": 0,
			"CanAdd":false,
			"DeBuff": true,
			"value": 0.3,
			"AttackKind": "",
		}
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "sichou",
			"value": randi_range(1,2)
		},
		{
			"name": "xuantie",
			"value": randi_range(1,2)
		},
		{
			"name": "tanmu",
			"value": randi_range(1,2)
		},
	]	
	self.fall_stone_pro = 0.1
	self.fall_stone = [
		{
			"name": "smlp",
			"value": randi_range(1,2)
		},
	]	
func _ready() -> void:
	super._ready()
	monster_76()
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
					if abs(position.x - RoleProp.role_pos_x) <= 270:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					if abs(position.x - RoleProp.role_pos_x) <= 270:
						do_hit_2()
					else:
						have_target()
				else:
					if count % 60 == 0:
						attack_target()
					else:
						stop_move()

func do_hit_2():
	to_hero()
	Skill_1_CD = 8
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
func CallRound():
	var pp = Vector2(self.position.x,self.position.y)
	var tween = get_tree().create_tween()
	Round = Global.add_Bullet("Monster76Bullet2",bullet,false,1,pp,"hit2",self.objattackDic["hit2"])
	tween.tween_property(Round,"position",setposition(),0.5)
	await get_tree().create_timer(2.5,false).timeout
	return_()
func return_():
	if Round != null:
		var tween = get_tree().create_tween()
		var pp = Vector2(self.position.x,self.position.y)
		tween.tween_property(Round,"position",pp,0.3)
		await get_tree().create_timer(0.28,false).timeout	
		Round.queue_free()
func setposition():
	return Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y)
func CallKnife():
	var po:Vector2
	if MonsterDirection:
		po = Vector2(70,-20)
	else:
		po = Vector2(-70,-20)
	Global.add_Bullet("Monster76Bullet1",bullet,MonsterDirection,1,position + po,"hit1",self.objattackDic["hit1"])
