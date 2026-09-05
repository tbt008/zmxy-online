extends Control
var get_name_
var page
var number
var EQ_prop = {}
var jm

@onready var infor = $VBoxContainer/infor
func _physics_process(_delta: float) -> void:
	infor.text = "第" + str(page) + "页" + "第" + str(number + 1) + "格"
#	if jm != null:
#		await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1.8).timeout
	if jm == null:
		queue_free()
func _on_equ_pressed() -> void:
	var new_list = PlayerData.GetzbData(page,number)
	if not CheckCanEquipment(new_list["名字"]):
		return
	match AE.AllEquipment_[new_list["名字"]]["类型"]:
		"武器":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["武器"].size() != 0:
				var mz = PlayerData.player_data["武器"][0]["名字"]
				var ql = PlayerData.player_data["武器"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["武器"][0]["Data"]
				PlayerData.player_data["武器"].clear()
				PlayerData.player_data["武器"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
			else:
				PlayerData.player_data["武器"].clear()
				PlayerData.player_data["武器"].push_back(new_list)
				PlayerData.zl_zb()
		"防具":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["防具"].size() != 0:
				var mz = PlayerData.player_data["防具"][0]["名字"]
				var ql = PlayerData.player_data["防具"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["防具"][0]["Data"]
				PlayerData.player_data["防具"].clear()
				PlayerData.player_data["防具"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
				
			else:
				PlayerData.player_data["防具"].clear()
				PlayerData.player_data["防具"].push_back(new_list)
				PlayerData.zl_zb()
		"饰品":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["饰品"].size() != 0:
				var mz = PlayerData.player_data["饰品"][0]["名字"]
				var ql = PlayerData.player_data["饰品"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["饰品"][0]["Data"]
				PlayerData.player_data["饰品"].clear()
				PlayerData.player_data["饰品"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
			else:
				PlayerData.player_data["饰品"].clear()
				PlayerData.player_data["饰品"].push_back(new_list)
				PlayerData.zl_zb()
		"头衔":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["头衔"].size() != 0:
				var mz = PlayerData.player_data["头衔"][0]["名字"]
				var ql = PlayerData.player_data["头衔"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["头衔"][0]["Data"]
				PlayerData.player_data["头衔"].clear()
				PlayerData.player_data["头衔"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
			else:
				PlayerData.player_data["头衔"].clear()
				PlayerData.player_data["头衔"].push_back(new_list)
				PlayerData.zl_zb()
		"时装":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["时装"].size() != 0:
				var mz = PlayerData.player_data["时装"][0]["名字"]
				var ql = PlayerData.player_data["时装"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["时装"][0]["Data"]
				PlayerData.player_data["时装"].clear()
				PlayerData.player_data["时装"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
				
			else:
				PlayerData.player_data["时装"].clear()
				PlayerData.player_data["时装"].push_back(new_list)
				PlayerData.zl_zb()
		"翅膀":
			PlayerData.remove_zb(page,number)
			if PlayerData.player_data["翅膀"].size() != 0:
				var mz = PlayerData.player_data["翅膀"][0]["名字"]
				var ql = PlayerData.player_data["翅膀"][0]["强化等级"]
				EQ_prop = PlayerData.player_data["翅膀"][0]["Data"]
				PlayerData.player_data["翅膀"].clear()
				PlayerData.player_data["翅膀"].push_back(new_list)
				PlayerData.zl_zb()
				PlayerData.add_zb(mz,ql,EQ_prop)
			else:
				PlayerData.player_data["翅膀"].clear()
				PlayerData.player_data["翅膀"].push_back(new_list)
				PlayerData.zl_zb()
		"法宝":
			PlayerData.remove_zb(page,number)
			if Global.FB_CD <= 0:
				if PlayerData.player_data["法宝"].size() != 0:
					var mz = PlayerData.player_data["法宝"][0]["名字"]
					var ql = PlayerData.player_data["法宝"][0]["强化等级"]
					var wx = PlayerData.player_data["法宝"][0]["五行"]
					EQ_prop = PlayerData.player_data["法宝"][0]["Data"]
					PlayerData.player_data["法宝"].clear()
					PlayerData.player_data["法宝"].push_back(new_list)
					PlayerData.zl_zb()
					PlayerData.add_fb(mz,ql,wx,EQ_prop)
				else:
					PlayerData.player_data["法宝"].clear()
					PlayerData.player_data["法宝"].push_back(new_list)
					PlayerData.zl_zb()
			else:
				var mz = new_list["名字"]
				var ql = new_list["强化等级"]
				var wx = new_list["五行"]
				EQ_prop = new_list["Data"]
				PlayerData.add_fb(mz,ql,wx,EQ_prop)
				var parent = Global.get_parent_(self,3)
				Global.AddMessageShow(parent,"当前法宝正在使用，无法更换！！",1.5,Vector2(485,240))
	RoleProp.get_equ_last_pro()
	RoleProp.get_last_prop()
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()


func _on_sell_pressed() -> void:
	if EQ_prop == null:
		PlayerData.remove_zb(page,number)
		return
	if not EQ_prop.has("类型"):
		PlayerData.remove_zb(page,number)
		return
	var Lx = EQ_prop["类型"]
	var pz = EQ_prop["品质"]
	match Lx:
		"武器","防具","饰品":
			if EQ_prop["宝石"].size() == 0:
				pass
			else:
				var parent = Global.get_parent_(self,3)
				Global.AddMessageShow(parent,"请先卸下该装备上的宝石！！",1.5,Vector2(485,240))
				return
	var abc = PlayerData.GetzbData(page,number)

	var Name = PlayerData.GetzbData(page,number)["Data"]["名字"]
	if pz == "传说" or pz == "玄冥" or pz == "魂器" or pz == "神器" or pz == "邪灵":
		self.visible = false
		Signals.ConnectChooseBoxSignal(self,"sell")
		jm = Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定要卖出" + str(pz) + '品质的' + str(Name) +"吗？（此装备已强化至+" + str(abc["强化等级"]) + "。）",0)
		return	
	if Lx == "法宝":
		self.visible = false
		Signals.ConnectChooseBoxSignal(self,"sell")
		jm = Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定要卖出" + str(Lx) + str(Name) +"吗？（此装备已强化至+" + str(abc["强化等级"]) + "。）",0)
		return		
	if abc["强化等级"] > 0:
		self.visible = false
		Signals.ConnectChooseBoxSignal(self,"sell")
		jm = Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定要卖出" + str(Lx) + str(Name) +"吗？（此装备已强化至+" + str(abc["强化等级"]) + "。）",0)
		return		
	#if 
	var get_value = AE.AllEquipment_[get_name_]["售价"]
	PlayerData.player_data["coin_num"] += get_value
	MemoryClass.保存游戏(Global.cd_path)
	PlayerData.remove_zb(page,number)
	PlayerData.zl_zb()
	queue_free()
func sell():
	var get_value = AE.AllEquipment_[get_name_]["售价"]
	PlayerData.player_data["coin_num"] += get_value
	MemoryClass.保存游戏(Global.cd_path)
	PlayerData.remove_zb(page,number)
	PlayerData.zl_zb()
func get_number():
	var number_ = int(str(get_parent().name).split("_")[1]) - 1
	return number_
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc


func _on_mouse_exited() -> void:
	pass
	#queue_free()


func _on_v_box_container_mouse_exited() -> void:
	pass
	#queue_free()


func _on_panel_mouse_exited() -> void:
	pass
	#queue_free()
func CheckCanEquipment(EquipmentName):#检测某装备是否属于该玩家
	var RoleID: int = PlayerData.player_data["Myself"]
	var parent = Global.get_parent_(self,3)
	var EqBase = AE.AllEquipment_[EquipmentName]["所属"]
	var Name_ = AE.AllEquipment_[EquipmentName]["名字"] as String
	var RoleBase: String
	if EqBase == "通用":
		return true
	match RoleID:
		1:
			RoleBase = "悟空"
			if EqBase == "悟空":
				return true
		2:
			RoleBase = "唐僧"
			if EqBase == "唐僧":
				return true
		3:
			RoleBase = "八戒"
			if EqBase == "八戒":
				return true
		4:
			RoleBase = "沙僧"
			if EqBase == "沙僧·铲" or EqBase == "沙僧·弓" or EqBase == "沙僧":
				return true
		5:
			RoleBase = "白龙"
			if EqBase == "白龙":
				return true
	Global.AddMessageShow(parent, Name_ + '属于' + EqBase + '，' + RoleBase + "无法穿戴！！",1.5,Vector2(485,240))
	return false
	
