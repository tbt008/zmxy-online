extends Node2D


func _on_zfbutton_pressed() -> void:
	Global.AddZhenFaUi(self,Vector2(0,0))


func _on_close_pressed() -> void:
	queue_free()
