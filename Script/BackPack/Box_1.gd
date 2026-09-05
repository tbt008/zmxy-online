extends Button
var get_item_name: String
var get_type
var add_equ_box
var sell_box
var qh_level: int
var EQ_prop = {}
var total_number:int
var current_page:int
var gl_po: Vector2
var is_in_ldl_gz = false
var is_in_shop = false
var wx = []
var is_in_hh = false
var is_in_hhgz = false
var get_tt
var HideProp: bool
var ForgeBZID: int
var IsChoose: bool
var MainBack
@onready var item_number: Label = $item_number
#目标：在背包里，全都放在背包上Node2D BackPack
var is_in_ldl 
func _ready() -> void:
	is_in_ldl = Global.is_in_ldl
	#MainBack = Global.get_parent_(self,6)
	get_item_name = str(icon.resource_path.split("AllItems/")[1].split(".")[0])
func _physics_process(_delta: float) -> void:
#	if MainBack is MainBackPack:
#		if not MainBack.ChooseMs:
#			IsChoose = false
#		if not MainBack.ChooseList.has(str(current_page) + '_' + str(get_number())):
#			IsChoose = false
#		else:
#			IsChoose = true
#	else:
#		IsChoose = false
#	if IsChoose:
#		self.modulate = Color("666666")
#	else:
#		self.modulate = Color("FFFFFF")
	#get_tt = AE.AllEquipment_[get_item_name]["类型"]
	if is_in_ldl_gz or is_in_shop or is_in_hh or is_in_hhgz or is_in_ldl:
		gl_po = get_tree().get_root().get_mouse_position() - Vector2(-25,20)
	else:
		gl_po = get_tree().get_root().get_mouse_position() - Vector2(430,250)
	if add_equ_box != null:
		if gl_po != null:
			add_equ_box.position = gl_po
	#===========属性图位置
	is_in_ldl = Global.is_in_ldl
	get_item_name = str(icon.resource_path.split("AllItems/")[1].split(".")[0])
	if get_item_name != "empty":
		get_type = AE.AllEquipment_[get_item_name]["类型"]
		match get_type:
			"武器":
				item_number.text = ""
			"防具":
				item_number.text = ""
			"饰品":
				item_number.text = ""
			"法宝":
				item_number.text = ""
			"翅膀":
				item_number.text = ""
			"时装":
				item_number.text = ""
			"头衔":
				item_number.text = ""
			"道具":
				if total_number > 1:
					item_number.text = str(total_number)
				else:
					item_number.text = ""
			"消耗品":
				if total_number > 1:
					item_number.text = str(total_number)
				else:
					item_number.text = ""
	else:
		total_number = 0
		item_number.text = ""
func _onPressWhenInBack():
	var Position_ = get_tree().get_root().get_mouse_position() - Vector2(640,280)
	var parent_ = Global.get_parent_(self,6)
	var number = get_number()
	match get_type:
		"武器","防具","饰品","法宝","时装","头衔","翅膀":
			sell_box = Global.add_se_eq_jm(parent_,Position_,get_item_name,current_page,number)
			sell_box.EQ_prop = EQ_prop
		"消耗品","道具":
			var pp = Global.add_dj_sell(parent_,Position_,get_item_name,current_page)
			pp.EQ_prop = EQ_prop
func _onPressWhenStrength():#当在强化界面被点击时
	var get_tt = AE.AllEquipment_[get_item_name]["类型"]
	if get_tt != "道具" and get_tt != "消耗品" and get_tt != "法宝":
		if qh_level < 7:
			MLdl.qh_list["名字"] = get_item_name
			MLdl.qh_list["强化等级"] = qh_level
			MLdl.qh_list["页码"] = current_page
			MLdl.qh_list["位置"] = int(str(self.name).split("_")[1]) - 1
			MLdl.qh_list["Data"] = EQ_prop
		else:
			var parent_ = Global.get_parent_(self,7)
			Global.AddMessageShow(parent_,"装备等级已达最高等级！！无法继续强化！",1.5,Vector2(500,305))
