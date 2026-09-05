extends Node2D
@onready var read_cd: Timer = $ReadCD
@onready var cd: Label = $Button/cd
@onready var button: Button = $Button

func _ready() -> void:
	# The notice should not block the first interaction for a fixed countdown.
	read_cd.start(0)
func _physics_process(delta: float) -> void:
	cd.text = "(" + str(snapped(read_cd.get_time_left(),0)) + "s)"
	if read_cd.get_time_left() <= 0:
		cd.text = ""
		button.disabled = false
	else:
		button.disabled = true
		

func _on_button_pressed(_pressed = null) -> void:
	MainSet.set_data["FristGame"] = false
	MemoryClass.main_bc()
	self.queue_free()
