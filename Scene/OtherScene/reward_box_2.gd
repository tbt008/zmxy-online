extends TextureRect
@onready var items: Button = $Items
@onready var name_: Label = $Name

var Name
var Num
func _ready() -> void:
	items.HideProp = true
func _physics_process(delta: float) -> void:
	items.set_button_icon(load_(Name))
	if Num == null:
		items.total_number = 1
	else:
		items.total_number = Num
	name_.text = AE.AllEquipment_[Name]["名字"]
	var color = AE.AllEquipment_[Name]["颜色"]
	name_.add_theme_color_override("font_color",color)
	name_.add_theme_color_override("font_outline_color",color)
	set_physics_process(false)
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
