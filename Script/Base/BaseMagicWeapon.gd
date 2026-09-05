extends Node2D
class_name BaseMagicWeapon
@onready var mg_action: AnimatedSprite2D = $MgAction
@onready var mg_player: AnimationPlayer = $MgPlayer
@onready var skill_cd: Timer = $SkillCD
@onready var hitbox: CollisionShape2D = $HitBox/HitBox
@onready var hit_box: Area2D = $HitBox
var FB_Level: int
var objattackDic = {}
var set_count: int = 0
var needMp = 20
var is_use = false
var is_canuse = true
var Skill_CD: int
var usecd: float
var Player:BaseHero
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}
var SelfDir: bool
func _physics_process(_delta: float) -> void:
	if not skill_cd.is_stopped():
		if Global.MgCdPic != null:
			Global.MgCdPic.MaxTime = usecd
	if scale.x == -1:
		SelfDir = true
	elif scale.x == 1:
		SelfDir = false
	#print(objattackDic)
	if not self is Mirror and not self is GhostDoll:
		if Global.FB_CD > 0: 
			self.visible = false
		else:
			visible = true
	if not is_use:
		mg_player.play("wait")
	if is_use:
		if is_canuse:
			UseSkill()
			is_canuse = false
	elif Skill_CD > 0:
		is_canuse = false
	set_count += 1
	if set_count % 30 == 0 and not is_use:
		FixHero()
func UseSkill():
	if EnoughMp():
		RoleProp.roleprop.Mp -= needMp
		ShowSkill()
func EnoughMp():
	return RoleProp.roleprop.Mp > needMp
	
func ShowSkill():
	pass	
	
	
func FixHero():
	var get_Roleposition = Vector2(RoleProp.role_pos_x,RoleProp.role_pos_y)
	var newposition: Vector2
	if RoleProp.Directon:
		scale.x = -1
		#mg_action.flip_h = true
		SelfDir = true
		newposition = get_Roleposition - Vector2(100,180)
	else:
		#mg_action.flip_h = false
		SelfDir = false
		scale.x = 1
		newposition = get_Roleposition - Vector2(-100,180)
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",newposition,0.5)
	

func Useover():
	is_use = false
	


func _on_skill_cd_timeout() -> void:
	Global.FB_CD = -10
	is_canuse = true
	skill_cd.stop()
