extends Node2D

var defeated_count := 0
@onready var player = $Player
@onready var status: Label = $HUD/Status
@onready var counter: Label = $HUD/Counter
@onready var skill_label: Label = $HUD/Skill

func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("enemy"):
		enemy.defeated.connect(_on_enemy_defeated)
	player.health_changed.connect(_on_player_health_changed)
	player.defeated.connect(_on_player_defeated)
	_update_counter()

func _process(_delta: float) -> void:
	skill_label.text = "技能 L：" + ("就绪" if player.skill_timer <= 0.0 else "冷却 %.1f" % player.skill_timer)
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

func _on_enemy_defeated() -> void:
	defeated_count += 1
	_update_counter()
	if defeated_count >= 3: status.text = "关卡完成！按 R 重新挑战"

func _on_player_health_changed(current: int, maximum: int) -> void:
	$HUD/Health.value = current
	$HUD/Health.max_value = maximum

func _on_player_defeated() -> void:
	status.text = "你被击败了，按 R 重新开始"

func _update_counter() -> void:
	counter.text = "击败敌人：%d / 3" % defeated_count
