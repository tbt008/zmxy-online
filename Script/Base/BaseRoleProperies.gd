extends Node
var Directon: bool
var SourcePlayer: BaseHero
var roleprop = {}
var baseroleprop = {}
var equprop = {}
var Paslprop = {}
var WqBs_prop = {}
var FjBs_prop = {}
var SpBs_prop = {}
var role_pos_x
var role_pos
var role_pos_y
var slz_level: int
var hytj_level: int
var lys_level: int
var lyfb_level: int
var hmz_level: int
var ws_value: int
var max_ws_value = 100
var is_ws_state = false
var ws_up_power = 1
var wq_prop = {}
var fj_prop = {}
var sp_prop = {}
var sz_prop = {}
var tx_prop = {}
var cb_prop = {}
var fb_prop = {}
var Role1SXBJ:float
var Role1SXxx:float
var CurrentHp:int = 1
var CurrentMp:int = 1
var PelletProps = {
	"1品丹":{
		"生命": 100,
		"魔法": 10,
		"攻击": 10,
		"暴击": 1,
		"幸运": 1,
		"回魔": 0.4,
	},
	"2品丹":{
		"生命": 150,
		"魔法": 15,
		"攻击": 15,
		"暴击": 1,
		"幸运": 1,
		"回魔": 0.4,
	},
	"3品丹":{
		"生命": 200,
		"魔法": 40,
		"攻击": 20,
		"暴击": 1,
		"幸运": 1,
		"回魔": 0.4,
	},
	"4品丹":{
		"生命": 250,
		"魔法": 55,
		"攻击": 25,
		"暴击": 1,
		"幸运": 1,
		"回魔": 0.4,
	},
	"5品丹":{
		"生命": 300,
		"魔法": 70,
		"攻击": 30,
		"暴击": 2,
		"幸运": 2,
		"回魔": 0.4,
	},
}
var ZhenFaProps = {
	"森罗阵":{
		"1":{"Type":"物防","Value": 1},
		"2":{"Type":"暴击","Value": 1},
		"3":{"Type":"魔防","Value": 1},
	},
	"落魄阵":{
		"1":{"Type":"魔法","Value": 15},
		"2":{"Type":"攻击","Value": 5},
		"3":{"Type":"幸运","Value": 1},
	},
	"腾蛇阵":{
		"1":{"Type":"生命","Value": 75},
		"2":{"Type":"攻击","Value": 10},
		"3":{"Type":"破甲","Value": 2},
		"4":{"Type":"破魔","Value": 2},
	},
	"太清阵":{
		"1":{"Type":"生命","Value": 75},
		"2":{"Type":"攻击","Value": 10},
		"3":{"Type":"暴击","Value": 1},
		"4":{"Type":"幸运","Value": 1},
	},
}
func GetZFLocProp(Name,loc):
	var Level = int(PlayerData.player_data[Name][str(loc)]["Level"])
	var Dic = ZhenFaProps[Name]
	var Prop = int(Dic[str(loc)]["Value"]) * Level
	return Prop
func GetNextLevelProp(Name,loc):
	var Level = int(PlayerData.player_data[Name][str(loc)]["Level"]) + 1
	var Dic = ZhenFaProps[Name]
	var Prop = int(Dic[str(loc)]["Value"]) * Level
	return Prop
func GetZFProp(Name):
	var Prop = {}
	Prop["生命"] = GetZFLocProp("太清阵",1) + GetZFLocProp("腾蛇阵",1)
	Prop["魔法"] = GetZFLocProp("落魄阵",1)
	Prop["攻击"] = GetZFLocProp("太清阵",2) + GetZFLocProp("腾蛇阵",2) + GetZFLocProp("落魄阵",2)
	Prop["物防"] = GetZFLocProp("森罗阵",1)
	Prop["魔防"] = GetZFLocProp("森罗阵",3)
	Prop["暴击"] = GetZFLocProp("森罗阵",2) + GetZFLocProp("太清阵",3)
	Prop["幸运"] = GetZFLocProp("太清阵",4) + GetZFLocProp("落魄阵",3)
	Prop["破甲"] = GetZFLocProp("腾蛇阵",3)
	Prop["破魔"] = GetZFLocProp("腾蛇阵",4)
	return Prop[Name]

