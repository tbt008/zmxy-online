extends BaseMonster
class_name Monster66
#@onready var death_: Timer = $Death
#
#func monster_66():
#	self.is_boss = false
#	self.my_mr_name = "毒蜘蛛"
#	self.attack_in = 10
#	self.level = 90
#	self.SHp = 120000
#	self.Hp = self.SHp
#	self.def = 200
#	self.mdef = 200
#	self.crit = 0
#	self.miss = 0
#	self.lucky = 0
#	self.Htarget = 0
#	self.Toughness = 0
#	self.ar = 0
#	self.sp = 0
#	self.Critreduce = 0
#	self.speed = 9
#	self.mysee = 300
#	self.attackRange = 110
#	self.attackDesire = 70
#	self.behit_calmtime = 0.2
#	self.self_rhp = 0
#	self.add_exp = 0
#	self.fall_coin = 0
#	self.objattackDic["hit1"] = {
#		"power": 600,
#		"hurtBack":[-4,-9],
#		"attackKind": "physics",
#		"HitProtect": 12,
#		"addeffect":{
#			"Name": "poision",
#			"AddTime": 3,
#			"ReduceInterval": 1,
#			"DeBuff": true,
#			"CanAdd":true,
#			"value": 100,
#			"AttackKind": "magic",
#		}
#	}
#	self.fall_pro = 0
#	self.fall_list = []	
#	self.fall_stone_pro = 0
#	self.fall_stone = []	
#func _ready() -> void:
#	super._ready()
#	monster_66()
#	death_.start(randi_range(14,18))
#func to_hero():
#	if RoleProp.role_pos_x > position.x:
#		base_damage_box.scale.x = 1
#		monster_dir.scale.x = 1
#	else:
#		base_damage_box.scale.x = -1
#		monster_dir.scale.x = -1
#func attack_target():
#	to_hero()
#	hit_name = "hit1"
#	velocity.x = 0
#	is_attacking = true
#	mr_player.play("hit1")
#	await mr_player.animation_finished
#	is_attacking = false
#	stop_move()
#func _on_death_timeout() -> void:
#	for i in get_parent().get_children():
#		if i is Monster65:
#			i.cure_hp(i.SHp * 0.05)
#	await get_tree().create_timer(1,false).timeout
#	self.Hp = -100
#func _on_hit_box_area_entered(area: Area2D) -> void:
#	super._on_hit_box_area_entered(area)
#	for i in get_parent().get_children():
#		if i is Monster65:
#			i.cure_hp(i.Hp * 0.01)
