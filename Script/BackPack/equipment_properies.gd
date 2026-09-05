extends Node2D

#@onready var title: Label = $pro_wk/information/inf/VBoxContainer2/title
@onready var eq_name: Label = $pro_wk/information/inf/VBoxContainer2/eq_name
@onready var eq_pz: Label = $pro_wk/information/inf/VBoxContainer2/eq_pz
@onready var eq_lx: Label = $pro_wk/information/inf/VBoxContainer2/eq_lx
@onready var eq_czl: Label = $pro_wk/information/inf/VBoxContainer3/eq_czl
@onready var eq_star_level: Label = $pro_wk/information/inf/VBoxContainer3/eq_star_level
@onready var eq_hp: Label = $pro_wk/information/inf/VBoxContainer3/eq_hp
@onready var eq_mp: Label = $pro_wk/information/inf/VBoxContainer3/eq_mp
@onready var eq_power: Label = $pro_wk/information/inf/VBoxContainer3/eq_power
@onready var eq_def: Label = $pro_wk/information/inf/VBoxContainer3/eq_def
@onready var eq_mdef: Label = $pro_wk/information/inf/VBoxContainer3/eq_mdef
@onready var eq_crit: Label = $pro_wk/information/inf/VBoxContainer3/eq_crit
@onready var eq_miss: Label = $pro_wk/information/inf/VBoxContainer3/eq_miss
@onready var eq_ehp: Label = $pro_wk/information/inf/VBoxContainer3/eq_ehp
@onready var eq_emp: Label = $pro_wk/information/inf/VBoxContainer3/eq_emp
@onready var eq_mz: Label = $pro_wk/information/inf/VBoxContainer3/eq_mz
@onready var eq_lucky: Label = $pro_wk/information/inf/VBoxContainer3/eq_lucky
@onready var eq_rx: Label = $pro_wk/information/inf/VBoxContainer3/eq_rx
@onready var eq_pj: Label = $pro_wk/information/inf/VBoxContainer3/eq_pj
@onready var eq_pm: Label = $pro_wk/information/inf/VBoxContainer3/eq_pm
@onready var eq_xx: Label = $pro_wk/information/inf/VBoxContainer3/eq_xx
@onready var eq_bm: Label = $pro_wk/information/inf/VBoxContainer3/eq_bm
@onready var eq_ms: Label = $pro_wk/information/inf/VBoxContainer/eq_ms
@onready var eq_sj: Label = $pro_wk/information/inf/VBoxContainer/eq_sj
@onready var color_rect: ColorRect = $ColorRect
@onready var BsProList = $pro_wk/information/inf/BsProp
@onready var have: Label = $pro_wk/information/inf/VBoxContainer2/have
@onready var v_box_container_3: VBoxContainer = $pro_wk/information/inf/VBoxContainer3
#====================宝石词条===================以下
@onready var Bs_eq_hp: Label = $pro_wk/information/inf/BsProp/eq_hp
@onready var Bs_eq_mp: Label = $pro_wk/information/inf/BsProp/eq_mp
@onready var Bs_eq_power: Label = $pro_wk/information/inf/BsProp/eq_power
@onready var Bs_eq_def: Label = $pro_wk/information/inf/BsProp/eq_def
@onready var Bs_eq_mdef: Label = $pro_wk/information/inf/BsProp/eq_mdef
@onready var Bs_eq_crit: Label = $pro_wk/information/inf/BsProp/eq_crit
@onready var Bs_eq_miss: Label = $pro_wk/information/inf/BsProp/eq_miss
@onready var Bs_eq_ehp: Label = $pro_wk/information/inf/BsProp/eq_ehp
@onready var Bs_eq_emp: Label = $pro_wk/information/inf/BsProp/eq_emp
@onready var Bs_eq_mz: Label = $pro_wk/information/inf/BsProp/eq_mz
@onready var Bs_eq_lucky: Label = $pro_wk/information/inf/BsProp/eq_lucky
@onready var Bs_eq_rx: Label = $pro_wk/information/inf/BsProp/eq_rx
@onready var Bs_eq_pj: Label = $pro_wk/information/inf/BsProp/eq_pj
@onready var Bs_eq_pm: Label = $pro_wk/information/inf/BsProp/eq_pm
@onready var Bs_eq_xx: Label = $pro_wk/information/inf/BsProp/eq_xx
@onready var Bs_eq_bm: Label = $pro_wk/information/inf/BsProp/eq_bm

