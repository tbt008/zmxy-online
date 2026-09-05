extends Node2D
@onready var read_cd: Timer = $ReadCD
@onready var cd: Label = $Button/cd
@onready var button: Button = $Button

func _ready() -> void:
	if MainSet.set_data["FristGame"]:
		read_cd.start(21)
	else:
		read_cd.start(0)
func _physics_process(delta: float) -> void:
	cd.text = "(" + str(snapped(read_cd.get_time_left(),0)) + "s)"
	if read_cd.get_time_left() <= 0:
		cd.text = ""
		button.disabled = false
	else:
		button.disabled = true
		

func _on_button_pressed() -> void:
	MainSet.set_data["FristGame"] = false
	MemoryClass.main_bc()
	self.queue_free()
