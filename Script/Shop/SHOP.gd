extends Node2D
class_name BasicSHop

@onready var bg_2: Sprite2D = $BG/BG2
@onready var page: Label = $BG/BG2/HBoxContainer/page
@onready var role: Label = $BG/BG2/bg_3/Role
@onready var line_edit: LineEdit = $BG/BG2/HBoxContainer2/LineEdit
var GET_ItemName: String
var WkList = [{"名字": "wkbsz","灵魂":100000},{"名字": "wkmrz","灵魂":100000},
{"名字": "wkwdg","灵魂":100000},{"名字": "wkhwdg","灵魂":100000},{"名字": "wkjdyhwq","灵魂":100},{"名字": "wkjdyhyf","灵魂":100}
,{"名字": "lemhg","灵魂":100},{"名字": "lemhz","灵魂":100}]
var TsList = [{"名字": "tsbsz","灵魂":100000},{"名字": "tsmrz","灵魂":100000},{"名字": "tshwdg","灵魂":100000},
{"名字": "tshowdg","灵魂":100000},{"名字": "tsjdyhwq","灵魂":100},{"名字": "tsjdyhyf","灵魂":100}
,{"名字": "dmysz","灵魂":100},{"名字": "dmyszh","灵魂":100}]
var BjList = [{"名字": "bjbsz","灵魂":100000},{"名字": "bjmrz","灵魂":100000},
	{"名字": "bjhwdg","灵魂":100000},{"名字": "bjhowdg","灵魂":100000},{"名字": "bjjdyhwq","灵魂":100},{"名字": "bjjdyhyf","灵魂":100}
	,{"名字": "lgdwc","灵魂":100},{"名字": "lgdwz","灵魂":100}]
var SsList = [{"名字": "ssbsz","灵魂":100000},{"名字": "ssmrz","灵魂":100000},
	{"名字": "sshwdg","灵魂":100000},{"名字": "sshowdg","灵魂":100000},{"名字": "ssjdyhwq","灵魂":100},{"名字": "ssjdyhyf","灵魂":100}
	,{"名字": "mlhfg","灵魂":100},{"名字": "mlhfz","灵魂":100}
	]
var BlList = [{"名字": "blbsz","灵魂":100000},{"名字": "blmrz","灵魂":100000},{"名字": "blhwdg","灵魂":100000},
{"名字": "blhowdg","灵魂":100000},{"名字": "bljdyhwq","灵魂":100},{"名字": "bljdyhyf","灵魂":100}
,{"名字": "lxhjq","灵魂":100},{"名字": "hhez","灵魂":100}]
var current_page: int = 1:
	set(vl):
		line_edit.text = ""
		GET_ItemName = ""
		current_page = vl
		change_page()
var max_page = 4
var List_x = [-220,0,220,-220,0,220,-220,0,220]
var List_y = [-120,-120,-120,-20,-20,-20,80,80,80]
var PlayeId = int(PlayerData.player_data["Myself"])
var TotalItemList = [{"名字": "qhs_1","灵魂":4000},{"名字": "qhs_2","灵魂":10000},{"名字": "qhs_3","灵魂":27000},{"名字": "qhs_4","灵魂":60000},
	{"名字": "yll","灵魂":5000},{"名字": "mpyj","灵魂":5000},{"名字": "wxxls","灵魂":30000},{"名字": "czlxls","灵魂":20000},{"名字": "xydxq","灵魂":10000}
	,{"名字": "ttzy","灵魂":80000}]
var CurrentType = "全部":
	set(vl):
		GET_ItemName = ""
		line_edit.text = ""
		CurrentType = vl
		current_page = 1
		change_page()
var shop_item_list = []
func _ready() -> void:

	PlayeId = int(PlayerData.player_data["Myself"])
	match PlayeId:
		1:
			if PlayerData.player_data["玩家等级"] >= 50:
				TotalItemList.push_back({"名字": "qtds","灵魂":200000})
			for i in WkList:
				TotalItemList.push_back(i)
		2:
			if PlayerData.player_data["玩家等级"] >= 50:
				TotalItemList.push_back({"名字": "jcz","灵魂":200000})
			for i in TsList:
				TotalItemList.push_back(i)
		3:
			if PlayerData.player_data["玩家等级"] >= 50:
				TotalItemList.push_back({"名字": "tpys","灵魂":200000})
			for i in BjList:
				TotalItemList.push_back(i)
		4:
			if PlayerData.player_data["玩家等级"] >= 50:
				TotalItemList.push_back({"名字": "jldj","灵魂":200000})
			for i in SsList:
				TotalItemList.push_back(i)
		5:
			if PlayerData.player_data["玩家等级"] >= 50:
				TotalItemList.push_back({"名字": "lwstz","灵魂":200000})
			for i in BlList:
				TotalItemList.push_back(i)
	TotalItemList.push_back({"名字": "xczg","灵魂":0})
	TotalItemList.push_back({"名字": "sxyr","灵魂":0})
	set_RoleName()
	page.text = str(current_page) + '/' + str(max_page)
	add_shop_item()
	SetCurrentPageTypeItems()
