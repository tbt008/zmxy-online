extends Node2D
@onready var river_player: AnimationPlayer = $RiverPlayer

func _ready() -> void:
	river_player.play("River")
