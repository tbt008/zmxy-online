extends Node2D




@onready var special_effect_player: AnimationPlayer = $Bg/SpecialEffectPlayer
@onready var RoleList: VBoxContainer = $Bg/ScrollContainer/PlayerList
@onready var shengcun: HBoxContainer = $Bg/Bg/shengcun
@onready var gongji: HBoxContainer = $Bg/Bg/gongji
@onready var minjie: HBoxContainer = $Bg/Bg/minjie
@onready var caozuo: HBoxContainer = $Bg/Bg/caozuo
@onready var role_name: Label = $Bg/Bg/RoleName
@onready var info: Label = $Bg/Bg/Info
@onready var prop: Label = $Bg/Bg/Prop

var Num: int
var RoleNameList = ["孙悟空","唐三藏","猪八戒","沙悟净","小白龙"]
var ProperiesList = ["火","水","土","木","金"]
var ColorList = ["ff0000","02ffff","c16b00","00ff00","ffff00"]
var RoleInfo = [
	"齐天大圣孙悟空，机敏聪慧，胆识过人。善用棍法，灵活多变，上手简单。",
	"金蝉转世唐三藏，佛法无边，普渡众生。武器九环禅杖，爆发，回血极高，攻击冰冻目标。",
	"天蓬元帅猪八戒，力大无穷，坚韧不拔。武器九齿钉耙，生存能力强，上手简单。",
	"卷帘大将沙悟净，为人谨慎，朴实无华。使用铲攻，善用猛毒，上限极高。",
	"玉龙三太子小白龙，智勇双全，刚正不阿。手持长枪，机制多样，操作灵活。",
]
var ShengCun = [0,4,3,4,4,3]
var GongJi = [0,3,5,2,4,3]
var MinJie = [0,5,3,4,3,4]
var CaoZuo = [0,3,4,3,4,5]
var CurrentChoose: int = 1
var PlayerList = ["swk","tsz"]
func _ready() -> void:

	if MainSet.set_data["LevelHYS"]:
		PlayerList.push_back("zbj")
	if MainSet.set_data["LevelTT"]:
		PlayerList.push_back("swj")
	if MainSet.set_data["XiaoBaiLong"]:
		PlayerList.push_back("xbl")
	for i in PlayerList:
		Global.AddRoleButton(RoleList,i,self)
	SetRole()
	AddStar(1)
func SetRole():
	role_name.text = RoleNameList[CurrentChoose - 1]
	info.text = RoleInfo[CurrentChoose - 1]
	prop.text = ProperiesList[CurrentChoose - 1]
	prop.add_theme_color_override("font_color",ColorList[CurrentChoose - 1])
	if CurrentChoose == 0:
		special_effect_player.play("Role_1")
	else:
		special_effect_player.play("Role_" + str(CurrentChoose))
		
func AddStar(Num):
	for i in shengcun.get_children():
		i.queue_free()
	for i in gongji.get_children():
		i.queue_free()
	for i in minjie.get_children():
		i.queue_free()
	for i in caozuo.get_children():
		i.queue_free()
	for i in range(ShengCun[CurrentChoose]):
		Global.AddStar(shengcun,2)	
	for i in range(5 - ShengCun[CurrentChoose]):
		Global.AddStar(shengcun,1)	
		
	for i in range(GongJi[CurrentChoose]):
		Global.AddStar(gongji,2)	
	for i in range(5 - GongJi[CurrentChoose]):
		Global.AddStar(gongji,1)	
		
	for i in range(MinJie[CurrentChoose]):
		Global.AddStar(minjie,2)	
	for i in range(5 - MinJie[CurrentChoose]):
		Global.AddStar(minjie,1)	
		
	for i in range(CaoZuo[CurrentChoose]):
		Global.AddStar(caozuo,2)	
	for i in range(5 - CaoZuo[CurrentChoose]):
		Global.AddStar(caozuo,1)	

func _on_return_main_menu_pressed() -> void:
	Global.cd_path = ""
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")
	
func change_to_map():
	match int(PlayerData.player_data["Map_num"]):
		1:
			get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
		2:
			if PlayerData.player_data["地府"]:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_2.tscn")
			else:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
		3:
			if PlayerData.player_data["天庭"]:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_3.tscn")
			else:
				get_tree().change_scene_to_file("res://Scene/Main_menu/Map_1.tscn")
				
func GetTargetCDNum():
	return Global.cd_path.split("r_")[1].split(".")[0]
func get_time():
	var date = Time.get_date_string_from_system()
	var time_ = Time.get_time_string_from_system()
	var last_time = date + " " + time_
	return last_time


func _on_qued_pressed() -> void:
	if PlayerData.player_data["Myself"] != 0:
		if CurrentChoose != PlayerData.player_data["Myself"]:
			Global.AddMessageShow(Global.Windows_,"角色ID不匹配！！",1.5,Vector2(485,295))
			return
		Global.AddMessageShow(Global.Windows_,"创建角色失败，该存档已有角色！！",1.5,Vector2(485,295))
		return
	if CurrentChoose == 0:
		Global.AddMessageShow(Global.Windows_,"请先选择一位角色！！",1.5,Vector2(485,295))
		return
	if int(GetTargetCDNum()) <= 6:
		MainSet.set_data["time" + str(Num)] = get_time()
	else:
		MainSet.set_data["其他存档"][str(GetTargetCDNum())]["time"] = get_time()
	MemoryClass.main_bc()
	PlayerData.player_data["Myself"] = int(CurrentChoose)
	MemoryClass.保存游戏(Global.cd_path)
	change_to_map()
