extends BaseLevel
class_name Level20
@onready var stop_1: CollisionShape2D = $wall/stop1
@onready var stop_2: CollisionShape2D = $wall/stop2
@onready var stop_3: CollisionShape2D = $wall/stop3
var Color_list = ["00ffff"]
var _2 = preload("res://Scene/Monster/Monster_46.tscn")
var _3 = preload("res://Scene/Monster/Monster_45.tscn")
var _4 = preload("res://Scene/Monster/Monster_44.tscn")
var _5 = preload("res://Scene/Monster/Monster_49.tscn")
var CanPass  = false
func _ready() -> void:
	Global.CurrentLevel = ""
	var RoleId = PlayerData.player_data["Myself"]
	Role_ = Global.call_hero("role_" + str(RoleId),hero,Vector2(4100,340),false)
	self.modulate = Color(1,1,1,1)
	front.modulate = Color(1,1,1,1)
	floor_2.modulate = Color(1,1,1,1)
	end.modulate = Color(1,1,1,1)
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self,"modulate", Color(1,1,1,1),3)
	tween.tween_property(end,"modulate", Color("00ffff"),3)
	tween.tween_property(floor_2,"modulate", Color("00ffff"),3)
	tween.tween_property(front,"modulate", Color("00ffff"),3)
	current_stage = 4
	Global.addBGM_(self,"res://Music/level/9_bg3.mp3")
	self.level_stage = 1
	if Role_ != null:
		my_camera = Global.add_Camera(Role_,Vector2(0,0),1100)
		my_camera.max_left = 0
		my_camera.max_top = 0
		my_camera.max_bottom = 590
		my_camera.max_right = 4600
	if role_information == null:
		role_information = Global.add_role_information(self,Vector2(0,0))
	RoleProp.roleprop.Hp = RoleProp.CurrentHp
	RoleProp.roleprop.Mp = RoleProp.CurrentMp
	Monster_group = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [49],
	}
	Monster_position_x = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [4550],
	}
	Monster_position_y = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [250],
	}
	Global.LastLevelPath = "res://Scene/Level/Level_19.tscn"
func _physics_process(delta: float) -> void:
	super._physics_process(delta)	
	if current_stage >= 1:
		if check_can_pass() and current_stage < 4:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false
func set_through():
	pass

