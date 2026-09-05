extends BaseMonster
class_name Monster120
var CureBl: float = 1
func monster_120():
	self.is_boss = false
	self.my_mr_name = "黑烟炼气师"
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
		"power": 800,
		"hurtBack":[-7,0],
		"attackKind": "magic",
		"addeffect":{
			"Name": "lpzbuff",
			"AddTime": 5,
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
	monster_120()
	Skill_1_CD = 6
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
				if count % 90 == 0:
					if randi_range(0,100) < attackDesire:
						attack_target()
			else:
				if Skill_1_CD <= 0:
					do_hit_2()
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
func CallBullet1():
	var Bullets
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster120Bullet1",self.bullet,false,1.5,Vector2(0,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullets = Global.add_Bullet("Monster120Bullet1",self.bullet,false,1.5,Vector2(0,0) + position,"hit1",self.objattackDic["hit1"])
	Bullets.look_at(get_Player.position)
func CallBullet2():
	Global.add_Bullet("Monster120Bullet2",self.bullet,false,1.5,Vector2(get_Player.position.x,500),"hit2",self.objattackDic["hit2"])
	pass
