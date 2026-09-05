extends Node2D
class_name Transmogrified
@onready var bg_2: Sprite2D = $BG/BG2
@onready var infor: Label = $BG/ChangePage/Infor
@onready var role_body: Sprite2D = $BG/Player/RoleBody
@onready var role_equipment: Sprite2D = $BG/Player/RoleEquipment
@onready var wqq: Button = $BG/wqq
@onready var wq: Label = $BG/wqq/wq
@onready var fjj: Button = $BG/fjj
@onready var fj_2: Label = $BG/fjj/fj2
@onready var role: Label = $BG/Role
@onready var wings: AnimatedSprite2D = $BG/Player/Wings
@onready var cbb: Button = $BG/cbb
@onready var cb: Label = $BG/cbb/cb
@onready var box_list: GridContainer = $BG/BoxList
@onready var tx: AnimatedSprite2D = $BG/Player/Tx
@onready var collect_value: Label = $BG/CollectValue

var CurrentType: String = "全部":
	set(vl):
		CurrentType = vl
		currentpage = 1
		AddBox()
var PlayerId = int(PlayerData.player_data["Myself"])			
var currentpage: int = 1
var maxpage: int = 4

var RoleItemList = {
	"悟空":["wkjdyhwq","ptxzg","whg","jcbj","qld","ryjgb","gtq","tsyj","gwj","qtz","nyd","qybd","zjbtg","th","qlg","qs","lemhg",
	"wkjdyhyf","ptxzf","dsyj","xwj","yhj","bsxj","xhmj","dszk","kys","zjqj","ey","qlj","lemhz",
	"wkhzyf","wklzyf","wkbsz","wkhwdg","wkwdg","wkmrz","putongnmwsz","youxiunmwsz","jingliangnmwsz","shishinmwsz"
	,"putongzlwsz","youxiuzlwsz","jingliangzlwsz","shishizlwsz"
	],
	
	"唐僧":["ptsmz","dsqz","bhz","jhcz","bsyz","xhxh","lhz","myz","kyz","hylz","smz","tc","plz","tsjdyhwq","rc","dmysz",
	"tsjdyhyf","ptjs","bsp","jcjs","qlp","lzp","tsyp","qcp","jljs","qyfp","hljh","cz","plp","dmyszh",
	"tshzyf","tslzyf","tsbsz","tshowdg","tshwdg","tsmrz","putongnmwsz","youxiunmwsz","jingliangnmwsz","shishinmwsz"
	,"putongzlwsz","youxiuzlwsz","jingliangzlwsz","shishizlwsz"],
	
	"八戒":["bjjdyhwq","ptdp","jcjp","wtp","zhp","jcdp","gtb","lcld","ssc","tpltp","syc","xhc","zjksf","tz","ylf","yt","lgdwc",
	"bjjdyhyf","ptcs","dszy","pxk","jgj","lcgy","bszj","xhymk","tpzy","hylk","wsjg","ry","ylk","lgdwz",
	"bjhzyf","bjlzyf","bjbsz","bjhowdg","bjhwdg","bjmrz","putongnmwsz","youxiunmwsz","jingliangnmwsz","shishinmwsz"
	,"putongzlwsz","youxiuzlwsz","jingliangzlwsz","shishizlwsz"
	],
	
	"沙僧":["ssjdyhwq","ptyyc","jmc","jcmc","hdc","jlxmc","bsbc","gtc","xhxc","jlfyc","shyc","kyc","hylc","zjxmc","ts","jlc","ll","mlhfg",
	"ssjdyhyf","ptcp","dshp","bxp","jmy","lchp","bap","jlfyj","xhp","jllm","yj","jlj","mlhfz",
	"sshzyf","sslzyf","ssbsz","sshowdg","sshwdg","ssmrz","putongnmwsz","youxiunmwsz","jingliangnmwsz","shishinmwsz"
	,"putongzlwsz","youxiuzlwsz","jingliangzlwsz","shishizlwsz"
	],
	"白龙":["bljdyhwq","pttq","dslq","twq","qthbq","bshq","mwq","ylhq","xyq","qysq","blmq","tq","tlq","ld","lxhjq",
	"bljdyhyf","ptcf","zhj","jclj","ttj","ssj","tsgp","xhgp","yljj","xhj","zjgp","ze","tlj","hhez",
	"blhzyf","bllzyf","blbsz","blhowdg","blhwdg","blmrz"
	,"putongnmwsz","youxiunmwsz","jingliangnmwsz","shishinmwsz"
	,"putongzlwsz","youxiuzlwsz","jingliangzlwsz","shishizlwsz"
	],
	"翅膀":["xqzy","bszy","jmzy","xtzy","ttzy","xmzy"],
	"头衔":["xczg","sxyr","xysc","yyscj","zyscj","cmscj","qpzscj","ghjscj","xzbwg","hhyx",
	"ptsryx","yxsryx","jlsryx","sssryx","xlsryx"],
}
func PushEqToList():
	var List = []
	match int(PlayerData.player_data["Myself"]):
		1:
			List = RoleItemList["悟空"]
			RoleItemList["头衔"].push_back("qtds")
		2:
			List = RoleItemList["唐僧"]
			RoleItemList["头衔"].push_back("jcz")
		3:
			List = RoleItemList["八戒"]
			RoleItemList["头衔"].push_back("tpys")
		4:
			List = RoleItemList["沙僧"]
			RoleItemList["头衔"].push_back("jldj")
		5:
			List = RoleItemList["白龙"]
			RoleItemList["头衔"].push_back("lwstz")
	for i in RoleItemList["翅膀"]:
		List.push_back(i)
	for i in RoleItemList["头衔"]:
		List.push_back(i)
	for i in List:
		if PlayerData.check_zb(i).size() != 0:
			if not PlayerData.player_data["幻化拥有列表"].has(i):
				PlayerData.player_data["幻化拥有列表"].push_back(i)
