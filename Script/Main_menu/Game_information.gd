extends Node2D
var show_czzn: bool
var show_yxxq: bool
var show_yxgg: bool
var title: String
@onready var czzn: MarginContainer = $ColorRect/czzn
@onready var yxxq: MarginContainer = $ColorRect/yxxq
@onready var yxgg: MarginContainer = $ColorRect/yxgg
@onready var Title: Label = $ColorRect/title
func _ready() -> void:
	show_czzn = true
	show_yxxq = false
	show_yxgg = false
	Title.text = "操作指南"
func _physics_process(_delta: float) -> void:
	if show_czzn:
		Title.text = "操作指南"
		czzn.visible = true
	else:
		czzn.visible = false
	if show_yxgg:
		Title.text = "游戏公告"
		yxgg.visible = true
	else:
		yxgg.visible = false
	if show_yxxq:
		Title.text = "游戏详情"
		yxxq.visible = true
	else:
		yxxq.visible = false


func _on_czzn_pressed() -> void:
	Global.AddSomeMonsterHelp(self,Vector2(0,0))
	return
	show_czzn = true
	show_yxxq = false
	show_yxgg = false
	


func _on_yxxq_pressed() -> void:
	return
	show_czzn = false
	show_yxxq = true
	show_yxgg = false


func _on_yxgg_pressed() -> void:
	return
	show_czzn = false
	show_yxxq = false
	show_yxgg = true


func _on_close_pressed() -> void:
	queue_free()
