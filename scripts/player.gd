extends CharacterBody2D

@export var move_speed := 320.0
@export var jump_velocity := -560.0
@export var gravity := 1500.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, direction * move_speed, move_speed * 8.0 * delta)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()

