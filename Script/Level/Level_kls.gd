extends BaseLevel
@onready var stop_1: CollisionShape2D = $wall/stop1
var is_cc = false
var WangWang: Monster144
var wxzw
func _ready() -> void:
	Global.addBGM_(self,"res://Music/level/BGM_Normal.mp3")
	Global.CurrentLevel = ""
	self.level_stage = 0
	super._ready()
	Monster_group = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_x = {
		"stage_1": [100],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_y = {
		"stage_1": [100],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
func _physics_process(delta: float) -> void:
	if WangWang == null:
		WangWang = Global.Create_Monster(144,monster,Vector2(randi_range(850,2700),randi_range(-900,450)))
	my_camera.max_right = 2800
	my_camera.max_top = -930
	role_information.gogo.visible = false



func _on_wxzw_pressed() -> void:
	if RoleProp.baseroleprop.Level < 50:
		Signals.ConnectChooseBoxSignal(self,"ToWXZWFB")
		if wxzw == null:
			wxzw = Global.add_choose_text($CanvasLayer,Vector2(0,0),"推荐50级以上再挑战，确定现在进入挑战吗？(无法使用修成正果头衔)",0)
	else:
		ToWXZWFB()
func ToWXZWFB():
	get_tree().change_scene_to_file("res://Scene/Level/Level_wxzw.tscn")
