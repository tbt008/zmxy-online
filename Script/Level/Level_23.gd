extends BaseLevel
class_name Level23
@onready var stop_5: CollisionShape2D = $wall/stop5

@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var HurtCount: int = 0
var IsPlay: bool
func _ready() -> void:
	Global.CurrentLevel = "天宫道"
	Global.addBGM_(self,"res://Music/level/Floor1_3.mp3")
	self.level_stage = 22
	super._ready()
	Monster_group = {
		"stage_1": [74,75,74,75,74,75,74,75,74,75,74,75,74,75,74,75,74,75,74,75],
		"stage_2": [74,75,76,74,74,76,74,75,74,75,74,76,74,76,74,76,75,74,74,74,74,75,75,74,74,74,74,74],
		"stage_3": [74,75,76,74,74,76,74,75,74,75,74,76,74,76,74,76,75,74,74,74,74,75,75,74,74,74,74,74,76,76,76,76,76,76,76,76],
		"stage_4": [78,77],
	}
	Monster_position_x = {
		"stage_1": [250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000,250,1000],
		"stage_2": [1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,1200,2150,
		1200,2150,1200,2150,1200,2150,1200,2150],
		"stage_3": [2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,
		2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,2350,3400,],
		"stage_4": [4450,3600],
	}
	Monster_position_y = {
		"stage_1": [475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475],
		"stage_2": [475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,
		475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475],
		"stage_3": [475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,
		475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475,475],
		"stage_4": [470,470],
	}
func _physics_process(delta: float) -> void:
	if HurtCount >= 5:
		if not IsPlay:
			$yun.play("open")
			IsPlay = true
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

func _on_check_area_entered(area: Area2D) -> void:
	HurtCount += 1
	Global.add_mr_hurt($Check,Vector2(0,0))

func _on_tp_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		print("124")
		$TTP.start(5)


func _on_tp_body_exited(body: Node2D) -> void:
	if body is BaseHero:
		$TTP.stop()


func _on_ttp_timeout() -> void:
	get_tree().change_scene_to_file("res://Scene/Level/Level_pty.tscn")
