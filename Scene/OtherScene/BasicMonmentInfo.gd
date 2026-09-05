extends Control
@onready var show_text: Label = $MarginContainer/ShowText

var ShowText
func _ready() -> void:
	self.z_index = 99
	
func _physics_process(delta: float) -> void:
	show_text.text = str(ShowText)
	