func _ready() -> void:
	baseroleprop = {
		"Level": 1,
		"SHp": 0,
		"Hp": 0,
		"SMp": 0,
		"Mp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0,
		"exp": 0,
		"max_exp":0,
		"gxp_value": 0,
		"coin_num": 0
	}
	roleprop = {
		"SHp": 0,
		"Hp": 0,
		"SMp": 0,
		"Mp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	equprop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	wq_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	fj_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	sp_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	fb_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	cb_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	tx_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	sz_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky":0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	Paslprop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0.0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}
	WqBs_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}	
	FjBs_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}	
	SpBs_prop = {
		"SHp": 0,
		"SMp": 0,
		"power": 0,
		"Def": 0,
		"Mdef": 0,
		"Crit": 0,
		"Miss": 0,
		"R_hp": 0,
		"R_mp": 0,
		"vampirism": 0,
		"Lucky": 0,
		"Toughness": 0,
		"Htarget": 0,
		"CritReduce": 0,
		"ar": 0,
		"sp": 0
	}	
func GetPelletProp():
	var Hp: int = 0
	var Mp: int = 0
	var Att: int = 0
	var Crit: int = 0
	var Lucky: int = 0
	var Emp: float = 0
	for i in range(6):
		if i > 0:
			Hp += PlayerData.player_data["生命丹" + str(i)] * PelletProps[str(i) + "品丹"]["生命"]
			Mp += PlayerData.player_data["魔法丹" + str(i)] * PelletProps[str(i) + "品丹"]["魔法"]
			Att += PlayerData.player_data["攻击丹" + str(i)] * PelletProps[str(i) + "品丹"]["攻击"]
			Crit += PlayerData.player_data["暴击丹" + str(i)] * PelletProps[str(i) + "品丹"]["暴击"]
			Lucky += PlayerData.player_data["幸运丹" + str(i)] * PelletProps[str(i) + "品丹"]["幸运"]
			Emp += PlayerData.player_data["回魔丹" + str(i)] * PelletProps[str(i) + "品丹"]["回魔"]
	return [Hp,Mp,Att,Crit,Lucky,Emp]

func get_last_prop():
	if PlayerData.ChekEqzb("头衔","xczg"):
		if SourcePlayer != null:
			for i in SourcePlayer.buff.get_children():
				if i.BuffInfo.has("DeBuff"):
					if i.BuffInfo["DeBuff"]:
						i.queue_free()
	if PlayerData.ChekEqzb("头衔","sxyr"):
		if SourcePlayer != null:
			if not SourcePlayer.SXYRCannotCure:
				roleprop.SHp = 1
				roleprop.Hp = 1
				SourcePlayer.SXYRCannotCure = true
				if SourcePlayer != null:
					for i in SourcePlayer.buff.get_children():
						if i.BuffInfo.has("DeBuff"):
							if i.BuffInfo["DeBuff"]:
								i.queue_free()
	else:
		roleprop.SHp = baseroleprop.SHp + equprop.SHp + Paslprop.SHp + GetPelletProp()[0] + GetZFProp("生命")

	roleprop.SMp = baseroleprop.SMp + equprop.SMp + Paslprop.SMp + GetPelletProp()[1] + GetZFProp("魔法")
	roleprop.power = baseroleprop.power + equprop.power + Paslprop.power + GetPelletProp()[2] + GetZFProp("攻击")
	roleprop.Def = baseroleprop.Def + equprop.Def + Paslprop.Def + GetZFProp("物防")
	roleprop.Mdef = baseroleprop.Mdef + equprop.Mdef + Paslprop.Mdef + GetZFProp("魔防")
	roleprop.Crit = baseroleprop.Crit + equprop.Crit + Paslprop.Crit + Role1SXBJ + GetPelletProp()[3] + GetZFProp("暴击")
	roleprop.Miss = baseroleprop.Miss + equprop.Miss + Paslprop.Miss
	roleprop.R_hp = baseroleprop.R_hp + equprop.R_hp + Paslprop.R_hp
	roleprop.R_mp = baseroleprop.R_mp + equprop.R_mp + Paslprop.R_mp + GetPelletProp()[5]
	roleprop.vampirism = baseroleprop.vampirism + equprop.vampirism + Paslprop.vampirism + Role1SXxx
	roleprop.Lucky = baseroleprop.Lucky + equprop.Lucky + Paslprop.Lucky + GetPelletProp()[4] + GetZFProp("幸运")
	roleprop.Toughness = baseroleprop.Toughness + equprop.Toughness + Paslprop.Toughness
	roleprop.Htarget = baseroleprop.Htarget + equprop.Htarget + Paslprop.Htarget
	roleprop.CritReduce = baseroleprop.CritReduce + equprop.CritReduce + Paslprop.CritReduce
	roleprop.ar = baseroleprop.ar + equprop.ar + Paslprop.ar + GetZFProp("破甲")
	roleprop.sp = baseroleprop.sp + equprop.sp + Paslprop.sp + GetZFProp("破魔")
	
