extends BaseLevel
class_name Level27
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var door_check: Area2D = $DoorCheck
@onready var stop_5: CollisionShape2D = $wall/stop5

var HitCount: int = 0
var IsOpen: bool
var CanThrough: bool
func _ready() -> void:
	Global.CurrentLevel = "北天王殿"
	Global.addBGM_(self,"res://Music/level/sdtw.mp3")
	self.level_stage = 26
	super._ready()
	Monster_group = {
		"stage_1": [81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81],
		"stage_2": [81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82],
		"stage_3": [81,81,81,80,80,80,82,82,82,80,81,82,82,81,80,80,80,81,81,82,82,81,80,81,82,82,82,82,81,82,80,82,81,81,80,82],
		"stage_4": [85],
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
	if HitCount >= 5:
		if not IsOpen:
			$mm.play("open")
			IsOpen = true
	super._physics_process(delta)	
	if CanThrough:
		if Input.is_action_pressed("Exit"):
			get_tree().change_scene_to_file("res://Scene/Level/Level_ymj.tscn")
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

func _on_door_check_area_entered(area: Area2D) -> void:
	HitCount += 1
	Global.add_mr_hurt(door_check,Vector2(0,0))


func _on_csm_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		CanThrough = true



func _on_csm_body_exited(body: Node2D) -> void:
	CanThrough = false
