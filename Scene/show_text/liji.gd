extends Label

func _ready() -> void:
	if Global.LJ_times > 1:
		self.text = str(Global.LJ_times) + "连击！！"
		$LjPlayer.play("LJ")
	else:
		queue_free()

