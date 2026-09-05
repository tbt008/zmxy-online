extends Node2D
@onready var bg: Sprite2D = $BG
@onready var page_infor: Label = $BG/HBoxContainer/PageInfor

var InforList = []
var current_page: int = 1
var max_page: int = 4
var positionList = [Vector2(0,-110),Vector2(0,10),Vector2(0,130)]
var is_set = false
var fbinfor = {
	"page_1":["dshl","tsgj","bsyj"],
	"page_2":["lsys","xhmt","kyl"],
	"page_3":["xhhl","qyj","zjfyd"],
	"page_4":["zjhl"],
}#这里添加每页的法宝技能，新增一个法宝就加一个
func ready():
	add_infor()
func _physics_process(_delta: float) -> void:
	page_infor.text = str(current_page) + '/' + str(max_page)
	if not is_set:
		add_infor()
		is_set = true
func add_infor():
	for i in fbinfor["page_" + str(current_page)].size():
		var infor = Global.addSkillSelect(bg,positionList[i],str(fbinfor["page_" + str(current_page)][i]))
		InforList.push_back(infor)
		
func remove_infor():
	for i in InforList:
		i.queue_free()
	InforList.clear()

func _on_last_pressed() -> void:
	if current_page > 1:
		current_page -= 1
		remove_infor()
		add_infor()

func _on_next_pressed() -> void:
	if current_page < max_page:
		current_page += 1
		remove_infor()
		add_infor()


func _on_close_pressed() -> void:
	queue_free()
