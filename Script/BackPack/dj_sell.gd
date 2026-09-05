extends Control
@onready var v_box_container: VBoxContainer = $MarginContainer2/MarginContainer/VBoxContainer
@onready var infor: Label = $MarginContainer2/MarginContainer/VBoxContainer/infor
@onready var sell_number: LineEdit = $MarginContainer2/MarginContainer/VBoxContainer/sell_number
@onready var use: TextureButton = $MarginContainer2/MarginContainer/VBoxContainer/use
@onready var sell: Button = $MarginContainer2/MarginContainer/VBoxContainer/sell
var ChooseJM
#需要：名字，页码
var my_name
var my_page
var be_number = 0
var is_set = false
var EQ_prop = {}
func _physics_process(_delta: float) -> void:
	infor.text = "名字：" + str(AE.AllEquipment_[my_name]["名字"])
	if AE.AllEquipment_[my_name]["类型"] == "道具" and is_set == false:
		use.disabled = true
		is_set = true
	be_number = int(sell_number.text)
	await get_tree().create_timer(4).timeout
	if ChooseJM == null:
		queue_free()
func _on_sell_number_text_change_rejected(rejected_substring: String) -> void:
	be_number = int(rejected_substring)

func _on_sell_pressed() -> void:
	var Type = AE.AllEquipment_[my_name]["类型"]
	match Type:
		"道具":
			var get_list = PlayerData.remove_dj(my_name,my_page,be_number)
			if be_number > 0 and int(get_list["获得灵魂"]) > 0:
				var name_ = AE.AllEquipment_[my_name]["名字"]
				var parent = get_parent().get_parent().get_parent()
				Global.AddMessageShow(parent,"丢弃：" + str(get_list["卖出数量"]) + "个" + str(name_) + "。  获得：" + str(get_list["获得灵魂"]) + "灵魂。",1.5,Vector2(480,280))
			PlayerData.zl_dj()
			MemoryClass.保存游戏(Global.cd_path)
			queue_free()
		"消耗品":
			var get_list = PlayerData.remove_xhp(my_name,my_page,be_number)
			if be_number > 0 and int(get_list["获得灵魂"]) > 0:
				var name_ = AE.AllEquipment_[my_name]["名字"]
				var parent = get_parent().get_parent().get_parent()
				Global.AddMessageShow(parent,"丢弃：" + str(get_list["卖出数量"]) + "个" + str(name_) + "。  获得：" + str(get_list["获得灵魂"]) + "灵魂。",1.5,Vector2(480,280))
			PlayerData.zl_xhp()
			MemoryClass.保存游戏(Global.cd_path)
			queue_free()

func _on_use_pressed() -> void:#消耗品使用方法，到时候一点一点家里面就行了
	if be_number <= 1:
		be_number = 1
		
	if be_number >= PlayerData.get_xhp_data(my_name):
		be_number = PlayerData.get_xhp_data(my_name)
	use_xhp()
	#MemoryClass.保存游戏(Global.cd_path)
	#queue_free()


func _on_panel_mouse_exited() -> void:
	queue_free()
func UseMpyj():
	for i in PlayerData.player_data["技能学习"]:
		if PlayerData.player_data["技能学习"][i].has("等级"):
			if PlayerData.player_data["技能学习"][i]["等级"] > 1:
				PlayerData.player_data["技能学习"][i]["等级"] = 1
	PlayerData.remove_xhp(my_name,my_page,1)
	var parent = get_parent().get_parent().get_parent()
	Global.AddMessageShow(parent,"技能等级已重置！。",1.5,Vector2(450,300))
	queue_free()
