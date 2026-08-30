extends CharacterBody2D

signal defeated

@export var max_health := 50
@export var move_speed := 100.0
@export var attack_damage := 10
@export var attack_range := 75.0
var current_health := 50
var attack_timer := 0.0
var player: Node2D

func _ready() -> void:
	current_health = max_health
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	attack_timer = maxf(0.0, attack_timer - delta)
	if not is_instance_valid(player): return
	var distance := global_position.distance_to(player.global_position)
	if distance > attack_range:
		var direction := signf(player.global_position.x - global_position.x)
		velocity.x = move_toward(velocity.x, direction * move_speed, 700.0 * delta)
		$Sprite.scale.x = direction if direction != 0 else 1
	else:
		velocity.x = move_toward(velocity.x, 0.0, 1000.0 * delta)
		if attack_timer == 0.0 and player.has_method("apply_damage"):
			attack_timer = 1.0
			player.apply_damage(attack_damage, Vector2(signf(player.global_position.x - global_position.x), -0.2))
	if not is_on_floor(): velocity.y += 1500.0 * delta
	move_and_slide()

func apply_damage(amount: int, direction := Vector2.ZERO) -> void:
	current_health = maxi(0, current_health - amount)
	$HealthBar.value = current_health
	velocity += direction * 180.0
	if current_health == 0:
		defeated.emit()
		queue_free()
