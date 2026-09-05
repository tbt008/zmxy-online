extends TextureRect
@onready var pic_box: TextureProgressBar = $PicBox
@onready var time_text: Label = $TimeText
@onready var last_time: Timer = $LastTime
var CanRest: bool = true
var SkillName: String
var MaxTime
func _physics_process(delta: float) -> void:
	if SkillName != null and SkillName != "":
		texture = load("res://Art/Skill/LittleSkillIcon/" + str(SkillName) + ".png")
		pic_box.texture_progress = load("res://Art/Skill/LittleSkillIcon/" + str(SkillName) + ".png")
		if RoleProp.SourcePlayer.Role1SkillInter.has(SkillName):
			if CanRest:
				if RoleProp.SourcePlayer.Role1SkillInter[SkillName] > 0:
					if last_time.is_stopped():
						MaxTime = RoleProp.SourcePlayer.Role1SkillInter[SkillName] / float(6)
						CanRest = false
						last_time.start(MaxTime)
			if last_time.time_left <= 0:
				time_text.visible = false
				pic_box.value = 0
			else:
				time_text.visible = true
				if last_time.time_left > 1:
					time_text.text = str(snapped(last_time.time_left,1))
				else:
					time_text.text = str(snapped(last_time.time_left,0.1))
				pic_box.value = last_time.time_left / float(MaxTime)


func _on_last_time_timeout() -> void:
	CanRest = true