func _onPressWhenSynthesis():
	
	if not is_in_ldl_gz:
		var parent_ = Global.get_parent_(self,7)
		for i in PlayerData.player_data["放入列表"]:
			var mylist = PlayerData.player_data["放入列表"][i]
			if mylist.size() == 0:
				var get_tt = AE.AllEquipment_[get_item_name]["类型"]
				if get_tt == "法宝":
					Global.AddMessageShow(parent_,"法宝无法参与合成！！！",1.5,Vector2(500,305))
					return
				if get_tt == "消耗品":
					Global.AddMessageShow(parent_,"消耗品无法参与合成！！！",1.5,Vector2(500,305))
					return
				PlayerData.player_data["放入列表"][i].push_back(str(get_item_name))
				PlayerData.player_data["放入列表"][i].push_back(PlayerData.get_dj_page(get_item_name))
				PlayerData.player_data["放入列表"][i].push_back(int(str(self.name).split("_")[1]) - 1)
				PlayerData.player_data["放入列表"][i].push_back(qh_level)
				PlayerData.player_data["放入列表"][i].push_back(EQ_prop)
				if get_tt == "武器" or get_tt == "防具" or get_tt == "饰品" or get_tt == "翅膀" or get_tt == "时装" or get_tt == "头衔" :
					if EQ_prop["宝石"].size() != 0:
						PlayerData.player_data["放入列表"][i].clear()
						Global.AddMessageShow(parent_,"请先卸下该装备上的宝石！！！",1.5,Vector2(500,305))
						return
					else:
						PlayerData.remove_zb(current_page,get_number())
						Global.get_parent_(self,6).set_box_data()
				elif get_tt == "道具" or get_tt == "消耗品":

					PlayerData.remove_dj(get_item_name,PlayerData.get_dj_page(get_item_name),1)
					Global.get_parent_(self,6).set_box_data()
				elif get_tt == "法宝":
					return
				return
	else:
		var num = str(self.name).split("_")[1]
		if int(num) > 3:
			return
		var list = PlayerData.player_data["放入列表"]["物品" + str(num)]
		if list.has(str(get_item_name)):
			var get_tt = AE.AllEquipment_[list[0]]["类型"]
			if get_tt == "武器" or get_tt == "防具" or get_tt == "饰品" or get_tt == "翅膀" or get_tt == "时装" or get_tt == "头衔" :
				PlayerData.add_zb(get_item_name,list[3],EQ_prop)
			elif get_tt == "道具":
				PlayerData.add_dj(list[0],1)
			elif get_tt == "消耗品":
				PlayerData.add_xhp(list[0],1)
			elif get_tt == "法宝":
				return
			PlayerData.player_data["放入列表"]["物品" + str(num)].clear()
			MemoryClass.保存游戏(Global.cd_path)
			return
