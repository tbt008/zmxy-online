extends Control
@onready var background: TextureRect = $background
@onready var text_tt: Label = $background/text_tt
@onready var remove_player: AnimationPlayer = $remove_player
var show_text: String
var state = show
var last_time: float
enum {
	show,
	wait,
	remove,
}

func _physics_process(_delta: float) -> void:
	match state:
		show:
			show_()
		wait:
			wait_()
		remove:
			remove_()
func show_():
	text_tt.text = show_text
	background.size.x = text_tt.size.x
	background.size.y = text_tt.size.y
	state = wait
func wait_():
	await get_tree().create_timer(last_time).timeout
	state = remove
func remove_():
	background.position.y -= 1
	remove_player.play("remove_")
