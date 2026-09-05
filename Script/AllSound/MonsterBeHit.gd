extends AudioStreamPlayer
#音效控制
var target
var is_set = false
func _physics_process(_delta: float) -> void:
	if not is_set:
		stream = load(target)
		play()	
		is_set = true
	if MainSet.set_data["RoleOrMonsterHit"]:
		set_volume_db(int(MainSet.set_data["MusicFB_2"]))
	else:
		set_volume_db(-80)
	


func _on_finished() -> void:
	queue_free()