func SetCurrentPageTypeItems():#根据当前选择类型来获取列表
	var GetTargetList = []#根据目标分类获取的所有物品列表
	var MyList = {}#生成一个根据上个数组数量对应页号的列表
	if GET_ItemName != "":
		max_page = 1
		MyList = {"Page_1":[]}
		for i in TotalItemList:
			var Name = AE.AllEquipment_[i["名字"]]["名字"]
			if Name == GET_ItemName:
				MyList["Page_1"].push_back(i)
		return MyList	
	for i in TotalItemList:
		match CurrentType:
			"全部":
				GetTargetList = TotalItemList
				break
			"装备":
				var Type = AE.AllEquipment_[i["名字"]]["类型"]
				if Type == "武器" or Type == "防具" or Type == "饰品" or Type == "法宝" or Type == "头衔":
					GetTargetList.push_back(i)
			"道具":
				var Type = AE.AllEquipment_[i["名字"]]["类型"]
				if Type == "道具" or Type == "消耗品":
					GetTargetList.push_back(i)
			"时装":
				var Type = AE.AllEquipment_[i["名字"]]["类型"]
				if Type == "时装":
					GetTargetList.push_back(i)
			"翅膀":
				var Type = AE.AllEquipment_[i["名字"]]["类型"]
				if Type == "翅膀":
					GetTargetList.push_back(i)
	
	var MaxPage = int(GetTargetList.size() / 9) + 1
	max_page = MaxPage
	for u in range(MaxPage):
		MyList["Page_" + str(u + 1)] = []
	var Page: int = 1
	for i in GetTargetList:#给这个列表填充物品
		if MyList["Page_" + str(Page)].size() < 9:
			MyList["Page_" + str(Page)].push_back(i)
		else:
			Page += 1
			MyList["Page_" + str(Page)].push_back(i)
	return MyList#输出这个列表
func _physics_process(_delta: float) -> void:
	page.text = str(current_page) + '/' + str(max_page)
	$BG/lh_bg/lh_.text = str(PlayerData.player_data["coin_num"])
func add_shop_item():
	var u = 0
	for i in SetCurrentPageTypeItems()["Page_" + str(current_page)]:
		var name_ = i["名字"]
		var need_ = i["灵魂"]
		var xx = List_x[u]
		var yy = List_y[u]
		var iit = Global.add_shop_items(bg_2,Vector2(xx,yy),name_,need_)
		shop_item_list.push_back(iit)
		u += 1

func set_RoleName():
	match PlayeId:
		1:
			role.text = "角色： 悟空"
		2:
			role.text = "角色： 唐僧"
		3:
			role.text = "角色： 八戒"
		4:
			role.text = "角色： 沙僧"
		5:
			role.text = "角色： 白龙"	
func _on_last_pressed() -> void:
	if current_page > 1:
		current_page -= 1
		page.text = str(current_page) + '/' + str(max_page)

func _on_next_pressed() -> void:
	if current_page < max_page:
		current_page += 1
		page.text = str(current_page) + '/' + str(max_page)
func change_page():
	for i in shop_item_list:
		i.queue_free()
	shop_item_list.clear()	
	add_shop_item()


func _on_close_pressed() -> void:
	queue_free()


func _on_charge_pressed() -> void:
	Global.AddMessageShow(Global.Windows_,"充值渠道已关闭，无法充值，请用灵魂购买商品！",1.5,Vector2(485,295))


func _on_total_pressed() -> void:
	CurrentType = "全部"

func _on_zb_pressed() -> void:
	CurrentType = "装备"

func _on_dj_pressed() -> void:
	CurrentType = "道具"

func _on_sz_pressed() -> void:
	CurrentType = "时装"

func _on_cb_pressed() -> void:
	CurrentType = "翅膀"


func _on_line_edit_text_changed(new_text: String) -> void:
	GET_ItemName = new_text


func _on_qd_pressed() -> void:
	change_page()
