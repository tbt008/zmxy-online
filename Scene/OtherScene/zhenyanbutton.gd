extends TextureRect
@onready var locandlevel: Label = $locandlevel
@onready var pic: Button = $Pic
@onready var jt: Sprite2D = $jt

# 拥有阵法：{"落魄阵":0}
var NotShow: bool
var LocNum: int
var ZhenFaType: String#
var RealName: String#
var Father
func _physics_process(delta: float) -> void:
	if Father != null:
		ZhenFaType = Father.CurrentZhenFaName
		match ZhenFaType:
			"slz":
				RealName = "森罗阵"
			"lpz":
				RealName = "落魄阵"
			"tsz":
				RealName = "腾蛇阵"
			"tqz":
				RealName = "太清阵"
		var Name = PlayerData.player_data[RealName][str(LocNum)]["InName"]
		pic.set_button_icon(load_(Name))
		pic.qh_level = 0
		pic.wx = []
		pic.EQ_prop = AE.AllEquipment_[Name]
		var Level = PlayerData.player_data[RealName][str(LocNum)]["Level"]
		locandlevel.text = str(LocNum) + '号位 Lv:' + str(Level)
		if not NotShow:
			if Father.CurrentNum == LocNum:
				jt.visible = true
			else:
				jt.visible = false
		else:
			jt.visible = false
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc


func _on_button_pressed() -> void:
	Father.CurrentNum = int(LocNum)
