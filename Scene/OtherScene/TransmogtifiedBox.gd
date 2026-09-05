extends TextureRect
@onready var show_box: Button = $ShowBox
@onready var eq_name: Label = $Eq_name
@onready var have_or_not: Label = $HaveOrNot
@onready var cdorxx: Label = $change/cdorxx
@onready var cdinfor: TextureRect = $cdinfor
var SelfName_: String
var Transmogrified_: Transmogrified
func _physics_process(_delta: float) -> void:
	
	eq_name.text = str(AE.AllEquipment_[SelfName_]["名字"])
	show_box.is_in_ldl_gz = true
	show_box.is_in_hhgz = true
	show_box.set_button_icon(load_(SelfName_))
	show_box.qh_level = 0
	show_box.wx = []
	show_box.EQ_prop = AE.AllEquipment_[SelfName_]
	var List = PlayerData.player_data["幻化列表"]
	if List["武器"] == SelfName_ or List["防具"] == SelfName_ or List["翅膀"] == SelfName_ or List["头衔"] == SelfName_:
		cdinfor.visible = true
		cdorxx.text = str("卸下")
	else:
		cdinfor.visible = false
		cdorxx.text = str("穿戴")
	if AlreadyHave(SelfName_):
		have_or_not.text = "已拥有"
		have_or_not.add_theme_color_override("font_color","00ff00")
		have_or_not.add_theme_color_override("font_outline_color","00ff00")
	else:
		have_or_not.add_theme_color_override("font_color","ff0000")
		have_or_not.add_theme_color_override("font_outline_color","ff0000")
		have_or_not.text = "未拥有"
		
	set_physics_process(false)

func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func AlreadyHave(Name):
	return PlayerData.player_data["幻化拥有列表"].has(SelfName_)

func _on_change_pressed() -> void:
	var Lx = AE.AllEquipment_[SelfName_]["类型"]
	if Lx == "时装":
		Lx = "防具"
	var Name = AE.AllEquipment_[SelfName_]["名字"]
	if cdorxx.text == "穿戴":
		if AlreadyHave(SelfName_):
			PlayerData.player_data["幻化列表"][Lx] = SelfName_
			Global.AddMessageShow(Global.Windows_,str(Lx) + "幻化为：" + str(Name) + "！！",1.5,Vector2(470,295))
		else:
			Global.AddMessageShow(Global.Windows_,"您还未拥有" + str(Name) + "！！",1.5,Vector2(470,295))
	elif cdorxx.text == "卸下":
		PlayerData.player_data["幻化列表"][Lx] = ""
		Global.AddMessageShow(Global.Windows_,"取消" + str(Lx) + ':' + str(Name) + "的幻化！！",1.5,Vector2(470,295))
	Transmogrified_.onEqchange()
	for i in Transmogrified_.box_list.get_children():
		if i != null:
			i.set_physics_process(true)
	MemoryClass.保存游戏(Global.cd_path)
	set_physics_process(true)
