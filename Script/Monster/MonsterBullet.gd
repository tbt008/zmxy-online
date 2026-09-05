extends Node2D
class_name MonsterBullet
@onready var bullet_player: AnimationPlayer = $BulletPlayer
@onready var bullet_ani: AnimatedSprite2D = $middle/BulletANI
@onready var hit_box: Area2D = $middle/HitBox
@onready var queue_timer: Timer = $queue_timer
@onready var is_throw_close: Timer = $IsThrowClose

#某个怪物使用子弹节点时，需要传入想要的伤害字典！！！！
enum {
	do,
	remove
}
var CanCure: bool
var IsThrow: bool
var ThrowCount: int = 0
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
var state = do
var dir: bool
var speed: float
var bullet_name
var hit
var attackKind
var hurtBack
var hit_name
var total_hit = 0
var ShowMonster71: bool
var FlySpeed: float = 0
var Count: int = 0
@onready var middle: Node2D = $middle
var IsSet:bool
var PlayerPosition
var MyFather: BaseMonster
func _ready() -> void:
	hit_name = hit_name
func _physics_process(_delta: float) -> void:
	ThrowCount += 1 
	if not IsSet:
		PlayerPosition = RoleProp.role_pos
		IsSet = true
	get_prop()
	match state:
		do:
			do_action(skill_name)
		remove:
			pass
	if skill_name == "Monster90Bullet":
		self.position += Global.GetPositionBetween(self,RoleProp.SourcePlayer) * FlySpeed * 0.5
		FlySpeed += 2
		if FlySpeed >= 10:
			FlySpeed = 10
	if skill_name == "Monster101Bullet2":
		if Count % 240 == 0:
			MovePlayerToself()
		Count += 1
func do_action(name_):
	if dir == false:
		middle.scale.x = 1
	else:
		middle.scale.x = -1
	bullet_player.speed_scale = speed
	bullet_player.play(name_)
	if name_ != "Monster55Bullet" or name_ != "Monster58Bullet" or name_ != "Monster101Bullet2" or name_ != "Monster100Bullet":
		await bullet_player.animation_finished
		state = remove

func _on_hit_box_area_entered(area: Area2D) -> void:
	if get_parent().get_parent() is Monster64:
		get_parent().get_parent().TotalHit += 1
	if get_parent().get_parent() is Monster85:
		get_parent().get_parent().HitCount += 1

	var role = area.get_parent().get_parent()
	if role is BaseMonster: return
	if objattackDic != null:
		if typeof(objattackDic) == TYPE_STRING:
			return
		if objattackDic.has(hit_name):
			if objattackDic[hit_name].has("addeffect"):
				if skill_name == "Monster83Bullet":
					if randi_range(0,100) < 65:
						Global.AddBuff(role.buff,objattackDic[hit_name]["addeffect"])
				elif skill_name == "Monster143Bullet2":
					if randi_range(0,100) < 30:
						Global.AddBuff(role.buff,objattackDic[hit_name]["addeffect"])
				else:
					Global.AddBuff(role.buff,objattackDic[hit_name]["addeffect"])
	if skill_name == "Monster143Bullet4":
		queue_timer.start(5)
	if skill_name == "Monster90Bullet":
		queue_free()
func get_prop():
	self.objattackDic[hit_name] = AttList

func CallMonster56Bullet():
	state = remove
	bullet_player.speed_scale = 1.8
	bullet_player.play("Monster56Bullet")
	await bullet_player.animation_finished
	#state = remove
func shake(strength,times,interv):
	var baselevel = get_parent().get_parent().get_parent().get_parent() as BaseLevel
	baselevel.shake_(strength,times,interv)
func Monster70Bullet2():
	if get_parent().get_parent() is BaseMonster:
		var po = Vector2()
		if not dir:
			po = Vector2(-168,140)
		else:
			po = Vector2(168,140)
		if ShowMonster71:
			Global.add_Bullet("Monster70Bullet2",get_parent().get_parent().bullet,dir,1,po + position,hit_name,objattackDic)	
func MovePlayerToself():
	var tween = create_tween()
	tween.tween_property(RoleProp.SourcePlayer,"position",position,0.6)
func TweenToPlayer():
	await get_tree().create_timer(0.2,false).timeout
	var desired_angle
	desired_angle = position.angle_to_point(RoleProp.SourcePlayer.position)
	var tween = get_tree().create_tween()
	tween.tween_property(self,"rotation",desired_angle,0.2)
func CallMonster114Bullet():
	var Bullet = Global.add_Bullet("Monster114Bullet2",get_parent().get_parent().bullet,false,2, Vector2(9,-120) + position,hit_name,objattackDic)	
	Bullet.look_at(get_parent().get_parent().get_Player.position)


func _on_hit_box_body_entered(body: Node2D) -> void:
	if skill_name == "Monster110Bullet":
		if ThrowCount > 60:
			if body is BaseMonster:
				if body is Monster110:
					body.cure_hp(body.SHp * 0.05)
					body.Skill_1_CD = 0
					self.queue_free()
	if skill_name == "Monster142Bullet1":
		if CanCure:
			if body is BaseMonster:
				if body is Monster142:
					body.cure_hp(body.SHp * 0.1)
					body.Skill_1_CD = 0
func CallMonster137Bullet2():
	var Bullet = Global.add_Bullet("Monster137Bullet2",get_parent().get_parent().bullet,false,0.5, Vector2(self.position.x,500),hit_name,objattackDic)	



func LookAtPlayer():
	self.look_at(RoleProp.SourcePlayer.position)
func CanCuree():
	CanCure = true
func Monster143Bullet1Bullet():
	Global.add_SpecialEffect(self,Vector2(0,0),"Monster143Bullet",Vector2(1,1),false,1)
func AddRoundShallow():
	if IsThrow:
		var WS_Effect = preload("res://Scene/Hero/Role_1/WS_Effect.tscn").instantiate()
		WS_Effect.add_child(bullet_ani.duplicate())
		WS_Effect.live_time = 0.4
		WS_Effect.color = Color(1,1,1,0.8)
		WS_Effect.set("position",get("position"))
		get_parent().add_child(WS_Effect)

func _on_queue_timer_timeout() -> void:
	queue_free()


func _on_is_throw_close_timeout() -> void:
	IsThrow = false
