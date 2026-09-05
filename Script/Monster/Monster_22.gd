extends BaseMonster
class_name Monster22
var moving_right = true
var moving_left = false
var boss_2: Monster23
func monster_22():
	if get_parent().get_parent() is LevelNMGHDGQ:
		self.CannotAttract = true
		self.is_bt = true
		self.is_boss = true
		self.my_mr_name = "牛魔王·兽"
		self.attack_in = 0
		self.level = 50
		self.SHp = 250000
		self.Hp = self.SHp
		self.def = 300
		self.mdef = 350
		self.crit = 105
		self.miss = 40
		self.lucky = 100
		self.Htarget = 200
		self.Toughness = 0
		self.ar = 100
		self.sp = 100
		self.Critreduce = 0
		self.speed = 40
		self.mysee = 300
		self.attackRange = 85
		self.attackDesire = 70
		self.behit_calmtime = 0
		self.self_rhp = 0
		self.add_exp = 0
		self.fall_coin = 1
		self.objattackDic["hit1"] = {
			"power": 1000,
			"hurtBack":[-8,-9],
			"attackKind": "physics",
			"addeffect":{
				"Name": "stun",
				"AddTime": 5,
				"CanAdd":true,
				"DeBuff": true,
				"DeRemove": false,
				"ReduceInterval": 0.5,
				"value": 0,
				"AttackKind": "",
			}
		}
		self.objattackDic["Fire"] = {
			"power": 1000,
			"hurtBack":[-4,-9],
			"attackKind": "magic"
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "nmwdnhsp",
				"value": 1
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = []	
		return
	self.CannotAttract = true
	self.is_bt = true
	self.is_boss = true
	self.my_mr_name = "牛魔王·兽"
	self.attack_in = 0
	self.level = 25
	self.SHp = 5000
	self.Hp = self.SHp
	self.def = 100
	self.mdef = 150
	self.crit = 5
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
		"power": 300,
		"hurtBack":[-8,-9],
		"attackKind": "physics"
	}
	self.objattackDic["Fire"] = {
		"power": 300,
		"hurtBack":[-4,-9],
		"attackKind": "magic"
	}
	self.fall_pro = 0.00
	self.fall_list = []	
	self.fall_stone_pro = 0
	self.fall_stone = []	
func _ready() -> void:
	super._ready()
	monster_22()
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if self.Hp <= 0:
		var par = get_parent().get_parent()
		if par is level10 or par is LevelNMGHDGQ:
			if boss_2 == null:
				boss_2 = Global.Create_Monster(23,get_parent(),Vector2(self.position.x,330))
func Monster_Intelligence():
	hit_name = "hit1"
	if Hp > 0:
		if moving_left:
			move_left()
		else:
			move_right()
		
func move_left():
	base_damage_box.scale.x = 1
	monster_dir.scale.x = 1
	velocity.x = -speed * 10
	if int($change_dir.time_left) < 7:
		mr_player.play("walk")
	else:
		mr_player.play("hit1")
func move_right():
	base_damage_box.scale.x = -1
	monster_dir.scale.x = -1
	velocity.x = speed * 10
	if int($change_dir.time_left) < 7:
		mr_player.play("walk")
	else:
		mr_player.play("hit1")
func _on_change_dir_timeout() -> void:
	if moving_left:
		moving_right = true
		moving_left = false
	else:
		moving_right = false
		moving_left = true
func call_fire():
	var po = Vector2(self.position.x, self.position.y - 100)
	Global.add_Bullet("Monster22Fire",self.bullet,false,1,po,"Fire",self.objattackDic["Fire"])
	pass
