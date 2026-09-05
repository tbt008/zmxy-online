extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stop_5: CollisionShape2D = $wall/stop5

var _2 = preload("res://Scene/Monster/Monster_14.tscn")
var _3 = preload("res://Scene/Monster/Monster_15.tscn")
var _4 = preload("res://Scene/Monster/Monster_16.tscn")
var _5 = preload("res://Scene/Monster/Monster_17.tscn")
var _7 = preload("res://Scene/Monster/Monster_19.tscn")
var _8 = preload("res://Scene/Monster/Monster_20.tscn")
func _ready() -> void:
	Global.CurrentLevel = "鲨之涡流"
	Global.addBGM_(self,"res://Music/level/21_bg3.mp3")
	self.level_stage = 9#处于哪个等级
	super._ready()
	Monster_group = {
		"stage_1": [16,16,14,15,14,15,14,15,14,15,14,15],
		"stage_2": [14,15,14,15,14,15,14,15,14,15,17,16,17,16,17,16,17,16,17,16],
		"stage_3": [14,15,14,15,14,15,14,15,14,15,17,16,17,16,17,16,17,16,17,16],
		"stage_4": [20],
	}
	Monster_position_x = {
		"stage_1": [1000,1000,120,1000,120,1000,120,1000,120,1000,120,1000],
		"stage_2": [1400,2000,1400,2000,1400,2000,1400,2000,1400,2000,1400,2000,1400,2000,1400,2000,1400,2000,1400,2000],
		"stage_3": [2500,3300,2500,3300,2500,3300,2500,3300,2500,3300,2500,3300,2500,3300,2500,3300,2500,3300,2500,3300],
		"stage_4": [4550],
	}
	Monster_position_y = {
		"stage_1": [300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_2": [250,250,250,250,250,250,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_3": [200,200,200,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_4": [300],
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
