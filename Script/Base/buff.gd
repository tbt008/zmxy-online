extends TextureRect
var texture_ = "poision"
var tt_

func _physics_process(_delta: float) -> void:
	
	set_texture(load_(texture_))
func _on_mouse_entered() -> void:
	match texture_:
		"poision":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"中毒：受中毒效果影响，这个单位开始每秒扣除一定的生命值。")
		"mp_poision":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"反噬：在使用消耗魔法的行动时，迅速除相当于所消耗魔法一定比率的生命。")
		"ice":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"冰封：这个单位现在处于冰冻状态，无法做出某些行动。")
		"Fire":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"灼烧：受灼烧效果影响，这个单位开始每秒扣除一定的生命值。")
		"speed_down":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"减速：这个单位的移动速度降低了。")
		"stun":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"眩晕：这个单位现在处于眩晕状态，无法做出某些行动。")
		"htsf":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"护体石肤：这个单位拥有极高的护盾\n并且防御能力大大提升。")
		"Bleed":
			tt_ = Global.add_BuffInfo(self,Vector2(35,35),"流血：这个单位正在持续快速流血。")
func _on_mouse_exited() -> void:
	if tt_ != null:
		tt_.queue_free()


func load_(name_):
	var __ = load("res://Art/AddEffect/Buff_icon/" + str(name_) + ".png")
	return __
