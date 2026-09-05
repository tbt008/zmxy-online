extends BaseLevel
class_name Lhhj
@onready var stop_1: CollisionShape2D = $wall/stop1
var is_cc = false
var IsSet: bool
func _ready() -> void:
	Global.CurrentLevel = ""
	Global.addBGM_(self,"res://Music/level/szzw.mp3")

	self.level_stage = 1
	super._ready()
	Monster_group = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_x = {
		"stage_1": [500],
		"stage_2": [500],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_y = {
		"stage_1": [500],
		"stage_2": [500],
		"stage_3": [],
		"stage_4": [],
	}
func _physics_process(delta: float) -> void:
	role_information.gogo.visible = false
	if not IsSet:
		#print("000")
		for u in Global.LHHJBossList:
			var i = Global.LHHJBossList[u]
			var Monster
			var Id = i["Num"]
			var Local = Vector2(1100,400)
			if Id == 33 or Id == 24 or Id == 56:
				Local = Vector2(700,390)
			Monster = Global.Create_Monster(i["Num"],monster,Local)
			if i["Name"] != null and str(i["Name"]) != "":
				Monster.my_mr_name = str(i["Name"])
			if int(i["Level"]) > 0:
				Monster.level = i["Level"]
			if int(i["SHp"]) > 0:
				Monster.SHp = i["SHp"]
				Monster.Hp = Monster.SHp
			if int(i["def"]) > 0:
				Monster.def = i["def"]
			if int(i["mdef"]) > 0:
				Monster.mdef = i["mdef"]
			if int(i["crit"]) > 0:
				Monster.crit = i["crit"]
			if int(i["miss"]) > 0:
				Monster.miss = i["miss"]
			if int(i["lucky"]) > 0:
				Monster.lucky = i["lucky"]
			if int(i["Htarget"]) > 0:
				Monster.Htarget = i["Htarget"]
			if int(i["Toughness"]) > 0:
				Monster.Toughness = i["Toughness"]
			if int(i["Critreduce"]) > 0:
				Monster.Critreduce = i["Critreduce"]
			if int(i["ar"]) > 0:
				Monster.ar = i["ar"]
			if int(i["sp"]) > 0:
				Monster.sp = i["sp"]
			if int(i["speed"]) > 0:
				Monster.speed = i["speed"]
			if int(i["self_rhp"]) > 0:
				Monster.self_rhp = i["self_rhp"]
			if float(i["ebol"]) > 0:
				Monster.ebol = i["ebol"]
			Monster.fall_list = []
			Monster.add_exp = 0
			Monster.fall_coin = 0
			Monster.fall_pro = 0
			Monster.fall_stone_pro = 0
			Monster.fall_stone = []	
			if int(i["power"]) > 0:
				for z in Monster.objattackDic:
					if Monster.objattackDic[z].has("power"):
						Monster.objattackDic[z]["power"] = i["power"]
		IsSet = true
	if not is_cc:
		if Role_.position.x >= 600:
			create_control.wait_time = 3
			create_control.start()	
			is_cc = true
			role_information.gogo.visible = false
		else:
			create_control.wait_time = 3
			create_control.start()	
	super._physics_process(delta)	
	my_camera.max_right = 1400
	#my_camera.max_top = -170
	if current_stage >= 1:
		if check_can_pass() and current_stage < 1:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false
