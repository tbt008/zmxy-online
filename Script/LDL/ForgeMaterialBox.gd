extends TextureRect
#@onready var Materials: Button = $Material
@onready var NeedAndHave: Label = $NeedAndHave
@onready var box: VBoxContainer = $Box

var ItemName: String
var NeedNum: int

func _physics_process(delta: float) -> void:
	if NeedNum == 0:
		NeedAndHave.text = ""
	else:
		SetBox()
		SetText()
	set_physics_process(false)
func SetText():
	if NeedNum != 0:
		if PlayerData.get_item_data(ItemName) >= NeedNum:
			NeedAndHave.add_theme_color_override("font_color","00ff00")
		else:
			NeedAndHave.add_theme_color_override("font_color","ff0000")
		NeedAndHave.text = str(PlayerData.get_item_data(ItemName)) + '/' + str(NeedNum)
func SetBox():
	var ItemBox = Global.AddItemBox(box,true,true,ItemName,0,1,[],AE.AllEquipment_[ItemName])
	ItemBox.set_button_icon(load_(str(ItemName)))
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
