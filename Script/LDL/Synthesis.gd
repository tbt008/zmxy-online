extends Node2D
class_name Synthesis
@onready var item_1: Button = $cl_1/item_1
@onready var item_2: Button = $cl_2/item_2
@onready var item_3: Button = $cl_3/item_3
@onready var item_4: Button = $scw/item_4
@onready var name_: Label = $infor/name_
@onready var need_lh: Label = $infor/need_lh
func _ready() -> void:
	item_1.is_in_ldl_gz = true
	item_2.is_in_ldl_gz = true
	item_3.is_in_ldl_gz = true
func _physics_process(_delta: float) -> void:
	item_1.is_in_ldl_gz = true
	item_2.is_in_ldl_gz = true
	item_3.is_in_ldl_gz = true
	item_4.is_in_ldl_gz = true
	
	
	set_cailiao_pic()
	get_name_()
	
func remove_infomation():
	for i in PlayerData.player_data["放入列表"]:
		if PlayerData.player_data["放入列表"][i].size() != 0:
			var new_list = PlayerData.player_data["放入列表"][i]
			var get_tt = AE.AllEquipment_[new_list[0]]["类型"]
			if get_tt == "武器" or get_tt == "防具" or get_tt == "饰品" or get_tt == "翅膀" or get_tt == "头衔" or get_tt == "时装":
				PlayerData.add_zb(new_list[0],new_list[3],new_list[4])
			elif get_tt == "道具" or get_tt == "消耗品":
				PlayerData.add_dj(new_list[0],1)
	PlayerData.player_data["放入列表"]["物品1"].clear()
	PlayerData.player_data["放入列表"]["物品2"].clear()
	PlayerData.player_data["放入列表"]["物品3"].clear()
	MemoryClass.保存游戏(Global.cd_path)
func get_name_():
	var name_1: String
	var name_2: String
	var name_3: String
	var List_1 = PlayerData.player_data["放入列表"]["物品1"]
	var List_2 = PlayerData.player_data["放入列表"]["物品2"]
	var List_3 = PlayerData.player_data["放入列表"]["物品3"]
	if List_1.size() != 0:
		name_1 = List_1[0]
	if List_2.size() != 0:
		name_2 = List_2[0]
	if List_3.size() != 0:
		name_3 = List_3[0]
	if List_1.size() != 0 and List_2.size() != 0 and List_3.size() != 0:
		if get_last_item(name_1,name_2,name_3)[0]:
			name_.text = str(AE.AllEquipment_[get_last_item(name_1,name_2,name_3)[1]]["名字"])
			item_4.set_button_icon(load_(str(get_last_item(name_1,name_2,name_3)[1])))
			var lx = AE.AllEquipment_[get_last_item(name_1,name_2,name_3)[1]]["类型"]
			need_lh.text = str(get_last_item(name_1,name_2,name_3)[2])
			match lx:
				"道具","消耗品":
					item_4.EQ_prop = AE.AllEquipment_[get_last_item(name_1,name_2,name_3)[1]]
				"法宝":
					item_4.EQ_prop = get_fb_prop(get_last_item(name_1,name_2,name_3)[1])
				"武器","饰品","防具","时装","头衔":
					match get_last_item(name_1,name_2,name_3)[1]:
						"dzjj":
							item_4.EQ_prop = GetEquipmentProp(get_last_item(name_1,name_2,name_3)[1])
							return
					item_4.EQ_prop = AE.AllEquipment_[get_last_item(name_1,name_2,name_3)[1]]
			
		else:
			item_4.EQ_prop = {}
			name_.text = ""
			need_lh.text = ""
			item_4.set_button_icon(load_(str("empty")))
	else:
		name_.text = ""
		need_lh.text = ""
		item_4.set_button_icon(load_(str("empty")))