func GetCurrentRoleList():#根据角色得到对应的所有装备列表
	var OtherList = []
	match int(PlayerData.player_data["Myself"]):
		1:
			role.text = "悟空"
			for i in RoleItemList["悟空"]:
				OtherList.push_back(i)
		2:
			role.text = "唐僧"
			for i in RoleItemList["唐僧"]:
				OtherList.push_back(i)
		3:
			role.text = "八戒"
			for i in RoleItemList["八戒"]:
				OtherList.push_back(i)
		4:
			role.text = "沙僧"
			for i in RoleItemList["沙僧"]:
				OtherList.push_back(i)
		5:
			role.text = "白龙"
			for i in RoleItemList["白龙"]:
				OtherList.push_back(i)
	return OtherList
func GetCurrentTypeList():#根据选择模式确定物品列表
	var List = GetCurrentRoleList()
	var NewList = []
	if CurrentType == "全部":
		return List
	for i in List:
		if AE.AllEquipment_[i]["类型"] == CurrentType:
			NewList.push_back(i)
	return NewList	
func GetCurrentMaxPage():#根据当前选择的模式确定最大页码
	var CurrentList = GetCurrentTypeList()
	if int(CurrentList.size()) % 6 == 0:
		return int(CurrentList.size() / 6)
	else:
		return int(CurrentList.size() / 6) + 1
func GetPageList():#根据模式传出可用的页码列表
	var CurrentList = GetCurrentTypeList()
	var PageDic = {}
	for i in range(GetCurrentMaxPage()):
		var num = i + 1
		PageDic["Page_" + str(num)] = []
	var loc_1_: int = 1
	var num: int = 1
	var PageNum: int = 1
	for i in CurrentList:
		if num < 6:
			num += 1
			PageDic["Page_" + str(PageNum)].push_back(i)
		else:
			num = 1
			PageDic["Page_" + str(PageNum)].push_back(i)
			PageNum += 1
			
	return PageDic
func GetFinishItemNum():
	var Num: int = 0
	var List = []
	if CurrentType == "全部":
		return PlayerData.player_data["幻化拥有列表"].size()
	for i in PlayerData.player_data["幻化拥有列表"]:
		if AE.AllEquipment_[i]["类型"] == CurrentType:
			List.push_back(i)
	return List.size()
