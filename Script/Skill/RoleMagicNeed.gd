extends Node2D
@onready var infor: Label = $PanelContainer/Infor

var Skill_name: String
var CurrentNeed: int
var NextNeed: int

func _physics_process(delta: float) -> void:
	infor.text = "技能名：" + str(Skill_name) + '，魔耗：' + str(CurrentNeed) + "  →  " + str(NextNeed)
	set_physics_process(false)