func _onPressWhenDZ():
	if Global.Forge_ == null:
		return
	var Type = AE.AllEquipment_[get_item_name]["类型"]
	var Have = AE.AllEquipment_[get_item_name]["所属"]
	var Name = AE.AllEquipment_[get_item_name]["名字"]
	var parent_ = Global.get_parent_(self,7)
	if not is_in_ldl_gz:#背包放格子
		if Type != "道具":
			Global.AddMessageShow(parent_,str(Name) + "不可以参与打造！",1.5,Vector2(500,305))
			return
		if Global.Forge_.zzs.get_children().size() <= 0:
			if Have != "制作书":
				Global.AddMessageShow(parent_,"只有制作书可以参与打造！",1.5,Vector2(500,305))
				return
			else:
				for i in Global.Forge_.zzs.get_children():
					Global.Forge_.zzs.remove_child(i)
					i.queue_free()
					
				var ItemBox = Global.AddItemBox(Global.Forge_.zzs,true,true,get_item_name,qh_level,1,[],EQ_prop)
				ItemBox.set_button_icon(load_(str(get_item_name)))
				ItemBox.get_item_name = get_item_name
				ItemBox.position = Vector2(8,8)
				Global.Forge_.RmoveBox()
				Global.Forge_.RemoveNameAndNeed()
				Global.Forge_.LoadMaterialBox()
				Global.Forge_.RefreshName()
		else:
			if Have != "制作书":
				if Have == "宝珠":
					if PlayerData.player_data["宝珠列表"].size() < 3:
						var BzProp = {"名字":get_item_name,"强化等级": qh_level,"Data": EQ_prop}
						PlayerData.player_data["宝珠列表"].push_back(BzProp)
						Global.Forge_.ADDBZPIC()
						PlayerData.remove_dj(get_item_name,PlayerData.get_dj_page(get_item_name),1)
						return
					else:
						Global.AddMessageShow(parent_,"最多放入三颗宝珠！",1.5,Vector2(500,305))
				else:
					Global.AddMessageShow(parent_,"只能放入宝珠！",1.5,Vector2(500,305))
					return
			else:
				for i in Global.Forge_.zzs.get_children():
					Global.Forge_.zzs.remove_child(i)
					i.queue_free()
				var ItemBox = Global.AddItemBox(Global.Forge_.zzs,true,true,get_item_name,qh_level,1,[],EQ_prop)
				ItemBox.set_button_icon(load_(str(get_item_name)))
				ItemBox.position = Vector2(8,8)
				ItemBox.get_item_name = get_item_name
				Global.Forge_.RmoveBox()
				Global.Forge_.RemoveNameAndNeed()
				Global.Forge_.LoadMaterialBox()
				#Global.Forge_.RemoveNameAndNeed()
				Global.Forge_.RefreshName()
	else:
		Global.Forge_.RemoveBSPIC(ForgeBZID)
func _onPressWhenfj():
	if not is_in_ldl_gz:#背包放格子
		var parent_ = Global.get_parent_(self,7)
		var get_tt = AE.AllEquipment_[get_item_name]["类型"]
		var Base = AE.AllEquipment_[get_item_name]["所属"]
		var Name_
		if PlayerData.player_data["分解列表"].size() != 0:
			Name_ = PlayerData.player_data["分解列表"][0]["名字"]
			var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
			var Data =  PlayerData.player_data["分解列表"][0]["Data"]
			get_tt = AE.AllEquipment_[Name_]["类型"]
			match get_tt:
				"武器","饰品","防具":
					PlayerData.add_zb(Name_,Level,Data)
					PlayerData.player_data["分解列表"].clear()
				"道具":
					PlayerData.add_dj(Name_,1)
					PlayerData.player_data["分解列表"].clear()
		var get_tt2 = AE.AllEquipment_[get_item_name]["类型"]
		match get_tt2:
			"法宝":
				Global.AddMessageShow(parent_,"法宝不可以分解！！",1.5,Vector2(500,305))
				return
			"消耗品":
				Global.AddMessageShow(parent_,"消耗品不可以分解！！",1.5,Vector2(500,305))
				return
			"翅膀":
				Global.AddMessageShow(parent_,"翅膀无不可以分解！！",1.5,Vector2(500,305))
				return
			"时装":
				Global.AddMessageShow(parent_,"时装不可以分解！！",1.5,Vector2(500,305))
				return
			"头衔":
				Global.AddMessageShow(parent_,"头衔不可以分解！！",1.5,Vector2(500,305))
				return
			"道具":
				PlayerData.player_data["分解列表"].push_back({"名字":get_item_name,"强化等级": qh_level,"Data": EQ_prop})
				PlayerData.remove_dj(get_item_name,current_page,1)
			"武器", "防具","饰品":
				if EQ_prop["宝石"].size() != 0:
					#PlayerData.player_data["分解列表"].clear()
					Global.AddMessageShow(parent_,"请先卸下该装备上的宝石！！！",1.5,Vector2(500,305))
					return
				PlayerData.player_data["分解列表"].push_back({"名字":get_item_name,"强化等级": qh_level,"Data": EQ_prop})
				PlayerData.remove_zb(current_page,get_number())
			"":
				Global.AddMessageShow(parent_,"错误？？！！",1.5,Vector2(500,305))
				return
	else:
		if PlayerData.player_data["分解列表"].size() != 0:
			var Name_ = PlayerData.player_data["分解列表"][0]["名字"]
			var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
			var Data =  PlayerData.player_data["分解列表"][0]["Data"]
			get_tt = AE.AllEquipment_[Name_]["类型"]
			match get_tt:
				"武器","饰品","防具":
					PlayerData.add_zb(Name_,Level,Data)
					PlayerData.player_data["分解列表"].clear()
				"道具":
					PlayerData.add_dj(Name_,1)
					PlayerData.player_data["分解列表"].clear()
		return
