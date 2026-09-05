extends Node2D
@onready var combo_box: HBoxContainer = $ComBoxFather/ComboBox
@onready var combo_player: AnimationPlayer = $ComboPlayer

var ComboNum: int

func _physics_process(_delta: float) -> void:
	#print(ComboNum)
	if ComboNum < 2:
		queue_free()
	var NumList = str(ComboNum).split("")
	for i in NumList:
		i = int(i)
		#print(i)
		Global.addComboNum(combo_box,i)
	combo_player.play("Combo")
	set_physics_process(false)
	await combo_player.animation_finished
	
