extends HBoxContainer
#var PoisionIcon
#func _physics_process(delta: float) -> void:
#	OnAddBuff()
#func OnAddBuff():
#	for i in RoleProp.SourcePlayer.buff.get_children():
#		if i.BuffInfo["Name"] == "poision":
#			if PoisionIcon == null:
#				PoisionIcon = Global.AddBuffIcon(Global.buff_box,i.BuffInfo)
#			else:
#				PoisionIcon.AddTimes += 1
#				PoisionIcon.buff_icon_remove.start(i.BuffInfo["AddTime"])
