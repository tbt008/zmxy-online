extends TextureRect
@onready var items: Button = $Items
@onready var title: Label = $ScrollContainer/title

var TotalNum: int
var ItemName: String
func _ready() -> void:
	#items.HideProp = true
	items.is_in_hhgz = true
	items.is_in_ldl_gz = true
	
	items.qh_level = 0
func _physics_process(delta: float) -> void:
	items.EQ_prop = AE.AllEquipment_[ItemName]
	items.wx = []
	items.set_button_icon(load_(ItemName))
	if TotalNum <= 1:
		TotalNum = 1
	var Name = AE.AllEquipment_[ItemName]["名字"]
	match AE.AllEquipment_[ItemName]["类型"]:
		"道具","消耗品":
			if TotalNum == null:
				items.total_number = 1
			else:
				items.total_number = TotalNum
		"武器","防具","饰品","法宝","时装","头衔","翅膀":		
			items.total_number = 0
	title.text = str(Name) + ' * ' + str(TotalNum)
	set_physics_process(false)
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
