extends Node2D
class_name BasicTask
@onready var text: Label = $BG/ms/ScrollContainer/Text
@onready var task_list: VBoxContainer = $BG/ScrollContainer/TaskList
@onready var reward_list: GridContainer = $BG/jl/ScrollContainer/RewardList
@onready var lqjl: TextureButton = $BG/lqjl
@onready var title: Label = $BG/ColorRect/Title
@onready var num: Label = $BG/ColorRect/Title/Num
var ActivityFinishNum: int = 0
var DailyFinishNum: int = 0
var TaskIsFinish: bool#任务达成
var CurrentTaskName: String
var CurrentTaskType: int = 1#任务种类1，活动，2日常
var AllDailyList = [
	]
var AllActivityList = {
	"成长礼包1":{
		"TaskName":"成长礼包1",
		"TaskType":"ActivityTask",
		"TaskInfo":"玩家等级达10级\n" + '（' + str(PlayerData.player_data["玩家等级"]) + "/10）",
		"TaskTarget":{"玩家等级": 10},
		"FinishType":2,
		"TaskReward":[{"Name": "xydxq","Value": 2,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "mpyj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "qhsbx","Value": 10,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "bsd_1","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"成长礼包2":{
		"TaskName":"成长礼包2",
		"TaskType":"ActivityTask",
		"TaskInfo":"玩家等级达20级\n" + '（' + str(PlayerData.player_data["玩家等级"]) + "/20）",
		"TaskTarget":{"玩家等级": 20},
		"FinishType":2,
		"TaskReward":[{"Name": "xydxq","Value": 2,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "qhsbx","Value": 18,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "szbx_1","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "bsd_2","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "xlhys","Value": 2,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "czlxls","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "wxxls","Value": 30,"Prop":{},"WX":[],"StrengthValue":0},],
					
				},
	"成长礼包3":{
		"TaskName":"成长礼包3",
		"TaskType":"ActivityTask",
		"TaskInfo":"玩家等级达30级\n" + '（' + str(PlayerData.player_data["玩家等级"]) + "/30）",
		"TaskTarget":{"玩家等级": 30},
		"FinishType":2,
		"TaskReward":[{"Name": "xydxq","Value": 2,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "qhsbx","Value": 25,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "szbx_2","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "renshen","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "liuhuang","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "shougong","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "lingli","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "xianmao","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "leizong","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "smlp","Value": 50,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "xlhys","Value": 5,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "czlxls","Value": 30,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "wxxls","Value": 60,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "ziyanyujin","Value": 200,"Prop":{},"WX":[],"StrengthValue":0},
					],
				},
	"成长礼包4":{
		"TaskName":"成长礼包4",
		"TaskType":"ActivityTask",
		"TaskInfo":"玩家等级达40级\n" + '（' + str(PlayerData.player_data["玩家等级"]) + "/40）",
		"TaskTarget":{"玩家等级": 40},
		"FinishType":2,
		"TaskReward":[{"Name": "xydxq","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "qhsbx","Value": 28,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "bsd_3","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "renshen","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "liuhuang","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "shougong","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "lingli","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "xianmao","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "leizong","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "dudan","Value": 30,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "smlp","Value": 100,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "dlhys","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "czlxls","Value": 60,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "wxxls","Value": 90,"Prop":{},"WX":[],"StrengthValue":0},
					{"Name": "ziyanyujin","Value": 300,"Prop":{},"WX":[],"StrengthValue":0},
					],
				},
	"决战平天大圣":{
		"TaskName":"决战平天大圣",
		"TaskType":"ActivityTask",
		"TaskTarget":{"牛魔王·鬼": 5},
		"FinishType":1,
		"TaskInfo":"击败牛魔王·鬼5次\n" + '（' + str(PlayerData.player_data["牛魔王·鬼"]) + "/5）",
		"TaskReward":[{"Name": "bsd_4","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"浩瀚星河":{
		"TaskName":"浩瀚星河",
		"TaskType":"ActivityTask",
		"TaskTarget":{"转轮·真法": 5},
		"FinishType":1,
		"TaskInfo":"击败转轮·真法5次\n" + '（' + str(PlayerData.player_data["转轮·真法"]) + "/5）",
		"TaskReward":[{"Name": "bsd_5","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"无首神":{
		"TaskName":"无首神",
		"TaskType":"ActivityTask",
		"TaskTarget":{"战神刑天": 10,"玩家等级": 50},
		"FinishType":6,
		"TaskInfo":"击败战神刑天10次" + '（' + str(PlayerData.player_data["战神刑天"]) + "/10）玩家等级达50级" + '（' + str(PlayerData.player_data["玩家等级"]) + "/50）",
		"TaskReward":[{"Name": "xmzy","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},],
				},
#	"天庭之证":{
#		"TaskName":"天庭之证",
#		"TaskType":"ActivityTask",
#		"TaskInfo":"拥有天庭战神时装",
#		"TaskTarget":{"天庭战神时装": 1},
#		"FinishType":3,
#		"TaskReward":[{"Name": "ttzs","Value": 1,"Prop":{},"WX":[],"StrengthValue":0}],
#				},
	"小有所藏":{
		"TaskName":"小有所藏",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达5" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/5），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 5},
		"FinishType":4,
		"TaskReward":[{"Name": "xysc","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"业余收藏家":{
		"TaskName":"业余收藏家",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达10" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/10），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 10},
		"FinishType":4,
		"TaskReward":[{"Name": "yyscj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 2,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"专业收藏家":{
		"TaskName":"专业收藏家",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达15" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/15），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 15},
		"FinishType":4,
		"TaskReward":[{"Name": "zyscj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 3,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"痴迷收藏家":{
		"TaskName":"痴迷收藏家",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达20" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/20），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 20},
		"FinishType":4,
		"TaskReward":[{"Name": "cmscj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 5,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"强迫症收藏家":{
		"TaskName":"强迫症收藏家",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达25" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/25），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 25},
		"FinishType":4,
		"TaskReward":[{"Name": "qpzscj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 8,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"骨灰级收藏家":{
		"TaskName":"骨灰级收藏家",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达30" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/30），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 30},
		"FinishType":4,
		"TaskReward":[{"Name": "ghjscj","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 10,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"行走博物馆":{
		"TaskName":"行走博物馆",
		"TaskType":"ActivityTask",
		"TaskInfo":"幻化功能中，收集进度达35" + '（' + str(PlayerData.player_data["幻化拥有列表"].size()) + "/35），若显示不准确，请先进去幻化界面再过来。",
		"TaskTarget":{"收集进度": 35},
		"FinishType":4,
		"TaskReward":[{"Name": "xzbwg","Value": 1,"Prop":{},"WX":[],"StrengthValue":0},
		{"Name": "qhsbx","Value": 15,"Prop":{},"WX":[],"StrengthValue":0},],
				},
	"勇闯八荒":{
		"TaskName":"勇闯八荒",
		"TaskType":"ActivityTask",
		"TaskInfo":"未拥有过”修成正果头衔“，并且通过天庭",
		"TaskTarget":{"未持有": true,"天庭":true},
		"FinishType":5,
		"TaskReward":[{"Name": "hhyx","Value": 1,"Prop":{},"WX":[],"StrengthValue":0}],
				},
}
func _ready() -> void:
	ADDTaskList()
func _physics_process(delta: float) -> void:
	match CurrentTaskType:
		1:
			title.text = "活动任务完成："
			num.text = "（" + str(ActivityFinishNum) + '/' + str(AllActivityList.size()) + "）"
			if CurrentTaskName == null or CurrentTaskName == "":
				return
			if TaskIsFinish:
				if not PlayerData.player_data[CurrentTaskName]:
					lqjl.disabled = false
				else:
					lqjl.disabled = true
			else:
				lqjl.disabled = true
			text.text = str(AllActivityList[CurrentTaskName]["TaskInfo"])
		2:
			title.text = "日常任务完成："
			num.text = "（" + str(DailyFinishNum) + '/' + str(AllDailyList.size()) + "）"
			pass
func ADDTaskList():
	match CurrentTaskType:
		1:
			RemoveList()
			for i in AllActivityList:
				Global.AddTaskTitle(task_list,AllActivityList[i]["TaskType"],AllActivityList[i]["TaskName"],self)
		2:
			RemoveList()
			for i in AllDailyList:
				pass
func ADDReward():
	RemoveReward()
	for i in AllActivityList[CurrentTaskName]["TaskReward"]:
		var ItemName = i["Name"]
		var TotalNum = i["Value"]
		Global.AddTaskReward(reward_list,ItemName,TotalNum)	

func RemoveReward():
	for i in reward_list.get_children():
		i.queue_free()
		#reward_list.remove_child(i)
func RemoveList():
	ActivityFinishNum = 0
	DailyFinishNum = 0
	for i in task_list.get_children():
		i.queue_free()
		#task_list.remove_child(i)
func _on_lqjl_pressed() -> void:
	PlayerData.player_data[CurrentTaskName] = true
	var list = AllActivityList[CurrentTaskName]["TaskReward"]
	Global.AddRewardInfo(Global.get_parent_(self,1),Vector2(0,0),list,null,null)
	MemoryClass.保存游戏(Global.cd_path)

func _on_close_pressed() -> void:
	queue_free()


func _on_hd_task_pressed() -> void:
	CurrentTaskType = 1
	ADDTaskList()
func _on_rc_task_pressed() -> void:
	CurrentTaskType = 2
	ADDTaskList()
