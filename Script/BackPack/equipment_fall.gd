extends CharacterBody2D
var item_name: String
var num_: int
var Is_set: bool
var Is_set2: bool
@onready var item_pic: Sprite2D = $item_pic
@onready var remove_pl = $remove_player
@onready var get_area: CollisionShape2D = $Area2D/get_area
var IsPick: bool
var Player: BaseHero
func _physics_process(delta: float) -> void:
	if not Is_set2:
		set_pic(item_name)
		if MainSet.set_data["AutomaticallyPickUpItems"]:
			get_area.disabled = true
		else:
			get_area.disabled = false
		Is_set2 = true
	Player = get_parent().get_parent().Role_
	
	if not is_on_floor():
		velocity.y -= delta * -980
	if MainSet.set_data["AutomaticallyPickUpItems"]:
		if not IsPick:
			AutomaticallyPickUpItems()
			#Is_set = true
	move_and_slide()
func set_pic(name_):
	item_pic.set_texture(load("res://Art/ItemIcon/" + str(name_) + ".png"))
	if item_name == "peach" or item_name == "Bble" or item_name == "radish":
		await get_tree().create_timer(6).timeout
		queue_free()
func AutomaticallyPickUpItems():
	PickUpItems(Player)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	PickUpItems(body)
func PickUpItems(body):
	if MainSet.set_data["PickUpItemsMusic"]:
		Global.addSound_(self,"res://Music/level/86_pickup.mp3")
	if item_name != "peach" and item_name != "Bble" and item_name != "radish":
		var get_type = AE.AllEquipment_[item_name]["类型"]
		match get_type:
			"武器","防具","饰品","翅膀","时装","头衔":
				if not PlayerData.CheckCanUsePage("装备列表") == 0:

					PlayerData.add_zb(item_name,num_,{})
				else:
					return
			"法宝":
				if not PlayerData.CheckCanUsePage("装备列表") == 0:
					PlayerData.add_fb(item_name,0,AE.get_wx(),{})
				else:
					return
			"道具":
				if not PlayerData.CheckCanUsePage("道具列表") == 0:
					PlayerData.add_dj(item_name,num_)
				else:
					return
			"消耗品":
				if not PlayerData.CheckCanUsePage("消耗品列表") == 0:
					PlayerData.add_xhp(item_name,num_)
				else:
					return
	match item_name:
		"peach":
			body.cure_Hp(RoleProp.roleprop.SHp * 0.45)
		"Bble":
			body.cure_Mp(RoleProp.roleprop.SMp * 0.2)
			#RoleProp.roleprop.Mp += int(RoleProp.roleprop.SMp * 0.2)
		"radish":
			body.cure_Hp(RoleProp.roleprop.SHp * 0.25)
	IsPick = true
	remove_pl.play("remove")
func Pick():
	IsPick = true
