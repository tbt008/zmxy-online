extends Node2D
@onready var front_bg: ColorRect = $bg/lh_pic/front_bg
@onready var Title: Label = $bg/lh_pic/front_bg/Title
@onready var Lh_value: Label = $bg/lh_pic/lh_value
#主动技能位置：(40,50)
var zd_sk
var bd_sk
var is_zd: bool = false
var is_bd: bool = false
func _ready() -> void:
	is_zd = true
	zd_sk = Global.add_zd_skillscene(front_bg,Vector2(40,50))
	is_bd = false

func _physics_process(_delta: float) -> void:
	if is_zd:
		Title.text = "主动技能"
	if is_bd:
		Title.text = "被动技能"
	Lh_value.text = str(PlayerData.player_data["coin_num"])

func _on_zd_skill_pressed() -> void:
	is_zd = true
	is_bd = false
	if zd_sk == null:
		zd_sk = Global.add_zd_skillscene(front_bg,Vector2(40,50))
	if bd_sk != null:
		bd_sk.queue_free()
func _on_bd_skill_pressed() -> void:
	is_zd = false
	is_bd = true
	if bd_sk == null:
		bd_sk = Global.add_bd_skillscene(front_bg,Vector2(10,50))
	if zd_sk != null:
		zd_sk.queue_free()
	

func _on_close_pressed() -> void:
	queue_free()
