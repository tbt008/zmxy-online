extends Control
class_name MainBackPack
@onready var coin_number: Label = $coin_text/coin_number
@onready var tab_bar: TabBar = $MarginContainer/VBoxContainer/TabBar
@onready var current_page_text: Label = $ChangePage/CurrentPageText
@onready var title: Label = $MarginContainer/VBoxContainer/title
@onready var PlSell = $MarginContainer/VBoxContainer/HBoxContainer/pl_sell
@onready var timer: Timer = $Timer

var current_fl = 0
var current_page = 1
var max_page: int = 10
var pl_sell
var is_in_ldl
var message
var ChooseList = []
var ChooseMs: bool
func _ready() -> void:
	title.text = "装备背包"

	set_box_data()
func _physics_process(_delta: float) -> void:
	if not PlayerData.player_data["ieho"]:
		if PlayerData.checkHaveZB("xczg")[0]:
			PlayerData.player_data["ieho"] = true
	current_page_text.text = str(current_page) + '/' + str(max_page)
	if Global.is_in_ldl:
		PlSell.disabled = true
	else:
		PlSell.disabled = false
	coin_number.text = str(PlayerData.player_data.coin_num)
#	if PlayerData.get_total_zb_list().size() >= 350:#检测装备背包所有页已经装满
#		Global.zb_packisfull = true
#	else:
#		Global.zb_packisfull = false


func set_box_data():
	
	match current_fl:
		0:
			title.text = "装备背包"
			var x = 1
			for i in PlayerData.player_data["装备列表"]["页码" + str(current_page)]:
				target_box(x).set_button_icon(load_(str(i.名字)))
				target_box(x).qh_level = i.强化等级
				target_box(x).EQ_prop = i.Data
				if AE.AllEquipment_[i.名字]["类型"] == "法宝":
					target_box(x).wx = i.五行
				else:
					target_box(x).wx = []
				target_box(x).current_page = current_page
				x += 1
			while x < 36:
				target_box(x).set_button_icon(load("res://Art/BackPack/AllItems/empty.png"))
				target_box(x).qh_level = 0
				target_box(x).wx = []
				target_box(x).EQ_prop = {}
				target_box(x).current_page = current_page
				x += 1
		1:
			title.text = "道具背包"
			var x = 1
			for i in PlayerData.player_data["道具列表"]["页码" + str(current_page)]:
				target_box(x).set_button_icon(load_(str(i.名字)))
				target_box(x).total_number = i.数量
				target_box(x).current_page = current_page
				target_box(x).EQ_prop = i.Data
				x += 1
			while x < 36:
				target_box(x).set_button_icon(load("res://Art/BackPack/AllItems/empty.png"))
				target_box(x).total_number = 0
				target_box(x).current_page = current_page
				target_box(x).EQ_prop = {}
				x += 1
			pass
		2:
			title.text = "消耗品背包"
			var x = 1
			for i in PlayerData.player_data["消耗品列表"]["页码" + str(current_page)]:
				target_box(x).set_button_icon(load_(str(i.名字)))
				target_box(x).total_number = i.数量
				target_box(x).current_page = current_page
				x += 1
			while x < 36:
				target_box(x).set_button_icon(load("res://Art/BackPack/AllItems/empty.png"))
				target_box(x).total_number = 0
				target_box(x).current_page = current_page
				x += 1
			pass
func target_box(num):
	var target = get_node("MarginContainer/VBoxContainer/MarginContainer/Sc_Box/Gd_Box/box_" + str(num))
	return target
func set_empty_box():
	for i in range(25):
		target_box(i + 1).set_button_icon(load("res://Art/BackPack/AllItems/empty.png"))
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc

func _on_button_pressed() -> void:
	randomize()
func _on_add_xhp_pressed() -> void:
	pass

func _on_add_dj_pressed() -> void:
	randomize()
	PlayerData.add_dj("qhs_1",2)
	

func _on_批量出售_pressed() -> void:
	if pl_sell == null:
		pl_sell = Global.add_pl_sell(PlSell,Vector2(90,0))
		pl_sell.MainBack = self
	elif pl_sell != null:
		RemoveChoose()
		pl_sell.queue_free()
func RemoveChoose():
	ChooseMs = false
	ChooseList.clear()
func _on_zb_pressed() -> void:
	current_fl = 0
	PlayerData.zl_zb()
	PlayerData.zl_dj()
	PlayerData.zl_xhp()
func _on_dj_pressed() -> void:
	current_fl = 1
	PlayerData.zl_zb()
	PlayerData.zl_dj()
	PlayerData.zl_xhp()
func _on_xhp_pressed() -> void:
	current_fl = 2
	PlayerData.zl_zb()
	PlayerData.zl_dj()
	PlayerData.zl_xhp()
func _on_timer_timeout() -> void:
	set_box_data()
func add_text(parent,text):
	if message == null:
		message = Global.add_touch_text(parent,Vector2(120,40),text)
func remove_message():
	if message != null:
		message.queue_free()


func _on_last_page_pressed() -> void:
	if current_page > 1:
		current_page -= 1
	if current_page <= 1:
		current_page = 1
	set_box_data()

func _on_next_page_pressed() -> void:
	if current_page < max_page:
		current_page += 1
	if current_page >= max_page:
		current_page = max_page
	set_box_data()
