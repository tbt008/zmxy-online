extends Node2D
class_name Role1Shallow
var direction: int
var action: String#技能动作
var iniaction: int#初始动作
var is_set = false
var is_attacking = false
var dir: int#方向
var is_Get = false
@onready var role_1_shallow: Area2D = $Role1Shallow
@onready var role_action: Sprite2D = $RoleAction
@onready var role_player: AnimationPlayer = $RolePlayer
@onready var wait: Timer = $wait
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}

func _physics_process(_delta: float) -> void:
	self.scale.x = direction
	if not is_set:
		role_action.set_frame(iniaction)
		wait.start(2.5)
		role_player.play("wait")
		is_set = true
	if action == "zz" and not is_attacking:
		do_hit_1()
	elif action == "lyfb" and not is_attacking:
		do_hit_2()	

func do_hit_1():
	is_attacking = true
	role_player.play("zz")
	await role_player.animation_finished
func do_hit_2():
	is_attacking = true
	role_player.play("lyfb")
	await role_player.animation_finished	


func _on_wait_timeout() -> void:
	queue_free()
func add_music(idx):
	match idx:
		0:
			Global.addSound_(self,"res://Music/Hero/1_Role1_hit9.mp3")
		1:
			Global.addSound_(self,"res://Music/Hero/39_Role1_hit3AndHit4.mp3")
		2:
			Global.addSound_(self,"res://Music/Hero/38_Role1_hit5.mp3")
		3:
			Global.addSound_(self,"res://Music/Hero/18_Role1_hit14.mp3")
		4:
			Global.addSound_(self,"res://Music/Hero/45_Role1_hit12_1.mp3")
		5:
			Global.addSound_(self,"res://Music/Hero/42_Role1_hit11.mp3")
		6:
			Global.addSound_(self,"res://Music/Hero/26_Role1_hit13_1.mp3")
