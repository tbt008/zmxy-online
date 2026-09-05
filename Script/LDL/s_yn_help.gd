extends Node2D
var max_page = 2
var current_page = 1
@onready var ma1_1 = $BG/Title_/Title_1/VBoxContainer/cail_1_1
@onready var ma1_2 = $BG/Title_/Title_1/VBoxContainer/cail_1_2
@onready var ma1_3 = $BG/Title_/Title_1/VBoxContainer/cail_1_3
@onready var ma1_4 = $BG/Title_/Title_1/VBoxContainer/cail_1_4
@onready var ma1_5 = $BG/Title_/Title_1/VBoxContainer/cail_1_5
@onready var ma1_6 = $BG/Title_/Title_1/VBoxContainer/cail_1_6
@onready var ma2_1 = $BG/Title_/Title_2/VBoxContainer/cail_1_1
@onready var ma2_2 = $BG/Title_/Title_2/VBoxContainer/cail_1_2
@onready var ma2_3 = $BG/Title_/Title_2/VBoxContainer/cail_1_3
@onready var ma2_4 = $BG/Title_/Title_2/VBoxContainer/cail_1_4
@onready var ma2_5 = $BG/Title_/Title_2/VBoxContainer/cail_1_5
@onready var ma2_6 = $BG/Title_/Title_2/VBoxContainer/cail_1_6
@onready var ma3_1 = $BG/Title_/Title_3/VBoxContainer/cail_1_1
@onready var ma3_2 = $BG/Title_/Title_3/VBoxContainer/cail_1_2
@onready var ma3_3 = $BG/Title_/Title_3/VBoxContainer/cail_1_3
@onready var ma3_4 = $BG/Title_/Title_3/VBoxContainer/cail_1_4
@onready var ma3_5 = $BG/Title_/Title_3/VBoxContainer/cail_1_5
@onready var ma3_6 = $BG/Title_/Title_3/VBoxContainer/cail_1_6
@onready var ma4_1 = $BG/Title_/Title_4/VBoxContainer/cail_1_1
@onready var ma4_2 = $BG/Title_/Title_4/VBoxContainer/cail_1_2
@onready var ma4_3 = $BG/Title_/Title_4/VBoxContainer/cail_1_3
@onready var ma4_4 = $BG/Title_/Title_4/VBoxContainer/cail_1_4
@onready var ma4_5 = $BG/Title_/Title_4/VBoxContainer/cail_1_5
@onready var ma4_6 = $BG/Title_/Title_4/VBoxContainer/cail_1_6
@onready var page: Label = $BG/CUre/Page

var material_1List = [
	{
		"page_1":["1级强化石","2级强化石","3级强化石","家传装备","阴之符文","今生碎片"],
		"page_2":["红色花瓣","前生碎片","优秀行者棍","天煞月戟","",""],
		"page_3":["","","","","",""],
		"page_4":["","","","","","",]
	}
]
var material_2List = [
	{
		"page_1":["1级强化石","2级强化石","3级强化石","家传装备","阳之符文","来生碎片"],
		"page_2":["紫色花瓣","前生碎片","地煞猿甲","天煞骨链","",""],
		"page_3":["","","","","","",],
		"page_4":["","","","","","",]
	}
]
var material_3List = [
	{
		"page_1":["1级强化石","2级强化石","3级强化石","家传装备","封印鬼王剑","前生碎片"],
		"page_2":["绿色花瓣","白霜胸甲","地煞铃铛","朱雀戒","",""],
		"page_3":["","","","","","",],
		"page_4":["","","","","","",]
	}
]
var material_4List = [
	{
		"page_1":["2级强化石","3级强化石","4级强化石","家传铃铛","鬼王剑","三生锤"],
		"page_2":["七彩袍","白霜胸甲·前生","地煞葫芦","天煞古剑","",""],
		"page_3":["","","","","","",],
		"page_4":["","","","","","",]
	}
]
func _physics_process(_delta: float) -> void:
	page.text = str(current_page) + '/' + str(max_page)
	set_material_()




func set_material_():
	ma1_1.text = str(material_1List[0]["page_" + str(current_page)][0])
	ma1_2.text = str(material_1List[0]["page_" + str(current_page)][1])
	ma1_3.text = str(material_1List[0]["page_" + str(current_page)][2])
	ma1_4.text = str(material_1List[0]["page_" + str(current_page)][3])
	ma1_5.text = str(material_1List[0]["page_" + str(current_page)][4])
	ma1_6.text = str(material_1List[0]["page_" + str(current_page)][5])
	
	ma2_1.text = str(material_2List[0]["page_" + str(current_page)][0])
	ma2_2.text = str(material_2List[0]["page_" + str(current_page)][1])
	ma2_3.text = str(material_2List[0]["page_" + str(current_page)][2])
	ma2_4.text = str(material_2List[0]["page_" + str(current_page)][3])
	ma2_5.text = str(material_2List[0]["page_" + str(current_page)][4])
	ma2_6.text = str(material_2List[0]["page_" + str(current_page)][5])
	
	ma3_1.text = str(material_3List[0]["page_" + str(current_page)][0])
	ma3_2.text = str(material_3List[0]["page_" + str(current_page)][1])
	ma3_3.text = str(material_3List[0]["page_" + str(current_page)][2])
	ma3_4.text = str(material_3List[0]["page_" + str(current_page)][3])
	ma3_5.text = str(material_3List[0]["page_" + str(current_page)][4])
	ma3_6.text = str(material_3List[0]["page_" + str(current_page)][5])

	ma4_1.text = str(material_4List[0]["page_" + str(current_page)][0])
	ma4_2.text = str(material_4List[0]["page_" + str(current_page)][1])
	ma4_3.text = str(material_4List[0]["page_" + str(current_page)][2])
	ma4_4.text = str(material_4List[0]["page_" + str(current_page)][3])
	ma4_5.text = str(material_4List[0]["page_" + str(current_page)][4])
	ma4_6.text = str(material_4List[0]["page_" + str(current_page)][5])
func _on_close_pressed() -> void:
	queue_free()


func _on_c_ure_pressed() -> void:
	if current_page > 1:
		current_page -= 1


func _on_reduce_pressed() -> void:
	if current_page < max_page:
		current_page += 1

