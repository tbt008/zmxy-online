extends Control
@onready var bg = $bg
@onready var st = $MarginContainer/MarginContainer/show_text
var tt: String
func _physics_process(_delta: float) -> void:
	st.text = tt
#	bg.size.x = st.size.x
#	bg.size.y = st.size.y + 30
	pass
