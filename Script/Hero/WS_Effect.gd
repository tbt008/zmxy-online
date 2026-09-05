extends Node2D
@onready var DeathTimer = $DeathTimer
@export var live_time = 0.3
@export var alfa_factor:float = 1
@export var color = Color(1,1,1)

#func _ready() -> void:
#	DeathTimer.start(live_time)
#

func _process(_delta: float) -> void:
	if DeathTimer.is_stopped():
		DeathTimer.start(live_time)
	var alfa = DeathTimer.time_left * alfa_factor / float(live_time)
	set("modulate",Color(color.r,color.g,color.b,alfa))
	pass

func _on_death_timer_timeout() -> void:
	queue_free()