func _on_syn_pressed() -> void:
	var name_1: String
	var name_2: String
	var name_3: String
	var List_1 = PlayerData.player_data["放入列表"]["物品1"]
	var List_2 = PlayerData.player_data["放入列表"]["物品2"]
	var List_3 = PlayerData.player_data["放入列表"]["物品3"]
	if List_1.size() != 0:
		name_1 = List_1[0]
	if List_2.size() != 0:
		name_2 = List_2[0]
	if List_3.size() != 0:
		name_3 = List_3[0]
	if get_last_item(name_1,name_2,name_3)[0]:
		var nn_lh = get_last_item(name_1,name_2,name_3)[2]
		if PlayerData.player_data["coin_num"] >= nn_lh:
			PlayerData.player_data["coin_num"] -= nn_lh
			var item_ = get_last_item(name_1,name_2,name_3)[1]
			var get_tt = AE.AllEquipment_[item_]["类型"]
			if get_tt == "武器" or get_tt == "防具" or get_tt == "饰品" or get_tt == "时装" or get_tt == "头衔":
				PlayerData.add_zb(item_,0,{})
			elif get_tt == "道具" or get_tt == "消耗品":
				PlayerData.add_dj(item_,1)
			elif get_tt == "法宝":
				PlayerData.add_fb(item_,0,AE.get_wx(),item_4.EQ_prop)
			PlayerData.player_data["放入列表"]["物品1"].clear()
			PlayerData.player_data["放入列表"]["物品2"].clear()
			PlayerData.player_data["放入列表"]["物品3"].clear()
			Global.AddMessageShow(get_parent(),"合成成功！获得：" + str(AE.AllEquipment_[item_]["名字"]) + " * 1 !!",1.5,Vector2(15,-45))
		else:
			Global.AddMessageShow(get_parent(),"灵魂不足！！！",1.5,Vector2(15,-45))
	else:
		Global.AddMessageShow(get_parent(),"合成公式错误！",1.5,Vector2(15,-45))
	MemoryClass.保存游戏(Global.cd_path)
func _on_help_pressed() -> void:
	Global.AddHc_Help(Global.get_parent_(self,3),Vector2(455,265))
func set_cailiao_pic():
	var List_1 = PlayerData.player_data["放入列表"]["物品1"]
	var List_2 = PlayerData.player_data["放入列表"]["物品2"]
	var List_3 = PlayerData.player_data["放入列表"]["物品3"]
	if List_1.size() == 0:
		item_1.set_button_icon(load_(str("empty")))
	else:
		item_1.set_button_icon(load_(str(List_1[0])))
	if List_2.size() == 0:
		item_2.set_button_icon(load_(str("empty")))
	else:
		item_2.set_button_icon(load_(str(List_2[0])))
	if List_3.size() == 0:
		item_3.set_button_icon(load_(str("empty")))
	else:
		item_3.set_button_icon(load_(str(List_3[0])))
	if List_1.size() > 3:
		item_1.qh_level = int(List_1[3])
		item_1.EQ_prop =  List_1[4]
	else:
		item_1.qh_level = 0
		item_1.EQ_prop = {}
	if List_2.size() > 3:
		item_2.qh_level = int(List_2[3])
		item_2.EQ_prop =  List_2[4]
	else:
		item_2.qh_level = 0
		item_2.EQ_prop = {}
	if List_3.size() > 3:
		item_3.qh_level = int(List_3[3])
		item_3.EQ_prop =  List_3[4]
	else:
		item_3.qh_level = 0
		item_3.EQ_prop = {}
func load_(name1):
	var abc = load("res://Art/BackPack/AllItems/" + str(name1) + ".png")
	return abc