func set_basic_prop():
	var max_exp_list = [140,160,180,200,220,300,400,500,600,700,800,900,1200,1400,1600,2000,2400,3000,4000,5000]
	match int(PlayerData.player_data["Myself"]):
		1:
			baseroleprop.SHp = 80 + 50 * (baseroleprop.Level - 1)
			baseroleprop.SMp = 50 + 15 * (baseroleprop.Level - 1)
			baseroleprop.power = 8 + 4 * (baseroleprop.Level - 1)
			baseroleprop.Def = 10 + 1 * (baseroleprop.Level - 1)
			baseroleprop.Mdef = 10 + 1 * (baseroleprop.Level - 1)
		2:
			baseroleprop.SHp = 50 + 30 * (baseroleprop.Level - 1)
			baseroleprop.SMp = 100 + 30 * (baseroleprop.Level - 1)
			baseroleprop.power = 15 + 6 * (baseroleprop.Level - 1)
			baseroleprop.Def = 10 + 1 * (baseroleprop.Level - 1)
			baseroleprop.Mdef = 10 + 1 * (baseroleprop.Level - 1)
		3:
			baseroleprop.SHp = 120 + 60 * (baseroleprop.Level - 1) 
			baseroleprop.SMp = 25 + 10 * (baseroleprop.Level - 1)
			baseroleprop.power = 15 + 4 * (baseroleprop.Level - 1) 
			baseroleprop.Def = 15 + 1 * (baseroleprop.Level - 1)
			baseroleprop.Mdef = 15 + 1 * (baseroleprop.Level - 1)
		4:
			baseroleprop.SHp = 70 + 40 * (baseroleprop.Level - 1) 
			baseroleprop.SMp = 70 + 20 * (baseroleprop.Level - 1)
			baseroleprop.power = 15 + 4 * (baseroleprop.Level - 1) 
			baseroleprop.Def = 5 + 1 * (baseroleprop.Level - 1)
			baseroleprop.Mdef = 5 + 1 * (baseroleprop.Level - 1)
		5:
			baseroleprop.SHp = 80 + 40 * (baseroleprop.Level - 1) 
			baseroleprop.SMp = 50 + 20 * (baseroleprop.Level - 1)
			baseroleprop.power = 10 + 4 * (baseroleprop.Level - 1) 
			baseroleprop.Def = 8 + 1 * (baseroleprop.Level - 1)
			baseroleprop.Mdef = 8 + 1 * (baseroleprop.Level - 1)
	if baseroleprop.Level < 20:
		baseroleprop.max_exp = max_exp_list[baseroleprop.Level - 1]
	else:
		baseroleprop.max_exp = 5000 + 5000 * (baseroleprop.Level - 19)
	get_last_prop()
	set_full_Hp()
	set_full_Mp()
func set_full_Hp():
	roleprop.Hp = roleprop.SHp
func set_full_Mp():
	roleprop.Mp = roleprop.SMp
func _physics_process(_delta: float) -> void:

	if ws_value >= max_ws_value:
		ws_value = max_ws_value

	if ws_value <= 0:
		is_ws_state = false
		ws_value = 0
	if is_ws_state == true:
		ws_up_power = 1.5
	else:
		ws_up_power = 1
	check_Hp()
	check_Mp()
	get_equ_last_pro()
	get_last_prop()
	
func check_Hp():
	if roleprop.Hp >= roleprop.SHp:
		roleprop.Hp = roleprop.SHp
	if roleprop.Hp <= 0:
		roleprop.Hp = 0
func check_Mp():
	if roleprop.Mp >= roleprop.SMp:
		roleprop.Mp = roleprop.SMp
	if roleprop.Mp <= 0:
		roleprop.Mp = 0	
		
func up_level():
	if baseroleprop.exp >= baseroleprop.max_exp:
		if baseroleprop.Level < 55:
			CureLevel()
