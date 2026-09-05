extends Node2D
var Idle = true
var Value: int
@onready var chekc: CollisionShape2D = $Check/Chekc

var Speed: float = 0
var tween
var TargetMonster:Monster141
func _ready() -> void:
	self.modulate = Color(1,1,1,0)
	
func _physics_process(delta: float) -> void:
	if Idle:
		tween = create_tween().set_parallel(true)
		tween.tween_property(self,'modulate',Color(1,1,1,1),1.5)
		tween.tween_property(self,"position",position + Vector2(0,-randi_range(20,40)),0.4)
		await get_tree().create_timer(0.6,false).timeout
		Idle = false
	if not Idle:
		self.position += Global.GetPositionBetween(self,TargetMonster) * Speed * 0.5
		chekc.disabled = false
		if TargetMonster == null:
			self.queue_free()
		Speed += 0.2
		if Speed >= 20:
			Speed = 20


func _on_check_body_entered(body: Node2D) -> void:
	if body is Monster141:
		var CureValue = int(body.SHp - body.Hp) * 0.03
		body.cure_hp(CureValue)
		queue_free()
