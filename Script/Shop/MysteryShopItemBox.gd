extends TextureRect
@onready var ItemBox: Button = $ItemBox
@onready var ItemNum: Label = $Num
@onready var NeedValue: Label = $Need
@onready var PurchaseButton: Button = $Purchase
var AllItemList = {
	"Box_1":[{"Name": "xuantie","Value": 5,"WX": [],"Level": 0,"Need": 500},{"Name": "sichou","Value": 5,"WX": [],"Level": 0,"Need": 500},
	{"Name": "tanmu","Value": 5,"WX": [],"Level": 0,"Need": 500}],
	
	"Box_2":[{"Name": "xuantie","Value": 10,"WX": [],"Level": 0,"Need": 1000},{"Name": "sichou","Value": 5,"WX": [],"Level": 0,"Need": 1000},
	{"Name": "tanmu","Value": 10,"WX": [],"Level": 0,"Need": 1000}],
	
	"Box_3":[{"Name": "xuantie","Value": 20,"WX": [],"Level": 0,"Need": 2000},{"Name": "sichou","Value": 20,"WX": [],"Level": 0,"Need": 2000},
	{"Name": "tanmu","Value": 20,"WX": [],"Level": 0,"Need": 2000}],
	
	"Box_4":[{"Name": "bsd_1","Value": 1,"WX": [],"Level": 0,"Need": 50000},{"Name": "bsd_2","Value": 1,"WX": [],"Level": 0,"Need": 120000},
	{"Name": "qhs_1","Value": 1,"WX": [],"Level": 0,"Need": 3000},{"Name": "qhs_2","Value": 1,"WX": [],"Level": 0,"Need": 8000},
	{"Name": "qhs_3","Value": 1,"WX": [],"Level": 0,"Need": 22000},{"Name": "qhs_4","Value": 1,"WX": [],"Level": 0,"Need": 50000},
	{"Name": "sms_1","Value": 1,"WX": [],"Level": 0,"Need": 15000},{"Name": "sms_2","Value": 1,"WX": [],"Level": 0,"Need": 40000}
	,{"Name": "fls_1","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "fls_2","Value": 1,"WX": [],"Level": 0,"Need": 54000}
	,{"Name": "gjs_1","Value": 1,"WX": [],"Level": 0,"Need": 18000},{"Name": "gjs_2","Value": 1,"WX": [],"Level": 0,"Need": 50000}
	,{"Name": "wfs_1","Value": 1,"WX": [],"Level": 0,"Need": 12000},{"Name": "wfs_2","Value": 1,"WX": [],"Level": 0,"Need": 32000}
	,{"Name": "mfs_1","Value": 1,"WX": [],"Level": 0,"Need": 12000},{"Name": "mfs_2","Value": 1,"WX": [],"Level": 0,"Need": 32000}
	,{"Name": "hxs_1","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "hxs_2","Value": 1,"WX": [],"Level": 0,"Need": 54000}
	,{"Name": "mpyj","Value": 1,"WX": [],"Level": 0,"Need": 3000},{"Name": "yll","Value": 1,"WX": [],"Level": 0,"Need": 4000}
	,{"Name": "renshen","Value": 3,"WX": [],"Level": 0,"Need": 80000},{"Name": "shougong","Value": 3,"WX": [],"Level": 0,"Need": 80000}
	,{"Name": "lingli","Value": 3,"WX": [],"Level": 0,"Need": 80000},{"Name": "liuhuang","Value": 3,"WX": [],"Level": 0,"Need": 80000}
	,{"Name": "leizong","Value": 3,"WX": [],"Level": 0,"Need": 80000},{"Name": "xianmao","Value": 3,"WX": [],"Level": 0,"Need": 80000}
	,{"Name": "dudan","Value": 3,"WX": [],"Level": 0,"Need": 120000},{"Name": "llzsp","Value": 1,"WX": [],"Level": 0,"Need": 30000},
	{"Name": "flzsp","Value": 1,"WX": [],"Level": 0,"Need": 30000},{"Name": "slzsp","Value": 1,"WX": [],"Level": 0,"Need": 25000},
	{"Name": "hlzsp","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "tlzsp","Value": 1,"WX": [],"Level": 0,"Need": 10000}
	,{"Name": "rls","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "bsz","Value": 1,"WX": [],"Level": 0,"Need": 3000}],
	
	"Box_5":[{"Name": "bsd_5","Value": 1,"WX": [],"Level": 0,"Need": 2200000},{"Name": "bsd_4","Value": 1,"WX": [],"Level": 0,"Need": 800000}
	,{"Name": "bsd_3","Value": 1,"WX": [],"Level": 0,"Need": 320000},{"Name": "llzsp","Value": 1,"WX": [],"Level": 0,"Need": 30000},
	{"Name": "flzsp","Value": 1,"WX": [],"Level": 0,"Need": 30000},{"Name": "slzsp","Value": 1,"WX": [],"Level": 0,"Need": 25000},
	{"Name": "hlzsp","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "tlzsp","Value": 1,"WX": [],"Level": 0,"Need": 10000},
	{"Name": "llz","Value": 1,"WX": [],"Level": 0,"Need": 80000},{"Name": "flz","Value": 1,"WX": [],"Level": 0,"Need": 80000},
	{"Name": "slz","Value": 1,"WX": [],"Level": 0,"Need": 60000},{"Name": "hlz","Value": 1,"WX": [],"Level": 0,"Need": 50000},
	{"Name": "tlz","Value": 1,"WX": [],"Level": 0,"Need": 20000},{"Name": "tss","Value": 1,"WX": [],"Level": 0,"Need": 70000},
	{"Name": "yhs","Value": 1,"WX": [],"Level": 0,"Need": 70000},{"Name": "putongnmwsz","Value": 1,"WX": [],"Level": 0,"Need": 50000},
	{"Name": "putongzlwsz","Value": 1,"WX": [],"Level": 0,"Need": 50000}]
}
var MyNum: int
var NewList = {}
var MyFather
var IsOpen: bool
@onready var mystery_shop_item_box: TextureRect = $"."
func Open():#调用这个打开格子并且刷新一次
	IsOpen = true
	ItemBox.disabled = false
	ItemBox.visible = true
	ItemNum.visible = true
	NeedValue.visible = true
	PurchaseButton.disabled = false
	PurchaseButton.visible = true
	mystery_shop_item_box.texture = load("res://Art/Shop/ShopItemBox.png")
	self.SetBox()
	ItemNum.text = str(AE.AllEquipment_[NewList["Name"]]["名字"]) + '×' + str(NewList["Value"])
	NeedValue.text = str(NewList["Need"]) + "灵魂"
func Close():#调用这个关闭格子
	IsOpen = false
	mystery_shop_item_box.texture = load("res://Art/Shop/CloseItemBox.png")
	ItemBox.disabled = true
	ItemBox.visible = false
	ItemNum.text = ""
	ItemNum.visible = false
	NeedValue.text = ""
	NeedValue.visible = false
	PurchaseButton.disabled = true
	PurchaseButton.visible = false
func _ready() -> void:
	BasicSet()
func GetList():
	return AllItemList["Box_" + str(MyNum)]

func BasicSet():
	ItemBox.is_in_ldl_gz = true
	ItemBox.is_in_hhgz = true
func SetBox():
	var CurrentList = AllItemList["Box_" + str(MyNum)]
	NewList = CurrentList[randi_range(0,CurrentList.size() - 1)]
	var Type = AE.AllEquipment_[NewList["Name"]]["类型"]
	match Type:
		"武器","饰品","防具","时装","头衔":
			ItemBox.qh_level = NewList["Level"]
			ItemBox.wx = []
		"法宝":
			ItemBox.wx = NewList["WX"]
		"道具","消耗品":
			ItemBox.total_number = NewList["Value"]
	ItemBox.EQ_prop = AE.AllEquipment_[NewList["Name"]]
	ItemBox.set_button_icon(load_(NewList["Name"]))

func _on_purchase_pressed() -> void:
	if PlayerData.player_data["购买次数"] <= 0:
		Global.AddMessageShow(Global.Windows_,"购买次数不足！！",1.5,Vector2(470,300))
		return
	var Need: int = NewList["Need"]
	if int(PlayerData.player_data["coin_num"]) < Need:
		Global.AddMessageShow(Global.Windows_,"灵魂不足！！",1.5,Vector2(470,300))
		return
	PlayerData.player_data["coin_num"] -= Need
	PlayerData.player_data["购买次数"] -= 1
	var Type = AE.AllEquipment_[NewList["Name"]]["类型"]
	match Type:
		"武器","饰品","防具","时装","头衔":
			PlayerData.add_zb(NewList["Name"],NewList["Level"],{})
		"法宝":
			if NewList["WX"] == []:
				PlayerData.add_fb(NewList["Name"],0,Global.get_wx(0),{})
			else:
				PlayerData.add_fb(NewList["Name"],0,NewList["WX"],{})
		"道具":
			PlayerData.add_dj(NewList["Name"],NewList["Value"])
		"消耗品":
			PlayerData.add_xhp(NewList["Name"],NewList["Value"])
	Global.AddMessageShow(Global.Windows_,"购买成功",1.5,Vector2(520,340))
	OpenAndCloseBox()
	MemoryClass.保存游戏(Global.cd_path)
func OpenAndCloseBox():
	match int(MyNum):
		1:
			for i in MyFather.ChildList1:
				if i.IsOpen:
					i.Open()
			for i in MyFather.ChildList2:
				if i.IsOpen:
					return 
			if randi_range(0,100) < 50:
				MyFather.item_2.Open()
		2:
			self.Close()
			MyFather.item_1.Open()
			if randi_range(0,100) < 50:
				MyFather.item_3.Open()
		3:
			self.Close()
			MyFather.item_1.Open()
			if randi_range(0,100) < 40:
				MyFather.item_4.Open()
		4:
			self.Close()
			MyFather.item_1.Open()
			if randi_range(0,100) < 10:
				MyFather.item_5.Open()
		5:
			self.Close()
			MyFather.item_1.Open()
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
