extends BaseLevel
class_name levelhddy
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
var is_set = false
var _1 = preload("res://Scene/Monster/Monster_67.tscn")
var _2 = preload("res://Scene/Monster/Monster_68.tscn")
var _3 = preload("res://Scene/Monster/Monster_69.tscn")

func _ready() -> void:
	Global.addBGM_(self,"res://Music/level/2_bg4.mp3")
	self.is_two_scene = true
	self.level_stage = 1
	super._ready()
	Monster_group = {
		"stage_1": [69,69,69,69,69,69,69,69,69,69,
		69,69,69,69,69,69,69,69,69,69,
		69,69,69,69,69,69,69,69,69,69,
		69,69,69,69,69,69,69,69,69,69,
		69,69,69,69,69,69,69,69,69,69],
		"stage_2": [67],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_x = {
		"stage_1": [150,900,150,900,150,900,150,900,150,900,
		150,900,150,900,150,900,150,900,150,900,
		150,900,150,900,150,900,150,900,150,900,
		150,900,150,900,150,900,150,900,150,900,
		150,900,150,900,150,900,150,900,150,900,],
		"stage_2": [1700],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_y = {
		"stage_1": [300,300,300,300,300,300,300,300,300,300,
		300,300,300,300,300,300,300,300,300,300,
		300,300,300,300,300,300,300,300,300,300,
		300,300,300,300,300,300,300,300,300,300,
		300,300,300,300,300,300,300,300,300,300,],
		"stage_2": [300],
		"stage_3": [],
		"stage_4": [],
	}
func _physics_process(delta: float) -> void:
	super._physics_process(delta)	
	if current_stage >= 1:
		if check_can_pass() and current_stage < 2:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false
func set_through():
	if current_stage == 1:
		if check_can_pass():
			stop_1.disabled = true
	if current_stage == 2:
		if not is_set:
			my_camera.limit_smoothed = false
			my_camera.position_smoothing_enabled = false
			is_set = true
		my_camera.max_left = 1000
		stop_1.disabled = false
		my_camera.max_right = 1870
