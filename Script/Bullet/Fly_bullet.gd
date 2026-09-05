extends CharacterBody2D
class_name BaseBullet
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed_
var direction_
var distance: int 
var position_1
var position_2
var name_
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
var skill_name: String
var dir: bool
var speed: float
var bullet_name
var hit
var attackKind
var hurtBack
var hit_name
var total_hit = 0
var is_get = false


func _physics_process(delta: float) -> void:
	get_prop()
	$AnimationPlayer.play(name_)
	if not is_get:
		position_1 = self.position.x
		is_get = true
	
	if direction_ == -1:
		self.scale.x = -self.scale.x
	else:
		self.scale.x = self.scale.x
	velocity.x -= direction_ * speed_ * delta
	check_and_free()
	move_and_slide()


func check_and_free():
	position_2 = self.position.x
	if abs(position_2 - position_1) >= distance:
		self.queue_free()
func _on_hit_area_area_entered(area: Area2D) -> void:
	var target = area.get_parent().get_parent()
	if objattackDic[hit_name].has("addeffect"):
		Global.AddBuff(target.buff,objattackDic[hit_name]["addeffect"])
		#target.push_back(objattackDic[hit_name]["addeffect"])
	if name_ == "Monster14Bullet" or name_ == "Monster41Bullet" or name_ == "Monster99Bullet":
		queue_free()
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
