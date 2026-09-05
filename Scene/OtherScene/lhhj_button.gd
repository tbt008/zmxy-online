extends Button
var selfName: String
var Father
func _physics_process(delta: float) -> void:
	text = str(selfName)
	set_physics_process(false)


func _on_pressed() -> void:
	Father.TargetBoss = selfName
	Father.ShowProp()
