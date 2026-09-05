extends Node2D
@onready var behitplayer: AnimatedSprite2D = $behitplayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	randomize()
	do_()
func _physics_process(_delta: float) -> void:
	randomize()
func do_():
	if randi_range(0,100) < 50:
		animation_player.play("hurt_1")
	else:
		animation_player.play("hurt_2")
	await animation_player.animation_finished

	pass_()
func pass_():
	queue_free()
