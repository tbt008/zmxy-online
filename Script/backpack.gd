extends Node2D
var back_target
var set_target
var skill_target
var magic_weapon_target
var pet_target
var bag_is_open = false
var skill_is_open = false
var weap_is_open = false
var pet_is_open = false
var set_is_open = false
@onready var backpack: Node2D = $"."
@onready var backpack_: TextureButton = $"../role_menu/backpack"
@onready var set: TextureButton = $"../role_menu/set"
@onready var skill: TextureButton = $"../role_menu/skill"
@onready var magic_weapon: TextureButton = $"../role_menu/magic_weapon"
@onready var pet: TextureButton = $"../role_menu/pet"
@onready var base_through_level: Node2D = $"../../.."
@onready var role_information: Node2D = $"../.."
var bp_c: int
func _physics_process(_delta: float) -> void:
	bp_c = backpack.get_child_count()
	if Input.is_action_just_pressed("backpack"):
		if back_target == null:
			if bp_c == 0:
				back_target = Global.add_back_pack(backpack,Vector2(430,270))
		else:
			back_target.queue_free()
	if Input.is_action_just_pressed("菜单"):
		if set_target == null:
			if bp_c == 0:
				set_target = Global.add_set_menu(backpack,Vector2(485,270))
		else:
			set_target.queue_free()
	if Input.is_action_just_pressed("技能"):
		if skill_target == null:
			if bp_c == 0:
				skill_target = Global.add_learn_skill(backpack,Vector2(0,0))
		else:
			skill_target.queue_free()
	if Input.is_action_just_pressed("法宝"):
		if PlayerData.player_data["法宝"].size() == 0:
			Global.AddMessageShow(base_through_level.canvas_layer,"您还未装备法宝！！！",1.5,Vector2(460,255))
			#Global.add_moment_text(base_through_level.canvas_layer,Vector2(0,0),"您未装备法宝！！！",2)
		else:
			if magic_weapon_target == null:
				if bp_c == 0:
					magic_weapon_target = Global.add_magp_infor(backpack,Vector2(500,270))
			else:
				magic_weapon_target.queue_free()
	if backpack.get_child_count() > 0:
		get_tree().paused = true
	else:
		get_tree().paused = false


func _on_backpack_pressed() -> void:
	if back_target == null:
		if bp_c == 0:
			back_target = Global.add_back_pack(backpack,Vector2(430,270))
	else:
		back_target.queue_free()


func _on_set_pressed() -> void:
	if set_target == null:
		if bp_c == 0:
			set_target = Global.add_set_menu(backpack,Vector2(485,270))
	else:
		set_target.queue_free()


func _on_skill_pressed() -> void:
	if skill_target == null:
		if bp_c == 0:
			skill_target = Global.add_learn_skill(backpack,Vector2(0,0))
	else:
		skill_target.queue_free()


func _on_magic_weapon_pressed() -> void:
	if PlayerData.player_data["法宝"].size() == 0:
		Global.AddMessageShow(base_through_level.canvas_layer,"您还未装备法宝！！！",1.5,Vector2(460,255))
		return
	if magic_weapon_target == null:
		if bp_c == 0:
			magic_weapon_target = Global.add_magp_infor(backpack,Vector2(500,270))
	else:
		magic_weapon_target.queue_free()

func _on_pet_pressed() -> void:
	Global.AddMessageShow(base_through_level.canvas_layer,"暂未开启",1.5,Vector2(460,255))