func get_last_item(n_1: String,n_2: String,n_3: String):
	var list = [n_1,n_2,n_3]
	var a_1 = list[0] + list[1] + list[2]
	var a_4 = list[0] + list[2] + list[1]
	var a_5 = list[2] + list[0] + list[1]
	var a_2 = list[1] + list[0] + list[2]
	var a_3 = list[2] + list[1] + list[0]
	var a_6 = list[1] + list[2] + list[0]

	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"ttlp1ttlp2ttlp3"):
		return [true,"ttlp",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"qhs_1qhs_1qhs_1"):
		return [true,"qhs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"qhs_2qhs_2qhs_2"):
		return [true,"qhs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"qhs_3qhs_3qhs_3"):
		return [true,"qhs_4",100]

#==========================强化石================================
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsth"):
		return [true,"tss",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlstc"):
		return [true,"tss",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlstz"):
		return [true,"tss",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsts"):
		return [true,"tss",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlstq"):
		return [true,"tss",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsey"):
		return [true,"yhs",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlscz"):
		return [true,"yhs",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsry"):
		return [true,"yhs",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsyj"):
		return [true,"yhs",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rlsrlsze"):
		return [true,"yhs",100]
#==========================高级材料================================
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"putongnmwszputongnmwszputongnmwsz"):
		return [true,"youxiunmwsz",1000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"youxiunmwszyouxiunmwszyouxiunmwsz"):
		return [true,"jingliangnmwsz",5000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"jingliangnmwszjingliangnmwszjingliangnmwsz"):
		return [true,"shishinmwsz",10000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"putongzlwszputongzlwszputongzlwsz"):
		return [true,"youxiuzlwsz",1000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"youxiuzlwszyouxiuzlwszyouxiuzlwsz"):
		return [true,"jingliangzlwsz",5000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"jingliangzlwszjingliangzlwszjingliangzlwsz"):
		return [true,"shishizlwsz",10000]
#==========================时装================================
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sms_1sms_1sms_1"):
		return [true,"sms_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sms_2sms_2sms_2"):
		return [true,"sms_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sms_3sms_3sms_3"):
		return [true,"sms_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sms_4sms_4sms_4"):
		return [true,"sms_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"fls_1fls_1fls_1"):
		return [true,"fls_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"fls_2fls_2fls_2"):
		return [true,"fls_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"fls_3fls_3fls_3"):
		return [true,"fls_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"fls_4fls_4fls_4"):
		return [true,"fls_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"gjs_1gjs_1gjs_1"):
		return [true,"gjs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"gjs_2gjs_2gjs_2"):
		return [true,"gjs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"gjs_3gjs_3gjs_3"):
		return [true,"gjs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"gjs_4gjs_4gjs_4"):
		return [true,"gjs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"wfs_1wfs_1wfs_1"):
		return [true,"wfs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"wfs_2wfs_2wfs_2"):
		return [true,"wfs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"wfs_3wfs_3wfs_3"):
		return [true,"wfs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"wfs_4wfs_4wfs_4"):
		return [true,"wfs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mfs_1mfs_1mfs_1"):
		return [true,"mfs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mfs_2mfs_2mfs_2"):
		return [true,"mfs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mfs_3mfs_3mfs_3"):
		return [true,"mfs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mfs_4mfs_4mfs_4"):
		return [true,"mfs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bjs_1bjs_1bjs_1"):
		return [true,"bjs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bjs_2bjs_2bjs_2"):
		return [true,"bjs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bjs_3bjs_3bjs_3"):
		return [true,"bjs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bjs_4bjs_4bjs_4"):
		return [true,"bjs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sbs_1sbs_1sbs_1"):
		return [true,"sbs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sbs_2sbs_2sbs_2"):
		return [true,"sbs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sbs_3sbs_3sbs_3"):
		return [true,"sbs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sbs_4sbs_4sbs_4"):
		return [true,"sbs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hxs_1hxs_1hxs_1"):
		return [true,"hxs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hxs_2hxs_2hxs_2"):
		return [true,"hxs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hxs_3hxs_3hxs_3"):
		return [true,"hxs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hxs_4hxs_4hxs_4"):
		return [true,"hxs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hms_1hms_1hms_1"):
		return [true,"hms_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hms_2hms_2hms_2"):
		return [true,"hms_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hms_3hms_3hms_3"):
		return [true,"hms_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hms_4hms_4hms_4"):
		return [true,"hms_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xys_1xys_1xys_1"):
		return [true,"xys_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xys_2xys_2xys_2"):
		return [true,"xys_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xys_3xys_3xys_3"):
		return [true,"xys_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xys_4xys_4xys_4"):
		return [true,"xys_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mzs_1mzs_1mzs_1"):
		return [true,"mzs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mzs_2mzs_2mzs_2"):
		return [true,"mzs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mzs_3mzs_3mzs_3"):
		return [true,"mzs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"mzs_4mzs_4mzs_4"):
		return [true,"mzs_5",100]
		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bms_1bms_1bms_1"):
		return [true,"bms_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bms_2bms_2bms_2"):
		return [true,"bms_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bms_3bms_3bms_3"):
		return [true,"bms_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bms_4bms_4bms_4"):
		return [true,"bms_5",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pjs_1pjs_1pjs_1"):
		return [true,"pjs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pjs_2pjs_2pjs_2"):
		return [true,"pjs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pjs_3pjs_3pjs_3"):
		return [true,"pjs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pjs_4pjs_4pjs_4"):
		return [true,"pjs_5",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pms_1pms_1pms_1"):
		return [true,"pms_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pms_2pms_2pms_2"):
		return [true,"pms_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pms_3pms_3pms_3"):
		return [true,"pms_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"pms_4pms_4pms_4"):
		return [true,"pms_5",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rxs_1rxs_1rxs_1"):
		return [true,"rxs_2",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rxs_2rxs_2rxs_2"):
		return [true,"rxs_3",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rxs_3rxs_3rxs_3"):
		return [true,"rxs_4",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"rxs_4rxs_4rxs_4"):
		return [true,"rxs_5",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"llzspllzspllzsp"):
		return [true,"llz",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hlzsphlzsphlzsp"):
		return [true,"hlz",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"slzspslzspslzsp"):
		return [true,"slz",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"tlzsptlzsptlzsp"):
		return [true,"tlz",100]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"flzspflzspflzsp"):
		return [true,"flz",100]
#==========================宝石================================	
	if GetSameType(list[0],list[1],list[2],"dshldshldshl"):	
		return [true,"dshl",500]
#==========================地煞葫芦================================	
	if GetSameType(list[0],list[1],list[2],"tsgjtsgjtsgj"):	
		return [true,"tsgj",1000]
#==========================天煞古剑================================	
	if GetSameType(list[0],list[1],list[2],"bsyjbsyjbsyj"):	
		return [true,"bsyj",1000]
#==========================白霜妖镜================================	
	if GetSameType(list[0],list[1],list[2],"xhmtxhmtxhmt"):	
		return [true,"xhmt",1000]
#==========================血海魔童================================	
	if GetSameType(list[0],list[1],list[2],"lsyslsyslsys"):	
		return [true,"lsys",1000]
#==========================罗刹妖伞================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"kyckyskyz"):
		return [true,"kyl",1000]	
#==========================枯叶灵================================	
	if GetSameType(list[0],list[1],list[2],"xhhlxhhlxhhl"):	
		return [true,"xhhl",1000]
#==========================萱花葫芦================================	
	if GetSameType(list[0],list[1],list[2],"qyjqyjqyj"):	
		return [true,"qyj",1000]
#==========================青云剑================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"hylzhylkhylc"):
		return [true,"zjfyd",1000]
#==========================混元伏妖盾================================	
	if GetSameType(list[0],list[1],list[2],"zjhlzjhlzjhl"):	
		return [true,"zjhl",1000]
#==========================紫金葫芦================================	
#==========================法宝================================		
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dzjcc"):
		return [true,"dzjj",10000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dzjchch"):
		return [true,"dzjj",10000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dzjtt"):
		return [true,"dzjj",10000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"lsspjsspqssp"):
		return [true,"ssc",15000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"yizfwyazfwfygwj"):
		return [true,"gwj",15000]
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"lshbzshbhshb"):
		return [true,"qcp",180]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"yizfwzshblssp"):
		return [true,"bap",180]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"yazfwhshbqssp"):
		return [true,"mwq",180]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xianzhiluyjpyaspyjpysp"):
		return [true,"yjp",180]	
#==========================装备================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bsxjbsxjbsxj"):
		return [true,"bszj",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bsyzbsyzbsyz"):
		return [true,"bsxj",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"bszjbszjbszj"):
		return [true,"bsyz",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"tfljmgzhtdlzj"):
		return [true,"fybz",3000]
#==========================1丹药================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"renshenrenshenrenshen"):
		return [true,"smd_1",1000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"xianmaoxianmaoxianmao"):
		return [true,"fld_1",1000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"linglilinglilingli"):
		return [true,"gjd_1",1000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"leizongleizongleizong"):
		return [true,"bjd_1",1000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"liuhuangliuhuangliuhuang"):
		return [true,"xyd_1",1000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"shougongshougongshougong"):
		return [true,"hmd_1",1000]	
#==========================2丹药================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudansmd_1renshen"):
		return [true,"smd_2",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanfld_1xianmao"):
		return [true,"fld_2",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudangjd_1lingli"):
		return [true,"gjd_2",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanbjd_1leizong"):
		return [true,"bjd_2",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanxyd_1liuhuang"):
		return [true,"xyd_2",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanhmd_1shougong"):
		return [true,"hmd_2",3000]	
#==========================3丹药================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudansmd_2renshen"):
		return [true,"smd_3",7000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanfld_2xianmao"):
		return [true,"fld_3",7000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudangjd_2lingli"):
		return [true,"gjd_3",7000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanbjd_2leizong"):
		return [true,"bjd_3",7000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanxyd_2liuhuang"):
		return [true,"xyd_3",7000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanhmd_2shougong"):
		return [true,"hmd_3",7000]	
#==========================4丹药================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudansmd_3renshen"):
		return [true,"smd_4",15000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanfld_3xianmao"):
		return [true,"fld_4",15000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudangjd_3lingli"):
		return [true,"gjd_4",15000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanbjd_3leizong"):
		return [true,"bjd_4",15000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanxyd_3liuhuang"):
		return [true,"xyd_4",15000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanhmd_3shougong"):
		return [true,"hmd_4",15000]		
#==========================5丹药================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudansmd_4renshen"):
		return [true,"smd_5",25000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanfld_4xianmao"):
		return [true,"fld_5",25000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudangjd_4lingli"):
		return [true,"gjd_5",25000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanbjd_4leizong"):
		return [true,"bjd_5",25000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanxyd_4liuhuang"):
		return [true,"xyd_5",25000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"dudanhmd_4shougong"):
		return [true,"hmd_5",25000]	
#==========================头衔================================	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"ptsryxptsryxptsryx"):
		return [true,"yxsryx",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"yxsryxyxsryxyxsryx"):
		return [true,"jlsryx",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"jlsryxjlsryxjlsryx"):
		return [true,"sssryx",3000]	
	if check_same(a_1,a_2,a_3,a_4,a_5,a_6,"sssryxsssryxsssryx"):
		return [true,"xlsryx",3000]	
		
	return [false,"",0]
func GetSameType(Name_1,Name_2,Name_3,need: String):
	if Name_1 == null or Name_2 == null or Name_3 == null:
		return false
	if Name_1 == Name_2 or Name_1 == Name_3 or Name_2 == Name_3:
		return false
	if Name_1 == "" or Name_2 == "" or Name_3 == "":
		return false
	var T = AE.AllEquipment_
	if not T[Name_1].has("FBTYPE") or not T[Name_2].has("FBTYPE") or not T[Name_3].has("FBTYPE"):
		return false
	else:
		if T[Name_1]["FBTYPE"] + T[Name_2]["FBTYPE"] + T[Name_3]["FBTYPE"] == need:
			return true
	return false
func get_fb_prop(name1):
	var List_1 = PlayerData.player_data["放入列表"]["物品1"]
	var List_2 = PlayerData.player_data["放入列表"]["物品2"]
	var List_3 = PlayerData.player_data["放入列表"]["物品3"]
	var hhp_1 = AE.get_last_equ_pro(List_1[0],List_1[3],List_1[4])["SHp"]
	var hhp_2 = AE.get_last_equ_pro(List_2[0],List_2[3],List_2[4])["SHp"]
	var hhp_3 = AE.get_last_equ_pro(List_3[0],List_3[3],List_3[4])["SHp"]
	var mmp_1 = AE.get_last_equ_pro(List_1[0],List_1[3],List_1[4])["SMp"]
	var mmp_2 = AE.get_last_equ_pro(List_2[0],List_2[3],List_2[4])["SMp"]
	var mmp_3 = AE.get_last_equ_pro(List_3[0],List_3[3],List_3[4])["SMp"]
	var power_1 = AE.get_last_equ_pro(List_1[0],List_1[3],List_1[4])["power"]
	var power_2 = AE.get_last_equ_pro(List_2[0],List_2[3],List_2[4])["power"]
	var power_3 = AE.get_last_equ_pro(List_3[0],List_3[3],List_3[4])["power"]
	var def_1 = AE.get_last_equ_pro(List_1[0],List_1[3],List_1[4])["Def"]
	var def_2 = AE.get_last_equ_pro(List_2[0],List_2[3],List_2[4])["Def"]
	var def_3 = AE.get_last_equ_pro(List_3[0],List_3[3],List_3[4])["Def"]
	var mdef_1 = AE.get_last_equ_pro(List_1[0],List_1[3],List_1[4])["Mdef"]
	var mdef_2 = AE.get_last_equ_pro(List_2[0],List_2[3],List_2[4])["Mdef"]
	var mdef_3 = AE.get_last_equ_pro(List_3[0],List_3[3],List_3[4])["Mdef"]
	var hhp = hhp_1 + hhp_2 + hhp_3
	var mmp = mmp_1 + mmp_2 + mmp_3
	var power = power_1 + power_2 + power_3
	var def = def_1 + def_2 + def_3
	var mdef = mdef_1 + mdef_2 + mdef_3
	hhp = int(hhp / 3)
	mmp = int(mmp / 3)
	power = int(power / 3)
	def = int(def / 3)
	mdef = int(mdef / 3)
	var newList = {"SHp": hhp,"SMp": mmp, "power": power, "Def": def, "Mdef": mdef}
	var proplist = AE.AllEquipment_[name1]

	for i in newList:
		proplist[i] += newList[i]
	return proplist
func GetEquipmentProp(name_1):
	var PropList = {}
	var List_1 = PlayerData.player_data["放入列表"]["物品1"]
	var List_2 = PlayerData.player_data["放入列表"]["物品2"]
	var List_3 = PlayerData.player_data["放入列表"]["物品3"]
	var proplist = AE.AllEquipment_[name_1]
	var NamePropList = AE.PropListName
	var PropOld = {}
	#print(proplist)
	for i in NamePropList:
		PropOld[i] = int((GetProp(List_1,i) + GetProp(List_2,i) + GetProp(List_3,i))) 
	#print(PropList)
	for i in NamePropList:
		proplist[i] += PropOld[i]
	return proplist
func get_eq_prop(name__):
	match name__:
		"bsxj_js":
			pass
		"bsxj_qs":
			pass
		"bsxj_ls":
			pass
func get_wx():
	randomize()
	var wx = {"金":false,"木":false,"水":false,"火":false,"土":false}
	var rr = randi_range(0,100)
	if rr <= 4:
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		var wx_1 = wx_lst[aa]
		wx_lst.erase(wx_1)
		var bb = randi_range(0,3) 
		var wx_2 = wx_lst[bb]
		wx_lst.erase(wx_2)
		var cc = randi_range(0,2) 
		var wx_3 = wx_lst[cc]
		wx[wx_1] = true
		wx[wx_2] = true
		wx[wx_3] = true
		var new_list = []
		for i in wx:
			if wx[i]:
				new_list.push_back(i)
		return new_list
	elif rr > 4 and rr < 10 :
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		var wx_1 = wx_lst[aa]
		wx_lst.erase(wx_1)
		var bb = randi_range(0,3) 
		var wx_2 = wx_lst[bb]
		wx[wx_1] = true
		wx[wx_2] = true
		var new_list = []
		for i in wx:
			if wx[i]:
				new_list.push_back(i)
		return new_list
	else:
		var new_list = []
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		new_list.push_back(wx_lst[aa])
		return new_list

func check_same(_1,_2,_3,_4,_5,_6,need: String):
	if _1 == need or _2 == need or _3 == need or _4 == need or _5 == need or _6 == need:
		return true
	return false
func CheckSameType():
	pass
func GetProp(List,need):
	var QHlevel: int
	if AE.AllEquipment_[List[0]]["类型"] == "道具":
		QHlevel = 0
	else:
		QHlevel = List[3]
	return AE.get_last_equ_pro(List[0],QHlevel,List[4])[need]
	
