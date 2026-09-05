extends Area2D
class_name RolehmzBullet
@onready var spe = $"."
@onready var special_effect_sprited_2d: AnimatedSprite2D = $SpecialEffectSprited2D
@onready var hit_box: CollisionShape2D = $Hit_Box
@onready var special_effect_player: AnimationPlayer = $SpecialEffectPlayer
@onready var check_mr: Area2D = $check_mr
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}
var dire: bool
var scale_: Vector2
var action_name: String
var is_can_hit: bool = false
enum {
	do,
	remove,
	other,
}
var state = do
var tt
func _physics_process(_delta: float) -> void:
	match state:
		do:
			do_action(dire,scale_,action_name)
		remove:
			queue_free()
		other:
			pass
func do_action(dir,sc_,name_):
	self.scale = sc_
	if dir == true:
		self.scale.x = -scale.x
	else:
		self.scale.x = scale.x
	special_effect_player.play(name_)
	await special_effect_player.animation_finished
	state = remove


func _on_check_mr_area_entered(_area: Area2D) -> void:
	is_can_hit = true


func _on_area_entered(area: Area2D) -> void:
	print(area)
