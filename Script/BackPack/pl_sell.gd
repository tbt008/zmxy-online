extends Control
@onready var page_: LineEdit = $MarginContainer/VBoxContainer/page_
@onready var pt: CheckBox = $MarginContainer/VBoxContainer/pt
@onready var yx: CheckBox = $MarginContainer/VBoxContainer/yx
@onready var jl: CheckBox = $MarginContainer/VBoxContainer/jl
@onready var ss: CheckBox = $MarginContainer/VBoxContainer/ss
@onready var cs: CheckBox = $MarginContainer/VBoxContainer/cs
@onready var hq: CheckBox = $MarginContainer/VBoxContainer/hq
@onready var xl: CheckBox = $MarginContainer/VBoxContainer/xl
@onready var sq: CheckBox = $MarginContainer/VBoxContainer/sq

var MainBack
var sell_pz = []
var pt_is_choose = false
var yx_is_choose = false
var jl_is_choose = false
var ss_is_choose = false
var cs_is_choose = false
var hq_is_choose = false
var sq_is_choose = false
var xl_is_choose = false
var page: int
var message
func _physics_process(_delta: float) -> void:
	page = int($MarginContainer/VBoxContainer/page_.text)
	SetbuttonDisabled()

func _on_qd_pressed() -> void:
#	if MainBack.ChooseMs:
#		var TotalValue: int = 0
#		var TotalNum: int
#		TotalNum = MainBack.ChooseList.size()
#		if TotalNum <= 0:
#			Global.AddMessageShow(get_parent(),"没有可卖出的装备！",1.5,Vector2(-240,150))
#			return	
#		var i = MainBack.ChooseList.size() - 1
#		while i >= 0:
#			var Page = int(str(MainBack.ChooseList[i]).split("_")[0])
#			var number = int(str(MainBack.ChooseList[i]).split("_")[1])
#			var List = PlayerData.remove_zb(Page,number)
#			if List == null:
#				i -= 1
#				continue
#			var Name = List["名字"]
#			var CoinNum: int = 0
#			CoinNum = AE.AllEquipment_[Name]["售价"]
#			TotalValue += CoinNum
#			i -= 1
#		MainBack.ChooseList.clear()
#		Global.AddMessageShow(get_parent(),"卖出" + str(TotalNum) + '件装备，获得' + str(TotalValue) + "灵魂！！",1.5,Vector2(-240,150))
#		return	
	if page != 1 and page != 2 and page != 3 and page != 4 and page != 5 and page != 6 and page != 7 and page != 8 and page != 9 and page != 10:
		Global.AddMessageShow(get_parent(),"请正确输入目标页码！",1.5,Vector2(-240,150))
		return
	if sell_pz.size() <= 0:
		Global.AddMessageShow(get_parent(),"请至少勾选一种品质！！",1.5,Vector2(-240,150))
		return
	var coin_number: int = 0
	for u in range(15):
		for i in PlayerData.player_data["装备列表"]["页码" + str(page)]:
			var Type = AE.AllEquipment_[i["名字"]]["类型"]
			if Type == "时装" or Type == "法宝" or Type == "头衔":
				continue
			var get_pz = AE.AllEquipment_[i["名字"]]["品质"]
			var value = AE.AllEquipment_[i["名字"]]["售价"]
			var qh_level = i["强化等级"]
			var bs_size = i["Data"]["宝石"].size()
			if sell_pz.has(get_pz) and qh_level == 0 and bs_size == 0:
				PlayerData.player_data["装备列表"]["页码" + str(page)].erase(i)
				PlayerData.player_data["coin_num"] += value
				coin_number += value
	if coin_number > 0:
		Global.AddMessageShow(get_parent(),"卖出成功！!获得：" + str(coin_number) + "灵魂。",1.5,Vector2(-240,150))
	MemoryClass.保存游戏(Global.cd_path)

func _on_pt_pressed() -> void:
	if not pt_is_choose:
		pt_is_choose = true
		sell_pz.push_back("普通")
	else:
		pt_is_choose = false
		sell_pz.erase("普通")
func _on_yx_pressed() -> void:
	if not yx_is_choose:
		yx_is_choose = true
		sell_pz.push_back("优秀")
	else:
		yx_is_choose = false
		sell_pz.erase("优秀")
func _on_jl_pressed() -> void:
	if not jl_is_choose:
		jl_is_choose = true
		sell_pz.push_back("精良")
	else:
		jl_is_choose = false
		sell_pz.erase("精良")
func _on_ss_pressed() -> void:
	if not ss_is_choose:
		ss_is_choose = true
		sell_pz.push_back("史诗")
	else:
		ss_is_choose = false
		sell_pz.erase("史诗")
func _on_cs_pressed() -> void:
	if not cs_is_choose:
		cs_is_choose = true
		sell_pz.push_back("传说")
	else:
		cs_is_choose = false
		sell_pz.erase("传说")

func _on_hq_pressed() -> void:
	if not hq_is_choose:
		hq_is_choose = true
		sell_pz.push_back("魂器")
	else:
		hq_is_choose = false
		sell_pz.erase("魂器")

func _on_xl_pressed() -> void:
	if not xl_is_choose:
		xl_is_choose = true
		sell_pz.push_back("邪灵")
	else:
		xl_is_choose = false
		sell_pz.erase("邪灵")
func _on_sq_pressed() -> void:
	if not sq_is_choose:
		sq_is_choose = true
		sell_pz.push_back("神器")
	else:
		sq_is_choose = false
		sell_pz.erase("神器")
func add_text(text,parent):
	if message == null:
		message = Global.add_touch_text(parent,Vector2(100,-80),text)
func remove_text():
	if message != null:
		message.queue_free()


func _on_close_pressed() -> void:
	queue_free()







func SetbuttonDisabled():
	if not Global.ChooseMs:
		pt.disabled = false
		yx.disabled = false
		jl.disabled = false
		ss.disabled = false
		xl.disabled = false
		hq.disabled = false
		cs.disabled = false
		sq.disabled = false
	else:
		pt.disabled = true
		yx.disabled = true
		jl.disabled = true
		ss.disabled = true
		xl.disabled = true
		hq.disabled = true
		cs.disabled = true
		sq.disabled = true




#func _on_gxms_pressed() -> void:
#	if not MainBack.ChooseMs:
#		MainBack.ChooseMs = true
#	else:
#		MainBack.ChooseMs = false
#		MainBack.RemoveChoose()
