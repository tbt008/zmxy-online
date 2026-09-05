extends BaseMonster
class_name Monster113
func monster_113():
	self.is_boss = false
	self.my_mr_name = "电魂童子"
	self.attack_in = 90
	self.level = 50
	self.SHp = 15000
	self.Hp = self.SHp
	self.def = 120
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
	self.objattackDic["hit2"] = {
		"power": 500,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"HitProtect": 10,
	}
	self.fall_pro = 0.3
	self.fall_list = [
		{
			"name": "leizong",
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
	monster_113()
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
func _on_hurt_box_area_entered(area: Area2D) -> void:
	super._on_hurt_box_area_entered(area)
	if randi_range(0,100) < 30:
		do_hit_1()
func AddBullet():
		Global.add_Bullet("Monster112Bullet",self.bullet,false,1,get_Player.position + Vector2(0,60),"hit2",self.objattackDic["hit2"])
