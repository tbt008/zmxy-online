extends TextureButton
var TaskName: String
var TaskType: String
var MyFather: BasicTask
#需要传入的
@onready var tilte: Label = $Tilte
@onready var label: Label = $Label

#将传给father的
var TaskInfo: String
var RewardList = []
var NbName: String
var Finish: bool
func _physics_process(delta: float) -> void:
	tilte.text = TaskName
	if PlayerData.player_data[TaskName]:
		label.text = "已领取"
		MyFather.ActivityFinishNum += 1
		label.add_theme_color_override("font_color","00ffff")
		label.add_theme_color_override("font_outline_color","00ffff")
		set_physics_process(false)
		return
	if CheckTaskFinish():
		Finish = true
		MyFather.TaskIsFinish = true
		label.text = "已完成"
		label.add_theme_color_override("font_color","00ff00")
		label.add_theme_color_override("font_outline_color","00ff00")
	else:
		Finish = false
		MyFather.TaskIsFinish = false
		label.text = "未完成"
		label.add_theme_color_override("font_color","ff0000")
		label.add_theme_color_override("font_outline_color","ff0000")
	set_physics_process(false)
func CheckTaskFinish():
	match TaskType:
		"ActivityTask":
			match MyFather.AllActivityList[TaskName]["FinishType"]:
				1:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					for i in Target:
						if PlayerData.player_data[i] < Target[i]:
							return false
					return true
				2:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					for i in Target:
						if PlayerData.player_data["玩家等级"] < Target[i]:
							return false
					return true
				3:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					match int(PlayerData.player_data["Myself"]):
						1:
							if PlayerData.checkHaveZB("wkttzssz")[0]:
								return true
						2:
							if PlayerData.checkHaveZB("tsttzssz")[0]:
								return true
						3:
							if PlayerData.checkHaveZB("bjttzssz")[0]:
								return true
						4:
							if PlayerData.checkHaveZB("ssttzssz")[0]:
								return true
					return false
				4:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					if PlayerData.player_data["幻化拥有列表"].size() >= int(Target["收集进度"]):
						return true
					return false
				5:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					if not PlayerData.player_data["ieho"] and PlayerData.player_data["截教天镜"]:
						return true
					return false
				6:
					var Target = MyFather.AllActivityList[TaskName]["TaskTarget"]
					if PlayerData.player_data["玩家等级"] < Target["玩家等级"]:
						return false
					if PlayerData.player_data["战神刑天"] < Target["战神刑天"]:
						return false

					return true
					
		"DailyTask":
			pass
	return true
func _on_pressed() -> void:
	MyFather.TaskIsFinish = Finish
	MyFather.CurrentTaskName = TaskName
	MyFather.ADDReward()

