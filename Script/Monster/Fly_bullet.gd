extends MonsterBullet

var distance_: int
var speed_: int
var dir_

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	
func do_action(name_):
	if dir == false:
		hit_box.scale.x = 1
	else:
		hit_box.scale.x = -1
	bullet_player.speed_scale = speed
	bullet_ani.flip_h = dir
	
	bullet_player.play(name_)
	await bullet_player.animation_finished
	state = remove
