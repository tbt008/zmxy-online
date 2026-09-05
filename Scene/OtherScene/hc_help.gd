extends Node2D
@onready var page: Label = $BG/ChangePage/Page
var message
var PositonList = [Vector2(0,-10),Vector2(0,45),Vector2(0,100),Vector2(0,155)]
var TotalList =[
	{"cl_1":"qhs_1","cl_2":"qhs_1","cl_3":"qhs_1","scw":"qhs_2"},
	{"cl_1":"qhs_2","cl_2":"qhs_2","cl_3":"qhs_2","scw":"qhs_3"},
	{"cl_1":"qhs_3","cl_2":"qhs_3","cl_3":"qhs_3","scw":"qhs_4"},
	{"cl_1":"ttlp1","cl_2":"ttlp2","cl_3":"ttlp3","scw":"ttlp"},
	
	{"cl_1":"sms_1","cl_2":"sms_1","cl_3":"sms_1","scw":"sms_2"},#宝石
	{"cl_1":"sms_2","cl_2":"sms_2","cl_3":"sms_2","scw":"sms_3"},#宝石
	{"cl_1":"sms_3","cl_2":"sms_3","cl_3":"sms_3","scw":"sms_4"},#宝石
	{"cl_1":"sms_4","cl_2":"sms_4","cl_3":"sms_4","scw":"sms_5"},#宝石
	
	{"cl_1":"fls_1","cl_2":"fls_1","cl_3":"fls_1","scw":"fls_2"},#宝石
	{"cl_1":"fls_2","cl_2":"fls_2","cl_3":"fls_2","scw":"fls_3"},#宝石
	{"cl_1":"fls_3","cl_2":"fls_3","cl_3":"fls_3","scw":"fls_4"},#宝石
	{"cl_1":"fls_4","cl_2":"fls_4","cl_3":"fls_4","scw":"fls_5"},#宝石
	
	{"cl_1":"gjs_1","cl_2":"gjs_1","cl_3":"gjs_1","scw":"gjs_2"},#宝石
	{"cl_1":"gjs_2","cl_2":"gjs_2","cl_3":"gjs_2","scw":"gjs_3"},#宝石
	{"cl_1":"gjs_3","cl_2":"gjs_3","cl_3":"gjs_3","scw":"gjs_4"},#宝石
	{"cl_1":"gjs_4","cl_2":"gjs_4","cl_3":"gjs_4","scw":"gjs_5"},#宝石
	
	{"cl_1":"wfs_1","cl_2":"wfs_1","cl_3":"wfs_1","scw":"wfs_2"},#宝石
	{"cl_1":"wfs_2","cl_2":"wfs_2","cl_3":"wfs_2","scw":"wfs_3"},#宝石
	{"cl_1":"wfs_3","cl_2":"wfs_3","cl_3":"wfs_3","scw":"wfs_4"},#宝石
	{"cl_1":"wfs_4","cl_2":"wfs_4","cl_3":"wfs_4","scw":"wfs_5"},#宝石
	
	{"cl_1":"mfs_1","cl_2":"mfs_1","cl_3":"mfs_1","scw":"mfs_2"},#宝石
	{"cl_1":"mfs_2","cl_2":"mfs_2","cl_3":"mfs_2","scw":"mfs_3"},#宝石
	{"cl_1":"mfs_3","cl_2":"mfs_3","cl_3":"mfs_3","scw":"mfs_4"},#宝石
	{"cl_1":"mfs_4","cl_2":"mfs_4","cl_3":"mfs_4","scw":"mfs_5"},#宝石
	
	{"cl_1":"bjs_1","cl_2":"bjs_1","cl_3":"bjs_1","scw":"bjs_2"},#宝石
	{"cl_1":"bjs_2","cl_2":"bjs_2","cl_3":"bjs_2","scw":"bjs_3"},#宝石
	{"cl_1":"bjs_3","cl_2":"bjs_3","cl_3":"bjs_3","scw":"bjs_4"},#宝石
	{"cl_1":"bjs_4","cl_2":"bjs_4","cl_3":"bjs_4","scw":"bjs_5"},#宝石
	
	{"cl_1":"sbs_1","cl_2":"sbs_1","cl_3":"sbs_1","scw":"sbs_2"},#宝石
	{"cl_1":"sbs_2","cl_2":"sbs_2","cl_3":"sbs_2","scw":"sbs_3"},#宝石
	{"cl_1":"sbs_3","cl_2":"sbs_3","cl_3":"sbs_3","scw":"sbs_4"},#宝石
	{"cl_1":"sbs_4","cl_2":"sbs_4","cl_3":"sbs_4","scw":"sbs_5"},#宝石
	
	{"cl_1":"hxs_1","cl_2":"hxs_1","cl_3":"hxs_1","scw":"hxs_2"},#宝石
	{"cl_1":"hxs_2","cl_2":"hxs_2","cl_3":"hxs_2","scw":"hxs_3"},#宝石
	{"cl_1":"hxs_3","cl_2":"hxs_3","cl_3":"hxs_3","scw":"hxs_4"},#宝石
	{"cl_1":"hxs_4","cl_2":"hxs_4","cl_3":"hxs_4","scw":"hxs_5"},#宝石
	
	{"cl_1":"hms_1","cl_2":"hms_1","cl_3":"hms_1","scw":"hms_2"},#宝石
	{"cl_1":"hms_2","cl_2":"hms_2","cl_3":"hms_2","scw":"hms_3"},#宝石
	{"cl_1":"hms_3","cl_2":"hms_3","cl_3":"hms_3","scw":"hms_4"},#宝石
	{"cl_1":"hms_4","cl_2":"hms_4","cl_3":"hms_4","scw":"hms_5"},#宝石
	
	{"cl_1":"pjs_1","cl_2":"pjs_1","cl_3":"pjs_1","scw":"pjs_2"},#宝石
	{"cl_1":"pjs_2","cl_2":"pjs_2","cl_3":"pjs_2","scw":"pjs_3"},#宝石
	{"cl_1":"pjs_3","cl_2":"pjs_3","cl_3":"pjs_3","scw":"pjs_4"},#宝石
	{"cl_1":"pjs_4","cl_2":"pjs_4","cl_3":"pjs_4","scw":"pjs_5"},#宝石
	
	{"cl_1":"pms_1","cl_2":"pms_1","cl_3":"pms_1","scw":"pms_2"},#宝石
	{"cl_1":"pms_2","cl_2":"pms_2","cl_3":"pms_2","scw":"pms_3"},#宝石
	{"cl_1":"pms_3","cl_2":"pms_3","cl_3":"pms_3","scw":"pms_4"},#宝石
	{"cl_1":"pms_4","cl_2":"pms_4","cl_3":"pms_4","scw":"pms_5"},#宝石
	
	
	{"cl_1":"bms_1","cl_2":"bms_1","cl_3":"bms_1","scw":"bms_2"},#宝石
	{"cl_1":"bms_2","cl_2":"bms_2","cl_3":"bms_2","scw":"bms_3"},#宝石
	{"cl_1":"bms_3","cl_2":"bms_3","cl_3":"bms_3","scw":"bms_4"},#宝石
	{"cl_1":"bms_4","cl_2":"bms_4","cl_3":"bms_4","scw":"bms_5"},#宝石
	
	{"cl_1":"xys_1","cl_2":"xys_1","cl_3":"xys_1","scw":"xys_2"},#宝石
	{"cl_1":"xys_2","cl_2":"xys_2","cl_3":"xys_2","scw":"xys_3"},#宝石
	{"cl_1":"xys_3","cl_2":"xys_3","cl_3":"xys_3","scw":"xys_4"},#宝石
	{"cl_1":"xys_4","cl_2":"xys_4","cl_3":"xys_4","scw":"xys_5"},#宝石
	
	{"cl_1":"rxs_1","cl_2":"rxs_1","cl_3":"rxs_1","scw":"rxs_2"},#宝石
	{"cl_1":"rxs_2","cl_2":"rxs_2","cl_3":"rxs_2","scw":"rxs_3"},#宝石
	{"cl_1":"rxs_3","cl_2":"rxs_3","cl_3":"rxs_3","scw":"rxs_4"},#宝石
	{"cl_1":"rxs_4","cl_2":"rxs_4","cl_3":"rxs_4","scw":"rxs_5"},#宝石
	
	{"cl_1":"mzs_1","cl_2":"mzs_1","cl_3":"mzs_1","scw":"mzs_2"},#宝石
	{"cl_1":"mzs_2","cl_2":"mzs_2","cl_3":"mzs_2","scw":"mzs_3"},#宝石
	{"cl_1":"mzs_3","cl_2":"mzs_3","cl_3":"mzs_3","scw":"mzs_4"},#宝石
	{"cl_1":"mzs_4","cl_2":"mzs_4","cl_3":"mzs_4","scw":"mzs_5"},#宝石
	#======================================法宝=========================
	{"cl_1":"dsyj","cl_2":"dsqz","cl_3":"dslj","scw":"dshl"},#地煞葫芦		
#	{"cl_1":"dsyj","cl_2":"dszy","cl_3":"dslj","scw":"dshl"},	
#	{"cl_1":"dszy","cl_2":"dsqz","cl_3":"dslj","scw":"dshl"},	
#	{"cl_1":"dsyj","cl_2":"dsqz","cl_3":"dszy","scw":"dshl"},	
	{"cl_1":"tsyp","cl_2":"tsyj","cl_3":"tsgl","scw":"tsgj"},#天煞古剑		
	{"cl_1":"xhxh","cl_2":"xhmj","cl_3":"xhyk","scw":"xhmt"},#血海魔童		
#	{"cl_1":"xhymk","cl_2":"xhmj","cl_3":"xhyk","scw":"xhmt"},
#	{"cl_1":"xhxh","cl_2":"xhymk","cl_3":"xhyk","scw":"xhmt"},
#	{"cl_1":"xhxh","cl_2":"xhmj","cl_3":"xhymk","scw":"xhmt"},
	{"cl_1":"bsxj","cl_2":"bszj","cl_3":"bsyz","scw":"bsyj"},#白霜妖镜
	{"cl_1":"lcld","cl_2":"lczh","cl_3":"lcgy","scw":"lsys"},
	{"cl_1":"kyc","cl_2":"kys","cl_3":"kyz","scw":"kyl"},
	{"cl_1":"xhc","cl_2":"xhp","cl_3":"xhz","scw":"xhhl"},
	{"cl_1":"qysz","cl_2":"qyfp","cl_3":"qybd","scw":"qyj"},
	{"cl_1":"hylz","cl_2":"hylk","cl_3":"hylc","scw":"zjfyd"},
	{"cl_1":"zjbtg","cl_2":"zjksf","cl_3":"zjqj","scw":"zjhl"},
#=======================时装=================================
	{"cl_1":"putongnmwsz","cl_2":"putongnmwsz","cl_3":"putongnmwsz","scw":"youxiunmwsz"},
	{"cl_1":"youxiunmwsz","cl_2":"youxiunmwsz","cl_3":"youxiunmwsz","scw":"jingliangnmwsz"},
	{"cl_1":"jingliangnmwsz","cl_2":"jingliangnmwsz","cl_3":"jingliangnmwsz","scw":"shishinmwsz"},
	{"cl_1":"putongzlwsz","cl_2":"putongzlwsz","cl_3":"putongzlwsz","scw":"youxiuzlwsz"},
	{"cl_1":"youxiuzlwsz","cl_2":"youxiuzlwsz","cl_3":"youxiuzlwsz","scw":"jingliangzlwsz"},
	{"cl_1":"jingliangzlwsz","cl_2":"jingliangzlwsz","cl_3":"jingliangzlwsz","scw":"shishizlwsz"},
#=======================装备=================================
	{"cl_1":"jssp","cl_2":"qssp","cl_3":"lssp","scw":"ssc"},
	{"cl_1":"hshb","cl_2":"zshb","cl_3":"lshb","scw":"qcp"},	
	{"cl_1":"yizfw","cl_2":"yazfw","cl_3":"fygwj","scw":"gwj"},
	{"cl_1":"yizfw","cl_2":"zshb","cl_3":"lssp","scw":"bap"},
	{"cl_1":"yazfw","cl_2":"hshb","cl_3":"qssp","scw":"mwq"},
	{"cl_1":"bsyz","cl_2":"bsyz","cl_3":"bsyz","scw":"bsxj"},
	{"cl_1":"bsxj","cl_2":"bsxj","cl_3":"bsxj","scw":"bszj"},
	{"cl_1":"bszj","cl_2":"bszj","cl_3":"bszj","scw":"bsyz"},
	{"cl_1":"t","cl_2":"t","cl_3":"dzj","scw":"dzjj"},
	{"cl_1":"c","cl_2":"c","cl_3":"dzj","scw":"dzjj"},
	{"cl_1":"ch","cl_2":"ch","cl_3":"dzj","scw":"dzjj"},
	{"cl_1":"tflj","cl_2":"mgzh","cl_3":"tdlzj","scw":"fybz"},
	{"cl_1":"ptsryx","cl_2":"ptsryx","cl_3":"ptsryx","scw":"yxsryx"},
	{"cl_1":"yxsryx","cl_2":"yxsryx","cl_3":"yxsryx","scw":"jlsryx"},
	{"cl_1":"jlsryx","cl_2":"jlsryx","cl_3":"jlsryx","scw":"sssryx"},
	{"cl_1":"sssryx","cl_2":"sssryx","cl_3":"sssryx","scw":"xlsryx"},

#=======================丹药=================================
	{"cl_1":"renshen","cl_2":"renshen","cl_3":"renshen","scw":"smd_1"},
	{"cl_1":"dudan","cl_2":"renshen","cl_3":"smd_1","scw":"smd_2"},
	{"cl_1":"dudan","cl_2":"renshen","cl_3":"smd_2","scw":"smd_3"},
	{"cl_1":"dudan","cl_2":"renshen","cl_3":"smd_3","scw":"smd_4"},
	{"cl_1":"dudan","cl_2":"renshen","cl_3":"smd_4","scw":"smd_5"},
	
	{"cl_1":"xianmao","cl_2":"xianmao","cl_3":"xianmao","scw":"fld_1"},
	{"cl_1":"dudan","cl_2":"xianmao","cl_3":"fld_1","scw":"fld_2"},
	{"cl_1":"dudan","cl_2":"xianmao","cl_3":"fld_2","scw":"fld_3"},
	{"cl_1":"dudan","cl_2":"xianmao","cl_3":"fld_3","scw":"fld_4"},
	{"cl_1":"dudan","cl_2":"xianmao","cl_3":"fld_4","scw":"fld_5"},
	
	{"cl_1":"lingli","cl_2":"lingli","cl_3":"lingli","scw":"gjd_1"},
	{"cl_1":"dudan","cl_2":"lingli","cl_3":"gjd_1","scw":"gjd_2"},
	{"cl_1":"dudan","cl_2":"lingli","cl_3":"gjd_2","scw":"gjd_3"},
	{"cl_1":"dudan","cl_2":"lingli","cl_3":"gjd_3","scw":"gjd_4"},
	{"cl_1":"dudan","cl_2":"lingli","cl_3":"gjd_4","scw":"gjd_5"},
	
	{"cl_1":"leizong","cl_2":"leizong","cl_3":"leizong","scw":"bjd_1"},
	{"cl_1":"dudan","cl_2":"leizong","cl_3":"bjd_1","scw":"bjd_2"},
	{"cl_1":"dudan","cl_2":"leizong","cl_3":"bjd_2","scw":"bjd_3"},
	{"cl_1":"dudan","cl_2":"leizong","cl_3":"bjd_3","scw":"bjd_4"},
	{"cl_1":"dudan","cl_2":"leizong","cl_3":"bjd_4","scw":"bjd_5"},
	
	{"cl_1":"liuhuang","cl_2":"liuhuang","cl_3":"liuhuang","scw":"xyd_1"},
	{"cl_1":"dudan","cl_2":"liuhuang","cl_3":"xyd_1","scw":"xyd_2"},
	{"cl_1":"dudan","cl_2":"liuhuang","cl_3":"xyd_2","scw":"xyd_3"},
	{"cl_1":"dudan","cl_2":"liuhuang","cl_3":"xyd_3","scw":"xyd_4"},
	{"cl_1":"dudan","cl_2":"liuhuang","cl_3":"xyd_4","scw":"xyd_5"},
	
	{"cl_1":"shougong","cl_2":"shougong","cl_3":"shougong","scw":"hmd_1"},
	{"cl_1":"dudan","cl_2":"shougong","cl_3":"hmd_1","scw":"hmd_2"},
	{"cl_1":"dudan","cl_2":"shougong","cl_3":"hmd_2","scw":"hmd_3"},
	{"cl_1":"dudan","cl_2":"shougong","cl_3":"hmd_3","scw":"hmd_4"},
	{"cl_1":"dudan","cl_2":"shougong","cl_3":"hmd_4","scw":"hmd_5"},
	
	{"cl_1":"rls","cl_2":"rls","cl_3":"th","scw":"tss"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"ey","scw":"yhs"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"tc","scw":"tss"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"cz","scw":"yhs"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"tz","scw":"tss"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"ry","scw":"yhs"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"ts","scw":"tss"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"yj","scw":"yhs"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"tq","scw":"tss"},
	{"cl_1":"rls","cl_2":"rls","cl_3":"ze","scw":"yhs"},
]
var ZBlIST = []
var DJlIST = []
var FBlIST = []
var SZlIST = []
var ItemList_ = []
var L_zbList = {}
var L_djList = {}
var L_fbList = {}
var L_szList = {}
var L_totalList = {}
var TotalPage: int
var ZBPage: int
var DJPage: int
var FBPage: int	
var SZPage: int	
var CurrentPage: int = 1:
	set(vl):
		CurrentPage = vl
		ADDHelpItems()
