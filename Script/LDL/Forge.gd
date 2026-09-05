extends Node2D
class_name Forge
@onready var zzs: TextureRect = $Zzs#(8,8)
@onready var last_item: TextureRect = $LastItem
@onready var item_name: Label = $LastItem/Name/ItemName
@onready var basic_material: HBoxContainer = $BasicMaterial/BasicMaterial
@onready var lh: Label = $LastItem/Need/LH
@onready var bs_box: HBoxContainer = $BSBox
var ItemData = {}
var ItemMaterialList = {
	"tfljzzs":{"xuantie": 40,"tanmu": 40},
	"mgzhzzs":{"tanmu": 40,"sichou": 40},
	"tdlzjzzs":{"xuantie": 30,"tanmu": 30,"sichou": 30},
	#=======饰品套
	"wsjgzzs":{"xuantie": 80,"tanmu": 60},
	"hljhzzs":{"tanmu": 60,"sichou": 80},
	"zjbtgzzs":{"xuantie": 140},
	"zjxmczzs":{"xuantie": 140},
	"blmqzzs":{"xuantie": 140},
	#=======史诗套
	"eyzzs":{"xuantie": 240,"sichou": 240},
	"thzzs":{"xuantie": 300,"tanmu": 180},
	"tczzs":{"xuantie": 300,"tanmu": 180},
	"czzzs":{"sichou": 480},
	"tzzzs":{"xuantie": 480},
	"ryzzs":{"xuantie": 300,"tanmu": 180},
	"tszzs":{"xuantie": 160,"sichou": 160,"tanmu": 160},
	"yjzzs":{"xuantie": 160,"sichou": 160,"tanmu": 160},
	"tqzzs":{"xuantie": 160,"sichou": 160,"tanmu": 160},
	"zezzs":{"xuantie": 160,"sichou": 160,"tanmu": 160},
	"llyzzs":{"xuantie": 160,"sichou": 160,"tanmu": 160,"tss": 5,"yhs": 5},
	"nmwdnhzzs":{"nmwdnhsp": 60,"nmwjh":1},
	"zlwdahzzs":{"zlwdahsp1": 30,"zlwdahsp2": 30,"zlwdahsp3": 10},
	#=======邪灵套
	"qlgzzs":{"xuantie": 600,"tanmu": 300},
	"qljzzs":{"xuantie": 300,"tanmu": 300,"sichou": 300},
	"plzzzs":{"xuantie": 450,"tanmu": 450},
	"plpzzs":{"sichou": 900},
	"ylfzzs":{"xuantie": 900},
	"ylkzzs":{"xuantie": 600,"tanmu": 300},
	"jlczzs":{"xuantie": 300,"sichou": 300,"tanmu": 300},
	"jljzzs":{"xuantie": 300,"sichou": 300,"tanmu": 300},
	"tlqzzs":{"xuantie": 300,"sichou": 300,"tanmu": 300},
	"tljzzs":{"xuantie": 300,"sichou": 300,"tanmu": 300},
	"doushuaiziyanzzs":{"ziyanyujin": 1500},
	"zjhlzzs":{"xuantie": 600,"tanmu": 300},
	"canglongjiezzs":{"canglonglingpo": 10,"tss": 5,"yhs": 5,"xuantie": 500,"tanmu": 500,"sichou": 500},
	#=======魂器套
	"qszzs":{"xuantie": 1200,"tanmu": 900,"tss": 20},
	"dzzzs":{"xuantie": 700,"tanmu": 700,"sichou": 700,"yhs": 20},
	"rczzs":{"xuantie": 1050,"tanmu": 1050,"tss": 20},
	"ztzzs":{"sichou": 2100,"yhs": 20},
	"ytzzs":{"xuantie": 2100,"tss": 20},
	"jtzzs":{"xuantie": 1500,"tanmu": 600,"yhs": 20},
	"llzzs":{"xuantie": 700,"sichou": 700,"tanmu": 700,"tss": 20},
	"jszzs":{"xuantie": 700,"sichou": 700,"tanmu": 700,"yhs": 20},
	"ldzzs":{"xuantie": 2100,"tss": 20},
}
func _ready() -> void:
	Global.Forge_ = self
	ADDBZPIC()
	lh.text = str(5000)
	RemoveNameAndNeed()

func LoadMaterialBox():
	if zzs.get_children().size() == 0:
		return
	if basic_material.get_children().size() > 0:
		for i in basic_material.get_children():
			i.queue_free()
			#basic_material.remove_child(i)
	for i in ItemMaterialList[zzs.get_children()[0].get_item_name]:
		var List = ItemMaterialList[zzs.get_children()[0].get_item_name]
		var Num = List[i]
		Global.AddForgeBox(basic_material,i,Num)
	
	if basic_material.get_child_count() == 2:
		basic_material.add_theme_constant_override("separation",50)
	elif basic_material.get_child_count() == 3:
		basic_material.add_theme_constant_override("separation",55)
	else:
		basic_material.add_theme_constant_override("separation",15)
func ADDItemBox():#显示生成物图像和名字
	RmoveBox()
	var ItemName: String
	if zzs.get_children().size() != 0:
		ItemName = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
	if PlayerData.player_data["宝珠列表"].size() <= 0:
		ItemData = GetEqProp()
	else:
		ItemData = GetBZProp()
	var ItemBox = Global.AddItemBox(last_item,true,true,ItemName,0,1,[],ItemData)
	ItemBox.set_button_icon(load_(str(ItemName)))
	ItemBox.position = Vector2(8,8)
	RefreshName()
