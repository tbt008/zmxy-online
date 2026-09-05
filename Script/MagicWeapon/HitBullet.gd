extends Node2D
class_name MgHit
@onready var hit_bullet: Node2D = $"."
@onready var bullet_player: AnimationPlayer = $BulletPlayer
var Rnd: int
var name_
var objattackDic = {}
var dir: bool
var get_dir: bool
var is_set: bool = false
var PP
var HitDic = {
		"power": 0,
		"hurtBack":[0,0],
		"attackKind": "real"
}#法宝的是由objatt……转成HitDic 所以做的时候还是用objatt就行了
func _physics_process(_delta: float) -> void:
	if not is_set:
		PP = get_parent()
		if PP is BaseMagicWeapon:
			pass
		else:
			PP = PP.get_parent()
		if dir:
			$".".scale.x = -$".".scale.x
		is_set = true
	HitDic = objattackDic
	do_action()
func do_action():
	bullet_player.play(str(name_))
	await bullet_player.animation_finished
func remove_infor():
	BaseHit.Mg_hit = 0
	BaseHit.Mghitbakc_x = 0
	BaseHit.Mghitbakc_y = 0
	BaseHit.Mg_hit_lx = ""


func _on_area_2d_area_entered(area: Area2D) -> void:
	var target = area.get_parent().get_parent()
	if target is BaseMonster:
		if objattackDic.has("addeffect"):
			if objattackDic["addeffect"].size() != 0:
				if randi_range(0,100) < Rnd:
					Global.AddBuff(target.buff,objattackDic["addeffect"])
	if name_ == "MagicUmbrellaBullet":
		self.queue_free()

