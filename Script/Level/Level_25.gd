extends BaseLevel
class_name Level25
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var stage: Node2D = $Stage
@onready var trap: Node2D = $Trap
@onready var stop_5: CollisionShape2D = $wall/stop5

##81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81
#81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82
#81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82,81,82,80,82,81,81,80,82
func _ready() -> void:
	Global.CurrentLevel = "南天王殿"
	Global.addBGM_(self,"res://Music/level/sdtw.mp3")
	self.level_stage = 24
	AddTrap()
	super._ready()
	Monster_group = {
		"stage_1": [81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81],
		"stage_2": [81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82],
		"stage_3": [81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82,81,82,80,82,81,81,80,82],
		"stage_4": [83],
	}
	Monster_position_x = {
		"stage_1": [150,450,850,150,450,850,150,450,850,200,650,200,650,200,650,200,650,200,650,850],
		"stage_2": [1250,1550,1850,2150,1250,1550,1850,2150,1250,1550,1850,2150,1250,1550,1850,2150,1250,1550,1850,2150,1250,1550,1850,2150,
		1250,1550,1850,2150,1250,1550,1850,2150],
		"stage_3": [2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,
		2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000,3450,2550,3000],
		"stage_4": [4500],
	}
	Monster_position_y = {
		"stage_1": [435,435,435,435,435,435,435,435,435,195,255,195,255,185,255,185,255,185,255,185,255,185,255,435],
		"stage_2": [435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,
		435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435],
		"stage_3": [185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,
		185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235,95,185,235],
		"stage_4": [450],
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

func AddTrap():
	Global.AddZZTWTrap(trap,"Trap1",Vector2(135,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(180,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(225,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(270,120))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(895,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(945,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(995,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(1045,635))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(1230,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(1275,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(1320,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(1365,120))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(1495,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(1545,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(1595,635))
	Global.AddZZTWTrap(trap,"Trap3",Vector2(1645,635))
	
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2465,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2510,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2555,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2600,120))
	
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2880,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2925,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(2970,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3015,120))
	
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3395,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3440,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3485,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3530,120))
	Global.AddZZTWTrap(trap,"Trap1",Vector2(3575,120))