#		if not PlayerData.player_data["天庭"]:
#			if baseroleprop.Level < 40:
#				CureLevel()
#		elif not PlayerData.player_data["截教"]:
#			if baseroleprop.Level < 50:
#				CureLevel()
#		elif not PlayerData.player_data["碧游宫"]:
#			if RoleProp.baseroleprop.Level < 75:
#				CureLevel()
func get_equ_properies():
	if PlayerData.player_data["武器"].size() != 0:
		var name_ = PlayerData.player_data["武器"][0]["名字"]
		var qh_level = PlayerData.player_data["武器"][0]["强化等级"]
		var Data = PlayerData.player_data["武器"][0]["Data"]
		var wq_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in wq_list.size():
			var loc_1 = wq_list.keys()[i]
			if wq_prop.has(loc_1):
				wq_prop[loc_1] = wq_list[loc_1]
	else:
		remove_wq_pro()
#==================设置武器属性========================##
	if PlayerData.player_data["防具"].size() != 0:
		var name_ = PlayerData.player_data["防具"][0]["名字"]
		var qh_level = PlayerData.player_data["防具"][0]["强化等级"]
		var Data = PlayerData.player_data["防具"][0]["Data"]
		var fj_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in fj_list.size():
			var loc_1 = fj_list.keys()[i]
			if fj_prop.has(loc_1):
				fj_prop[loc_1] = fj_list[loc_1]
	else:
		remove_fj_pro()
#====================设置防具属性=====================##
	if PlayerData.player_data["饰品"].size() != 0:
		var name_ = PlayerData.player_data["饰品"][0]["名字"]
		var qh_level = PlayerData.player_data["饰品"][0]["强化等级"]
		var Data = PlayerData.player_data["饰品"][0]["Data"]
		var sp_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in sp_list.size():
			var loc_1 = sp_list.keys()[i]
			if sp_prop.has(loc_1):
				sp_prop[loc_1] = sp_list[loc_1]
	else:
		remove_sp_pro()
#================设置饰品属性==========================##
	if PlayerData.player_data["时装"].size() != 0:
		var name_ = PlayerData.player_data["时装"][0]["名字"]
		var qh_level = PlayerData.player_data["时装"][0]["强化等级"]
		var Data = PlayerData.player_data["时装"][0]["Data"]
		var sz_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in sz_list.size():
			var loc_1 = sz_list.keys()[i]
			if sz_prop.has(loc_1):
				sz_prop[loc_1] = sz_list[loc_1]
	else:
		remove_sz_pro()
#================设置时装属性==========================##
	if PlayerData.player_data["头衔"].size() != 0:
		var name_ = PlayerData.player_data["头衔"][0]["名字"]
		var qh_level = PlayerData.player_data["头衔"][0]["强化等级"]
		var Data = PlayerData.player_data["头衔"][0]["Data"]
		var tx_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in tx_list.size():
			var loc_1 = tx_list.keys()[i]
			if tx_prop.has(loc_1):
				tx_prop[loc_1] = tx_list[loc_1]
	else:
		remove_tx_pro()
#================设置头衔属性==========================##
	if PlayerData.player_data["翅膀"].size() != 0:
		var name_ = PlayerData.player_data["翅膀"][0]["名字"]
		var qh_level = PlayerData.player_data["翅膀"][0]["强化等级"]
		var Data = PlayerData.player_data["翅膀"][0]["Data"]
		var cb_list = AE.get_last_equ_pro(name_,qh_level,Data)
		for i in cb_list.size():
			var loc_1 = cb_list.keys()[i]
			if cb_prop.has(loc_1):
				cb_prop[loc_1] = cb_list[loc_1]
	else:
		remove_cb_pro()
#================设置翅膀属性==========================##
	if PlayerData.player_data["法宝"].size() != 0:
		var name_ = PlayerData.player_data["法宝"][0]["名字"]
		var qh_level = PlayerData.player_data["法宝"][0]["强化等级"]
		var wxlist = PlayerData.player_data["法宝"][0]["五行"]
		var Data = PlayerData.player_data["法宝"][0]["Data"]
		var fb_list = AE.get_fb_last_equ_pro(name_,qh_level,wxlist,Data)
		for i in fb_list.size():
			var loc_1 = fb_list.keys()[i]
			if fb_prop.has(loc_1):
				fb_prop[loc_1] = fb_list[loc_1]
	else:
		remove_fb_pro()
#================设置法宝属性==========================##
	get_BsWqProperies()
	get_BsFjProperies()
	get_BsSpProperies()