func RefreshName():#更新生成物名字
	var ItemName: String
	if zzs.get_children().size() != 0:
		ItemName = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
	var Name = AE.AllEquipment_[ItemName]["名字"]
	var Color_ = AE.AllEquipment_[ItemName]["颜色"]
	item_name.text = str(Name)
	item_name.add_theme_color_override("font_color",Color_)
func ADDBZPIC():
	RemoveAllBspic()
	if PlayerData.player_data["宝珠列表"].size() <= 0:
		return
	for i in PlayerData.player_data["宝珠列表"]:
		var Name = i["名字"]
		var Prop = i["名字"]
		var Data = i["Data"]
		var ItemBox = Global.AddItemBox(bs_box,true,false,Name,0,1,[],Data)
		ItemBox.set_button_icon(load_(str(Name)))
		ItemBox.ForgeBZID = bs_box.get_child_count() - 1
		ItemBox.is_in_ldl_gz = true
func RemoveBSPIC(id):
	if bs_box.get_child_count() <= 0:
		return
	else:
		bs_box.get_children()[id].queue_free()
		var Name = PlayerData.player_data["宝珠列表"][id]["名字"]
		PlayerData.add_dj(Name,1)
		PlayerData.player_data["宝珠列表"].remove_at(id)
		ADDBZPIC()

func remove_infomation():
	if PlayerData.player_data["宝珠列表"].size() <= 0:
		return
	for i in PlayerData.player_data["宝珠列表"]:
		var Name = i["名字"]
		PlayerData.add_dj(Name,1)
	PlayerData.player_data["宝珠列表"].clear()
	MemoryClass.保存游戏(Global.cd_path)
func RemoveAllBspic():
	for i in bs_box.get_children():
		bs_box.remove_child(i)
		i.queue_free()
		
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func CheckFullMaterial():#检测物品是否充足
	if zzs.get_children().size() == 0:
		return
	for i in ItemMaterialList[zzs.get_children()[0].get_item_name]:
		var List = ItemMaterialList[zzs.get_children()[0].get_item_name]
		var Num = List[i]
		if PlayerData.get_item_data(i) < Num:
			return false
	return true
func RemoveZZSBox():#清理制作书格子
	for i in zzs.get_children():
		i.queue_free()
		#zzs.remove_child(i)
func RemoveMaterialBox():#清理材料格子
	for i in basic_material.get_children():
		basic_material.remove_child(i)
	for i in range(4):
		Global.AddForgeBox(basic_material,"",0)
	if basic_material.get_child_count() == 2:
		basic_material.add_theme_constant_override("separation",50)
	elif basic_material.get_child_count() == 3:
		basic_material.add_theme_constant_override("separation",55)
	else:
		basic_material.add_theme_constant_override("separation",15)
func RmoveBox():
	for i in last_item.get_children():
		if i != null:
			if i.name != "Name" and i.name != "Need":
				i.queue_free()
				#last_item.remove_child(i)
func RemoveNameAndNeed():
	item_name.text = ""
func RemoveAll():
		var Name = zzs.get_children()[0].get_item_name
		for i in ItemMaterialList[Name]:		
			PlayerData.remove_dj(i,PlayerData.get_dj_page(i),ItemMaterialList[Name][i])
		PlayerData.remove_dj(Name,PlayerData.get_dj_page(Name),1)
		PlayerData.player_data["宝珠列表"].clear()
		ADDBZPIC()
		ItemData = {}
		RemoveZZSBox()
		RemoveMaterialBox()
		
func _on_froge_pressed() -> void:
	if zzs.get_children().size() == 0:
		Global.AddMessageShow(Global.Windows_,"请先放入制作书！！",1.5,Vector2(500,305))
		return
	if PlayerData.player_data["coin_num"] < 5000:
		Global.AddMessageShow(Global.Windows_,"灵魂不足！！",1.5,Vector2(500,305))
		return
	var name_ = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
	if name_ == "zlwdah" or name_ == "nmwdnh":
		Global.AddMessageShow(Global.Windows_,"法宝暂未制作！！",1.5,Vector2(500,305))
		return
	if CheckFullMaterial():
		ADDItemBox()
		var ItemName: String
		if zzs.get_children().size() == 1:
			ItemName = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
		match AE.AllEquipment_[ItemName]["类型"]:
			"法宝":
				PlayerData.add_fb(ItemName,0,AE.get_wx(),ItemData)
			"武器","防具","饰品","时装","头衔":
				PlayerData.add_zb(ItemName,0,ItemData)
		RemoveAll()
		PlayerData.player_data["coin_num"] -= 5000
		Global.AddMessageShow(Global.Windows_,"打造成功！！",1.5,Vector2(500,305))
	else:
		Global.AddMessageShow(Global.Windows_,"材料不足！！",1.5,Vector2(500,305))
func GetBZProp():
	if PlayerData.player_data["宝珠列表"].size() <= 0:
		return
	var BZProp = {}
	for i in AE.PropListName:
		BZProp[i] = 0
	for i in PlayerData.player_data["宝珠列表"]:#随机化属性
		i["Data"] = AE.AllEquipment_[i["名字"]]
		for u in AE.PropListName:
			BZProp[u] += i["Data"][u]
	var ItemName: String
	if zzs.get_children().size() == 1:
		ItemName = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
	else:
		return
	var PropList = AE.AllEquipment_[ItemName]
	for i in AE.PropListName:
		PropList[i] += BZProp[i]
	return PropList
func GetEqProp():
	var ItemName: String
	if zzs.get_children().size() == 1:
		ItemName = str(zzs.get_children()[0].get_item_name).split("zzs")[0]
	else:
		return
	return AE.AllEquipment_[ItemName]
	pass


func _on_help_pressed() -> void:
	Global.AddForgeHelp(Global.get_parent_(self,3),Vector2(455,265))
