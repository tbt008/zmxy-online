extends Node
var Player = PlayerData.player_data
var Initialized_Data = {}
var Get_sj = {}
var LimitTime = {
			"year": 2024,
			"month":5,
			"day":9,
			"hour":13,
			"minute":35,
			"second":0,
		}
var level
func CheckOutTime():
	var Dic = LimitTime
	var MyDic = MainSet.set_data["MyTime"]
	if MyDic == {}:
		return 
	if int(Dic["year"]) < int(MyDic["year"]):
		return true
	elif int(Dic["year"]) > int(MyDic["year"]):
		return false
	else:
		if int(Dic["month"]) < int(MyDic["month"]):
			return true
		elif int(Dic["month"]) > int(MyDic["month"]):
			return false
		else:
			if int(Dic["day"]) < int(MyDic["day"]):
				return true
			elif int(Dic["day"]) > int(MyDic["day"]):
				return false
			else:
				if int(Dic["hour"]) < int(MyDic["hour"]):
					return true
				elif int(Dic["hour"]) > int(MyDic["hour"]):
					return false
				else:
					if int(Dic["minute"]) < int(MyDic["minute"]):
						return true
					elif int(Dic["minute"]) > int(MyDic["minute"]):
						return false
					else:
						return true
func 读取游戏(路径):
	var 读取 = FileAccess.open_encrypted_with_pass(str(路径), FileAccess.READ, Keys)
	if FileAccess.file_exists(str(路径)):
		while 读取.get_position() < 读取.get_length():
			var 得到的数据 = JSON.parse_string(读取.get_line())
			if 得到的数据 == null:
				remove_data()
				for i in Initialized_Data:
					if 得到的数据 != null:
						if 得到的数据.has(i):
							Initialized_Data[i] = 得到的数据[i]
						else:
							得到的数据[i] = Initialized_Data[i]
			else:
				#remove_data()
				for i in Player:
					if 得到的数据 != null:
						if 得到的数据.has(i):
							Player[i] = 得到的数据[i]
						else:
							得到的数据[i] = Player[i]		
#	else:
#		remove_data()
#		print("无文件")
#		return false	
	return true
func 提前数据(路径):
	var List = {}
	var 读取 = FileAccess.open_encrypted_with_pass(str(路径), FileAccess.READ, Keys)
	if FileAccess.file_exists(str(路径)):
		while 读取.get_position() < 读取.get_length():
			var 得到的数据 = JSON.parse_string(读取.get_line())
			for i in 得到的数据:
				if 得到的数据 != null:
					if 得到的数据.has(i):
						List[i] = 得到的数据[i]
	return List
						
func 得到数据(路径):
	var 读取 = FileAccess.open_encrypted_with_pass(str(路径), FileAccess.READ, Keys)
	if FileAccess.file_exists(str(路径)):
		if 读取.get_length() != 0:
			while 读取.get_position() < 读取.get_length():
				var 得到的数据 = JSON.parse_string(读取.get_line())
				if 得到的数据 != null:
					if 得到的数据.size() != 0:
						for i in Player:
							if 得到的数据.has(i):
								level = 得到的数据["玩家等级"]
								return level
							else:
								level = 1
					else:
						level = 1
		else:
			level = 1
	return 1
var Keys =  "zmxybgyh" + OS.get_unique_id() + "v1.1"
func 保存游戏(path:String):
	var get_cdh = path.split("Ar_")[1].split(".")[0]
	MainSet.set_data["time" + str(get_cdh)] = get_time()
	MemoryClass.main_bc()
	var 写入 = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, Keys)
	if FileAccess.file_exists(str(path)):
		if 写入 != null:
			写入.store_line(JSON.stringify(Player))
			
func main_dq():
	var 读取 = FileAccess.open_encrypted_with_pass("user://MainGame.json", FileAccess.READ, Keys2)
	if FileAccess.file_exists("user://MainGame.json"):
		while 读取.get_position() < 读取.get_length():
			var 得到的数据 = JSON.parse_string(读取.get_line())
			var Main_set = MainSet.set_data
			for i in Main_set:
				if 得到的数据 != null:
					if 得到的数据.has(i):
						Main_set[i] = 得到的数据[i]
					else:
						得到的数据[i] = Main_set[i]

var Keys2 =  "zmxybgyh" + OS.get_unique_id() + "v1.1"
func main_bc():
	var 写入 = FileAccess.open_encrypted_with_pass("user://MainGame.json", FileAccess.WRITE, Keys2)
	#var 写入 = FileAccess.open("user://MainGame.json",FileAccess.WRITE)	
	if FileAccess.file_exists("user://MainGame.json"):
		if 写入 != null:
			写入.store_line(JSON.stringify(MainSet.set_data))
func get_time():
	var date = Time.get_date_string_from_system()
	var time_ = Time.get_time_string_from_system()
	var last_time = date + " " + time_
	return last_time
func get_cd_number():
	if Global.cd_path == null:
		return 
	var number = str(Global.cd_path).split("Ar_")[1].split(".")[0]
	#print(number)
	return number
func remove_data():
	Initialized_Data = PlayerData.Initialized_Data.duplicate(true)
	RemoveMainData(get_cd_number())
#	MainSet.set_data["name" + str(get_cd_number())] = ""
#	MainSet.set_data["time" + str(get_cd_number())] = ""
	MemoryClass.main_bc()
func remove_play_data():
	Initialized_Data = PlayerData.Initialized_Data.duplicate(true)
	for i in Initialized_Data:
		if Initialized_Data != null:
			if Player.has(i):
				Player[i] = Initialized_Data[i]
	pass
func Remove():
	Global.AddMessageShow(Global.Windows_,"数据不正常哦，拜拜啦~",4,Vector2(485,295))
	remove_data()
	MainSet.set_data["xg"] = true
	var 写入 = FileAccess.open_encrypted_with_pass(Global.cd_path, FileAccess.WRITE, MemoryClass.Keys)
	写入.store_line(JSON.stringify(Initialized_Data))
	MemoryClass.保存游戏(Global.cd_path)
func RemoveMainData(Num: int):
	if Num <= 6:
		MainSet.set_data["name" + str(Num)] = ""
		MainSet.set_data["time" + str(Num)] = ""
	else:
		MainSet.set_data["其他存档"][str(Num)]["name"] = ""
		MainSet.set_data["其他存档"][str(Num)]["time"] = ""
