class_name Health
extends Node

signal damaged(amount: int)
signal died

@export var max_health := 100
var current_health: int

func _ready() -> void:
	current_health = max_health

func apply_damage(amount: int) -> void:
	if current_health <= 0:
		return
	current_health = maxi(0, current_health - amount)
	damaged.emit(amount)
	if current_health == 0:
		died.emit()