func _onPressWhenXQ():
	if not is_in_ldl_gz:
		var parent_ = Global.get_parent_(self,7)
		var get_tt = AE.AllEquipment_[get_item_name]["类型"]
		var Base = AE.AllEquipment_[get_item_name]["所属"]
		if PlayerData.player_data["镶嵌列表"].size() == 0:
			match get_tt:
				"法宝":
					Global.AddMessageShow(parent_,"法宝不可以镶嵌宝石！！",1.5,Vector2(500,305))
					return
				"消耗品":
					Global.AddMessageShow(parent_,"不可放入消耗品！！",1.5,Vector2(500,305))
					return
				"翅膀":
					Global.AddMessageShow(parent_,"翅膀无法镶嵌宝石！！",1.5,Vector2(500,305))
					return
				"时装":
					Global.AddMessageShow(parent_,"时装无法镶嵌宝石！！",1.5,Vector2(500,305))
					return
				"头衔":
					Global.AddMessageShow(parent_,"头衔无法镶嵌宝石！！",1.5,Vector2(500,305))
					return
				"道具":
					if Base == "宝石":
						if PlayerData.player_data["镶嵌列表"].size() == 0:
							Global.AddMessageShow(parent_,"请先放入装备！！",1.5,Vector2(500,305))
					else:
						Global.AddMessageShow(parent_,"该道具不可用于镶嵌！！",1.5,Vector2(500,305))
					
				"武器", "防具","饰品":
					PlayerData.player_data["镶嵌列表"].push_back({"名字":get_item_name,"强化等级": qh_level,"Data": EQ_prop})
					PlayerData.remove_zb(current_page,get_number())
					
				"":
					Global.AddMessageShow(parent_,"错误？？！！",1.5,Vector2(500,305))
					return
		else:
			var Data =  PlayerData.player_data["镶嵌列表"][0]["Data"]
			var is_same = false
			match get_tt:
				"法宝":
					Global.AddMessageShow(parent_,"法宝不可以镶嵌宝石！！",1.5,Vector2(500,305))
					return
				"消耗品":
					Global.AddMessageShow(parent_,"不可放入消耗品！！",1.5,Vector2(500,305))
					return
				"道具":
					if Base == "宝石":
						
						if Data["宝石"].size() < get_MaxBs():
							if Data["宝石"].size() != 0:
								for i in Data["宝石"]:
									var get_lx = str(i.split("_")[0])
									if str(get_item_name.split("_")[0]) == get_lx:
										is_same = true
								if is_same:
									Global.AddMessageShow(parent_,"同类型的宝石只能镶嵌一个！！",1.5,Vector2(500,305))
									return
								else:
									PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"].push_back(get_item_name)
									PlayerData.remove_dj(get_item_name,current_page,1)
							else:
								PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"].push_back(get_item_name)
								PlayerData.remove_dj(get_item_name,current_page,1)
						else:
							Global.AddMessageShow(parent_,"最多镶嵌" + str(get_MaxBs()) + "个宝石！！",1.5,Vector2(500,305))
							return
					else:
						Global.AddMessageShow(parent_,"该道具不可用于镶嵌！！",1.5,Vector2(500,305))
						return
				"武器", "防具","饰品":
					Global.AddMessageShow(parent_,"请先将镶嵌格子内装备卸下！！",1.5,Vector2(500,305))
					return
				"":
					Global.AddMessageShow(parent_,"错误？？！！",1.5,Vector2(500,305))
					return
	else:
		var get_tt = AE.AllEquipment_[get_item_name]["类型"]
		var Name_: String
		var Level: int
		var Data
		if PlayerData.player_data["镶嵌列表"].size() != 0:
			Name_ = PlayerData.player_data["镶嵌列表"][0]["名字"]
			Level = PlayerData.player_data["镶嵌列表"][0]["强化等级"] 
			Data =  PlayerData.player_data["镶嵌列表"][0]["Data"]
			match get_tt:
				"武器","饰品","防具":
					PlayerData.add_zb(Name_,Level,Data)
					PlayerData.player_data["镶嵌列表"].clear()
				"道具":
					PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"].erase(get_item_name)
					PlayerData.add_dj(get_item_name,1)
				"":
					pass
		return
