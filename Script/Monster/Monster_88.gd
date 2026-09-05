extends BaseMonster
class_name Monster88
func monster_88():
	self.is_boss = false
	self.my_mr_name = "牛妖"
	self.attack_in = 90
	self.level = 35
	self.SHp = 12000
	self.Hp = self.SHp
	self.def = 140
	self.mdef = 140
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 70
	self.Toughness = 70
	self.ar = 35
	self.sp = 35
	self.Critreduce = 0
	self.speed = 8
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 150
	self.fall_coin = 110
	self.objattackDic["hit1"] = {
		"power": 150,
		"hurtBack":[-8,-12],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.objattackDic["hit2"] = {
		"power": 200,
		"hurtBack":[-1,-1],
		"attackKind": "physics",
		"HitProtect": 20,
		"addeffect":{
			"Name": "Immobilize",
			"AddTime": 3,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
			"CanAdd":false,
			"DeBuff": true,
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
	monster_88()
	Skill_1_CD = randi_range(5,8)
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(8,12)
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
	
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
				if abs(position.x - RoleProp.role_pos_x) <= 300:
					if count % 90 == 0:
						if randi_range(0,100) < attackDesire:
							attack_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_1()
				elif count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
					else:
						stop_move()
				else:
					stop_move()

func ADDMonsterBullet():
	Global.add_Bullet("Monster88Bullet",self.bullet,MonsterDirection,1,Vector2(get_Player.position.x,470),"hit2",self.objattackDic["hit2"])

