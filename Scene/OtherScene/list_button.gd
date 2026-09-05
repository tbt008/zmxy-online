extends Button
var selfName: String
var Father
var Num: int
func _physics_process(delta: float) -> void:
	text = str(selfName)
	set_physics_process(false)

func _on_pressed() -> void:
	Father.AddBoss(selfName,Num)
