extends Node2D
var Idle = true
var Value: int
@onready var check: CollisionShape2D = $Check/Check
var Speed: float = 0
var tween
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
		self.position += Global.GetPositionBetween(self,RoleProp.SourcePlayer) * Speed * 0.5
		check.disabled = false
		Speed += 0.2
		if Speed >= 20:
			Speed = 20



func _on_check_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		PlayerData.player_data.coin_num += int(Value)
		queue_free()


func _on_move_timeout() -> void:
	pass # Replace with function body.
