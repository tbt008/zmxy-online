extends BaseLevel
class_name Level7
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stop_5: CollisionShape2D = $wall/stop5

var _2 = preload("res://Scene/Monster/Monster_14.tscn")
var _3 = preload("res://Scene/Monster/Monster_15.tscn")
var _4 = preload("res://Scene/Monster/Monster_17.tscn")

func _ready() -> void:
	Global.CurrentLevel = "浅岸"
	Global.addBGM_(self,"res://Music/level/21_bg3.mp3")
	self.level_stage = 7#处于哪个等级
	super._ready()
	Monster_group = {
		"stage_1": [14,14,14,14,15,15,15,15],
		"stage_2": [14,14,14,15,15,15,15,14,14,14,15,15,15,14,14,14,14,15,15,15,14,14,14],
		"stage_3": [14,14,14,14,14,15,15,14,14,15,15,14,15,15,14,14,15,15,14,15,15],
		"stage_4": [17],
	}
	Monster_position_x = {
		"stage_1": [900,900,900,900,700,700,700,700],
		"stage_2": [1100,1100,1100,2000,2000,2000,2000,1400,1400,1600,1600,1600,1400,1800,1800,1800,1600,1600,1600,1400,1800,1800,1800],
		"stage_3": [2700,2705,2700,2700,2700,3000,3000,3000,3000,3200,3200,3200,3300,3300,3000,3000,3200,3200,3200,3300,3300],
		"stage_4": [4550],
	}
	Monster_position_y = {
		"stage_1": [300,300,300,300,300,300,300,300,300],
		"stage_2": [250,250,250,250,250,250,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_3": [200,200,200,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
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
		stop_5.disabled = false
		stop_3.disabled = false
