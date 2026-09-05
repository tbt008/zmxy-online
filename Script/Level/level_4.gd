extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var trap_sky_1
var trap_sky_2
var trap_sky_3
var trap_sky_4
var trap_sky_5
var trap_sky_6
var trap_sky_7
var trap_sky_8
var trap_sky_9
var trap_sky_10
var _1 = preload("res://Scene/Monster/Monster_7.tscn")
var _2 = preload("res://Scene/Monster/Monster_8.tscn")
func _ready() -> void:
	Global.CurrentLevel = "蝙蝠窟"
	Global.addBGM_(self,"res://Music/level/7_bg2.mp3")
	add_trap_sky()
	set_trap_floor()
	self.level_stage = 4
	super._ready()
	Monster_group = {
		"stage_1": [7,7,7,7,7,7,7,7,7],
		"stage_2": [7,7,7,7,7,7,7,7,7,7,7,7,7,7],
		"stage_3": [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7],
		"stage_4": [7,7,7,7,7,8],
	}
	Monster_position_x = {
		"stage_1": [700,700,700,700,700,700,700,700,700],
		"stage_2": [2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000],
		"stage_3": [3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000,3000],
		"stage_4": [4500,4500,4500,4500,4500,4350],
	}
	Monster_position_y = {
		"stage_1": [300,300,300,300,300,300,300,300,300],
		"stage_2": [300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_3": [300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_4": [300,300,300,300,300,465],
	}
func _physics_process(delta: float) -> void:
	add_trap_sky()
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
func set_trap_floor():
	Global.add_Trap(self,Vector2(350,400),"Trap_2")
	Global.add_Trap(self,Vector2(400,400),"Trap_2")
	Global.add_Trap(self,Vector2(450,400),"Trap_2")
	Global.add_Trap(self,Vector2(500,400),"Trap_2")
	Global.add_Trap(self,Vector2(550,400),"Trap_2")
	#=============
	Global.add_Trap(self,Vector2(1500,400),"Trap_2")
	Global.add_Trap(self,Vector2(1550,400),"Trap_2")
	Global.add_Trap(self,Vector2(1600,400),"Trap_2")
	Global.add_Trap(self,Vector2(1650,400),"Trap_2")
	#============
	
	Global.add_Trap(self,Vector2(1800,400),"Trap_2")
	Global.add_Trap(self,Vector2(1850,400),"Trap_2")
	Global.add_Trap(self,Vector2(1900,400),"Trap_2")
	Global.add_Trap(self,Vector2(1950,400),"Trap_2")
func add_trap_sky():
	if trap_sky_1 == null:
		trap_sky_1 = Global.add_Trap(self,Vector2(1000,-100),"Trap_1")
	if trap_sky_2 == null:
		trap_sky_2 = Global.add_Trap(self,Vector2(1100,-100),"Trap_1")
	if trap_sky_3 == null:
		trap_sky_3 = Global.add_Trap(self,Vector2(1200,-100),"Trap_1")
	if trap_sky_4 == null:
		trap_sky_4= Global.add_Trap(self,Vector2(2750,-100),"Trap_1")
	if trap_sky_5 == null:
		trap_sky_5 = Global.add_Trap(self,Vector2(2900,-100),"Trap_1")
	if trap_sky_6 == null:
		trap_sky_6 = Global.add_Trap(self,Vector2(3050,-100),"Trap_1")
	if trap_sky_7 == null:
		trap_sky_7 = Global.add_Trap(self,Vector2(3750,-100),"Trap_1")
	if trap_sky_8 == null:
		trap_sky_8 = Global.add_Trap(self,Vector2(3950,-100),"Trap_1")
	if trap_sky_9 == null:
		trap_sky_9 = Global.add_Trap(self,Vector2(4100,-100),"Trap_1")
	if trap_sky_10 == null:
		trap_sky_10 = Global.add_Trap(self,Vector2(3650,-100),"Trap_1")
		
