extends TextureRect
@onready var buff_bar: TextureProgressBar = $BuffBar
@onready var buff_time: Label = $BuffTime
@onready var buff_icon_remove: Timer = $BuffIconRemove
@onready var add_times: Label = $AddTimes

var BuffTime: float
var BuffInfo
var DataList = {}
var Parent: BaseObject
func _physics_process(_delta: float) -> void:
	var PParent = Global.get_parent_(self,2)
	if Parent != null:
		if PParent is BossBlood:
			Parent = Global.get_parent_(self,2).GetObj
		else:
			Parent = RoleProp.SourcePlayer
	else:
		Parent = RoleProp.SourcePlayer
	if DataList == {}:
		return
	buff_bar.texture_progress = load("res://Art/AddEffect/Buff_icon/" + str(DataList["Name"]) + ".png")
	if DataList["AddTime"] > 0:
		BuffTime = DataList["AddTime"]
	buff_bar.size = self.size
	if GetBuffCount() > 1:
		add_times.text = str(GetBuffCount())
	else:
		add_times.text = ""
	if not BuffTime >= 99999: 
		buff_bar.value = buff_icon_remove.time_left / float(BuffTime)
		buff_time.text = str(snapped(buff_icon_remove.time_left,0.1))
	else:
		buff_time.text = "永久"
func _on_buff_icon_remove_timeout() -> void:
	self.visible = false




func _on_mouse_entered() -> void:
	if BuffInfo == null:
		BuffInfo = Global.AddBuffinfor(get_parent().get_parent(),self.position + Vector2(-20,50),DataList)
	BuffInfo.Parent = self
	BuffInfo.LastHurt = DataList["value"]

func _on_mouse_exited() -> void:
	if BuffInfo != null:
		BuffInfo.queue_free()
func GetBuffCount():
	var Count: int = 0
	if Parent != null:
		for i in Parent.buff.get_children():
			if i.BuffInfo["Name"] == DataList["Name"]:
				Count += 1
	return Count
