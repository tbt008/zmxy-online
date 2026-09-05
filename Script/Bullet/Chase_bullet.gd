extends Node2D
class_name ChaseBullet
var speed_
var time_
var name_
var dir: bool
#===========传入
@onready var que: Timer = $que
@onready var chase_player: AnimationPlayer = $ChasePlayer
@onready var chase_ani = $Chaseani
var level = 0
var def = 0
var mdef = 0
var crit = 0
var miss = 0
var lucky = 0
var Htarget = 0
var Toughness = 0
var ar = 0
var sp = 0
var Critreduce = 0
var AttList
var objattackDic = {}
var hit_name
var total_hit = 0
var is_get = false
var is_set = false
var velocity: Vector2:
	set(val):
		velocity = val
		rotation = velocity.angle()

func _physics_process(delta: float) -> void:
	
	get_prop()
	if not is_set:
		que.wait_time = float(time_)
		que.start()
		chase_player.play(name_)
		is_set = true
		
	var desired_angle = global_position.direction_to(Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y)).angle()
	var cur_angle = lerp_angle(rotation,desired_angle,0.05)
	velocity = Vector2.RIGHT.rotated(cur_angle) * speed_
	global_position += velocity * delta
func get_prop():
	var tt = get_parent().get_parent()
	if tt is BaseMonster:
		level = tt.level
		def = tt.def
		mdef = tt.mdef
		crit = tt.crit
		miss = tt.miss
		lucky = tt.lucky
		Htarget = tt.Htarget
		Toughness = tt.Toughness
		ar = tt.ar
		sp = tt.sp
		Critreduce = tt.Critreduce
		total_hit = tt.total_hit
	if hit_name != "":
		self.objattackDic[hit_name] = AttList


func _on_que_timeout() -> void:
	add_otherBullet()
	queue_free()


func _on_hit_box_area_entered(area: Area2D) -> void:
	var target = area.get_parent().get_parent()
	if objattackDic[hit_name].has("addeffect"):
		Global.AddBuff(target.buff,objattackDic[hit_name]["addeffect"])
	add_otherBullet()
	queue_free()
func add_otherBullet():
	match name_:
		"Monster33Bullet":
			Global.add_Bullet("Monster33Bullet",get_parent(),false,1,Vector2(self.position.x,self.position.y),hit_name,AttList)
		"Monster37Bullet":
			Global.add_Bullet("Monster37Bullet",get_parent(),false,1,Vector2(self.position.x,self.position.y),hit_name,AttList)
			Global.add_Bullet("PoisionBullet",get_parent(),false,1,Vector2(self.position.x,self.position.y),hit_name,AttList)
