extends BaseLevel
class_name level15
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var liggt_: Timer = $Liggt_
@onready var light_1: Sprite2D = $light_1
@onready var light_2: Sprite2D = $light_2
@onready var light_3: Sprite2D = $light_3
@onready var light_4: Sprite2D = $light_4
@onready var light_5: Sprite2D = $light_5
@onready var light_6: Sprite2D = $light_6
@onready var stop_5: CollisionShape2D = $wall/stop5

var current_times = 1
var max_times = 6
var _2 = preload("res://Scene/Monster/Monster_41.tscn")
var _3 = preload("res://Scene/Monster/Monster_38.tscn")
var _4 = preload("res://Scene/Monster/Monster_39.tscn")
var _5 = preload("res://Scene/Monster/Monster_40.tscn")
var _6 = preload("res://Scene/Monster/Monster_30.tscn")
var _7 = preload("res://Scene/Monster/Monster_31.tscn")
func _ready() -> void:
	Global.CurrentLevel = "判官府"
	Global.addBGM_(self,"res://Music/level/4_bg2.mp3")
	self.level_stage = 15
	super._ready()
	Monster_group = {
		"stage_1": [39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40],
		"stage_2": [39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,31,30,31,30,31,30,31,30],
		"stage_3": [39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,39,40,31,30,31,30,31,30,31,30,31,30,31,30,31,30,31,30],
		"stage_4": [41],
	}
	Monster_position_x = {
		"stage_1": [50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000],
		"stage_2": [1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,
		1200,2150,1200,2150,1200,2150,1200,2150],
		"stage_3": [2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,
		2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,],
		"stage_4": [4550],
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
func add_ini():
	light_1.visible = true
	light_2.visible = true
	light_3.visible = true
	light_4.visible = true
	light_5.visible = true
	light_6.visible = true
	current_times = 0
	liggt_.wait_time = 16
	liggt_.start()
func _on_liggt__timeout() -> void:
	match current_times:
		0:
			$light_1.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.Hp * 0.10)
		1:
			$light_2.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.Hp * 0.20)
		2:
			$light_3.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.Hp * 0.30)
		3:
			$light_4.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.Hp * 0.40)
		4:
			$light_5.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.Hp * 0.50)
		5:
			$light_6.visible = false
			RoleProp.roleprop.Hp -= int(RoleProp.roleprop.SHp)
	current_times += 1	
			
			