#================设置宝石属性==========================##
func get_BsWqProperies():
	var BsList = []
	if PlayerData.player_data["武器"].size() != 0:
		var Data = PlayerData.player_data["武器"][0]["Data"]
		if Data["宝石"].size() != 0:
			for i in Data["宝石"]:
				BsList.push_back(i)
		if BsList.size() != 0:
			for i in BsList:
				var Prop = AE.AllEquipment_[i]#宝石的属性
				for u in WqBs_prop:
					if Prop.has(u):
						if Prop[u] != 0:
							WqBs_prop[u] = Prop[u]
		else:
			removeWqBs()
	else:
		removeWqBs()

func get_BsFjProperies():
	var BsList = []
	if PlayerData.player_data["防具"].size() != 0:
		var Data = PlayerData.player_data["防具"][0]["Data"]
		if Data["宝石"].size() != 0:
			for i in Data["宝石"]:
				BsList.push_back(i)
		if BsList.size() != 0:
			for i in BsList:
				var Prop = AE.AllEquipment_[i]
				for u in FjBs_prop:
					if Prop.has(u):
						if Prop[u] != 0:
							FjBs_prop[u] = Prop[u]
		else:
			removeFjBs()
	else:
		removeFjBs()
func get_BsSpProperies():
	var BsList = []
	if PlayerData.player_data["饰品"].size() != 0:
		var Data = PlayerData.player_data["饰品"][0]["Data"]
		if Data["宝石"].size() != 0:
			for i in Data["宝石"]:
				BsList.push_back(i)
		if BsList.size() != 0:
			for i in BsList:
				var Prop = AE.AllEquipment_[i]
				for u in SpBs_prop:
					if Prop.has(u):
						if Prop[u] != 0:
							SpBs_prop[u] = Prop[u]
		else:
			removeSpBs()
	else:
		removeSpBs()

func get_equ_last_pro():
	get_equ_properies()
	for i in equprop.keys():
		equprop[i] = wq_prop[i] + fj_prop[i] + sp_prop[i] + fb_prop[i] + WqBs_prop[i] + FjBs_prop[i] + SpBs_prop[i] + tx_prop[i] + sz_prop[i] + cb_prop[i]
func remove_wq_pro():
	wq_prop.SHp = 0
	wq_prop.SMp = 0
	wq_prop.power = 0
	wq_prop.Def = 0
	wq_prop.Mdef = 0
	wq_prop.Crit = 0
	wq_prop.Miss = 0
	wq_prop.R_hp = 0
	wq_prop.R_mp = 0
	wq_prop.vampirism = 0
	wq_prop.Lucky = 0
	wq_prop.Toughness = 0
	wq_prop.Htarget = 0
	wq_prop.CritReduce = 0
	wq_prop.ar = 0
	wq_prop.sp = 0
	pass
func remove_fj_pro():
	fj_prop.SHp = 0
	fj_prop.SMp = 0
	fj_prop.power = 0
	fj_prop.Def = 0
	fj_prop.Mdef = 0
	fj_prop.Crit = 0
	fj_prop.Miss = 0
	fj_prop.R_hp = 0
	fj_prop.R_mp = 0
	fj_prop.vampirism = 0
	fj_prop.Lucky = 0
	fj_prop.Toughness = 0
	fj_prop.Htarget = 0
	fj_prop.CritReduce = 0
	fj_prop.ar = 0
	fj_prop.sp = 0
	pass
func remove_sp_pro():
	sp_prop.SHp = 0
	sp_prop.SMp = 0
	sp_prop.power = 0
	sp_prop.Def = 0
	sp_prop.Mdef = 0
	sp_prop.Crit = 0
	sp_prop.Miss = 0
	sp_prop.R_hp = 0
	sp_prop.R_mp = 0
	sp_prop.vampirism = 0
	sp_prop.Lucky = 0
	sp_prop.Toughness = 0
	sp_prop.Htarget = 0
	sp_prop.CritReduce = 0
	sp_prop.ar = 0
	sp_prop.sp = 0
	pass
func remove_fb_pro():
	fb_prop.SHp = 0
	fb_prop.SMp = 0
	fb_prop.power = 0
	fb_prop.Def = 0
	fb_prop.Mdef = 0
	fb_prop.Crit = 0
	fb_prop.Miss = 0
	fb_prop.R_hp = 0
	fb_prop.R_mp = 0
	fb_prop.vampirism = 0
	fb_prop.Lucky = 0
	fb_prop.Toughness = 0
	fb_prop.Htarget = 0
	fb_prop.CritReduce = 0
	fb_prop.ar = 0
	fb_prop.sp = 0
