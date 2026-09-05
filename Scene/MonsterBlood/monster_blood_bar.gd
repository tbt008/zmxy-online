extends Node2D
class_name mr_blood_bar
@onready var blood_bar: TextureProgressBar = $blood_bar
@onready var blood_text: Label = $blood_bar/blood_text
@onready var queue_free_timer: Timer = $queue_free_Timer
@onready var blood_bar_2: TextureProgressBar = $blood_bar/blood_bar2

var bar_value: float
var bar_text: int
var can_show: bool
var Blood:
	set(va):
		Blood = va
		on_Hpchange(Blood)
func _ready() -> void:
	if not MainSet.set_data["MonsterLittleBlood"] or not MainSet.set_data["NoShowMonsterBody"]:
		self.queue_free()
func _physics_process(_delta: float) -> void:
	
	if bar_text <= 0:
		bar_text = 0
	if can_show == false:
		if queue_free_timer.is_stopped():
			queue_free_timer.start()
#	else:
#		t.pause()
		
		queue_free_timer.stop()
		self.modulate = Color(1,1,1,1)
	blood_bar.value = bar_value
	Blood = bar_value
	if MainSet.set_data["MonsterBloodTextSHow"]:#如果设置显示文字则打开，否则不显示
		blood_text.text = ""
		#blood_text.text = str(bar_text) + '(' + str(snapped(bar_value,0.0001) * 100) + "%)"
	else:
		blood_text.text = ""


func _on_timer_timeout() -> void:
#	t.play()
	var tween = create_tween()
	tween.stop()
	tween.tween_property(self,"modulate",Color(1,1,1,0),2)
	await get_tree().create_timer(2,false).timeout
	queue_free()
func on_Hpchange(vale):
	if not MainSet.set_data["HpBarDelay"]:
		$blood_bar/blood_bar2.value = 0
		return
	var tween = create_tween()
	tween.stop()
	tween.tween_property($blood_bar/blood_bar2,"value",vale,0.5)
