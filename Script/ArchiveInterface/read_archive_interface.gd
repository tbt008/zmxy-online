extends Node2D
var Initialized_Data = {}
@onready var cd_number: LineEdit = $background/cd_number
@onready var all_ar: GridContainer = $ScrollContainer/AllAr

func _ready() -> void:
	MemoryClass.main_dq()
	AddAr()
func GetNeedBox():
	return int(MainSet.set_data["CdNum"])
func RemoveAr():
	for i in all_ar.get_children():
		all_ar.remove_child(i)
		i.queue_free()
func AddAr():
	RemoveAr()
	for i in range(GetNeedBox()):
		Global.AddBasicArButton(all_ar,i + 1)

func _on_close_pressed() -> void:
	queue_free()


func _on_delete_pressed() -> void:
	if int(cd_number.text) > GetNeedBox() or int(cd_number.text) <= 0:
		Global.AddMessageShow(self,"找不到存档" + str(cd_number.text) + "的信息，请确保正确输入了存档号！！",1.5,Vector2(470,300))
		return
	if cd_number.text == "":
		Global.AddMessageShow(self,"找不到存档信息，请确保正确输入了存档号！！",1.5,Vector2(470,300))
		return
	else:
		Signals.ConnectChooseBoxSignal(self,"remove_data_")
		Global.add_choose_text(self,Vector2(0,0),"确定要删除存档" + str(cd_number.text) + "吗？\n（删除后无法恢复！）",4)
func remove_data_():
		remove_data()
		var 写入 = FileAccess.open_encrypted_with_pass("user://MyAr_" + cd_number.text + ".json", FileAccess.WRITE, MemoryClass.Keys)
		写入.store_line(JSON.stringify(Initialized_Data))
		AddAr()
		Global.AddMessageShow(self,"存档" + cd_number.text + "已重置为初始状态！！",1.5,Vector2(470,300))
func remove_data():
	Initialized_Data = PlayerData.Initialized_Data.duplicate(true)
	MemoryClass.RemoveMainData(int(cd_number.text))
#	MainSet.set_data["name" + str(cd_number.text)] = ""
#	MainSet.set_data["time" + str(cd_number.text)] = ""
	MemoryClass.main_bc()
func RemoveMainData(Num: int):
	if Num <= 6:
		MainSet.set_data["name" + str(Num)] = ""
		MainSet.set_data["time" + str(Num)] = ""
	else:
		MainSet.set_data["其他存档"][str(Num)]["name"] = ""
		MainSet.set_data["其他存档"][str(Num)]["time"] = ""
func get_time():
	var date = Time.get_date_string_from_system()
	var time_ = Time.get_time_string_from_system()
	var last_time = date + " " + time_
	return last_time


func _on_addcd_pressed() -> void:
	MainSet.set_data["CdNum"] += 1
	Global.AddMessageShow(self,"添加成功，不要添加过多，以防卡顿！！",1.5,Vector2(470,300))
	MemoryClass.main_bc()
	AddAr()

func _on_removecd_pressed() -> void:
	if MainSet.set_data["CdNum"] <= 6:
		Global.AddMessageShow(self,"最少保留6个存档格子！！！",1.5,Vector2(470,300))
		return
	MainSet.set_data["CdNum"] -= 1
	MemoryClass.main_bc()
	AddAr()