func AddBox():#添加格子，调用这个即可
	RemoveBox()
	var Dic = GetPageList()
	if Dic.size() > 0:
		for i in Dic["Page_" + str(currentpage)]:
			Global.AddTransBox(box_list,i,self)	
func RemoveBox():
	for i in box_list.get_children():
		i.queue_free()
		#box_list.remove_child(i)	
	
	
func set_box_():
	if PlayerData.player_data["幻化列表"]["武器"] == "":
		wqq.get_item_name = "empty"
	else:
		wqq.get_item_name = PlayerData.player_data["幻化列表"]["武器"]
	if PlayerData.player_data["幻化列表"]["防具"] == "":
		fjj.get_item_name = "empty"
	else:
		fjj.get_item_name = PlayerData.player_data["幻化列表"]["防具"]
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		cbb.get_item_name = "empty"
	else:
		cbb.get_item_name = PlayerData.player_data["幻化列表"]["翅膀"]
	if wqq.get_item_name == "empty":
		wqq.set_button_icon(load_("empty"))
		wq.visible = true
	else:
		wq.visible = false
		wqq.is_in_ldl_gz = true
		wqq.is_in_hh = true
		if PlayerData.player_data["幻化列表"]["武器"] == "":
			wqq.set_button_icon(load_("empty"))
			wqq.EQ_prop = {}
		else:
			wqq.set_button_icon(load_(PlayerData.player_data["幻化列表"]["武器"]))
			wqq.EQ_prop = AE.AllEquipment_[PlayerData.player_data["幻化列表"]["武器"]]
		wqq.qh_level = 0
		wqq.wx = []
	if fjj.get_item_name == "empty":
		fj_2.visible = true
		fjj.set_button_icon(load_("empty"))
	else:
		fj_2.visible = false
		fjj.is_in_ldl_gz = true
		fjj.is_in_hh = true
		if PlayerData.player_data["幻化列表"]["防具"] == "":
			fjj.set_button_icon(load_("empty"))
			fjj.EQ_prop = {}
		else:
			fjj.set_button_icon(load_(PlayerData.player_data["幻化列表"]["防具"]))
			fjj.EQ_prop = AE.AllEquipment_[PlayerData.player_data["幻化列表"]["防具"]]
		fjj.qh_level = 0
		fjj.wx = []
	if cbb.get_item_name == "empty":
		cb.visible = true
		cbb.set_button_icon(load_("empty"))
	else:
		cb.visible = false
		cbb.is_in_ldl_gz = true
		cbb.is_in_hh = true
		if PlayerData.player_data["幻化列表"]["翅膀"] == "":
			cbb.set_button_icon(load_("empty"))
			cbb.EQ_prop = {}
		else:
			cbb.set_button_icon(load_(PlayerData.player_data["幻化列表"]["翅膀"]))
			cbb.EQ_prop = AE.AllEquipment_[PlayerData.player_data["幻化列表"]["翅膀"]]
		cbb.qh_level = 0
		cbb.wx = []
func _ready() -> void:
	PushEqToList()
	maxpage = GetCurrentMaxPage()
	match PlayerId:
		1:
			$BG/Player/Playerplay.play("Wait")
			RoleItemList["头衔"].push_back("qtds")
		2:
			$BG/Player/Playerplay.play("Wait2")
			RoleItemList["头衔"].push_back("jcz")
		3:
			$BG/Player/Playerplay.play("Wait3")
			RoleItemList["头衔"].push_back("tpys")
		4:
			$BG/Player/Playerplay.play("wait4")
			RoleItemList["头衔"].push_back("jldj")
		5:
			$BG/Player/Playerplay.play("wait5")
			RoleItemList["头衔"].push_back("lwstz")
	infor.text = str(currentpage) + '/' + str(maxpage)
	onEqchange()
	AddBox()