func _on_pressed() -> void:
#	if MainBack is MainBackPack:
#		if MainBack.ChooseMs:
#			if not IsChoose:
#				MainBack.ChooseList.push_back(str(current_page) + '_' + str(get_number()))
#				IsChoose = true
#			else:
#				MainBack.ChooseList.erase(str(current_page) + '_' + str(get_number()))
#				IsChoose = false
#			return
	var parent_
	if Global.BoxCount > 0:
		if is_in_ldl:
			parent_ = Global.get_parent_(self,7)
		else:
			parent_ = Global.get_parent_(self,6)
		if is_in_hh or is_in_shop or is_in_hhgz:
			return
		else:
			Global.AddMessageShow(parent_,"点击过快！！",1.5,Vector2(500,305))
		return
	else:
		Global.BoxCount = 6
	if HideProp:
		return
	if is_in_hh or is_in_shop or is_in_hhgz:
		return
	if add_equ_box != null:
		add_equ_box.queue_free()
	if get_item_name != "empty" and sell_box == null:
		if Global.is_in_ldl == false:
			_onPressWhenInBack()
		elif Global.is_in_ldl == true:
			match MLdl.loc_:
				"强化":
					_onPressWhenStrength()
				"合成":
					_onPressWhenSynthesis()
				"镶嵌":
					_onPressWhenXQ()
				"分解":
					Global.NeedChangeItem = true
					_onPressWhenfj()
				"打造":
					_onPressWhenDZ()
	MemoryClass.保存游戏(Global.cd_path)
func _on_mouse_entered() -> void:
	if HideProp:
		return
	if get_item_name != "empty" and add_equ_box == null:
		var tt = get_parent_()
		var pp = Vector2(0,0)
		if EQ_prop != null:
			add_equ_box = Global.add_equ_propeties_box(tt,pp,get_item_name,qh_level,wx,EQ_prop)
			add_equ_box.is_in_ldl_gz = is_in_ldl_gz
			add_equ_box.is_in_shop = is_in_shop
func _on_mouse_exited() -> void:
	if add_equ_box != null :
		add_equ_box.queue_free()
func get_number():
	var number = int(str(self.name).split("_")[1]) - 1
	return number
func get_parent_():
	var LastParent
	if is_in_hh or is_in_hhgz or is_in_shop or is_in_ldl_gz or is_in_ldl:
		LastParent = Global.Windows_
	else:
		LastParent = Global.get_parent_(self,7)	
	return LastParent
func get_MaxBs():
	if PlayerData.player_data["镶嵌列表"].size() == 0:
		return 0
	var Level = PlayerData.player_data["镶嵌列表"][0]["强化等级"] 
	match Level:
		0,1:
			return 0
		2,3:
			return 1
		4,5:
			return 2
		6:
			return 3
		7:
			return 4
	return 0
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
