extends Node2D


func _on_close_pressed(_pressed = null) -> void:
	queue_free()
