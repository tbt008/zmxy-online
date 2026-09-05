extends Node2D
@onready var Item_List = $BG/ItemList
var list_ = []
var current_choose: int = -1
var is_set = false
var name_: String
var page_: int
func _physics_process(_delta: float) -> void:
	if not is_set:
		add_item_()
		is_set = true
func add_item_():
	for i in list_.size():
		Item_List.add_item(get_item_name(i),load_(get_item(i)),true)

func get_item(idx):
	var name__
	name__ = list_[idx]["名字"]
	return name__
func get_item_name(idx):
	var name__
	name__ = list_[idx]["名字"]
	var name_text = AE.AllEquipment_[name__]["名字"]
	var lx = AE.AllEquipment_[name__]["类型"]
	var get_num = get_item_num(idx)
	var wxx = get_wx_text(idx)
	
	match lx:
		"武器","防具","饰品":
			if get_num > 0:
				name_text = name_text + ' (+' + str(get_num) + ")"
		"法宝":
			if wxx != "":
				if get_num > 0:
					name_text = name_text + ' (+' + str(get_num) + ")" + '('  + str(wxx) + ")"
				else:
					name_text = name_text + str(wxx)
			else:
				if get_num > 0:
					name_text = name_text + ' (+' + str(get_num) + ")"
				else:
					name_text = name_text
		"道具","消耗品":
			if get_num > 0:
				name_text = name_text + ' * ' + str(get_num) + "个"
	return name_text	
func get_wx_text(idx):
	var get_xx
	get_xx = list_[idx]["五行"]
	var wx: String = ""
	if get_xx.size() > 0:
		if get_xx.size() == 1:
			wx = str(get_xx[0])
		else:
			for i in get_xx:
				wx = wx + str(i)
	return wx
func get_wx(idx):
	var get_wx_
	get_wx_ = list_[idx]["五行"]
	if get_wx_.size() == 0:
		get_wx_ = get_wx_()
	return get_wx_
func get_item_num(idx):
	var num_ = list_[idx]["num"]
	return num_
func load_(name__):
	var abc = load("res://Art/BackPack/AllItems/" + str(name__) + ".png")
	return abc

func _on_item_list_item_selected(index: int) -> void:
	current_choose = int(index)


func _on_qd_pressed() -> void:
	if current_choose >= 0:
		var names
		names = list_[current_choose]["名字"]
		var lx = AE.AllEquipment_[names]["类型"]
		var get_num = get_item_num(current_choose)
		var get_wx_ = get_wx(current_choose)
		var list = [{"Name": names,"Value": get_num,"Prop":{},"WX":Global.get_wx(0),"StrengthValue":0}]
		Global.AddRewardInfo(Global.get_parent_(self,1),Vector2(0,0),list,name_,1)

		
	queue_free()
func get_wx_():
	randomize()
	var wx = {"金":false,"木":false,"水":false,"火":false,"土":false}
	var rr = randi_range(0,100)
	if rr <= 10:
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
	elif rr > 10 and rr < 30 :
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


func _on_qx_pressed() -> void:
	queue_free()


func _on_close_pressed() -> void:
	queue_free()
