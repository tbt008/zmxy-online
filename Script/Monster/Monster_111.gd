extends BaseMonster
class_name Monster111
func monster_109():
	self.is_boss = false
	self.my_mr_name = "人参童子"
	self.attack_in = 90
	self.level = 50
	self.SHp = 16000
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
	self.speed = 11
	self.mysee = 500
	self.attackRange = 165
	self.attackDesire = 80
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 220
	self.fall_coin = 220
	self.objattackDic["hit1"] = {
		"power": 500,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "renshen",
			"value": randi_range(1,2)
		},
	]
	self.fall_stone_pro = 0.28
	self.fall_stone = [
		{
			"name": "ziyanyujin",
			"value": randi_range(1,5)
		},
	]		
func _ready() -> void:
	super._ready()
	Skill_1_CD = 0
	monster_109()
func CallBullet1():
	var Bullets
	if self.MonsterDirection:
		Bullets = Global.add_Bullet("Monster111Bullet",self.bullet,MonsterDirection,1,Vector2(40,0) + position,"hit1",self.objattackDic["hit1"])
	else:
		Bullets = Global.add_Bullet("Monster111Bullet",self.bullet,MonsterDirection,1,Vector2(40,0) + position,"hit1",self.objattackDic["hit1"])
func do_hit_1():
	super.to_hero()
	Skill_1_CD = randi_range(15,18)
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
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt() and not is_Immobilize:
		if has_target == false:
			normal_state()
		else:
			if follow_Hero():
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
func MonsterCureHp():
	var BaseLevel_ = get_parent().get_parent() as BaseLevel
	for i in BaseLevel_.monster.get_children():
		if i != null:
			if i is BaseMonster:
				Global.add_SpecialEffect(i,Vector2(0,-45),"Monster111Bullet",Vector2(1,1),false,1)
				i.cure_hp(i.SHp * 0.35)
				if i.Hp >= i.SHp:
					i.hd += i.SHp * 0.35
					i.max_hd = i.hd
