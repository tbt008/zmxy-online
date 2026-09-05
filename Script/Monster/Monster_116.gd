extends BaseMonster
class_name Monster116
func monster_116():
	self.is_Fly = true
	self.is_boss = true
	self.my_mr_name = "五龙轮"
	self.attack_in = 60
	self.level = 55
	self.SHp = 300000
	self.Hp = self.SHp
	self.def = 350
	self.mdef = 400
	self.crit = 0
	self.miss = 0
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 20
	self.sp = 20
	self.Critreduce = 0
	self.speed = 14
	self.mysee = 500
	self.attackRange = 205
	self.attackDesire = 90
	self.behit_calmtime = 0.2
	self.self_rhp = 0
	self.add_exp = 15
	self.fall_coin = 4
	self.objattackDic["hit1"] = {
		"power": 400,
		"hurtBack":[-4,-9],
		"attackKind": "real"
	}
	self.fall_pro = 0
	self.fall_list = []		
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_116()
	Skill_1_CD = 10
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
	Skill_1_CD = 10
	hit_name = "hit2"
	velocity.x = 0
	is_attacking = true
	mr_player.play("hit2")
	await mr_player.animation_finished
	is_attacking = false
	stop_move()
func CallBullet():
	var Bullet
	Bullet = Global.add_Bullet("Monster116Bullet",self.bullet,false,2.5,Vector2(0,0) + position,"hit1",self.objattackDic["hit1"])	
	Bullet.look_at(get_Player.position)
func MonsterCureHp():
	var BaseLevel_ = get_parent().get_parent() as BaseLevel
	for i in BaseLevel_.monster.get_children():
		if i != null:
			if i is BaseMonster and not i is Monster138:
				i.cure_hp(i.SHp * 0.05)
				if i.Hp >= i.SHp:
					i.hd += i.SHp * 0.05
					i.max_hd = i.hd
