extends BaseLevel
class_name Level1
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var _1 = preload("res://Scene/Monster/Monster_1.tscn")
var _2 = preload("res://Scene/Monster/Monster_2.tscn")
var _3 = preload("res://Scene/Monster/Monster_3.tscn")
@onready var stop_5: CollisionShape2D = $wall/stop5

func _ready() -> void:
	Global.CurrentLevel = "花果山"
	Global.addBGM_(self,"res://Music/level/1_music.mp3")
	self.level_stage = 1
	super._ready()
	Monster_group = {
		"stage_1": [1,1,1,1,1,1,1,1,1],
		"stage_2": [2,2,2,1,1,2,2,1,1,2,2,2,2,2],
		"stage_3": [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
		"stage_4": [2,2,2,2,2,3],
	}
	Monster_position_x = {
		"stage_1": [500,400,700,700,700,700,700,700,700],
		"stage_2": [2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000],
		"stage_3": [3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000],
		"stage_4": [4500,4500,4500,4500,4500,4500],
	}
	Monster_position_y = {
		"stage_1": [350,320,300,300,300,300,300,300,300],
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
		stop_5.disabled = false
		my_camera.max_left = 3500
		stop_3.disabled = false
