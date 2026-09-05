extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var Dir:bool
var ShouldDeath: bool
func _ready() -> void:
	animation_player.play("smb")
	
func _physics_process(delta: float) -> void:
	if ShouldDeath:
		self.queue_free()
	if Dir:
		self.position.x += 7
	else:
		self.position.x -= 7
