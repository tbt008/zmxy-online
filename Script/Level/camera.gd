extends Camera2D
var max_right
var max_left
var max_top
var max_bottom

func _physics_process(_delta: float) -> void:
	self.limit_right = max_right
	self.limit_left = max_left
	self.limit_top = max_top
	self.limit_bottom = max_bottom
	
func disturb_offset(strength: float):
	
	self.offset = Vector2(randf_range(-strength,strength),randf_range(-strength,strength))

func Shake(strength: float,times: int,interv:float):
	
	for i in range(times):
		disturb_offset(strength)
		await get_tree().create_timer(interv,false).timeout
		reset_offset()
		
	reset_offset()
func reset_offset():
	self.offset = Vector2(0,0)
