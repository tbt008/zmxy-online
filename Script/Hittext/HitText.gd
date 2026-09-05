extends Label
@onready var show_text_player: AnimationPlayer = $show_text_player
@onready var hit_text: Label = $"."
enum{
	show,
	remove
}
var is_miss
var is_crit
var state = show
var show_text: int
var show_lx: String
func _physics_process(_delta: float) -> void:
	if is_miss:
		hit_text.text = "Miss"
		show_text_player.play("miss")
		return
	if show_text > 0:
		if not is_miss:
			if is_crit:
				if show_lx == "cure":
					hit_text.text = "暴击 +" + str(show_text)
				else:
					hit_text.text = "暴击 -" + str(show_text)
			else:
				if show_lx == "cure":
					hit_text.text = "+" + str(show_text)
				else:
					hit_text.text = str(show_text)
		else:
			hit_text.text = "Miss"
	match state:
		show:
			show_()
		remove:
			pass

func show_():
	if show_lx == "physics":
		show_text_player.play("hit_text")
	elif show_lx == "real":
		show_text_player.play("real_hurt")
	elif show_lx == "magic":
		show_text_player.play("hurt_text")
	elif show_lx == "cure":
		show_text_player.play("cure_text")
	elif is_miss:
		show_text_player.play("miss")
	else:
		show_text_player.play("real_hurt")
	await show_text_player.animation_finished
	state = remove
