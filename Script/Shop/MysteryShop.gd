extends Node2D

@onready var item_1: TextureRect = $ShopBg/ShopItemList/MysteryShopItemBox
@onready var item_2: TextureRect = $ShopBg/ShopItemList/MysteryShopItemBox2
@onready var item_3: TextureRect = $ShopBg/ShopItemList/MysteryShopItemBox3
@onready var item_4: TextureRect = $ShopBg/ShopItemList/MysteryShopItemBox4
@onready var item_5: TextureRect = $ShopBg/ShopItemList/MysteryShopItemBox5

@onready var all_times: Label = $ShopBg/AllTimes
@onready var all_lh: Label = $ShopBg/AllLH
var ChildList1 = []
var ChildList2 = []
func _ready() -> void:
	ChildList1 = [item_1,item_2,item_3,item_4,item_5]
	ChildList2 = [item_2,item_3,item_4,item_5]
	item_1.MyFather = self
	item_2.MyFather = self
	item_3.MyFather = self
	item_4.MyFather = self
	item_5.MyFather = self
	item_1.MyNum = 1
	item_1.Open()
	item_2.MyNum = 2
	item_2.Close()
	item_3.MyNum = 3
	item_3.Close()
	item_4.MyNum = 4
	item_4.Close()
	item_5.MyNum = 5
	item_5.Close()
func _physics_process(delta: float) -> void:
	all_times.text = "购买次数：" + str(PlayerData.player_data["购买次数"])
	all_lh.text = "剩余灵魂：" + str(PlayerData.player_data["coin_num"])
func _on_close_pressed() -> void:
	queue_free()


func _on_purchase_purchase_times_pressed() -> void:
	Global.AddCureTimesBox(self,Vector2(350,130))
