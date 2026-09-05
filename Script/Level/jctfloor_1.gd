extends Sprite2D

@onready var move_player: AnimationPlayer = $MovePlayer
var Player
var dir: int
var is_set: bool
var catch: bool
var Type:String
func _ready() -> void:
	if randi_range(0,100) <= 50:
		dir = 1
	else:
		dir = -1

func _physics_process(delta: float) -> void:
	if not is_set:
		move_player.play(Type)
		is_set = true
	if Type == "an_5":
		#print("12")
		if catch:
			if Player != null:
				Player.position.x += randi_range(150,240) * delta * dir	


func _on_area_2d_body_entered(body: Node2D) -> void:
	catch = true
	if body is BaseHero:
		Player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	catch = false
