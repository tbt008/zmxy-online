extends CharacterBody2D

signal health_changed(current: int, maximum: int)
signal defeated

@export var move_speed := 320.0
@export var jump_velocity := -560.0
@export var gravity := 1500.0
@export var max_health := 100
@export var attack_damage := 25
@export var attack_cooldown := 0.35
var current_health := 100
var attack_timer := 0.0
var facing := 1
var _jump_was_down := false
var _attack_was_down := false
@onready var attack_area: Area2D = $AttackArea

func _physics_process(delta: float) -> void:
	attack_timer = maxf(0.0, attack_timer - delta)
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := float(Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT))
	if direction != 0:
		facing = 1 if direction > 0 else -1
		$DebugBody.scale.x = facing
	velocity.x = move_toward(velocity.x, direction * move_speed, move_speed * 8.0 * delta)

	if (Input.is_key_pressed(KEY_SPACE)) and is_on_floor() and not _jump_was_down:
		velocity.y = jump_velocity
	_jump_was_down = Input.is_key_pressed(KEY_SPACE)
	if (Input.is_key_pressed(KEY_J) or Input.is_key_pressed(KEY_X)) and not _attack_was_down:
		attack()
	_attack_was_down = Input.is_key_pressed(KEY_J) or Input.is_key_pressed(KEY_X)

	move_and_slide()

func attack() -> void:
	if attack_timer > 0.0:
		return
	attack_timer = attack_cooldown
	attack_area.position.x = 58.0 * facing
	for target in attack_area.get_overlapping_bodies():
		if target.has_method("apply_damage"):
			target.apply_damage(attack_damage, Vector2(facing, -0.2))

func apply_damage(amount: int, _direction := Vector2.ZERO) -> void:
	current_health = maxi(0, current_health - amount)
	health_changed.emit(current_health, max_health)
	if current_health == 0:
		defeated.emit()
		queue_free()
