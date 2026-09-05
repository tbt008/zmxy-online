extends Control
var my_text
var is_qd = false
var is_qx = false
var is_set
var calm_time: int
@onready var calm: Label = $TextureRect/bg/qx/calm

func _physics_process(_delta: float) -> void:
	if not is_set:
		if calm_time > 0:
			$think_time.wait_time = calm_time
			$think_time.start()
		else:
			$TextureRect/bg/qd.disabled = false
		$TextureRect/bg/ScrollContainer/Text.text = my_text
		is_set = true
	if calm_time > 0:
		calm.text = "(" + str(snapped($think_time.get_time_left(),0)) + "s)"
	if $think_time.get_time_left() <= 0:
		calm.text = ""
func _on_qx_pressed() -> void:
	is_qx = true
	queue_free()


func _on_qd_pressed() -> void:
	Signals.emit_signal("_on_Choose_pressed")
	is_qd = true
	queue_free()


func _on_think_time_timeout() -> void:
	$TextureRect/bg/qd.disabled = false
