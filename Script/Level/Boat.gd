extends Node2D
var catch = false
var speed = 50.0
var player: BaseHero
@onready var monster_47: CharacterBody2D = $Monster_47

func _physics_process(delta: float) -> void:
	if self.position.x <= 4423:
		self.position.x += speed * delta
		if catch:
			player.position.x += speed * delta
		monster_47.position = self.position
	else:
		monster_47.position = Vector2(0,0)
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BaseHero:# or body is BaseMonster:
		player = body
		catch = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	catch = false
