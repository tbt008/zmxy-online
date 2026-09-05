extends BaseLevel
class_name Level28
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
@onready var light: Node2D = $jg/Light
@onready var light_2: Node2D = $jg/Light2
@onready var light_3: Node2D = $jg/Light3
@onready var light_4: Node2D = $jg/Light4
@onready var light_5: Node2D = $jg/Light5
@onready var a_nplayer: AnimationPlayer = $ANplayer
@onready var stop_5: CollisionShape2D = $wall/stop5

var IsPlay:bool
var LightID = [false,true,false,true,false]
func _ready() -> void:
	Global.CurrentLevel = "彩虹楼"
	Global.addBGM_(self,"res://Music/level/Floor_7-10.mp3")
	self.level_stage = 27
	super._ready()
	Monster_group = {
		"stage_1": [86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86],
		"stage_2": [86,86,86,87,87,87,88,88,88,87,86,88,88,86,87,87,87,86,86,88,88,86,87,86,88,88,88,88],
		"stage_3": [86,86,86,87,87,87,88,88,88,87,86,88,88,86,87,87,87,86,86,88,88,86,87,86,88,88,88,88,86,88,87,88,86,86,87,88],
		"stage_4": [89],
	}
	Monster_position_x = {
		"stage_1": [50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000,50,1000],
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
	if light.IsLight == LightID[0]:
		if light_2.IsLight == LightID[1]:
			if light_3.IsLight == LightID[2]:
				if light_4.IsLight == LightID[3]:
					if light_5.IsLight == LightID[4]:
						if not IsPlay:
							a_nplayer.play("floordown")
							IsPlay = true
		
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
func move_playerto_boss():
	var tween = create_tween()
	tween.tween_property(Role_,"position",$Player.position,1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		get_tree().change_scene_to_file("res://Scene/Level/Level_dtwd.tscn")
