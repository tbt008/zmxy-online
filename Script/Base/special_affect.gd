extends AnimatedSprite2D
@onready var special_effect: AnimatedSprite2D = $"."
@onready var EffectPlayer: AnimationPlayer = $SpecialAffect
enum {
	do,
	remove
}
var Effect_name: String
var state = do
var Effect_dir: bool
var Effect_speed: float
var scale_
func _physics_process(_delta: float) -> void:

	match state:
		do:
			do_action(Effect_name)
		remove:
			pass

func do_action(name_):
	EffectPlayer.speed_scale = Effect_speed
	special_effect.flip_h = Effect_dir
	special_effect.scale = scale_
	EffectPlayer.play(name_)
	await EffectPlayer.animation_finished
	state = remove
	pass
