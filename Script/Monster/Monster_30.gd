extends BaseMonster
class_name Monster30
var brother: Monster31
func monster_30(is_boss_):
	self.my_mr_name = "黑无常"
	if is_boss_:
		self.attack_in = 0
		self.level = 27
		self.SHp = 20000
		self.Hp = self.SHp
		self.def = 150
		self.mdef = 150
		self.crit = 15
		self.miss = 10
		self.lucky = 0
		self.Htarget = 10
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 8
		self.mysee = 300
		self.attackRange = 245
		self.attackDesire = 80
		self.behit_calmtime = 0.1
		self.self_rhp = 0
		self.add_exp = 360
		self.fall_coin = 200
		self.objattackDic["hit1"] = {
			"power": 338,
			"hurtBack":[-4,-8],
			"attackKind": "physics",
			"addeffect":{
				"Name": "speed_down",
				"AddTime": 1.5,
				"CanAdd":false,
				"DeBuff": true,
				"ReduceInterval": 0,
				"value": 0.5,
				"AttackKind": "",
			}
		}
		self.fall_pro = 0.5
		self.fall_list = [
			{
				"name": "yhj",
				"value": 0
			},
			{
				"name": "tsgl",
				"value": 0
			},
		]	
		self.fall_stone_pro = 0
		self.fall_stone = []
	else:
		self.attack_in = 10
		self.level = 25
		self.SHp = 3000
		self.Hp = self.SHp
		self.def = 150
		self.mdef = 150
		self.crit = 10
		self.miss = 8
		self.lucky = 0
		self.Htarget = 10
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 7
		self.mysee = 300
		self.attackRange = 145
		self.attackDesire = 60
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 70
		self.fall_coin = 27
		self.objattackDic["hit1"] = {
			"power": 288,
			"hurtBack":[-4,-8],
			"attackKind": "physics",
			"addeffect":{
				"Name": "speed_down",
				"AddTime": 1.5,
				"CanAdd":false,
				"ReduceInterval": 0,
				"value": 0.5,
				"AttackKind": "",
			}
		}
		self.fall_pro = 0.00
		self.fall_list = []	
		self.fall_stone_pro = 0
		self.fall_stone = []
func _ready() -> void:
	super._ready()
	if get_parent().get_parent().name == "Level_12":
		is_boss = true
	else:
		is_boss = false
	monster_30(is_boss)
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	get_death()
func Monster_Intelligence():
	get_death()
	if abs(RoleProp.role_pos_x - position.x) < mysee:
		has_target = true
	if not is_ice and not is_sleep and not is_stun and not cannotchangestatewhenattorbeatt():
		if has_target == false:
			normal_state()
		else:
			if follow_Hero():
				have_target()
			elif count % 60 == 0:
				var rad = randi_range(0,100)
				if rad <= attackDesire:
					attack_target()
			else:
				stop_move()
func get_monster_31():
	if self.is_boss:
		var tta = get_parent().get_children()
		for i in tta:
			if i is Monster31:
				brother = i
	return brother
func get_death():
	get_monster_31()
	if brother != null:
		if get_monster_31().is_boss:
			if get_monster_31().death():
				$call_bai.start(4)

func _on_call_bai_timeout() -> void:
	var par = get_parent()
	var White = Global.Create_Monster(31,par,Vector2(self.position.x,self.position.y))
	var BaseLevel_ = get_parent().get_parent() as BaseLevel
	BaseLevel_.MonsterArray.push_back(White)
	$call_bai.stop()
