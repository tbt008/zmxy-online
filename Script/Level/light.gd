extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var IsLight: bool
func _physics_process(delta: float) -> void:
	if IsLight:
		animation_player.play("Light2")
	else:
		animation_player.play("Light1")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if IsLight:
		IsLight = false
	else:
		IsLight = true
	Global.add_mr_hurt($Area2D,Vector2(0,0))
