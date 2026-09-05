extends Node2D

func _physics_process(_delta: float) -> void:
	$AnimationPlayer.play("miss")
	await $AnimationPlayer.animation_finished
