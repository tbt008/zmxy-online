extends Node2D
class_name GameSet
@onready var gm_open_or_close: Button = $Bg/BGColor/VBoxContainer/GameMusicTitle/GMOpenOrClose
@onready var gm_2_open_or_close: Button = $Bg/BGColor/VBoxContainer/GameMusicTitle2/GM2OpenOrClose
@onready var h_slider: HSlider = $Bg/BGColor/VBoxContainer/GameMusicFB/HSlider
@onready var gm_2_slider: HSlider = $Bg/BGColor/VBoxContainer/GameMusicFB2/GM2Slider
@onready var mbt_open_or_close: Button = $Bg/BGColor/VBoxContainer/MonsterBloodText/MBTOpenOrClose
@onready var mbs_open_or_close: Button = $Bg/BGColor/VBoxContainer/MonsterBloodShow/MBSOpenOrClose
@onready var mbs2_open_or_close: Button = $Bg/BGColor/VBoxContainer/MonsterBloodShow2/MBS2OpenOrClose
@onready var yes_or_no: Button = $Bg/BGColor/VBoxContainer2/BodyShow/YesOrNo
@onready var yes_or_not: Button = $Bg/BGColor/VBoxContainer2/HpBloodDelay/YesORNot
@onready var yes_or_nots: Button = $Bg/BGColor/VBoxContainer2/AutomaticallyPickUpItems/YesOrNots
@onready var ornot: Button = $Bg/BGColor/VBoxContainer2/AutomaticallyPickUpItems2/Ornot
@onready var open_close: Button = $Bg/BGColor/VBoxContainer2/LevelInfo/openClose
@onready var show_close_2: Button = $Bg/BGColor/VBoxContainer/RoleEQ/ShowClose2
@onready var show_close: Button = $Bg/BGColor/VBoxContainer2/RoleBody/ShowClose

var is_set = false
var MusicIsChange = false
func _physics_process(_delta: float) -> void:
	if MainSet.set_data["NotShowRoleBody"]:
		show_close.text = "不显示"
	else:
		show_close.text = "显示中"
	if MainSet.set_data["NotShowRoleEQ"]:
		show_close_2.text = "不显示"
	else:
		show_close_2.text = "显示中"
		
	if MainSet.set_data["BackGroundMusic"] == true:
		gm_open_or_close.text = "开启中"
	else:
		gm_open_or_close.text = "关闭中"
	if MainSet.set_data["RoleOrMonsterHit"] == true:
		gm_2_open_or_close.text = "开启中"
	else:
		gm_2_open_or_close.text = "关闭中"
	if MainSet.set_data["MonsterBloodTextSHow"]:
		mbt_open_or_close.text = "开启中"
	else:
		mbt_open_or_close.text = "关闭中"
		
	if MainSet.set_data["MonsterBloodSHow"]:
		mbs_open_or_close.text = "开启中"
	else:
		mbs_open_or_close.text = "关闭中"
	if MainSet.set_data["MonsterLittleBlood"]:
		mbs2_open_or_close.text = "开启中"
	else:
		mbs2_open_or_close.text = "关闭中"
	if MainSet.set_data["NoShowMonsterBody"]:
		yes_or_no.text = "当前显示"
	else:
		yes_or_no.text = "当前不显示"
	if MainSet.set_data["HpBarDelay"]:
		yes_or_not.text = "开启中"
	else:
		yes_or_not.text = "关闭中"
	if MainSet.set_data["AutomaticallyPickUpItems"]:
		yes_or_nots.text = "开启中"
	else:
		yes_or_nots.text = "关闭中"
	if MainSet.set_data["PickUpItemsMusic"]:
		ornot.text = "开启中"
	else:
		ornot.text = "关闭中"
	if MainSet.set_data["LevelInfo"]:
		open_close.text = "开启中"
	else:
		open_close.text = "关闭中"
	if not is_set:
		h_slider.value = MainSet.set_data["MusicFB"]
		gm_2_slider.value = MainSet.set_data["MusicFB_2"]
		is_set = true

func _on_gm_open_or_close_pressed() -> void:#游戏音乐开关
	if MainSet.set_data["BackGroundMusic"] == true:
		MainSet.set_data["BackGroundMusic"] = false
	else:
		MainSet.set_data["BackGroundMusic"] = true
	MemoryClass.main_bc()


func _on_gm_2_open_or_close_pressed() -> void:#游戏音效开关
	if MainSet.set_data["RoleOrMonsterHit"] == true:
		MainSet.set_data["RoleOrMonsterHit"] = false
	else:
		MainSet.set_data["RoleOrMonsterHit"] = true
	MemoryClass.main_bc()


func _on_h_slider_value_changed(value: float) -> void:
	MainSet.set_data["MusicFB"] = value
	MemoryClass.main_bc()

func _on_return_pressed() -> void:
	queue_free()