var MaxPage: int
var CurrentType: int = 0:
	set(vl):
		CurrentType = vl
		OnCurrentTypeChange()
func _ready() -> void:
	GetList()
	GetTargetPageItemList(TotalList)
	ADDHelpItems()
	TotalPage = GetPage(TotalList)
	ZBPage = GetPage(ZBlIST)
	DJPage = GetPage(DJlIST)
	FBPage = GetPage(FBlIST)
	SZPage = GetPage(SZlIST)	
func _physics_process(delta: float) -> void:
	match CurrentType:
		0:
			MaxPage = TotalPage
		1:
			MaxPage = ZBPage
		2:
			MaxPage = DJPage
		3:
			MaxPage = FBPage
		4:
			MaxPage = SZPage
	page.text = str(CurrentPage) + '/' + str(MaxPage)
func GetList():
	for i in TotalList:
		var Type = AE.AllEquipment_[i["scw"]]["类型"]
		if Type == "武器" or Type == "防具" or Type == "饰品" or Type == "头衔":
			ZBlIST.push_back(i)
		elif Type == "道具":
			DJlIST.push_back(i)
		elif Type == "法宝":
			FBlIST.push_back(i)
		elif Type == "时装":
			SZlIST.push_back(i)
	L_zbList = GetTargetPageItemList(ZBlIST)
	L_djList = GetTargetPageItemList(DJlIST)
	L_fbList = GetTargetPageItemList(FBlIST)
	L_szList = GetTargetPageItemList(SZlIST)
	L_totalList = GetTargetPageItemList(TotalList)
