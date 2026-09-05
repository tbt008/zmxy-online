extends Node2D 
@onready var item_name: Label = $BG/name_ #商品名称
@onready var lh_need: Label = $BG/lh_value # 购买需要的灵魂文本
@onready var need_num = $BG/num_/num_kj/num_  #购买的数量
@onready var items: Button = $BG/bgg/Items
var EQ_prop = {}
var total_num: int = 1
var item_name_: String
var choose_jm
var need_lh: int
func _ready() -> void:
	items.is_in_shop = true
	
func _physics_process(_delta: float) -> void:
	items.is_in_shop = true
	if total_num <= 1:
		total_num = 1
	if item_name_ != "":
		item_name.text = str(AE.AllEquipment_[item_name_]["名字"])
		items.set_button_icon(load_(item_name_))
		items.qh_level = 0
		items.wx = []
		items.EQ_prop = AE.AllEquipment_[item_name_]
	lh_need.text = str(need_lh)
func _on_cure_num_pressed() -> void:
	total_num += 1
	need_num.text = str(total_num)

func _on_reduce_num_pressed() -> void:
	if total_num > 1:
		total_num -= 1
		need_num.text = str(total_num)



func _on_num__text_changed(new_text: String) -> void:
	if int(new_text) > 1:
		total_num = int(new_text)


func _on_goumai_pressed() -> void:
	Signals.ConnectChooseBoxSignal(self,"GM")
	var parent_ = Global.get_parent_(self,3)
	choose_jm = Global.add_choose_text(parent_,Vector2(0,0),"确定花费" + str(need_lh * total_num) + '灵魂购买' + str(total_num) + "个" + str(item_name.text) +  "吗？",0)

func add_item_toplayer(times):
	var parent_ = Global.get_parent_(self,3)
	if PlayerData.player_data["coin_num"] >= int(need_lh * total_num):
		var lx = AE.AllEquipment_[item_name_]["类型"]
		var cklb: String
		match lx:
			"武器","防具","饰品","翅膀","头衔","时装","法宝":
				cklb = "装备列表"
			"道具":
				cklb = "道具列表"
			"消耗品":
				cklb = "消耗品列表"
		if not PlayerData.CheckCanUsePage(cklb) == 0:
			PlayerData.player_data["coin_num"] -= int(need_lh * total_num)
			
			match lx:
				"武器","防具","饰品","翅膀","头衔","时装":
					for i in range(times):
						if PlayerData.CheckCanUsePage("装备列表") == 0:
							Global.AddMessageShow(parent_,"背包已满！",1.5,Vector2(485,295))
							break
						else:
							PlayerData.add_zb(item_name_,0,{})
				"法宝":
					for i in range(times):
						if PlayerData.CheckCanUsePage("装备列表") == 0:
							Global.AddMessageShow(parent_,"背包已满！",1.5,Vector2(485,295))
							break
						else:
							PlayerData.add_fb(item_name_,0,AE.get_wx(),{})
				"道具":
					PlayerData.add_dj(item_name_,total_num)
				"消耗品":
					PlayerData.add_xhp(item_name_,total_num)
			Global.AddMessageShow(parent_,"购买成功！",1.5,Vector2(485,295))
			return
		else:
			Global.AddMessageShow(parent_,"背包已满！",1.5,Vector2(485,295))
#	else:
#		Global.AddMessageShow(parent_,"灵魂不足！",1.5,Vector2(485,295))
#		return
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func GM():
	add_item_toplayer(total_num)
