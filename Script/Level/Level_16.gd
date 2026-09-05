extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stop_5: CollisionShape2D = $wall/stop5

var _2 = preload("res://Scene/Monster/Monster_46.tscn")
var _3 = preload("res://Scene/Monster/Monster_45.tscn")
var _4 = preload("res://Scene/Monster/Monster_44.tscn")
var _5 = preload("res://Scene/Monster/Monster_43.tscn")
func _ready() -> void:
	Global.CurrentLevel = "阎罗殿"
	Global.addBGM_(self,"res://Music/level/4_bg2.mp3")
	self.level_stage = 16
	super._ready()
	Monster_group = {
		"stage_1": [40,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40],
		"stage_2": [39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,31,30,31,30,31,30,31,30],
		"stage_3": [39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,31,30,31,30,31,30,31,30,31,30,31,30,31,30,31,30],
		"stage_4": [43],
	}
	Monster_position_x = {
		"stage_1": [50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000],
		"stage_2": [1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,
		1200,2150,1200,2150,1200,2150,1200,2150],
		"stage_3": [2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,
		2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,],
		"stage_4": [4500],
	}
	Monster_position_y = {
		"stage_1": [450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450],
		"stage_2": [450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,
		450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450],
		"stage_3": [450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,
		450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450],
		"stage_4": [350],
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
