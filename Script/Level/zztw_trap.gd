extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var Drop: bool
var MyName: String
var objattackDic = {}
var hit_name
func _physics_process(delta: float) -> void:
	hit_name = MyName
	self.objattackDic["Trap1"] = {
		"power": RoleProp.roleprop.SHp * 0.05,
		"hurtBack":[15,-15],
		"attackKind": "real"
	}
	self.objattackDic["Trap2"] = {
		"power": RoleProp.roleprop.SHp * 0.05,
		"hurtBack":[15,-15],
		"attackKind": "real"
	}
	self.objattackDic["Trap3"] = {
		"power": RoleProp.roleprop.SHp * 0.05,
		"hurtBack":[15,-15],
		"attackKind": "real"
	}
	if MyName == "Trap1":
		if not Drop:
			animation_player.play("Trap2")
	if MyName == "Trap3":
		animation_player.play("Trap3")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if MyName == "Trap1":
		Drop = true
		animation_player.play("Trap1")
		await animation_player.animation_finished
		animation_player.play("Trap2")
		Drop = false


func _on_hit_box_area_entered(area: Area2D) -> void:
	var target = area.get_parent().get_parent()
	if target is BaseHero:
		target.reduce_hp(RoleProp.roleprop.SHp * 0.05,self,self)
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
