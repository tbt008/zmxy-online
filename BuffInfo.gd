extends Node
var BuffIce: BaseBuff
var BuffList = []

func CheckIceBuff():
	if BuffIce == null:
		for i in BuffList:
			if i != null:
				if i.BuffInfo["Name"] == "Ice":
					BuffIce = i
					break
			else:
				break
	else:
		for i in BuffList:
			if i != null:
				if i.BuffInfo["Name"] == BuffIce.BuffInfo["Name"]:
					if i.BuffInfo["CanAdd"] and BuffIce.BuffInfo["CanAdd"]:
						BuffIce.BuffInfo["AddTime"] += i.BuffInfo["AddTime"]
						i.queue_free()
					else:
						i.queue_free()
