extends BasicBuff
class_name Fire
var TimeCanAdd: bool


func _on_cyele_timer_timeout() -> void:
	if AddObj is BaseHero:
		AddObj.effect_reducehp(Value,AtkKind)
	elif AddObj is BaseMonster:
		AddObj.reduce_hp(Value)
func _on_queue_timer_timeout() -> void:
	pass # Replace with function body.
