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
var trap_sky_11
var trap_sky_12
var trap_sky_13
var trap_sky_14
var trap_sky_15
var trap_sky_16
var trap_sky_17
var trap_sky_18
var trap_sky_19
var trap_sky_20
var _1 = preload("res://Scene/Monster/Monster_13.tscn")
var _2 = preload("res://Scene/Monster/Monster_9.tscn")
var _3 = preload("res://Scene/Monster/Monster_10.tscn")
var _4 = preload("res://Scene/Monster/Monster_12.tscn")
func _ready() -> void:
	Global.CurrentLevel = "迦楼罗之穴"
	Global.addBGM_(self,"res://Music/level/7_bg2.mp3")
	add_trap_sky()
	set_trap_floor()
	self.level_stage = 6
	super._ready()
	Monster_group = {
		"stage_1": [13,13,13,13,9,9,9,9,9],
		"stage_2": [13,13,13,9,9,9,10,10,10,10,10,13,13,13,10,10,13,13,13],
		"stage_3": [13,13,9,9,9,10,10,10,13,13,10,10,10,10,10,13,13,13,13,13],
		"stage_4": [12],
	}
	Monster_position_x = {
		"stage_1": [750,750,750,750,750,1000,1000,1000,1000],
		"stage_2": [1650,1650,1650,1850,1850,1850,2100,2100,2100,2100,1500,1500,1500,1500,2100,1500,1500,1500,1500],
		"stage_3": [3350,2750,3350,2750,3000,3000,3000,3000,3400,3400,3400,3100,3100,3100,3200,3400,3100,3100,3100,3200],
		"stage_4": [4500],
	}
	Monster_position_y = {
		"stage_1": [300,300,300,300,300,300,300,300,300],
		"stage_2": [300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_3": [100,100,100,100,100,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300],
		"stage_4": [200],
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
	Global.add_Trap(self,Vector2(1350,400),"Trap_2")
	Global.add_Trap(self,Vector2(1400,400),"Trap_2")
	Global.add_Trap(self,Vector2(1450,400),"Trap_2")
	Global.add_Trap(self,Vector2(1650,400),"Trap_2")
	Global.add_Trap(self,Vector2(1700,400),"Trap_2")
	#=============
	Global.add_Trap(self,Vector2(1750,400),"Trap_2")
	Global.add_Trap(self,Vector2(1950,400),"Trap_2")
	Global.add_Trap(self,Vector2(2000,400),"Trap_2")
	Global.add_Trap(self,Vector2(2050,400),"Trap_2")
	#============!!!!!!!!!!!!!!
	Global.add_Trap(self,Vector2(3200,400),"Trap_2")
	Global.add_Trap(self,Vector2(3250,400),"Trap_2")
	Global.add_Trap(self,Vector2(3300,400),"Trap_2")
	Global.add_Trap(self,Vector2(3350,400),"Trap_2")
	Global.add_Trap(self,Vector2(3400,400),"Trap_2")
#	#@==========
#	Global.add_Trap(self,Vector2(3100,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3150,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3200,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3250,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3300,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3350,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3400,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3450,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3500,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3550,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3600,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3650,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3700,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3750,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3800,400),"Trap_2")
#	Global.add_Trap(self,Vector2(3850,400),"Trap_2")
func add_trap_sky():
	if trap_sky_1 == null:
		trap_sky_1 = Global.add_Trap(self,Vector2(450,-100),"Trap_1")
	if trap_sky_2 == null:
		trap_sky_2 = Global.add_Trap(self,Vector2(510,-100),"Trap_1")
	if trap_sky_3 == null:
		trap_sky_3 = Global.add_Trap(self,Vector2(560,-100),"Trap_1")
	if trap_sky_4 == null:
		trap_sky_4= Global.add_Trap(self,Vector2(610,-100),"Trap_1")
	if trap_sky_5 == null:
		trap_sky_5 = Global.add_Trap(self,Vector2(1500,-100),"Trap_1")
	if trap_sky_6 == null:
		trap_sky_6 = Global.add_Trap(self,Vector2(1550,-100),"Trap_1")
	if trap_sky_7 == null:
		trap_sky_7 = Global.add_Trap(self,Vector2(1600,-100),"Trap_1")
	if trap_sky_8 == null:
		trap_sky_8 = Global.add_Trap(self,Vector2(1800,-100),"Trap_1")
	if trap_sky_9 == null:
		trap_sky_9 = Global.add_Trap(self,Vector2(1850,-100),"Trap_1")
	if trap_sky_10 == null:
		trap_sky_10 = Global.add_Trap(self,Vector2(1900,-100),"Trap_1")
		
	if trap_sky_11 == null:
		trap_sky_11 = Global.add_Trap(self,Vector2(3550,-100),"Trap_1")
	if trap_sky_12 == null:
		trap_sky_12 = Global.add_Trap(self,Vector2(3600,-100),"Trap_1")
	if trap_sky_13 == null:
		trap_sky_13 = Global.add_Trap(self,Vector2(3650,-100),"Trap_1")
	if trap_sky_14 == null:
		trap_sky_14= Global.add_Trap(self,Vector2(3700,-100),"Trap_1")
	if trap_sky_15 == null:
		trap_sky_15 = Global.add_Trap(self,Vector2(3750,-100),"Trap_1")
	if trap_sky_16 == null:
		trap_sky_16 = Global.add_Trap(self,Vector2(2550,-100),"Trap_1")
	if trap_sky_17 == null:
		trap_sky_17 = Global.add_Trap(self,Vector2(2600,-100),"Trap_1")
	if trap_sky_18 == null:
		trap_sky_18 = Global.add_Trap(self,Vector2(2650,-100),"Trap_1")
	if trap_sky_19 == null:
		trap_sky_19 = Global.add_Trap(self,Vector2(2700,-100),"Trap_1")
