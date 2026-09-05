extends CharacterBody2D
@onready var hit_box: Area2D = $HitBox
@onready var trap_player: AnimationPlayer = $TrapPlayer
@onready var trap_an: AnimatedSprite2D = $TrapAN
var hit_name
var get_name_
var can_drop
var is_play
var total_hit = 0
var objattackDic = {}
enum {
	do,
	remove
}
func _physics_process(delta: float) -> void:
	wait_(get_name_)
	if can_drop:
		if not is_on_floor():
			velocity.y -= delta * -780
	
	if get_name_ == "Trap_1":
		if is_on_floor():
			queue_free()
	move_and_slide()
func _on_hit_box_area_entered(area: Area2D) -> void:
	match get_name_:
		"Trap_1":
			hit_name = "Trap_1"
			self.objattackDic["Trap_1"] = {
				"power": 50,
				"hurtBack":[15,-15],
				"attackKind": "real"
			}
		"Trap_2":
			hit_name = "Trap_2"
			self.objattackDic["Trap_2"] = {
				"power": 50,
				"hurtBack":[15,-15],
				"attackKind": "real"
			}
	
	var target = area.get_parent().get_parent()
	if target is BaseHero:
		target.reduce_hp(objattackDic[hit_name]["power"],self,self)
		if RoleProp.is_ws_state:
			return
		if target is role3:
			if target.Is_sdBuff:
				return
		if target is role3:
			if target.IsTMc:
				return
		target.state_behit()
		if randi_range(0,100) < 50:
			target.attack_to_left(self,self)
		else:
			target.attack_to_right(self,self)

func wait_(name_):
	match name_:
		"Trap_1":
			trap_player.play("Trap_1_1")
		"Trap_2":
			trap_player.play("Trap_2")
func _on_check_who_area_entered(_area: Area2D) -> void:
	can_drop = true
