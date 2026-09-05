extends Control
@onready var title: Label = $MarginContainer/MarginContainer/VBoxContainer/title
@onready var color_rect: ColorRect = $ColorRect

@onready var name_: Label = $MarginContainer/MarginContainer/VBoxContainer/name
@onready var lx: Label = $MarginContainer/MarginContainer/VBoxContainer/lx
@onready var pz: Label = $MarginContainer/MarginContainer/VBoxContainer/pz
@onready var ms: Label = $MarginContainer/MarginContainer/VBoxContainer/VBoxContainer/ms
@onready var sl: Label = $MarginContainer/MarginContainer/VBoxContainer/sl
@onready var sj: Label = $MarginContainer/MarginContainer/VBoxContainer/VBoxContainer/sj
var my_name
var is_set = false
func get_name_():
	var name1= my_name
	return name1
func _ready() -> void:
	self.modulate = Color(1,1,1,0)
func _physics_process(_delta: float) -> void:
	color_rect.size = $MarginContainer.size
	if get_parent() is BasicBackPack:
		if self.position.y + color_rect.size.y >= 320:
			self.position.y = 320 - color_rect.size.y
	elif get_parent() == Global.Windows_:
		if self.position.y + color_rect.size.y >= 590:
			self.position.y = 590 - color_rect.size.y
	if is_set == false:
		create_tween().tween_property(self,"modulate",Color(1,1,1,1),0.2)
		set_color()
		name_.text = "名称：" + str(AE.AllEquipment_[get_name_()]["名字"])
		lx.text = "类型：" +  str(AE.AllEquipment_[get_name_()]["类型"])
		pz.text = "品质：" +  str(AE.AllEquipment_[get_name_()]["品质"])
		if str(AE.AllEquipment_[get_name_()]["类型"]) == "消耗品":
			sl.text = "拥有：" + str(PlayerData.get_xhp_data(get_name_())) + " 个"
		else:
			sl.text = "拥有：" + str(PlayerData.get_item_data(get_name_())) + " 个"
		ms.text = "描述：" +  str(AE.AllEquipment_[get_name_()]["描述"])
		sj.text = "售价：" +  str(AE.AllEquipment_[get_name_()]["售价"]) + "灵魂。"
		is_set = true

func set_color():
	name_.add_theme_color_override("font_color",AE.AllEquipment_[get_name_()]["颜色"])
	pz.add_theme_color_override("font_color",AE.AllEquipment_[get_name_()]["颜色"])
