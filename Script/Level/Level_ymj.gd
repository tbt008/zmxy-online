extends BaseLevel
class_name Levelymj
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stop_4: CollisionShape2D = $wall/stop4
@onready var stop_5: CollisionShape2D = $wall/stop5



func _ready() -> void:
	Global.CurrentLevel = "御马监"
	Global.addBGM_(self,"res://Music/level/BGM_ymj.mp3")
	self.level_stage = 1
	super._ready()
	Monster_group = {
		"stage_1": [94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95],
		"stage_2": [94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,94,94,94,94,94,94,94,94],
		"stage_3": [94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94,94,95,95,94],
		"stage_4": [134],
	}
	Monster_position_x = {
		"stage_1": [350,800,350,800,350,800,100,1000,100,1000,100,1000,100,1000,100,1000,100,1000,100,1000],
		"stage_2": [1350,1750,2150,1350,1750,2150,1350,1750,2150,1650,1420,1650,1420,1650,1420,1550,2000,1550,2000,1550,2000,1550,2000,1550,2000
		,1400,2000,1400,2000,1400,2000,1400,2000],
		"stage_3": [2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,
		2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250,2850,3250],
		"stage_4": [4500,4500,4500,4500,4500,4500,4500,4500,4500,4500,4500,4500],
	}
	Monster_position_y = {
		"stage_1": [420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420],
		"stage_2": [420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,
		420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420],
		"stage_3": [420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,
		420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420,420],
		"stage_4": [450,450,450,450,450,450,450,450,450,450],
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
