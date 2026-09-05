extends BaseLevel
class_name Level17
@onready var text_2: Label = $CanvasLayer/text/text2

func _ready() -> void:
	Global.CurrentLevel = "忘川河"
	Global.PlayerBeHitCount = 0
	Global.addBGM_(self,"res://Music/level/9_bg3.mp3")
	self.level_stage = 1
	super._ready()
	Monster_group = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_x = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	Monster_position_y = {
		"stage_1": [],
		"stage_2": [],
		"stage_3": [],
		"stage_4": [],
	}
	
func _physics_process(delta: float) -> void:
	text_2.text = str(Global.PlayerBeHitCount)
	super._physics_process(delta)	
	if current_stage >= 1:
		if current_stage < 4:
			role_information.gogo.visible = true
		else:
			role_information.gogo.visible = false



func _on_hddy_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		if PlayerData.get_item_data("bsz") > 0:
			PlayerData.remove_dj("bsz",PlayerData.get_dj_page("bsz"),1)
			MemoryClass.保存游戏(Global.cd_path)
			Global.change_secen("res://Scene/Level/Level_hddy.tscn")
		else:
			RoleProp.roleprop.Hp = -100
		#if 
