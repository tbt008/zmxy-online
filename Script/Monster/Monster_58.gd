extends BaseMonster
class_name Monster58
var Round
func monster_58():
	self.is_boss = false
	self.my_mr_name = "勾魂使者"
	self.attack_in = 0
	self.level = 30
	self.SHp = 5000
	self.Hp = self.SHp
	self.def = 150
	self.mdef = 100
	self.crit = 10
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 500
	self.attackRange = 80
	self.attackDesire = 60
	self.behit_calmtime = 0.3
	self.self_rhp = 0
	self.add_exp = 90
	self.fall_coin = 50
	self.objattackDic["hit1"] = {
		"power": 180,
		"hurtBack":[-4,-9],
		"attackKind": "physics",
	}
	self.objattackDic["dmghr"] = {
		"power": 60,
		"hurtBack":[-1,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Bleed",
			"AddTime": 3,
			"ReduceInterval": 0.5,
			"value": 10,
			"CanAdd": true,
			"DeBuff": true,
			"AttackKind": "real",
		}
	}
	self.fall_pro = 0.0
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_58()
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
					if abs(position.x - RoleProp.role_pos_x) <= 320:
						do_hit_2()
					else:
						have_target()
				else:
					have_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
				else: 
					if count % 90 == 0:
						attack_target()
					else:
						stop_move()
func do_hit_2():
	Skill_1_CD = 4
	hit_name = "dmghr"
	velocity.x = 0
	is_attacking = true
	mr_player.play("dmghr")
	await mr_player.animation_finished
	is_attacking = false
func CallRound():
	var pp = Vector2(self.position.x,self.position.y)
	var tween = get_tree().create_tween()
	Round = Global.add_Bullet("Monster58Bullet",bullet,false,1,pp,"dmghr",self.objattackDic["dmghr"])
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