func GetTargetPageItemList(List):
	var PageList = {}
	var currentpage: int = 1
	var MM
	if int(List.size() % 4) == 0:
		MM = int(List.size() / 4)
	else:
		MM = int(List.size() / 4) + 1
	var CurrentNum: int = 1
	for i in range(MM):
		PageList["page" + str(i + 1)] = []
	for i in List:
		if PageList["page" + str(currentpage)].size() < 4:
			PageList["page" + str(currentpage)].push_back(i)
		else:
			currentpage += 1
			PageList["page" + str(currentpage)].push_back(i)
		
	return PageList
func GetPage(List):
	var MM
	if int(List.size() % 4) == 0:
		MM = int(List.size() / 4)
	else:
		MM = int(List.size() / 4) + 1
	return MM
func OnCurrentTypeChange():
	CurrentPage = 1
	ADDHelpItems()


func ADDHelpItems():
	RemoveItem()
	#return
	var List = []
	var Num: int = 0
	match CurrentType:
		0:	
			if L_totalList != {}:	
				for i in L_totalList["page" + str(CurrentPage)]:
					ItemList_.push_back(Global.AddHelpThing(self,PositonList[Num],i))
					Num += 1
					#print(Num)
		1:
			if L_zbList != {}:
				for i in L_zbList["page" + str(CurrentPage)]:
					ItemList_.push_back(Global.AddHelpThing(self,PositonList[Num],i))
					Num += 1
		2:
			if L_djList != {}:
				for i in L_djList["page" + str(CurrentPage)]:
					ItemList_.push_back(Global.AddHelpThing(self,PositonList[Num],i))
					Num += 1
		3:
			if L_fbList != {}:
				for i in L_fbList["page" + str(CurrentPage)]:
					ItemList_.push_back(Global.AddHelpThing(self,PositonList[Num],i))
					Num += 1
		4:
			if L_szList != {}:
				for i in L_szList["page" + str(CurrentPage)]:
					ItemList_.push_back(Global.AddHelpThing(self,PositonList[Num],i))
					Num += 1
