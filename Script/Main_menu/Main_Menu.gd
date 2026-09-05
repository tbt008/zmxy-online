extends Node2D
class_name MainMenu
var abx : TextureButton
@onready var ar_infer: Node2D = $ar_infer
@onready var BGset: Node2D = $BGset
@onready var begin_game = $ButtonList/Begin_game
@onready var Music_set = $Music_set
@onready var music: Button = $ButtonList/music
@onready var tiaoguo: Button = $ButtonList/tiaoguo
@onready var BackGround = $background
@onready var name_: Label = $background/name
#@onready var Hide_1 = $background/Hide
#@onready var Hide_2 = $background/Hide2
@onready var name_2: Label = $background/name/name2
@onready var http_request: HTTPRequest = $HTTPRequest
var Times:int = 0
var my_music
var is_playing = false
var cd_jm
var message_box
var music_jm
var GameSet_:GameSet

func _ready() -> void:
	if MainSet.set_data.has("FileValue"):
		if float(MainSet.set_data["FileValue"]) < float(Global.FileNum):
			MainSet.set_data["FileValue"] = Global.FileNum
	Global.cd_path = ""
	Global.CollectNum = 0
	Global.LLBTLevel = 1
	Global.LLBTBOSSMS = false
	Global.LLBTCGMS = false
	Global.LLBTWXMS = false
	Global.Windows_ = get_parent()
	Global.FB_CD = 0
	Global.is_EyeFix = false
	Global.is_DeadLink = false
	MemoryClass.remove_play_data()
	RoleProp.ws_value = 0
	MemoryClass.main_dq()
	if MainMusic.MyMainMusic == null:
		MainMusic.ADDMusic()
	if MainSet.set_data["FristGame"]:
		Global.addGameNeedKnow(self,Vector2(0,0))
		pass
#	print(Global.cd_path)
#	if Global.cd_path != null:
#		print(MainSet.set_data["name" + str(MemoryClass.get_cd_number())])
func _physics_process(_delta: float) -> void:

	if MainSet.set_data["剧情跳过"]:
		tiaoguo.text = "显示剧情"
	else:
		tiaoguo.text = "跳过剧情"
	match int(MainSet.set_data["MainMenuBG"]):
		1:
			name_2.text = "《八荒湮隳篇·力战七大魔王》"
			BackGround.texture = load("res://Art/MainGame/Bg1.png")
		2:
			name_2.text = "《八荒湮隳篇·勇斗十殿阎罗》"
			BackGround.texture = load("res://Art/MainGame/Bg2.png")
		3:
			name_2.text = "《八荒湮隳篇·智取十万天兵》"
			BackGround.texture = load("res://Art/MainGame/Bg3.png")
	RoleProp.ws_value = 0
	if Music_set.get_child_count() != 0:
		music.disabled = true
		if music_jm != null:
			if music_jm.is_change:
				MainMusic.ADDMusic()
				music_jm.is_change = false
	else:
		music.disabled = false
	if GameSet_ != null:
		if GameSet_.MusicIsChange:
			MainMusic.ADDMusic()
			GameSet_.MusicIsChange = false

func _on_begin_game_pressed() -> void:
	if MainSet.set_data.has("FileValue"):
		if float(MainSet.set_data["FileValue"]) > float(Global.FileNum):
			Global.AddMessageShow(get_parent(),"当前游戏不是最新版本，请使用最新版本游戏！！！",1.5,Vector2(470,340))
			return
			
	if MemoryClass.CheckOutTime():
		Global.AddMessageShow(get_parent(),"游戏已经过期！！！",1.5,Vector2(470,340))
		return
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	#Global.AddMessageShow(get_parent(),"欢迎进入游戏！！",1.5,Vector2(470,340))
	if ar_infer.get_child_count() == 0:
		cd_jm = Global.add_cd_jm(ar_infer,Vector2(0,0))



func _on_music_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	music_jm = Global.add_music_set(Music_set,Vector2(0,0))



