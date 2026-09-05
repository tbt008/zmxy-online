extends Node2D
var HitCount: int = 0
@onready var b_sz: AnimationPlayer = $BSz

func _physics_process(delta: float) -> void:
	if HitCount >= 5:
		b_sz.play("death")
func _on_area_2d_area_entered(area: Area2D) -> void:
	HitCount += 1
	Global.add_mr_hurt(self,Vector2(0,0))


func fall_item():
	if randi_range(0,100) <= 50:
		var par = get_parent() as BaseLevel
		Global.fall_item(par.fall_it,Vector2(self.position.x,self.position.y + 100),"bsz",1)

