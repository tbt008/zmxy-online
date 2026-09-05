extends Node
#var is_ice
#var addAffect = {
#	"name": "",
#	"value": 0,
#	"time": 0
#}
#func find_effect():
#	match addAffect["name"]:
#		"RFireAffect":
#			AddFiretoRole(addAffect["value"],addAffect["time"])
#		"MFireAffect":
#			AddFiretoMonster(addAffect["value"],addAffect["time"])
#		"ice":
#			show_ice(addAffect["time"])
#
#func AddFiretoRole(value_,lasttime):
#
#	pass
#func AddFiretoMonster(value_,lasttime):
#	pass
#func show_ice(last_time):
#	is_ice = true
#
#
#func _on_ice_time_timeout() -> void:
#	is_ice = false
