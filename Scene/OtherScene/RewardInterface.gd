extends Node2D
@onready var item_list: GridContainer = $Wkbg/ScrollContainer/ItemList
@onready var title: Label = $Wkbg/Title
@onready var pl: AnimationPlayer = $pl

var UseItemName
var UseNum
var ItemList_ = []
var ItemInfo = {"Name": "ryjgb","Value": 4,"Prop":{},"WX":[],"StrengthValue":0}#每个对象包含，内部名，数量，数据，五行，强化等级
func _process(delta: float) -> void:
	AddItemToBackPack()
	if UseItemName != null and UseNum != null:
		PlayerData.remove_xhp(UseItemName,PlayerData.get_xhp_page(UseItemName),UseNum)
	MemoryClass.保存游戏(Global.cd_path)
	set_process(false)
func _physics_process(delta: float) -> void:
	if UseItemName != null and UseNum != null:
		title.text = "本次使用：" + str(AE.AllEquipment_[UseItemName]["名字"]) + ' * ' + str(UseNum)
	else:
		title.text = ""
	pl.play("pl")
	AddBox()
	set_physics_process(false)
func AddBox():
	var tween = create_tween()
	for i in ItemList_:
		var Type = AE.AllEquipment_[i["Name"]]["类型"]#物品类型
		var ItemName = i["Name"]
		var Value = i["Value"]
		var StrengthValue = i["StrengthValue"]
		var Prop = i["Prop"]
		var WX = i["WX"]
		var box = Global.AddRewardBox(item_list,ItemName,Value)
		box.modulate = Color(1,1,1,0)
		tween.tween_property(box,"modulate",Color(1,1,1,1),0.2)
func AddItemToBackPack():#将物品添加到背包内
	for i in ItemList_:
		var Type = AE.AllEquipment_[i["Name"]]["类型"]#物品类型
		var ItemName = i["Name"]
		var Value = i["Value"]
		var StrengthValue = i["StrengthValue"]
		var Prop = i["Prop"]
		var WX = i["WX"]
		if Value <= 0:
			Value = 1
		match Type:
			"武器","防具","饰品","翅膀","头衔","时装":
				for u in range(Value):
					PlayerData.add_zb(ItemName,StrengthValue,Prop)
			"法宝":
				for u in range(Value):
					PlayerData.add_fb(ItemName,StrengthValue,WX,Prop)
			"道具":
				PlayerData.add_dj(ItemName,Value)
			"消耗品":
				PlayerData.add_xhp(ItemName,Value)
	MemoryClass.保存游戏(Global.cd_path)

func _on_close_pressed() -> void:
	#AddItemToBackPack()
#	if UseItemName != null and UseNum != null:
#		PlayerData.remove_xhp(UseItemName,PlayerData.get_xhp_page(UseItemName),UseNum)
#		MemoryClass.保存游戏(Global.cd_path)
	queue_free()
