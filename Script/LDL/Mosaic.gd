extends Node2D
class_name Mosaic
@onready var bs_1: Button = $bs_1/bs_1
@onready var bs_2: Button = $bs_2/bs_2
@onready var bs_3: Button = $bs_3/bs_3
@onready var bs_4: Button = $bs_4/bs_4
@onready var Zb: Button = $zb/Zb


func _physics_process(_delta: float) -> void:
	setBoxInLdL()#设置格子为在炼丹炉内
	
	if PlayerData.player_data["镶嵌列表"].size() != 0:
		set_ZBProperies()
		set_OtherProp()
	else:
		remove_infomation()

func setBoxInLdL():
	bs_1.is_in_ldl_gz = true
	bs_2.is_in_ldl_gz = true
	bs_3.is_in_ldl_gz = true
	bs_4.is_in_ldl_gz = true
	Zb.is_in_ldl_gz = true
	
func set_ZBProperies():
	Zb.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["名字"])))
	Zb.qh_level = PlayerData.player_data["镶嵌列表"][0]["强化等级"]
	Zb.EQ_prop = PlayerData.player_data["镶嵌列表"][0]["Data"]
func set_OtherProp():
	var BSsize = PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"].size()
	#print(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"])
	if BSsize == 1:
		bs_1.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][0])))
		bs_2.set_button_icon(load_(str("empty")))
		bs_3.set_button_icon(load_(str("empty")))
		bs_4.set_button_icon(load_(str("empty")))
	elif BSsize == 2:
		bs_1.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][0])))
		bs_2.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][1])))
		bs_3.set_button_icon(load_(str("empty")))
		bs_4.set_button_icon(load_(str("empty")))
	elif BSsize == 3:
		bs_1.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][0])))
		bs_2.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][1])))
		bs_3.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][2])))
		bs_4.set_button_icon(load_(str("empty")))
	elif BSsize == 4:
		bs_1.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][0])))
		bs_2.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][1])))
		bs_3.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][2])))
		bs_4.set_button_icon(load_(str(PlayerData.player_data["镶嵌列表"][0]["Data"]["宝石"][3])))
	else:
		bs_1.set_button_icon(load_(str("empty")))
		bs_2.set_button_icon(load_(str("empty")))
		bs_3.set_button_icon(load_(str("empty")))
		bs_4.set_button_icon(load_(str("empty")))
func remove_infomation():
	var Name_: String
	var Level: int
	var Data
	if PlayerData.player_data["镶嵌列表"].size() != 0:
		Name_ = PlayerData.player_data["镶嵌列表"][0]["名字"]
		Level = PlayerData.player_data["镶嵌列表"][0]["强化等级"] 
		Data =  PlayerData.player_data["镶嵌列表"][0]["Data"]
		PlayerData.add_zb(Name_,Level,Data)
	Zb.set_button_icon(load_(str("empty")))
	bs_1.set_button_icon(load_(str("empty")))
	bs_2.set_button_icon(load_(str("empty")))
	bs_3.set_button_icon(load_(str("empty")))
	bs_4.set_button_icon(load_(str("empty")))
	PlayerData.player_data["镶嵌列表"].clear()
		
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc


func _on_help_pressed() -> void:
	Global.AddMosaicHelp(Global.get_parent_(self,3),Vector2(0,0))
