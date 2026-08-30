extends CharacterBody2D

signal health_changed(current: int, maximum: int)
signal defeated

@export var move_speed := 320.0
@export var jump_velocity := -560.0
@export var gravity := 1500.0
@export var max_health := 100
@export var attack_damage := 25
@export var attack_cooldown := 0.35
@export var skill_cooldown := 3.0
var current_health := 100
var attack_timer := 0.0
var skill_timer := 0.0
var facing := 1
var _jump_was_down := false
var _attack_was_down := false
var _skill_was_down := false
@onready var attack_area: Area2D = $AttackArea

func _physics_process(delta: float) -> void:
	attack_timer = maxf(0.0, attack_timer - delta)
	skill_timer = maxf(0.0, skill_timer - delta)
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := float(Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT))
	if direction != 0:
		facing = 1 if direction > 0 else -1
		$Sprite.scale.x = facing
	velocity.x = move_toward(velocity.x, direction * move_speed, move_speed * 8.0 * delta)

	if (Input.is_key_pressed(KEY_SPACE)) and is_on_floor() and not _jump_was_down:
		velocity.y = jump_velocity
	_jump_was_down = Input.is_key_pressed(KEY_SPACE)
	if (Input.is_key_pressed(KEY_J) or Input.is_key_pressed(KEY_X)) and not _attack_was_down:
		attack()
	if Input.is_key_pressed(KEY_K) and not _skill_was_down:
		cast_skill()
	_attack_was_down = Input.is_key_pressed(KEY_J) or Input.is_key_pressed(KEY_X)
	_skill_was_down = Input.is_key_pressed(KEY_K)

	move_and_slide()

func attack() -> void:
	if attack_timer > 0.0:
		return
	attack_timer = attack_cooldown
	attack_area.position.x = 58.0 * facing
	for target in attack_area.get_overlapping_bodies():
		if target.has_method("apply_damage"):
			target.apply_damage(attack_damage, Vector2(facing, -0.2))
	_show_effect($AttackFlash, 0.12, 1.0)

func cast_skill() -> void:
	if skill_timer > 0.0:
		return
	skill_timer = skill_cooldown
	_show_effect($SkillFlash, 0.35, 2.0)
	for target in get_tree().get_nodes_in_group("enemy"):
		if is_instance_valid(target) and abs(target.global_position.x - global_position.x) < 260.0 and abs(target.global_position.y - global_position.y) < 140.0:
			target.apply_damage(60, Vector2(facing, -0.5))

func _show_effect(effect: Node2D, duration: float, scale_factor: float) -> void:
	effect.visible = true
	effect.scale = Vector2.ONE * scale_factor
	var tween := create_tween()
	tween.tween_property(effect, "modulate:a", 0.0, duration)
	tween.tween_callback(func():
		effect.visible = false
		effect.modulate.a = 1.0
	)

func apply_damage(amount: int, _direction := Vector2.ZERO) -> void:
	current_health = maxi(0, current_health - amount)
	health_changed.emit(current_health, max_health)
	if current_health == 0:
		defeated.emit()
		queue_free()
