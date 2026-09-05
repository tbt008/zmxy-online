extends Node2D
class_name Decompose
@onready var remove_items: Button = $scw/RemoveItems
@onready var item_list: GridContainer = $ScrollContainer/ItemList
@onready var lh: Label = $DecomposeButton/need_lh/lh
@onready var wait: Timer = $wait
var CanDe: bool = true
var BSList = ["sms_1","fls_1","mfs_1","wfs_1","gjs_1","bjs_1","sbs_1"]
var NormalItems = {
	"qhs_2":{"Value":[{"name":"qhs_1","num":3}],"Need":1000},#生成物，需要灵魂
	"qhs_3":{"Value":[{"name":"qhs_2","num":3}],"Need":1000},
	"qhs_4":{"Value":[{"name":"qhs_3","num":3}],"Need":1000},
	"ttlp":{"Value":[{"name":"ttlp1","num":1},{"name":"ttlp2","num":1},{"name":"ttlp3","num":1}],"Need":100},
}
var ItemList_ = [] 
var NeedLh: int
var Is_set: bool
func _ready() -> void:
	Signals.ConnectChooseBoxSignal(self,"fj")
	remove_items.is_in_ldl_gz = true
func _physics_process(delta: float) -> void:
	if PlayerData.player_data["分解列表"].size() != 0:
		Is_set = false
		set_remove_itemsProperies()
		if Global.NeedChangeItem:
			ChangeItemList()
			Global.NeedChangeItem = false
	else:
		if not Is_set:
			RemoveLIst()
			AddEmpty()
			Is_set = true
		remove_infomation()
func Pushqhs(Name_,Level):
	var TotalNum: int
	match Level:
		0:
			TotalNum = 0
		1:
			TotalNum = 3
		2:
			TotalNum = 7
		3:
			TotalNum = 28
		4:
			TotalNum = 57
		5:
			TotalNum = 96
		6:
			TotalNum = 205
		7:
			TotalNum = 417
	if TotalNum > 0:
		ItemList_.push_back({"name":"qhs_1","num":TotalNum})
func AddEmpty():
	for i in range(8):
		Global.AddItemBox(item_list,true,true,"empty",0,0,[],[])
func PushBS(Name_,Type):
	match Type:
		"传说","神器":
			if randi_range(0,100) < 30:
				for i in range(randi_range(1,3)):
					ItemList_.push_back({"name":BSList[randi_range(0,BSList.size() - 1)],"num":1})
		"魂器","邪灵":
			if randi_range(0,100) < 40:
				for i in range(randi_range(1,2)):
					ItemList_.push_back({"name":BSList[randi_range(0,BSList.size() - 1)],"num":1})
func PushBasicItem(Type):
	var BasicItemList_ = ["xuantie","sichou","tanmu"]
	match Type:
		"普通":
			ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":1})
			return
		"优秀":
			ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":3})
			return
		"精良":
			ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":5})
			return
		"史诗":
			ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":7})
			return
		"传说":
			for i in range(randi_range(1,2)):
				ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":7})
			return
				
	for i in range(randi_range(1,3)):
		ItemList_.push_back({"name":BasicItemList_[randi_range(0,2)],"num":randi_range(5,10)})
		
func BsFj(Name_):
	var Base = AE.AllEquipment_[Name_]["所属"]
	if Base != "宝石":
		return
	var NameList = str(Name_).split("_")
	var Level = NameList[1]
	var Name = NameList[0]
	if Base != "宝石":
		return
	if int (Level) <= 1:
		return
	NormalItems[Name_] = {"Value":[],"Need":100}
	for i in range(3):
		NormalItems[Name_]["Value"].push_back({"name":str(Name) + '_' + str(int(Level) - 1),"num":1})
func ChangeItemList():
	RemoveLIst()
	ItemList_ = [] 
	#lh.text = ""
	if PlayerData.player_data["分解列表"].size() != 0:
		var Name_ = PlayerData.player_data["分解列表"][0]["名字"]
		var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
		var Data =  PlayerData.player_data["分解列表"][0]["Data"]
		var get_tt = AE.AllEquipment_[Name_]["类型"]
		if NormalItems.has(Name_):
			if NormalItems[Name_].has("Need"):
				NeedLh = NormalItems[Name_]["Need"]
				lh.text = str(NormalItems[Name_]["Need"])
			else:
				NeedLh = 1000
				lh.text = str(1000)
		else:
				NeedLh = 1000
				lh.text = str(1000)
		var num: int = 0
		match get_tt:
			"武器","饰品","防具":
				Pushqhs(Name_,Level)
				PushBS(Name_,AE.AllEquipment_[Name_]["品质"])
				PushBasicItem(AE.AllEquipment_[Name_]["品质"])
				if ItemList_.size() != 0:
					for i in ItemList_:
						var ItemName = i["name"]
						var Type = AE.AllEquipment_[ItemName]["类型"]
						var Num = i["num"]
						var box
						match Type:
							"武器","饰品","防具":
								box = Global.AddItemBox(item_list,true,true,ItemName,Num,0,[],AE.AllEquipment_[ItemName])
								box.set_button_icon(load_(ItemName))
							"道具":
								box = Global.AddItemBox(item_list,true,true,ItemName,0,Num,[],AE.AllEquipment_[ItemName])
								box.set_button_icon(load_(ItemName))
						num += 1
					if 8 - num > 0:
						for i in range(8 - num):
							Global.AddItemBox(item_list,true,true,"empty",0,0,[],[])
				else:
					for i in range(8):
						Global.AddItemBox(item_list,true,true,"empty",0,0,[],[])
					
			"道具":
				BsFj(Name_)
				if not NormalItems.has(Name_):
					for i in range(8):
						Global.AddItemBox(item_list,true,true,"empty",0,0,[],[])
					return
				else:
					for i in NormalItems[Name_]["Value"]:
						var box = Global.AddItemBox(item_list,true,true,i["name"],0,i["num"],[],AE.AllEquipment_[i["name"]])
						box.set_button_icon(load_(i["name"]))
						num += 1
					if 8 - num > 0:
						for i in range(8 - num):
							Global.AddItemBox(item_list,true,true,"empty",0,0,[],[])

