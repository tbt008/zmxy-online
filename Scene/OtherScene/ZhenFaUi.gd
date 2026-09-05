extends Node2D
@onready var zhenfaname: Label = $BG/zhenfaname#阵法名字
@onready var zhenfaicon: TextureRect = $BG/zhenfaicon#阵法大图
@onready var zhen_fa_button_list: VBoxContainer = $BG/ZhenFaButton/ZhenFaButtonList
@onready var get_need: Label = $BG/GetNeed
@onready var UseButton: Button = $BG/Use
@onready var cur_name: Label = $BG/CurrentEq/CurName
@onready var bg: Sprite2D = $BG
var Infomation
var CurrentZhenFaName: String = "slz"
var CurrentUseType: String = "阵法详情"
var CurrentNum: int = 1
var CurrentZFList = {
	"slz":{"FangFa":"北方星宿1~3位掉落"},
	"lpz":{"FangFa":"北方星宿4~6位掉落"},
	"tsz":{"FangFa":"北方星宿第7位，南方星宿1~3掉落"},
	"tqz":{"FangFa":"南方星宿4~7位掉落"}
}
func _ready() -> void:
	var Pd = str(PlayerData.player_data["已佩戴阵法"])
	match Pd:
		"slz":
			cur_name.text = "森罗阵"
		"lpz":
			cur_name.text = "落魄阵"
		"tsz":
			cur_name.text = "腾蛇阵"
		"tqz":
			cur_name.text = "太清阵"
		"":
			cur_name.text = ""
	AddTotalZhenfaButton()
	SetZhenfaBasicInfo()
	SetRightInfo()
	AddZhenyanButton()
func _physics_process(delta: float) -> void:
	if PlayerData.player_data["已佩戴阵法"] == CurrentZhenFaName:#设置激活按钮样式
		UseButton.set_button_icon(load("res://Art/TwentyEightConstellations/43.png"))
	else:
		UseButton.set_button_icon(load("res://Art/TwentyEightConstellations/42.png"))
		
func AddZhenyanButton():
	var PostionList = [Vector2(120,25),Vector2(210,185),Vector2(40,185)]
	match CurrentZhenFaName:
		"slz","lpz":
			PostionList = [Vector2(120,25),Vector2(210,185),Vector2(40,185)]
		"tsz","tqz":
			PostionList = [Vector2(125,25),Vector2(225,125),Vector2(125,210),Vector2(20,125)]
	for i in zhenfaicon.get_children():
		if i != null:
			zhenfaicon.remove_child(i)
			i.queue_free()
	var Num: int = 1
	for i in PostionList:
		Global.Addzhenyanbutton(zhenfaicon,i,Num,self)
		Num += 1	
func SetZhenfaBasicInfo():
	zhenfaicon.texture = load("res://Art/TwentyEightConstellations/" +str(CurrentZhenFaName) + ".png")#设置中心大图
	get_need.text = "获得方式：" + str(CurrentZFList[CurrentZhenFaName]["FangFa"])#设置获取方法字
	match CurrentZhenFaName:
		"slz":
			zhenfaname.text = "森罗阵"
			zhenfaname.add_theme_color_override("font_color","8a00ff")
		"lpz":
			zhenfaname.text = "落魄阵"
			zhenfaname.add_theme_color_override("font_color","8a00ff")
		"tsz":
			zhenfaname.text = "腾蛇阵"
			zhenfaname.add_theme_color_override("font_color","ff8d00")
		"tqz":
			zhenfaname.text = "太清阵"
			zhenfaname.add_theme_color_override("font_color","ff8d00")
	if PlayerData.player_data["已佩戴阵法"] == CurrentZhenFaName:#设置激活按钮样式
		UseButton.set_button_icon(load("res://Art/TwentyEightConstellations/43.png"))
	else:
		UseButton.set_button_icon(load("res://Art/TwentyEightConstellations/42.png"))
func AddTotalZhenfaButton():#将左侧阵法列表加上
	for i in CurrentZFList:
		Global.AddZhenfalxbutton(zhen_fa_button_list,i,self)
func SetRightInfo():
	match CurrentUseType:
		"阵法详情":
			if Infomation != null:
				Infomation.queue_free()
			Infomation = Global.AddZhenFaInfo(bg,Vector2(70,-120),self)
		"阵眼升级":
			if Infomation != null:
				Infomation.queue_free()
			Infomation = Global.AddZhenYanCureLevel(bg,Vector2(70,-120),self)
		"阵法突破":
			if Infomation != null:
				Infomation.queue_free()
			Infomation = Global.AddZhenFaTuPo(bg,Vector2(70,-120),self)
func OnChangeName():
	#CurrentUseType = "阵法详情"
	SetZhenfaBasicInfo()
	SetRightInfo()


func _on_close_pressed() -> void:
	queue_free()


func _on_zfxq_pressed() -> void:
	CurrentUseType = "阵法详情"
	SetRightInfo()

func _on_zysj_pressed() -> void:
	CurrentUseType = "阵眼升级"
	SetRightInfo()
	
func _on_zftp_pressed() -> void:
	CurrentUseType = "阵法突破"
	SetRightInfo()


func _on_use_pressed() -> void:
	var Name_
	match CurrentZhenFaName:
		"slz":
			Name_ = "森罗阵"
		"lpz":
			Name_ = "落魄阵"
		"tsz":
			Name_ = "腾蛇阵"
		"tqz":
			Name_ = "太清阵"
		"":
			Name_ = ""
	if PlayerData.player_data["已佩戴阵法"] == CurrentZhenFaName:
		PlayerData.player_data["已佩戴阵法"] = ""
		Global.AddMessageShow(Global.Windows_,"取消佩戴" + str(Name_) + "！！",1.5,Vector2(500,305))
	else:

			
		if PlayerData.player_data[Name_]["Level"] > 0:
			PlayerData.player_data["已佩戴阵法"] = CurrentZhenFaName
			Global.AddMessageShow(Global.Windows_,"佩戴" + str(Name_) + "！！",1.5,Vector2(500,305))
		else:
			Global.AddMessageShow(Global.Windows_,str(Name_) + "等级不足，无法激活！！",1.5,Vector2(500,305))
			return
	var Pd = str(PlayerData.player_data["已佩戴阵法"])
	match Pd:
		"slz":
			cur_name.text = "森罗阵"
		"lpz":
			cur_name.text = "落魄阵"
		"tsz":
			cur_name.text = "腾蛇阵"
		"tqz":
			cur_name.text = "太清阵"
		"":
			cur_name.text = ""


func _on_button_pressed() -> void:
	Global.AddZhenFaHelp(self,Vector2(0,0))
