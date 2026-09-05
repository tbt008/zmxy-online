extends BaseMonster
class_name Monster24
var hand_1
var hand_2
var is_set
@onready var RandFire: Timer = $Fire
@onready var ShowHeartTimer: Timer = $Heart
var boos_4: Monster141
func monster_24():
	if get_parent().get_parent() is LevelNMGHDGQ:
		self.CannotAttract = true
		self.is_bt = true
		self.is_boss = true
		self.my_mr_name = "牛魔王·鬼"
		self.attack_in = 0
		self.level = 50
		self.SHp = 400000
		self.Hp = self.SHp
		self.def = 500
		self.mdef = 500
		self.crit = 40
		self.miss = 35
		self.lucky = 60
		self.Htarget = 20
		self.Toughness = 0
		self.ar = 50
		self.sp = 50
		self.Critreduce = 0
		self.speed = 40
		self.mysee = 300
		self.attackRange = 85
		self.attackDesire = 70
		self.behit_calmtime = 0
		self.self_rhp = 0
		self.add_exp = 0
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": 450,
			"hurtBack":[-4,-9],
			"attackKind": "physics"
		}
		self.objattackDic["Fire"] = {
			"power": 850,
			"hurtBack":[-4,-9],
			"attackKind": "magic",
			"addeffect":{
				"Name": "Fire",
				"AddTime": 5,
				"CanAdd":true,
				"DeBuff": true,
				"ReduceInterval": 0.5,
				"value": 80,
				"AttackKind": "real",
			}
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "nmwdnhsp",
				"value": 5
			},
		]	
		self.fall_stone_pro = 0.5
		self.fall_stone = [
			{
				"name": "putongnmwsz",
				"value": 0
			},
		]
		return	
	self.CannotAttract = true
	self.is_bt = true
	self.is_boss = true
	self.my_mr_name = "牛魔王·鬼"
	self.attack_in = 0
	self.level = 25
	self.SHp = 30000
	self.Hp = self.SHp
	self.def = 200
	self.mdef = 200
	self.crit = 0
	self.miss = 8
	self.lucky = 0
	self.Htarget = 0
	self.Toughness = 0
	self.ar = 0
	self.sp = 0
	self.Critreduce = 0
	self.speed = 40
	self.mysee = 300
	self.attackRange = 85
	self.attackDesire = 70
	self.behit_calmtime = 0
	self.self_rhp = 0
	self.add_exp = 0
	self.fall_coin = 200
	self.objattackDic["hit1"] = {
		"power": 450,
		"hurtBack":[-4,-9],
		"attackKind": "physics"
	}
	self.objattackDic["Fire"] = {
		"power": 250,
		"hurtBack":[-4,-9],
		"attackKind": "magic",
		"addeffect":{
			"Name": "Fire",
			"AddTime": 2.5,
			"CanAdd":true,
			"DeBuff": true,
			"ReduceInterval": 0.5,
			"value": 20,
			"AttackKind": "magic",
		}
	}
	self.fall_pro = 0.5
	self.fall_list = [
		{
			"name": "ttlp1",
			"value": 1
		},
	]	
	self.fall_stone_pro = 0
	self.fall_stone = [
	]	
func _ready() -> void:
	super._ready()
	Skill_1_CD = 10
	monster_24()
	await get_tree().create_timer(0.5,false).timeout
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if self.Hp <= 0:
		if hand_1 != null:
			hand_1.queue_free()
		if hand_2 != null:
			hand_2.queue_free()
	if self.Hp <= 0:
		if get_parent().get_parent() is LevelNMGHDGQ:
			if boos_4 == null:
				boos_4 = Global.Create_Monster(141,get_parent(),Vector2(700,430))
func Monster_Intelligence():
	
	hit_name = "Fire"
	if not is_set:
		monster_24()
		hide_heart()
		is_set = true
		if hand_1 == null:
			hand_1 = Global.create_hands(get_parent(),true,Vector2(self.position.x + 200,300))
		if hand_2 == null:
			hand_2 = Global.create_hands(get_parent(),false,Vector2(self.position.x - 200,300))
	if self.Hp <= 0:
		if hand_1 != null:
			hand_1.queue_free()
		if hand_2 != null:
			hand_2.queue_free()
	if Skill_1_CD <= 0:
		call_fire_1()
			
func _on_add_eyes_timeout() -> void:
	pass

func call_fire_1():
	RandFire.stop()
	Skill_1_CD = 26
	var ppx = [-450,-350,-250,-150,-50,50,150,250,350]
	var ppy = [370,370,370,370,370,370,370,370,370]
	for i in range(9):
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,Vector2(ppx[i] + position.x,ppy[i]),"Fire",self.objattackDic["Fire"])
		await get_tree().create_timer(0.4,false).timeout
	await get_tree().create_timer(1,false).timeout
	call_fire_2()
func call_fire_2():
	var ppx = [570,470,370,270,170,70,-30,-130,-230]
	var ppy = [370,370,370,370,370,370,370,370,370]
	for i in range(9):
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,Vector2(ppx[i] + position.x,ppy[i]),"Fire",self.objattackDic["Fire"])
		await get_tree().create_timer(0.4,false).timeout
	await get_tree().create_timer(1,false).timeout
	call_fire_3()
func call_fire_3():
	var ppx = [650,450,250,50,-150,-350,-550]
	#var ppx = [850,1050,1250,1450,1650,1850,2050]
	var ppy = [370,370,370,370,370,370,370]
	for i in range(7):
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,Vector2(ppx[i] + position.x,ppy[i]),"Fire",self.objattackDic["Fire"])
	await get_tree().create_timer(1,false).timeout
	call_fire_4()
func call_fire_4():
	var ppx = [-450,-250,-50,150,350,550,750]
	var ppy = [370,370,370,370,370,370,370]
	for i in range(7):
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,Vector2(ppx[i] + position.x,ppy[i]),"Fire",self.objattackDic["Fire"])
	await get_tree().create_timer(1,false).timeout
	RandFire.start(randi_range(4,5))
func _on_fire_timeout() -> void:
	for i in range(3,10):
		Global.add_Bullet("Monster22Fire",self.bullet,false,1,Vector2(randi_range(-500,500) + position.x,370),"Fire",self.objattackDic["Fire"])
func show_heart():
	ShowHeartTimer.start(randi_range(6,11))
func hide_heart():
	ShowHeartTimer.start(randi_range(6,8))

func _on_heart_timeout() -> void:
	if monster_dir.visible:
		monster_dir.visible = false
		$BaseDamageBox/HurtBox/HurtBox.disabled = true
		hide_heart()
	else:
		$BaseDamageBox/HurtBox/HurtBox.disabled = false
		monster_dir.visible = true
		show_heart()
