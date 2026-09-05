extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var hit_name
var get_name_
var IsHit: bool
var is_play
var total_hit = 0
var objattackDic = {}
var Player
var HitCount: int = 0
func _physics_process(delta: float) -> void:
	var Parent = get_parent()
	Player = Parent.Role_
	if not IsHit:
		HitCount = 0
		animation_player.play("Empty")
	else:
		if HitCount % 120 == 0:
			animation_player.play("Hit")
		HitCount += 1


func _on_hix_box_area_entered(area: Area2D) -> void:
	hit_name = "Trap_1"
	self.objattackDic["Trap_1"] = {
		"power": int(RoleProp.roleprop.SHp * 0.05),
		"hurtBack":[15,-15],
		"attackKind": "real"
	}
	if Player is BaseHero:
		Global.AddBuff(Player.buff,{
			"Name": "Fire",
			"AddTime": 2,
			"ReduceInterval": 0.5,
			"value": int(RoleProp.roleprop.SHp * 0.01),
			"AttackKind": "magic",
			"CanAdd":false,
			"DeBuff": true,
		})
	var target = area.get_parent().get_parent()
	if target is BaseHero:
		#target.reduce_hp(objattackDic[hit_name]["power"],self,self)
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	IsHit = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	IsHit = false
