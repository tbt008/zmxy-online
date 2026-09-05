extends Node2D
var GetPlayer: BaseHero
var AddCount: int = 0
@onready var pler: AnimationPlayer = $Pler
func _ready() -> void:
	pler.play("wang")
func _physics_process(delta: float) -> void:
	if GetPlayer != null:
		GetPlayer.velocity.x = 0
		GetPlayer.velocity.y = 0
	if AddCount % 30 == 0:
		if GetPlayer != null:
			Global.AddBuff(GetPlayer.buff,{
			"Name": "stun",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		})
	AddCount += 1

func _on_check_body_entered(body: Node2D) -> void:
	if body is BaseHero:
		GetPlayer = body
		Global.AddBuff(body.buff,{
			"Name": "stun",
			"AddTime": 1,
			"ReduceInterval": 0,
			"value": 0,
			"AttackKind": "",
		})


func _on_check_body_exited(body: Node2D) -> void:
	GetPlayer = null