func RemoveLIst():
	ItemList_ = []
	for i in item_list.get_children():
		if i != null:
			i.free()
func set_remove_itemsProperies():
	remove_items.set_button_icon(load_(str(PlayerData.player_data["分解列表"][0]["名字"])))
	remove_items.qh_level = PlayerData.player_data["分解列表"][0]["强化等级"]
	remove_items.EQ_prop = PlayerData.player_data["分解列表"][0]["Data"]
	
func _on_decompose_button_pressed() -> void:
	
	if not CanDe:
		Global.AddMessageShow(Global.Windows_,"点击过快！",1.5,Vector2(500,305))
		return
	else:
		CanDe = false
		wait.start(0.1)
	if PlayerData.player_data["coin_num"] < NeedLh:
		Global.AddMessageShow(Global.Windows_,"灵魂不足！",1.5,Vector2(500,305))
		return
	
	if PlayerData.player_data["分解列表"].size() != 0:
		var Name_ = PlayerData.player_data["分解列表"][0]["名字"]
		var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
		var Data =  PlayerData.player_data["分解列表"][0]["Data"]
		var get_tt = AE.AllEquipment_[Name_]["类型"]
		var Typee = AE.AllEquipment_[Name_]["类型"]
		var ItemName_ = AE.AllEquipment_[Name_]["名字"]
		if Level > 0:
			Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定要分解" + str(ItemName_) +"吗？（该装备包含强化等级！）",0)
		else:
			Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定要分解" + str(ItemName_) +"吗？",0)
	else:
		Global.AddMessageShow(Global.Windows_,"先放点什么吧~",1.5,Vector2(500,305))		
func fj():
	
	if PlayerData.player_data["分解列表"].size() != 0:
		var list = []
		var Name_ = PlayerData.player_data["分解列表"][0]["名字"]
		var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
		var Data =  PlayerData.player_data["分解列表"][0]["Data"]
		var get_tt = AE.AllEquipment_[Name_]["类型"]
		var Typee = AE.AllEquipment_[Name_]["类型"]
		var ItemName_ = AE.AllEquipment_[Name_]["名字"]
		match get_tt:
			"武器","饰品","防具":
				if ItemList_.size() != 0:
					for i in ItemList_:
						var ItemName = i["name"]
						var Type = AE.AllEquipment_[ItemName]["类型"]
						var Num = i["num"]
						var box
						match Type:
							"武器","饰品","防具":
								list.push_back({"Name": ItemName,"Value": 1,"Prop":AE.AllEquipment_[ItemName],"WX":[],"StrengthValue":Num})
								PlayerData.player_data["分解列表"].clear()
							"道具":
								list.push_back({"Name": ItemName,"Value": Num,"Prop":[],"WX":[],"StrengthValue":0})
								PlayerData.player_data["分解列表"].clear()
					Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),list,null,null)
					Global.AddMessageShow(Global.Windows_,"分解成功！！",1.5,Vector2(500,305))
					PlayerData.player_data["coin_num"] -= NeedLh
				else:
					Global.AddMessageShow(Global.Windows_,str(Typee) + str(ItemName_) + "不会分解出任何物品！！",1.5,Vector2(500,305))
					
			"道具":
				BsFj(Name_)
				if not NormalItems.has(Name_):
					var name_ = AE.AllEquipment_[Name_]["名字"]
					var Type = AE.AllEquipment_[Name_]["类型"]
					Global.AddMessageShow(Global.Windows_,str(Type) + str(name_) + "不可以进行分解！！",1.5,Vector2(500,305))
					return
				else:
					PlayerData.player_data["coin_num"] -= NeedLh
					for i in NormalItems[Name_]["Value"]:
						var Name = i["name"]
						var Num = i["num"]
						list.push_back({"Name": Name,"Value": Num,"Prop":[],"WX":[],"StrengthValue":0})
					Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),list,null,null)
					PlayerData.player_data["分解列表"].clear()	
					Global.AddMessageShow(Global.Windows_,"分解成功！！",1.5,Vector2(500,305))
func remove_infomation():
	if PlayerData.player_data["分解列表"].size() != 0:
		var Name_ = PlayerData.player_data["分解列表"][0]["名字"]
		var Level = PlayerData.player_data["分解列表"][0]["强化等级"] 
		var Data =  PlayerData.player_data["分解列表"][0]["Data"]
		var get_tt = AE.AllEquipment_[Name_]["类型"]
		match get_tt:
			"武器","饰品","防具":
				PlayerData.add_zb(Name_,Level,Data)
				PlayerData.player_data["分解列表"].clear()
			"道具":
				PlayerData.add_dj(Name_,1)
	remove_items.set_button_icon(load_(str("empty")))
	PlayerData.player_data["分解列表"].clear()
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc


func _on_help_pressed() -> void:
	Global.Add_Decompose_Help(Global.get_parent_(self,3),Vector2(485,290))


func _on_wait_timeout() -> void:
	print("123")
	CanDe = true
