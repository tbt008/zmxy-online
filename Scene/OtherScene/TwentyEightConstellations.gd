extends Node2D


func _on_zfbutton_pressed(_pressed = null) -> void:
	Global.AddZhenFaUi(self,Vector2(0,0))


func _on_close_pressed(_pressed = null) -> void:
	queue_free()