var Bs_prop = {
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

var EQ_prop = {}
var qh_level: int
var wx = []
var nam: String
var is_set = false
var is_in_ldl_gz = false
var is_in_shop = false
func _ready() -> void:
	self.modulate = Color(1,1,1,0)
func _physics_process(_delta: float) -> void:
	if get_parent() is BasicBackPack:
		if self.position.y + color_rect.size.y >= 320:
			self.position.y = 320 - color_rect.size.y
		if self.position.x + color_rect.size.x >= 495:
			self.position.x = 270 - color_rect.size.x
	elif get_parent() == Global.Windows_:
		if self.position.y + color_rect.size.y >= 590:
			self.position.y = 590 - color_rect.size.y
		if self.position.x + color_rect.size.x >= 925:
			self.position.x = 685 - color_rect.size.x
	if nam == "empty":
		return
	color_rect.size = $pro_wk/information.size
	if BsProList != null:
		if EQ_prop != {}:
			if EQ_prop.has("宝石"):
				if EQ_prop["宝石"].size() == 0:
					BsProList.queue_free()
	if not is_set:
		create_tween().tween_property(self,"modulate",Color(1,1,1,1),0.2)
		set_some_pro_color(nam)
		set_information_(nam)
		if AE.AllEquipment_[nam]["类型"] != "道具" and AE.AllEquipment_[nam]["类型"] != "消耗品":
			have.queue_free()
			setBsInfor()
		else:
			if v_box_container_3 != null:
				v_box_container_3.queue_free()
			if BsProList != null:
				BsProList.queue_free()
		is_set = true
func set_some_pro_color(name_):

	eq_name.add_theme_color_override("font_color",AE.AllEquipment_[name_]["颜色"])
	eq_name.add_theme_color_override("font_outline_color",AE.AllEquipment_[name_]["颜色"])
	eq_pz.add_theme_color_override("font_color",AE.AllEquipment_[name_]["颜色"])
	eq_pz.add_theme_color_override("font_outline_color",AE.AllEquipment_[name_]["颜色"])
func set_information_(name_: String):
	if AE.AllEquipment_[name_]["类型"] == "道具" or AE.AllEquipment_[name_]["类型"] == "消耗品":
		eq_name.text = str(AE.AllEquipment_[name_]["名字"])
		eq_pz.text = "品质：" + str(AE.AllEquipment_[name_]["品质"])
		if AE.AllEquipment_[name_].has("所属"):
			if AE.AllEquipment_[name_]["所属"] != "" and AE.AllEquipment_[name_]["所属"] != "无":
				eq_lx.text = "类型：" + str(AE.AllEquipment_[name_]["类型"]) + '·' + str(AE.AllEquipment_[name_]["所属"])
			else:
				eq_lx.text = "类型：" + str(AE.AllEquipment_[name_]["类型"])
		else:
			eq_lx.text = "类型：" + str(AE.AllEquipment_[name_]["类型"])
		if str(AE.AllEquipment_[name_]["类型"]) == "消耗品":
			have.text = "拥有：" + str(PlayerData.get_xhp_data(name_)) + " 个"
		else:
			have.text = "拥有：" + str(PlayerData.get_item_data(name_)) + " 个"
		if AE.AllEquipment_[name_]["描述"] == "" and eq_ms != null:
			eq_ms.queue_free()
		else:
			eq_ms.text = "描述:" + str(AE.AllEquipment_[name_]["描述"])
		eq_sj.text = "售价:" + str(AE.AllEquipment_[name_]["售价"]) + "灵魂。"
		return
	#==================================为道具的情况
	if qh_level != 0:
		eq_name.text = str(get_properies(name_,"名字")[0]) + '(+' + str(qh_level) + ")"
	else:
		eq_name.text = str(get_properies(name_,"名字")[0])
	eq_pz.text = "品质：" + str(get_properies(name_,"品质")[0])
	eq_lx.text = "类型：" + str(get_properies(name_,"类型")[0]) + '·' + str(get_properies(name_,"所属")[0])
	match get_properies(name_,"类型")[0]:
		"法宝":
			if not AE.AllEquipment_[name_].has("五行") and eq_star_level != null:
				eq_star_level.queue_free()
			else:
				if get_wx() == "":
					eq_star_level.text = "五行：随机"
				else:
					eq_star_level.text = "五行：" + str(get_wx())
			if get_fb_pro(name_,"成长率") == 0 and eq_czl != null:
				eq_czl.queue_free()
			else:
				eq_czl.text = "成长率: " + str(get_fb_pro(name_,"成长率"))
			if get_fb_pro(name_,"SHp") == 0 and eq_hp != null:
				eq_hp.queue_free()
			else:
				eq_hp.text = "生命:" + str(get_fb_pro(name_,"SHp"))
			
			if get_fb_pro(name_,"SMp") == 0 and eq_mp != null:
				eq_mp.queue_free()
			else:
				eq_mp.text = "魔法:" + str(get_fb_pro(name_,"SMp"))
				
			if get_fb_pro(name_,"power") == 0 and eq_power != null:
				eq_power.queue_free()
			else:
				eq_power.text = "攻击:" + str(get_fb_pro(name_,"power"))
				
			if get_fb_pro(name_,"Def") == 0 and eq_def != null:
				eq_def.queue_free()
			else:
				eq_def.text = "物防:" + str(get_fb_pro(name_,"Def"))
				
			if get_fb_pro(name_,"Mdef") == 0 and eq_mdef != null:
				eq_mdef.queue_free()
			else:
				eq_mdef.text = "魔防:" + str(get_fb_pro(name_,"Mdef"))
				
			if get_properies(name_,"Crit")[0] == 0 and eq_crit != null:
				eq_crit.queue_free()
			else:
				eq_crit.text = "暴击:" + str(get_properies(name_,"Crit")[0])
				
			if get_properies(name_,"Miss")[0] == 0 and eq_miss != null:
				eq_miss.queue_free()
			else:
				eq_miss.text = "闪避:" + str(get_properies(name_,"Miss")[0])
				
			if get_properies(name_,"R_hp")[0] == 0 and eq_ehp != null:
				eq_ehp.queue_free()
			else:
				eq_ehp.text = "回血:" + str(get_properies(name_,"R_hp")[0])
				
			if get_properies(name_,"R_mp")[0] == 0 and eq_emp != null:
				eq_emp.queue_free()
			else:
				eq_emp.text = "回魔:" + str(get_properies(name_,"R_mp")[0])
				
			if get_properies(name_,"Htarget")[0] == 0 and eq_mz != null:
				eq_mz.queue_free()
			else:
				eq_mz.text = "命中:" + str(get_properies(name_,"Htarget")[0])
				
			if get_properies(name_,"Lucky")[0] == 0 and eq_lucky != null:
				eq_lucky.queue_free()
			else:
				eq_lucky.text = "幸运:" + str(get_properies(name_,"Lucky")[0])
				
			if get_properies(name_,"Toughness")[0] == 0 and eq_rx != null:
				eq_rx.queue_free()
			else:
				eq_rx.text = "韧性:" + str(get_properies(name_,"Toughness")[0])
				
			if get_properies(name_,"ar")[0] == 0 and eq_pj != null:
				eq_pj.queue_free()
			else:
				eq_pj.text = "破甲:" + str(get_properies(name_,"ar"))
				
			if get_properies(name_,"sp")[0] == 0 and eq_pm != null:
				eq_pm.queue_free()
			else:
				eq_pm.text = "破魔:" + str(get_properies(name_,"sp")[0])
				
			if get_properies(name_,"vampirism")[0] == 0 and eq_xx != null:
				eq_xx.queue_free()
			else:
				eq_xx.text = "吸血:" + str(get_properies(name_,"vampirism")[0])
				
			if get_properies(name_,"CritReduce")[0] == 0 and eq_bm != null:
				eq_bm.queue_free()
			else:
				eq_bm.text = "暴免:" + str(get_properies(name_,"CritReduce")[0])
				
			if AE.AllEquipment_[name_]["描述"] == "" and eq_ms != null:
				eq_ms.queue_free()
			else:
				eq_ms.text = "描述:" + str(AE.AllEquipment_[name_]["描述"])
		"武器","防具","饰品","头衔","时装","翅膀":
			if not AE.AllEquipment_[name_].has("五行") and eq_star_level != null:
				eq_star_level.queue_free()
			else:
				eq_star_level.text = "五行：" + str(get_wx())
			if eq_czl != null:
				eq_czl.queue_free()
			if get_properies(name_,"SHp")[0] == 0 and eq_hp != null:
				eq_hp.queue_free()
			else:
				eq_hp.text = "生命:" + str(get_properies(name_,"SHp")[1])
			
			if get_properies(name_,"SMp")[0] == 0 and eq_mp != null:
				eq_mp.queue_free()
			else:
				eq_mp.text = "魔法:" + str(get_properies(name_,"SMp")[1])
				
			if get_properies(name_,"power")[0] == 0 and eq_power != null:
				eq_power.queue_free()
			else:
				eq_power.text = "攻击:" + str(get_properies(name_,"power")[1])
				
			if get_properies(name_,"Def")[0] == 0 and eq_def != null:
				eq_def.queue_free()
			else:
				eq_def.text = "物防:" + str(get_properies(name_,"Def")[1])
				
			if get_properies(name_,"Mdef")[0] == 0 and eq_mdef != null:
				eq_mdef.queue_free()
			else:
				eq_mdef.text = "魔防:" + str(get_properies(name_,"Mdef")[1])
				
			if get_properies(name_,"Crit")[0] == 0 and eq_crit != null:
				eq_crit.queue_free()
			else:
				eq_crit.text = "暴击:" + str(get_properies(name_,"Crit")[1])
				
			if get_properies(name_,"Miss")[0] == 0 and eq_miss != null:
				eq_miss.queue_free()
			else:
				eq_miss.text = "闪避:" + str(get_properies(name_,"Miss")[1])
				
			if get_properies(name_,"R_hp")[0] == 0 and eq_ehp != null:
				eq_ehp.queue_free()
			else:
				eq_ehp.text = "回血:" + str(get_properies(name_,"R_hp")[1])
				
			if get_properies(name_,"R_mp")[0] == 0 and eq_emp != null:
				eq_emp.queue_free()
			else:
				eq_emp.text = "回魔:" + str(get_properies(name_,"R_mp")[1])
				
			if get_properies(name_,"Htarget")[0] == 0 and eq_mz != null:
				eq_mz.queue_free()
			else:
				eq_mz.text = "命中:" + str(get_properies(name_,"Htarget")[1])
				
			if get_properies(name_,"Lucky")[0] == 0 and eq_lucky != null:
				eq_lucky.queue_free()
			else:
				eq_lucky.text = "幸运:" + str(get_properies(name_,"Lucky")[1])
				
			if get_properies(name_,"Toughness")[0] == 0 and eq_rx != null:
				eq_rx.queue_free()
			else:
				eq_rx.text = "韧性:" + str(get_properies(name_,"Toughness")[1])
				
			if get_properies(name_,"ar")[0] == 0 and eq_pj != null:
				eq_pj.queue_free()
			else:
				eq_pj.text = "破甲:" + str(get_properies(name_,"ar")[1])
				
			if get_properies(name_,"sp")[0] == 0 and eq_pm != null:
				eq_pm.queue_free()
			else:
				eq_pm.text = "破魔:" + str(get_properies(name_,"sp")[1])
				
			if get_properies(name_,"vampirism")[0] == 0 and eq_xx != null:
				eq_xx.queue_free()
			else:
				eq_xx.text = "吸血:" + str(get_properies(name_,"vampirism")[1])
				
			if get_properies(name_,"CritReduce")[0] == 0 and eq_bm != null:
				eq_bm.queue_free()
			else:
				eq_bm.text = "暴免:" + str(get_properies(name_,"CritReduce")[1])

		

	if AE.AllEquipment_[name_]["描述"] == "" and eq_ms != null:
		eq_ms.queue_free()
	else:
		eq_ms.text = "描述:" + str(AE.AllEquipment_[name_]["描述"])
	if get_properies(name_,"售价")[0] == 0 and eq_sj != null:
		eq_sj.queue_free()
	else:
		eq_sj.text = "售价:" + str(get_properies(name_,"售价")[0]) + "灵魂。"

func setBsInfor():
	if not EQ_prop.has("宝石"):
		self.queue_free()
		return
	if EQ_prop["宝石"].size() != 0:
		if get_bs_prop("SHp") != 0:
			Bs_eq_hp.text = "生命：" + str(get_bs_prop("SHp"))
		else:
			if Bs_eq_hp != null:
				Bs_eq_hp.queue_free()
		if get_bs_prop("SMp") != 0:
			Bs_eq_mp.text = "魔法：" + str(get_bs_prop("SMp"))
		else:
			if Bs_eq_mp != null:
				Bs_eq_mp.queue_free()
		if get_bs_prop("power") != 0:
			Bs_eq_power.text = "攻击：" + str(get_bs_prop("power"))
		else:
			if Bs_eq_power != null:
				Bs_eq_power.queue_free()
		if get_bs_prop("Def") != 0:
			Bs_eq_def.text = "物防：" + str(get_bs_prop("Def"))
		else:
			if Bs_eq_def != null:
				Bs_eq_def.queue_free()
		if get_bs_prop("Mdef") != 0:
			Bs_eq_mdef.text = "魔防：" + str(get_bs_prop("Mdef"))
		else:
			if Bs_eq_mdef != null:
				Bs_eq_mdef.queue_free()
		if get_bs_prop("Crit") != 0:
			Bs_eq_crit.text = "暴击：" + str(get_bs_prop("Crit"))
		else:
			if Bs_eq_crit != null:
				Bs_eq_crit.queue_free()
		if get_bs_prop("Miss") != 0:
			Bs_eq_miss.text = "闪避：" + str(get_bs_prop("Miss"))
		else:
			if Bs_eq_miss != null:
				Bs_eq_miss.queue_free()
		if get_bs_prop("R_hp") != 0:
			Bs_eq_ehp.text = "回血：" + str(get_bs_prop("R_hp"))
		else:
			if Bs_eq_ehp != null:
				Bs_eq_ehp.queue_free()
		if get_bs_prop("R_mp") != 0:
			Bs_eq_emp.text = "回魔：" + str(get_bs_prop("R_mp"))
		else:
			if Bs_eq_emp != null:
				Bs_eq_emp.queue_free()
		if get_bs_prop("Htarget") != 0:
			Bs_eq_mz.text = "命中：" + str(get_bs_prop("Htarget"))
		else:
			if Bs_eq_mz != null:
				Bs_eq_mz.queue_free()
		if get_bs_prop("Lucky") != 0:
			Bs_eq_lucky.text = "幸运：" + str(get_bs_prop("Lucky"))
		else:
			if Bs_eq_lucky != null:
				Bs_eq_lucky.queue_free()
		if get_bs_prop("Toughness") != 0:
			Bs_eq_rx.text = "韧性：" + str(get_bs_prop("Toughness"))
		else:
			if Bs_eq_rx != null:
				Bs_eq_rx.queue_free()
		if get_bs_prop("ar") != 0:
			Bs_eq_pj.text = "破甲：" + str(get_bs_prop("ar"))
		else:
			if Bs_eq_pj != null:
				Bs_eq_pj.queue_free()
		if get_bs_prop("sp") != 0:
			Bs_eq_pm.text = "破魔：" + str(get_bs_prop("sp"))
		else:
			if Bs_eq_pm != null:
				Bs_eq_pm.queue_free()
		if get_bs_prop("vampirism") != 0:
			Bs_eq_xx.text = "吸血：" + str(get_bs_prop("vampirism"))
		else:
			if Bs_eq_xx != null:
				Bs_eq_xx.queue_free()
		if get_bs_prop("CritReduce") != 0:
			Bs_eq_bm.text = "暴免：" + str(get_bs_prop("CritReduce"))
		else:
			if Bs_eq_bm != null:
				Bs_eq_bm.queue_free()
func get_bs_prop(need):
	if set_BsProp() == {}:
		return 0
	else:
		var information = set_BsProp()[need]
		return information
	#return 0#为0 说明为宝石列表为空

func set_BsProp():#属性图获取宝石属性
	var BsList = EQ_prop["宝石"]
	if BsList.size() == 0:
		return {}
	else:
		for i in BsList:#i 是每个宝石的名字
			var List = AE.AllEquipment_[i]# 根据名字获取宝石的属性
			for u in Bs_prop:
				if List.has(u):
					if List[u] != 0:
						Bs_prop[u] = List[u]
	return Bs_prop

func get_properies(name_,need):
	var Num: int
	var infomation
	infomation = get_last_equ_pro(name_,qh_level)#[need]
	if infomation == null:
		self.queue_free()
		return [null,null]
	if not infomation.has(need):
		self.queue_free()
		return [null,null]
	infomation = infomation[need]
	if typeof(infomation) == TYPE_STRING:
		return [infomation]
	else:
		Num = infomation
		if AE.AllEquipment_[name_]["强化属性"].has(need):
			var Info = AE.AllEquipment_[name_]["强化属性"][need]
			infomation = get_last_equ_pro(name_,qh_level)[need] - Info * qh_level
		#infomation = AE.AllEquipment_[name_][need]
		if qh_level > 0:
			if AE.AllEquipment_[name_]["强化属性"].has(need):
				infomation = str(infomation) + '(+' + str(AE.AllEquipment_[name_]["强化属性"][need] * qh_level) + ")"
			
	return [Num,infomation]		
func get_last_equ_pro(_name_,qh_level_):
	var MY_EQdata = EQ_prop.duplicate()
	if EQ_prop == null:
		return
	for i in MY_EQdata.size():
		if not MY_EQdata.has("强化属性"):
			return
		if MY_EQdata["强化属性"].has(MY_EQdata.keys()[i]):
			MY_EQdata[MY_EQdata.keys()[i]] = MY_EQdata["强化属性"][MY_EQdata.keys()[i]] * qh_level_ + EQ_prop[MY_EQdata.keys()[i]]
	return MY_EQdata
func get_name_():
	var name_ = str(self.get_parent().get_item_name)
	return name_
func get_wx():
	var a = ""
	for i in wx:
		a = a + str(i)
	return a
func get_fb_pro(name_,need):
	var infomation = AE.get_fb_last_equ_pro(name_,qh_level,wx,EQ_prop)[need]
	return infomation