func _on_gmae_help_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	Global.add_gm_infor(self,Vector2(0,0))


func _on_tiaoguo_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	if MainSet.set_data["剧情跳过"]:
		MainSet.set_data["剧情跳过"] = false
		Global.AddMessageShow(get_parent(),"将不会跳过结束剧情！！",1.5,Vector2(470,340))
	else:
		MainSet.set_data["剧情跳过"] = true
		Global.AddMessageShow(get_parent(),"将会跳过结束剧情！！",1.5,Vector2(470,340))
	MemoryClass.main_bc()

func _on_change_bg_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	Global.add_change_bg(BGset,Vector2(0,0))


func _on_game_set_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	GameSet_ = Global.Add_GameSet_(self,Vector2(0,0))


func _on_game_warn_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	Global.addGameNeedKnow(self,Vector2(0,0))
	



######===========获取并更新时间=========================---------================================

func CheckTime():
	var error = http_request.request("http://quan.suning.com/getSysTime.do")
	if error != OK:
		push_error("在HTTP请求中发生了一个错误。")
	Times += 1
	if Times >= 15:
		Global.AddMessageShow(get_parent(),"获取时间信息失败，网络连接可能存在问题，部分功能将无法使用！！",1.5,Vector2(470,340))
func _on_body_received(request,body):
	var time_str = body.get_string_from_utf8()
	if time_str == "":
		print("无法获取时间1！！")
		CheckTime()
		Global.AddMessageShow(get_parent(),"获取时间信息失败，网络连接可能存在问题，部分功能将无法使用！！",1.5,Vector2(470,340))
		return null
	var utc_time = JSON.parse_string(time_str)
	if utc_time == null:
		print("无法获取时间2！！")
		CheckTime()
		Global.AddMessageShow(get_parent(),"获取时间信息失败，网络连接可能存在问题，部分功能将无法使用！！",1.5,Vector2(470,340))
		return null
	var TImeUnix = int(utc_time["sysTime2"])
	if TImeUnix == null or str(TImeUnix) == "":
		print("无法获取时间3！！")
		CheckTime()
		Global.AddMessageShow(get_parent(),"获取时间信息失败，网络连接可能存在问题，部分功能将无法使用！！",1.5,Vector2(470,340))
		return null
	return TImeUnix
func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if _on_body_received(result,body) != null:
		var abc = str(_on_body_received(result,body)).split()
		var DataList = {
			"year": str(abc[0] + abc[1] + abc[2] + abc[3]),
			"month":str(abc[4] + abc[5]),
			"day":str(abc[6] + abc[7]),
			"hour":str(abc[8] + abc[9]),
			"minute":str(abc[10] + abc[11]),
			"second":str(abc[12] + abc[13]),
		}
		RefreshTime(DataList)
		
func RefreshTime(DataList):
	var Dic = DataList
	var MyDic = MainSet.set_data["MyTime"]#最后储存的时间
	#print(MyDic)
	if MyDic.size() <= 0:
#		MainSet.set_data["MyTime"] = DataList
#		#MemoryClass.保存游戏(Global.cd_path)
		return 
	if int(Dic["year"]) < int(MyDic["year"]):
		return
	elif int(Dic["year"]) > int(MyDic["year"]):
		print("更新年")
		MainSet.set_data["MyTime"] = DataList
	else:
		if int(Dic["month"]) < int(MyDic["month"]):
			return 
		elif int(Dic["month"]) > int(MyDic["month"]):
			print("更新月")
			MainSet.set_data["MyTime"] = DataList
		else:
			if int(Dic["day"]) < int(MyDic["day"]):
				return 
			elif int(Dic["day"]) > int(MyDic["day"]):
				print("更新日")
				MainSet.set_data["MyTime"] = DataList
			else:
				return 
	MemoryClass.main_bc()


func _on_letter_pressed() -> void:
	Global.addBGM_(self,"res://Music/MainSceneMusic/2_SD_xz.mp3")
	Global.AddLetterForPlayer(self,Vector2(0,0))