func RemoveItem():
	for i in ItemList_:
		if i != null:
			i.queue_free()


func _on_last_pressed() -> void:
	if CurrentPage > 1:
		CurrentPage -= 1


func _on_next_pressed() -> void:
	if CurrentPage < MaxPage:
		CurrentPage += 1


func _on_total_pressed() -> void:
	CurrentType = 0


func _on_zb_pressed() -> void:
	CurrentType = 1


func _on_dj_pressed() -> void:
	CurrentType = 2


func _on_fb_pressed() -> void:
	CurrentType = 3

func _on_sz_pressed() -> void:
	CurrentType = 4
	
	
func _on_close_pressed() -> void:
	self.queue_free()

#func SetList(Name_List,SCW):
#	var List = ["dslj","dsyj","dslq","dszy","dsqz","dshp"]
#	var LastList = []
#	var TotalSize = Name_List.size()
#	var Times
#	for i in range(TotalSize - 2):
#		LastList.push_back({"cl_1":Name_List[0],"cl_2":Name_List[1],"cl_3":i,"scw":SCW})
#
#	print(LastList)

func add_text(text,parent):
	if message == null:
		message = Global.AddBasicMonmentInfo(parent,text,get_global_mouse_position() + Vector2(40,40))
func remove_text():
	if message != null:
		message.queue_free()

func _on_other_help_mouse_entered() -> void:
	add_text("同类型的装备均可以参与法宝合成！",get_parent())


func _on_other_help_mouse_exited() -> void:
	remove_text()
