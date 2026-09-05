extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stop_5: CollisionShape2D = $wall/stop5

var _1 = preload("res://Scene/Monster/Monster_26.tscn")
var _2 = preload("res://Scene/Monster/Monster_27.tscn")
var _3 = preload("res://Scene/Monster/Monster_28.tscn")
var _4 = preload("res://Scene/Monster/Monster_30.tscn")
var _5 = preload("res://Scene/Monster/Monster_31.tscn")
var _6 = preload("res://Scene/Monster/Monster_32.tscn")
var _7 = preload("res://Scene/Monster/Monster_33.tscn")
var _8 = preload("res://Scene/Monster/Monster_34.tscn")
var _9 = preload("res://Scene/Monster/Monster_34.tscn")
func _ready() -> void:
	Global.CurrentLevel = "鬼城"
	Global.addBGM_(self,"res://Music/level/26_bg1.mp3")
	self.level_stage = 11
	super._ready()
	Monster_group = {
		"stage_1": [26,26,26,26,26,26,26,26,26],
		"stage_2": [27,27,27,26,26,26,26,27,27,27,27,27,27,27],
		"stage_3": [27,27,27,27,26,26,26,26,27,27,27,27,27,27,27],
		"stage_4": [27,27,27,27,27,28],
	}
	Monster_position_x = {
		"stage_1": [500,700,700,700,700,700,700,700,700],
		"stage_2": [2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000],
		"stage_3": [3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000],
		"stage_4": [4500,4500,4500,4500,4500,4500],
	}
	Monster_position_y = {
		"stage_1": [350,300,300,300,300,300,300,300,300],
		"stage_2": [300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_3": [300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_4": [300,300,300,300,300,300],
	}
func _physics_process(delta: float) -> void:
	super._physics_process(delta)	
	if current_stage >= 1:
		if check_can_pass() and current_stage < 4:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false
func set_through():
	if current_stage == 1:
		if check_can_pass():
			stop_1.disabled = true
	elif current_stage == 2:	
		if check_can_pass():
			stop_2.disabled = true	
	elif current_stage == 3:
		if check_can_pass():
			stop_3.disabled = true	
	elif current_stage == 4:
		my_camera.max_left = 3500
		stop_3.disabled = false
		stop_5.disabled = false