func _on_gm_2_slider_value_changed(value: float) -> void:
	MainSet.set_data["MusicFB_2"] = value
	MemoryClass.main_bc()


func _on_mbt_open_or_close_pressed() -> void:
	if MainSet.set_data["MonsterBloodTextSHow"]:
		MainSet.set_data["MonsterBloodTextSHow"] = false
	else:
		MainSet.set_data["MonsterBloodTextSHow"] = true
	MemoryClass.main_bc()

func _on_mbs_open_or_close_pressed() -> void:
	if MainSet.set_data["MonsterBloodSHow"]:
		MainSet.set_data["MonsterBloodSHow"] = false
	else:
		MainSet.set_data["MonsterBloodSHow"] = true
	MemoryClass.main_bc()

func _on_mbs_2_open_or_close_pressed() -> void:
	if MainSet.set_data["MonsterLittleBlood"]:
		MainSet.set_data["MonsterLittleBlood"] = false
	else:
		MainSet.set_data["MonsterLittleBlood"] = true
	MemoryClass.main_bc()


func _on_g_mzm_1_pressed() -> void:
	MainSet.set_data["music"] = 1
	MemoryClass.main_bc()
	MusicIsChange = true


func _on_g_mzm_2_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 2:
		MainSet.set_data["music"] = 2
		MemoryClass.main_bc()
		MusicIsChange = true
	else:
		Global.AddMessageShow(Global.Windows_,"到达二图解锁二图背景音乐",1.5,Vector2(470,300))


func _on_g_mzm_3_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 3:
		MainSet.set_data["music"] = 3
		MemoryClass.main_bc()
		MusicIsChange = true
	else:
		Global.AddMessageShow(Global.Windows_,"到达三图解锁三图背景音乐",1.5,Vector2(470,300))

func _on_gm_2_zm_1_pressed() -> void:
	MainSet.set_data["MainMenuBG"] = 1
	MemoryClass.main_bc()


func _on_gm_2_zm_2_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 2:
		MainSet.set_data["MainMenuBG"] = 2
		MemoryClass.main_bc()
	else:
		Global.AddMessageShow(Global.Windows_,"到达二图解锁二图封面",1.5,Vector2(470,300))

func _on_gm_2_zm_3_pressed() -> void:
	if MainSet.set_data["CurrentLevelPage"] >= 3:
		MainSet.set_data["MainMenuBG"] = 3
		MemoryClass.main_bc()
	else:
		Global.AddMessageShow(Global.Windows_,"到达三图解锁三图封面",1.5,Vector2(470,300))



func _on_yes_or_no_pressed() -> void:
	if MainSet.set_data["NoShowMonsterBody"]:
		MainSet.set_data["NoShowMonsterBody"] = false
	else:
		MainSet.set_data["NoShowMonsterBody"] = true
	MemoryClass.main_bc()


func _on_yes_or_not_pressed() -> void:
	if MainSet.set_data["HpBarDelay"]:
		MainSet.set_data["HpBarDelay"] = false
	else:
		MainSet.set_data["HpBarDelay"] = true
	MemoryClass.main_bc()


func _on_yes_or_nots_pressed() -> void:
	if MainSet.set_data["AutomaticallyPickUpItems"]:
		MainSet.set_data["AutomaticallyPickUpItems"] = false
	else:
		MainSet.set_data["AutomaticallyPickUpItems"] = true
	MemoryClass.main_bc()


func _on_g_mzm_4_pressed() -> void:
	if MainSet.set_data["Music4"]:
		MainSet.set_data["music"] = 4
		MemoryClass.main_bc()
		MusicIsChange = true
	else:
		Global.AddMessageShow(Global.Windows_,"还未开启四图音乐哦，快去游戏中寻找一下吧~",1.5,Vector2(470,300))
#	MainSet.set_data["music"] = 4
#	MemoryClass.main_bc()
	
#if MainSet.set_data["PickUpItemsMusic"]:


func _on_ornot_pressed() -> void:
	if MainSet.set_data["PickUpItemsMusic"]:
		MainSet.set_data["PickUpItemsMusic"] = false
	else:
		MainSet.set_data["PickUpItemsMusic"] = true
	MemoryClass.main_bc()


func _on_open_close_pressed() -> void:
	if MainSet.set_data["LevelInfo"]:
		MainSet.set_data["LevelInfo"] = false
	else:
		MainSet.set_data["LevelInfo"] = true
	MemoryClass.main_bc()


func _on_show_close_2_pressed() -> void:
	if MainSet.set_data["NotShowRoleEQ"]:
		MainSet.set_data["NotShowRoleEQ"] = false
	else:
		MainSet.set_data["NotShowRoleEQ"] = true
	MemoryClass.main_bc()


func _on_show_close_pressed() -> void:
	if MainSet.set_data["NotShowRoleBody"]:
		MainSet.set_data["NotShowRoleBody"] = false
	else:
		MainSet.set_data["NotShowRoleBody"] = true
	MemoryClass.main_bc()
