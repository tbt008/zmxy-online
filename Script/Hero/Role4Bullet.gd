extends Node2D
class_name Role4Bullet
var Player: BaseHero
var OldMonster: BaseMonster
var TargetMonster: BaseMonster
var HitCount: int = 0
var Speed = 10
var IsSet: bool
func _physics_process(delta: float) -> void:
	if not IsSet:
		TargetMonster = CheckMonster()
		OldMonster = TargetMonster
		IsSet = true
	if TargetMonster != null:
		self.position += Global.GetPositionBetween(self,TargetMonster) * Speed
	else:
		queue_free()
	if TargetMonster == null or OldMonster == null:
		self.queue_free()
func _on_queue_timer_timeout() -> void:
	queue_free()
func CheckMonster():
	var MrList = []
	if Player is BaseHero:
		MrList = Player.get_parent().get_parent().monster.get_children()
	for i in  MrList:
		if i != null:
			if i is BaseMonster:
				if i != OldMonster:
					return i
	return null
func _process(delta: float) -> void:
	if HitCount > 3:
		queue_free()
func _on_check_body_entered(body: Node2D) -> void:
	if body == null:
		return
	if body is BaseMonster:
		if body == TargetMonster:
			OldMonster = TargetMonster
			Global.AddBuff(body.buff,{
			"Name": "Voodoo",
			"AddTime": 5,
			"ReduceInterval": 1,
			"value": 0,
			"CanAdd":true,
			"AttackKind": "real",
		})
			Global.AddBuff(body.buff,{
			"Name": "stun",
			"AddTime": 0.3,
			"ReduceInterval": 0,
			"value": 0,
			"CanAdd":false,
			"AttackKind": "",
		})
			TargetMonster = CheckMonster()