func remove_cb_pro():
	cb_prop.SHp = 0
	cb_prop.SMp = 0
	cb_prop.power = 0
	cb_prop.Def = 0
	cb_prop.Mdef = 0
	cb_prop.Crit = 0
	cb_prop.Miss = 0
	cb_prop.R_hp = 0
	cb_prop.R_mp = 0
	cb_prop.vampirism = 0
	cb_prop.Lucky = 0
	cb_prop.Toughness = 0
	cb_prop.Htarget = 0
	cb_prop.CritReduce = 0
	cb_prop.ar = 0
	cb_prop.sp = 0
func remove_sz_pro():
	sz_prop.SHp = 0
	sz_prop.SMp = 0
	sz_prop.power = 0
	sz_prop.Def = 0
	sz_prop.Mdef = 0
	sz_prop.Crit = 0
	sz_prop.Miss = 0
	sz_prop.R_hp = 0
	sz_prop.R_mp = 0
	sz_prop.vampirism = 0
	sz_prop.Lucky = 0
	sz_prop.Toughness = 0
	sz_prop.Htarget = 0
	sz_prop.CritReduce = 0
	sz_prop.ar = 0
	sz_prop.sp = 0
func remove_tx_pro():
	tx_prop.SHp = 0
	tx_prop.SMp = 0
	tx_prop.power = 0
	tx_prop.Def = 0
	tx_prop.Mdef = 0
	tx_prop.Crit = 0
	tx_prop.Miss = 0
	tx_prop.R_hp = 0
	tx_prop.R_mp = 0
	tx_prop.vampirism = 0
	tx_prop.Lucky = 0
	tx_prop.Toughness = 0
	tx_prop.Htarget = 0
	tx_prop.CritReduce = 0
	tx_prop.ar = 0
	tx_prop.sp = 0
func removeWqBs():
	WqBs_prop.SHp = 0
	WqBs_prop.SMp = 0
	WqBs_prop.power = 0
	WqBs_prop.Def = 0
	WqBs_prop.Mdef = 0
	WqBs_prop.Crit = 0
	WqBs_prop.Miss = 0
	WqBs_prop.R_hp = 0
	WqBs_prop.R_mp = 0
	WqBs_prop.vampirism = 0
	WqBs_prop.Lucky = 0
	WqBs_prop.Toughness = 0
	WqBs_prop.Htarget = 0
	WqBs_prop.CritReduce = 0
	WqBs_prop.ar = 0
	WqBs_prop.sp = 0	
func removeFjBs():
	FjBs_prop.SHp = 0
	FjBs_prop.SMp = 0
	FjBs_prop.power = 0
	FjBs_prop.Def = 0
	FjBs_prop.Mdef = 0
	FjBs_prop.Crit = 0
	FjBs_prop.Miss = 0
	FjBs_prop.R_hp = 0
	FjBs_prop.R_mp = 0
	FjBs_prop.vampirism = 0
	FjBs_prop.Lucky = 0
	FjBs_prop.Toughness = 0
	FjBs_prop.Htarget = 0
	FjBs_prop.CritReduce = 0
	FjBs_prop.ar = 0
	FjBs_prop.sp = 0
func removeSpBs():
	SpBs_prop.SHp = 0
	SpBs_prop.SMp = 0
	SpBs_prop.power = 0
	SpBs_prop.Def = 0
	SpBs_prop.Mdef = 0
	SpBs_prop.Crit = 0
	SpBs_prop.Miss = 0
	SpBs_prop.R_hp = 0
	SpBs_prop.R_mp = 0
	SpBs_prop.vampirism = 0
	SpBs_prop.Lucky = 0
	SpBs_prop.Toughness = 0
	SpBs_prop.Htarget = 0
	SpBs_prop.CritReduce = 0
	SpBs_prop.ar = 0
	SpBs_prop.sp = 0			
func CureExp(Exp: int):
	RoleProp.baseroleprop.exp += Exp
	PlayerData.player_data.玩家当前经验 = RoleProp.baseroleprop.exp
func CureLevel():
	baseroleprop.Level += 1
	PlayerData.player_data.玩家等级 = baseroleprop.Level
	baseroleprop.exp = 0
	PlayerData.player_data.玩家当前经验 = 0
	MemoryClass.保存游戏(Global.cd_path)
	set_basic_prop()
