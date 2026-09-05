extends TextureRect
var ComboNum: int

func _physics_process(_delta: float) -> void:
	self.set_texture(load("res://Art/AllNumber/LJ/lj_" + str(ComboNum) + ".png"))
	set_physics_process(false)
