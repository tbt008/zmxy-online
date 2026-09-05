extends TextureButton
var BossName:String
var IsOpen: bool
func _physics_process(delta: float) -> void:
	if BossName != null and BossName != "":
		texture_normal = LoadPic(BossName,1)
		texture_pressed = LoadPic(BossName,1)
		texture_hover = LoadPic(BossName,2)
		texture_disabled = LoadPic(BossName,1)
func LoadPic(Name,Type):
	return load("res://Art/TwentyEightConstellations/" + str(Name) + '_' + str(Type) + ".png")
func _on_pressed() -> void:
	if not IsOpen:
		Global.AddMessageShow(Global.Windows_,"暂未开放！！",1.5,Vector2(500,305))
		return
