extends Node
class_name BasicBuff
var CanAdd: bool#是否可以叠加
var Value: float#数值
var AtkKind: String #伤害类型
var AddObj: BaseObject
var AddTimes: int
func _physics_process(delta: float) -> void:
	pass
func _ready() -> void:
	AddObj = get_parent().get_parent()


func _on_cyele_timer_timeout() -> void:
	pass # Replace with function body.


func _on_reduce_timer_timeout() -> void:
	pass # Replace with function body.


func _on_queue_timer_timeout() -> void:
	pass # Replace with function body.
