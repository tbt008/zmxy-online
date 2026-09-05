extends Node2D
@onready var message: Label = $Message
@onready var message_player: AnimationPlayer = $MessagePlayer
var ShowText: String
var LastTime: float

func _physics_process(_delta: float) -> void:
	message.text = str(ShowText)
	await get_tree().create_timer(LastTime).timeout
	message_player.play("MessageShow")
	
