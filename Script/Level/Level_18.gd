extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var _2 = preload("res://Scene/Monster/Monster_46.tscn")
var _3 = preload("res://Scene/Monster/Monster_45.tscn")
var _4 = preload("res://Scene/Monster/Monster_44.tscn")
var _5 = preload("res://Scene/Monster/Monster_48.tscn")
func _ready() -> void:
	Global.CurrentLevel = "奈何桥"
	Global.addBGM_(self,"res://Music/level/9_bg3.mp3")
	self.level_stage = 18
	super._ready()
	Monster_group = {
		"stage_1": [51,51,51,53,53,53,51,51,51,51,52,52,52,52,52,52,52,51,51,51],
		"stage_2": [51,53,51,53,51,53,51,53,51,53,51,52,51,52,51,52,51,52,52,52,52,52,52,52,52,52,52,52],
		"stage_3": [51,53,51,53,51,53,51,53,51,53,51,52,51,52,51,52,51,52,52,52,52,52,52,52,52,52,52,52,51,51,51,51,51,51,51,51],
		"stage_4": [48],
	}
	Monster_position_x = {
		"stage_1": [1000,1000,1000,100,100,100,700,900,700,900,700,900,700,900,700,900,700,900,700,900],
		"stage_2": [1250,2100,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,
		1200,2150,1200,2150,1200,2150,1200,2150],
		"stage_3": [2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,
		2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,],
		"stage_4": [4550],
	}
	Monster_position_y = {
		"stage_1": [255,255,255,100,100,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_2": [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
		255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_3": [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
		255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255],
		"stage_4": [250],
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
#	elif current_stage == 4:
#		my_camera.max_left = 3500
#		stop_3.disabled = false
