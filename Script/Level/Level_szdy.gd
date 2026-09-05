extends BaseLevel
#@onready var stop_1: CollisionShape2D = $wall/stop1
#var is_cc = false
#func _ready() -> void:
#	Global.addBGM_(self,"res://Music/level/2_bg4.mp3")
#	preload("res://Scene/Monster/Monster_70.tscn")
#	self.level_stage = 1
#	super._ready()
#	Monster_group = {
#		"stage_1": [70],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#	Monster_position_x = {
#		"stage_1": [850],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#	Monster_position_y = {
#		"stage_1": [200],
#		"stage_2": [],
#		"stage_3": [],
#		"stage_4": [],
#	}
#func _physics_process(delta: float) -> void:
#	if not is_cc:
#		if Role_.position.x >= 600:
#			create_control.wait_time = 3
#			create_control.start()	
#			is_cc = true
#			role_information.gogo.visible = false
#		else:
#			create_control.wait_time = 3
#			create_control.start()	
#	super._physics_process(delta)	
#	my_camera.max_right = 936
#	if current_stage >= 1:
#		if check_can_pass() and current_stage < 1:
#			role_information.gogo.visible = true
#		else:
#			role_information.gogo.visible = false
