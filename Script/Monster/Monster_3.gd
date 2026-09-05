extends BaseMonster
class_name Monster3
func monster_3(is_boss_):
	self.my_mr_name = "大猩猩"
	if is_boss_:
		self.attack_in = 30
		self.level = 5
		self.SHp = 300
		self.Hp = self.SHp
		self.def = 50
		self.mdef = 80
		self.crit = 5
		self.miss = 0
		self.lucky = 0
		self.Htarget = 0
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 12
		self.mysee = 400
		self.attackRange = 135
		self.attackDesire = 100
		self.behit_calmtime = 0.1
		self.self_rhp = 0
		self.add_exp = 35
		self.fall_coin = 10
		self.objattackDic["hit1"] = {
			"power": 65,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"HitProtect": 8
		}
		self.fall_pro = 1
		self.fall_list = []
		self.fall_stone_pro = 0
		self.fall_stone = []	
	else:
		self.attack_in = 10
		self.level = 10
		self.SHp = 200
		self.Hp = self.SHp
		self.def = 50
		self.mdef = 50
		self.crit = 5
		self.miss = 0
		self.lucky = 0
		self.Htarget = 0
		self.Toughness = 0
		self.ar = 0
		self.sp = 0
		self.Critreduce = 0
		self.speed = 10
		self.mysee = 300
		self.attackRange = 135
		self.attackDesire = 80
		self.behit_calmtime = 0.2
		self.self_rhp = 0
		self.add_exp = 10
		self.fall_coin = 2
		self.objattackDic["hit1"] = {
			"power": 30,
			"hurtBack":[-4,-9],
			"attackKind": "physics",
			"HitProtect": 8
		}
		self.fall_pro = 0.18
		self.fall_list = [
			{
				"name": "ptxzg",
				"value": 0
			},
			{
				"name": "ptxzf",
				"value": 0
			},
			{
				"name": "ptsmz",
				"value": 0
			},
			{
				"name": "ptjs",
				"value": 0
			},
			{
				"name": "ptdp",
				"value": 0
			},
			{
				"name": "ptcs",
				"value": 0
			},
			{
				"name": "ptyyc",
				"value": 0
			},
			{
				"name": "ptcp",
				"value": 0
			},
		]	
		self.fall_stone_pro = 0.0
		self.fall_stone = []	
func _ready() -> void:
	super._ready()
	if get_parent().get_parent().name == "Level_1":
		is_boss = true
	else:
		is_boss = false
	monster_3(is_boss)

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if is_boss:
		if PlayerData.player_data["武器"].size() == 0 and PlayerData.player_data["防具"].size() == 0 and PlayerData.player_data["饰品"].size() == 0 and PlayerData.player_data["法宝"].size() == 0:
			if PlayerData.get_dj_page("ttlp1") != 0 and PlayerData.get_dj_page("ttlp2") != 0:
				if Global.TotalHurtCount == 0 and PlayerData.player_data["天庭"]:
					self.fall_list = [
						{
							"name": "ttlp3",
							"value": 1
						},]