func use_xhp():
	match my_name:
		"yll":
			if PlayerData.player_data["望乡台"] == 1:
				PlayerData.remove_xhp(my_name,my_page,1)
				Global.change_secen("res://Scene/Level/Level_Eighteenth_Hell.tscn")
			else:
				var parent = get_parent().get_parent().get_parent()
				Global.AddMessageShow(parent,"需通关“奈何桥“！！。",1.5,Vector2(450,300))
		"mpyj":
			self.visible = false
			Signals.ConnectChooseBoxSignal(self,"UseMpyj")
			ChooseJM = Global.add_choose_text(Global.get_parent_(self,3),Vector2(0,0),"确定使用孟婆药剂吗，所有高于1级的技能等级将清除为1（不返还灵魂）？",0)
		"qhsbx":
			var a = Global.GetAllItemNum(["qhs_1","qhs_2","qhs_3","qhs_4"],be_number,randi_range(3,4))
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"hhbx":
			var a = Global.GetAllItemNum(["qhs_1","qhs_2","qhs_3","qhs_4","bsz","c","ch","t","hshb","lshb","zshb","yazfw","yizfw","fygwj","jssp","lssp","qssp","yll","zxbx_1","zxbx_2","zxbx_3"],be_number,randi_range(1,1))
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"zxbx_1":
			var LIST = [{"名字":"qhs_1","num": 5,"五行":[]},{"名字":"qhs_2","num": 2,"五行":[]},{"名字":"qhs_3","num": 1,"五行":[]},
			{"名字":"qhs_4","num": 1,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"zxbx_2":
			var LIST = [{"名字":"fgwxg","num": 0,"五行":[]},{"名字":"fgwxj","num": 0,"五行":[]},{"名字":"jhcz","num": 0,"五行":[]},
			{"名字":"jcdp","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"zxbx_3":
			var LIST = [{"名字":"qld","num": 0,"五行":[]},{"名字":"xwj","num": 0,"五行":[]},{"名字":"zqj","num": 0,"五行":[]}
			,{"名字":"qlp","num": 0,"五行":[]},{"名字":"bhz","num": 0,"五行":[]},{"名字":"pxk","num": 0,"五行":[]},{"名字":"zhp","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"mhwbx":
			var LIST = [{"名字":"dslj","num": 0,"五行":[]},{"名字":"dszy","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"yrwbx":
			var LIST = [{"名字":"dsyj","num": 0,"五行":[]},{"名字":"dsqz","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"bfsxbx":
			var LIST = [{"名字":"whg","num": 0,"五行":[]},{"名字":"wtp","num": 0,"五行":[]},{"名字":"bsp","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"stwbx":
			var LIST = [{"名字":"jcjp","num": 0,"五行":[]},{"名字":"jcbj","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"pmwbx":
			var LIST = [{"名字":"jcjs","num": 0,"五行":[]},{"名字":"jcsz","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"jmwbx":
			var LIST = [{"名字":"xwj","num": 0,"五行":[]},{"名字":"pxk","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"smwbx":
			var LIST = [{"名字":"qlp","num": 0,"五行":[]},{"名字":"zqj","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"xydxq":
			var parent = get_parent().get_parent().get_parent()
			if not PlayerData.CheckSameIniBuff("DoubleFallPro"):
				PlayerData.remove_xhp(my_name,my_page,1)
				PlayerData.player_data["初始Buff"].push_back({"Name": "DoubleFallPro","value": 0.0,
				"AddTime": 7200,"AttackKind": "SpecialBuff_1","CanRemove":false})
				Global.AddMessageShow(parent,"获得两小时双倍掉率Buff，重进关卡生效。",1.5,Vector2(450,300))
			else:
				Global.AddMessageShow(parent,"当前已有双倍掉率Buff!!!。",1.5,Vector2(450,300))
			queue_free()
		"szbx_1":
			var LIST = [{"名字":"wklzyf","num": 0,"五行":[]},{"名字":"tslzyf","num": 0,"五行":[]},
			{"名字":"bjlzyf","num": 0,"五行":[]},{"名字":"sslzyf","num": 0,"五行":[]}
			,{"名字":"bllzyf","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"szbx_2":
			var LIST = [{"名字":"wkhzyf","num": 0,"五行":[]},{"名字":"tshzyf","num": 0,"五行":[]},
			{"名字":"bjhzyf","num": 0,"五行":[]},{"名字":"sshzyf","num": 0,"五行":[]},{"名字":"blhzyf","num": 0,"五行":[]}]
			Global.add_Choose_Item(Global.get_parent_(get_parent(),2),Vector2(460,260),LIST,my_name,my_page)
			queue_free()
		"bsd_1":
			var a = Global.GetAllItemNum(["sms_1","fls_1","gjs_1","bjs_1","sbs_1","wfs_1","mfs_1"
			,"xys_1","bms_1","rxs_1","pjs_1","pms_1","mzs_1","hxs_1","hms_1"],be_number,1)
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
			
		"bsd_2":
			var a = Global.GetAllItemNum(["sms_2","fls_2","gjs_2","bjs_2","sbs_2","wfs_2","mfs_2"
			,"xys_2","bms_2","rxs_2","pjs_2","pms_2","mzs_2","hxs_2","hms_2"],be_number,1)
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"bsd_3":
			var a = Global.GetAllItemNum(["sms_3","fls_3","gjs_3","bjs_3","sbs_3","wfs_3","mfs_3"
			,"xys_3","bms_3","rxs_3","pjs_3","pms_3","mzs_3","hxs_3","hms_3"],be_number,1)
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"bsd_4":
			var a = Global.GetAllItemNum(["sms_4","fls_4","gjs_4","bjs_4","sbs_4","wfs_4","mfs_4"
			,"xys_4","bms_4","rxs_4","pjs_4","pms_4","mzs_4","hxs_4","hms_4"],be_number,1)
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"bsd_5":
			var a = Global.GetAllItemNum(["sms_5","fls_5","gjs_5","bjs_5","sbs_5","wfs_5","mfs_5"
			,"xys_5","bms_5","rxs_5","pjs_5","pms_5","mzs_5","hxs_5","hms_5"],be_number,1)
			Global.AddRewardInfo(Global.get_parent_(self,3),Vector2(0,0),a,my_name,be_number)
			queue_free()
		"xlhys":
			var parent = get_parent().get_parent().get_parent()
			PlayerData.player_data["coin_num"] += 150000 * be_number
			PlayerData.remove_xhp("xlhys",PlayerData.get_xhp_page("xlhys"),be_number)
			Global.AddMessageShow(parent,"使用" + str(be_number) + "个小灵魂药水获得" + str(be_number * 15) + "w灵魂。",1.5,Vector2(450,300))
			MemoryClass.保存游戏(Global.cd_path)
			queue_free()
		"dlhys":
			var parent = get_parent().get_parent().get_parent()
			PlayerData.player_data["coin_num"] += 600000 * be_number
			PlayerData.remove_xhp("dlhys",PlayerData.get_xhp_page("dlhys"),be_number)
			Global.AddMessageShow(parent,"使用" + str(be_number) + "个大灵魂药水获得" + str(be_number * 60) + "w灵魂。",1.5,Vector2(450,300))
			MemoryClass.保存游戏(Global.cd_path)
			queue_free()
	MemoryClass.保存游戏(Global.cd_path)