func _physics_process(_delta: float) -> void:
	SetWingsOffset()
	var Num = GetFinishItemNum()
	maxpage = GetCurrentMaxPage()
	infor.text = str(currentpage) + '/' + str(maxpage)
	#Global.CollectNum = int(Num)
	collect_value.text = str(CurrentType) + '收集进度：(' + str(Num) + '/' + str(GetCurrentTypeList().size()) + ")"
func _on_close_pressed() -> void:
	queue_free()


func _on_last_pressed() -> void:
	if currentpage > 1:
		currentpage -= 1
		AddBox()
func _on_next_pressed() -> void:
	if currentpage < maxpage:
		currentpage += 1
		AddBox()
func onEqchange():
	var WQ: String
	var Fj: String
	
	if PlayerData.player_data["幻化列表"]["武器"] == "":
		if PlayerData.player_data["武器"].size() == 0:
			WQ = "Empty"
		else:
			WQ = str(PlayerData.player_data["武器"][0]["名字"])
	else:
		WQ = str(PlayerData.player_data["幻化列表"]["武器"])
	ChangeEq(WQ)
	if PlayerData.player_data["幻化列表"]["防具"] == "":	
		if PlayerData.player_data["时装"].size() == 0:		
			if PlayerData.player_data["防具"].size() == 0:
				Fj = "Empty"
			else:
				Fj = str(PlayerData.player_data["防具"][0]["名字"])
		else:
			Fj = str(PlayerData.player_data["时装"][0]["名字"])
	else:
		Fj = str(PlayerData.player_data["幻化列表"]["防具"])
	Fj = Global.GetName(Fj)
	ChangeBody(Fj)
	var WingsList
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		if PlayerData.player_data["翅膀"].size() == 0:
			wings.visible = false
			WingsList = "empty"
		else:
			wings.visible = true
			WingsList = PlayerData.player_data["翅膀"][0]["名字"]
	else:
		wings.visible = true
		WingsList = PlayerData.player_data["幻化列表"]["翅膀"]
		print(WingsList)
	wings.play(WingsList)
	ChangeTx()
	set_box_()
func ChangeBody(name_):
	role_body.texture = Global.LoadRole1Body(name_)
func ChangeEq(name_):
	role_equipment.texture = Global.LoadRole1EQ(name_)
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
func ChangeTx():
	if PlayerData.player_data["幻化列表"]["头衔"] == "":
		if PlayerData.player_data["头衔"].size() == 0:
			tx.play("Empty")
		else:
			var mz = PlayerData.player_data["头衔"][0]["名字"]
			tx.play(mz)
	else:
		tx.play(PlayerData.player_data["幻化列表"]["头衔"])

func _on_total_pressed() -> void:
	CurrentType = "全部"

func _on_wq_pressed() -> void:
	CurrentType = "武器"

func _on_fj_pressed() -> void:
	CurrentType = "防具"

func _on_cb_pressed() -> void:
	CurrentType = "翅膀"
	
func _on_sz_pressed() -> void:
	CurrentType = "时装"


func _on_tx_pressed() -> void:
	CurrentType = "头衔"
func SetWingsOffset():
	var CurrentWingsName: String
	if PlayerData.player_data["幻化列表"]["翅膀"] == "":
		if PlayerData.player_data["翅膀"].size() == 0:
			CurrentWingsName = "empty"
		else:
			CurrentWingsName = PlayerData.player_data["翅膀"][0]["名字"]
	else:
		CurrentWingsName = PlayerData.player_data["幻化列表"]["翅膀"]
	match CurrentWingsName:
		"xtzy","ttzy":
			wings.offset = Vector2(0,0)
			wings.scale = Vector2(1.6,1.6) 
		"xqzy":
			wings.offset = Vector2(5,15)
			wings.scale = Vector2(1.2,1.2) 
		"jmzy":
			wings.offset = Vector2(20,15)
			wings.scale = Vector2(1.1,1.1) 
		"xmzy":
			wings.offset = Vector2(20,-15)
			wings.scale = Vector2(1,1) 
		"bszy":
			wings.offset = Vector2(15,15)
			wings.scale = Vector2(1,1) 
