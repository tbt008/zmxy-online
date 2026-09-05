extends Node2D
class_name ChangeClothesjm
#00ff00，ff0000
@onready var HaveOrNot: Label = $BG/HaveOrNot
@onready var cdorxx: Label = $BG/change/cdorxx
@onready var cdinfor: Sprite2D = $cdinfor
@onready var show_box: Button = $BG/ShowBox
@onready var Eq_name: Label = $BG/Eq_name

var SelfName_: String
var Transmogrified_: Transmogrified

func _physics_process(_delta: float) -> void:
	
	Eq_name.text = str(AE.AllEquipment_[SelfName_]["名字"])
	show_box.is_in_ldl_gz = true
	show_box.is_in_hhgz = true
	show_box.set_button_icon(load_(SelfName_))
	show_box.qh_level = 0
	show_box.wx = []
	show_box.EQ_prop = AE.AllEquipment_[SelfName_]
	var List = PlayerData.player_data["幻化列表"]
	if List["武器"] == SelfName_ or List["防具"] == SelfName_ or List["翅膀"] == SelfName_:
		cdinfor.visible = true
		cdorxx.text = str("卸下")
	else:
		cdinfor.visible = false
		cdorxx.text = str("穿戴")
	if PlayerData.check_zb(SelfName_).size() != 0:
		HaveOrNot.text = "已拥有"
		HaveOrNot.add_theme_color_override("font_color","00ff00")
	else:
		HaveOrNot.add_theme_color_override("font_color","ff0000")
		HaveOrNot.text = "未拥有"
		
	set_physics_process(false)

func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc


func _on_change_pressed() -> void:
	var Lx = AE.AllEquipment_[SelfName_]["类型"]
	var Name = AE.AllEquipment_[SelfName_]["名字"]

	if cdorxx.text == "穿戴":
		if PlayerData.check_zb(SelfName_).size() != 0:
			if Lx == "武器":
				PlayerData.player_data["幻化列表"]["武器"] = SelfName_
				Global.AddMessageShow(Global.Windows_,"武器幻化为：" + str(Name) + "！！",1.5,Vector2(470,295))
			elif Lx == "防具":
				PlayerData.player_data["幻化列表"]["防具"] = SelfName_
				Global.AddMessageShow(Global.Windows_,"防具幻化为：" + str(Name) + "！！",1.5,Vector2(470,295))
			elif Lx == "时装":
				PlayerData.player_data["幻化列表"]["防具"] = SelfName_
				Global.AddMessageShow(Global.Windows_,"时装幻化为：" + str(Name) + "！！",1.5,Vector2(470,295))
			elif Lx == "翅膀":
				PlayerData.player_data["幻化列表"]["翅膀"] = SelfName_
				Global.AddMessageShow(Global.Windows_,"翅膀幻化为：" + str(Name) + "！！",1.5,Vector2(470,295))
		else:
			Global.AddMessageShow(Global.Windows_,"您还未拥有" + str(Name) + "！！",1.5,Vector2(470,295))
	elif cdorxx.text == "卸下":
		if Lx == "武器":
			PlayerData.player_data["幻化列表"]["武器"] = ""
			Global.AddMessageShow(Global.Windows_,"取消武器：" + str(Name) + "的幻化！！",1.5,Vector2(470,295))
		elif Lx == "防具":
			PlayerData.player_data["幻化列表"]["防具"] = ""
			Global.AddMessageShow(Global.Windows_,"取消防具：" + str(Name) + "的幻化！！",1.5,Vector2(470,295))
		elif Lx == "时装":
			PlayerData.player_data["幻化列表"]["防具"] = ""
			Global.AddMessageShow(Global.Windows_,"取消时装：" + str(Name) + "的幻化！！",1.5,Vector2(470,295))
		elif Lx == "翅膀":
			PlayerData.player_data["幻化列表"]["翅膀"] = ""
			Global.AddMessageShow(Global.Windows_,"取消翅膀：" + str(Name) + "的幻化！！",1.5,Vector2(470,295))
	Transmogrified_.onEqchange()
	for i in Transmogrified_.List:
		if i != null:
			i.set_physics_process(true)
	MemoryClass.保存游戏(Global.cd_path)
	set_physics_process(true)
