extends TextureRect
var Type: int

func _physics_process(delta: float) -> void:
	texture = load("res://Art/MainGame/ChoosePlayer/xx_" + str(Type) + ".png")
	set_physics_process(false)
