extends Node2D
@onready var title: Label = $"509/Title"
@onready var title_2: Label = $"509/Title2"
@onready var title_3: Label = $"509/Title3"
@onready var title_4: Label = $"509/Title4"
@onready var title_5: Label = $"509/Title5"
@onready var title_6: Label = $"509/Title6"
@onready var title_7: Label = $"509/Title7"
@onready var title_8: Label = $"509/Title8"
@onready var title_9: Label = $"509/Title9"
@onready var title_10: Label = $"509/Title10"
@onready var title_11: Label = $"509/Title11"
@onready var title_12: Label = $"509/Title12"
@onready var title_13: Label = $"509/Title13"
@onready var page: Label = $Page


var CurrentPage: int = 1
var MaxPage: int = 4

func _physics_process(delta: float) -> void:
	page.text = str(CurrentPage) + '/' + str(MaxPage)
	match int(CurrentPage):
		1:
			title.visible = true
			title_2.visible = true
			title_3.visible = true
			title_4.visible = true
			title_5.visible = true
			title_6.visible = true
			title_7.visible = true
			title_8.visible = false
			title_9.visible = false
			title_10.visible = false
			title_11.visible = false
			title_12.visible = false
			title_13.visible = false
		2:
			title.visible = false
			title_2.visible = false
			title_3.visible = false
			title_4.visible = false
			title_5.visible = false
			title_6.visible = false
			title_7.visible = false
			title_8.visible = true
			title_9.visible = true
			title_10.visible = false
			title_11.visible = false
			title_12.visible = false
			title_13.visible = false
		3:
			title.visible = false
			title_2.visible = false
			title_3.visible = false
			title_4.visible = false
			title_5.visible = false
			title_6.visible = false
			title_7.visible = false
			title_8.visible = false
			title_9.visible = false
			title_10.visible = true
			title_11.visible = true
			title_12.visible = false
			title_13.visible = false
		4:
			title.visible = false
			title_2.visible = false
			title_3.visible = false
			title_4.visible = false
			title_5.visible = false
			title_6.visible = false
			title_7.visible = false
			title_8.visible = false
			title_9.visible = false
			title_10.visible = false
			title_11.visible = false
			title_12.visible = true
			title_13.visible = true
			
func _on_close_pressed() -> void:
	queue_free()


func _on_last_page_pressed() -> void:
	if CurrentPage > 1:
		CurrentPage -= 1


func _on_next_page_pressed() -> void:
	if CurrentPage < MaxPage:
		CurrentPage += 1
