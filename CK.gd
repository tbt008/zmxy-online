extends Node
class_name CheckC
func _physics_process(delta: float) -> void:
	return
	if Input.is_action_just_pressed("开启关卡"):
		OpenAll()
	
	return
	if PlayerData.check_zb("xczg") != []:
		return
	if PlayerData.player_data["玩家等级"] > 50:
		removedata()

	if PlayerData.player_data["玩家当前经验"] > 300000:
		removedata()
	if PlayerData.player_data["玩家等级"] <= 1:	
		if PlayerData.player_data["coin_num"] >= 1000:
			removedata()
	if PlayerData.player_data["coin_num"] >= 100000000:
		removedata()
		
	if RoleProp.roleprop.SHp >= 30000:
		removedata()
		
	if RoleProp.roleprop.SMp >= 15000:
		removedata()
		
	if RoleProp.roleprop.power >= 4000:
		removedata()
		
	if RoleProp.roleprop.Lucky >= 250:
		removedata()
		
	if RoleProp.roleprop.vampirism >= 0.1:
		removedata()
		
	if RoleProp.roleprop.Def >= 450:
		removedata()
		
	if RoleProp.roleprop.Mdef >= 450:
		removedata()
		
	if RoleProp.roleprop.R_hp >= 90:
		removedata()
		
	if RoleProp.roleprop.R_mp >= 90:
		removedata()
		
	if RoleProp.roleprop.Crit >= 350:
		removedata()
		
	if RoleProp.roleprop.Miss >= 300:
		removedata()
		
	if RoleProp.roleprop.ar >= 120:
		removedata()
		
	if RoleProp.roleprop.sp >= 120:
		removedata()			
func RemoveWhenLh(num):
	if PlayerData.player_data["coin_num"] >= num:
		removedata()
		
func zl_zb():
	var list = []
	for i in range(1,10):
		for u in PlayerData.player_data["装备列表"]["页码" + str(i + 1)]:
			list.push_back(u)
	return list
func removedata():
	MemoryClass.Remove()
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")
	await get_tree().create_timer(3,false).timeout
	get_tree().quit()
func CheckMagicWeaponInfo():
	var List = zl_zb()
	if List.size() != null:
		for i in List:
			pass
	pass
func OpenAll():
	pass
#	PlayerData.add_dj("ttlp",1)
#	PlayerData.add_dj("mjlp",1)
#	PlayerData.add_dj("smd_1",5)
#	PlayerData.add_dj("smd_2",5)
#	PlayerData.add_dj("smd_3",5)
#	PlayerData.add_dj("smd_4",5)
#	PlayerData.add_dj("smd_5",5)
#	PlayerData.add_dj("gjd_1",5)
#	PlayerData.add_dj("gjd_2",5)
#	PlayerData.add_dj("gjd_3",5)
#	PlayerData.add_dj("gjd_4",5)
#	PlayerData.add_dj("gjd_5",5)
#	PlayerData.add_dj("bjd_1",5)
#	PlayerData.add_dj("bjd_2",5)
#	PlayerData.add_dj("bjd_3",5)
#	PlayerData.add_dj("bjd_4",5)
#	PlayerData.add_dj("bjd_5",5)
#	PlayerData.add_dj("hmd_5",5)
#	PlayerData.add_dj("hmd_4",5)
#	PlayerData.add_dj("hmd_3",5)
#	PlayerData.add_dj("hmd_2",5)
#	PlayerData.add_dj("hmd_1",5)
#	PlayerData.add_dj("xyd_1",5)
#	PlayerData.add_dj("xyd_2",5)
#	PlayerData.add_dj("xyd_3",5)
#	PlayerData.add_dj("xyd_4",5)
#	PlayerData.add_dj("xyd_5",5)
#	PlayerData.add_dj("tss",5)
#	PlayerData.add_dj("yhs",5)
#	PlayerData.add_xhp("bsd_5",5)
#	PlayerData.add_dj("llz",5)
#	PlayerData.add_dj("tlz",5)
#	PlayerData.add_dj("slz",5)
#	PlayerData.add_dj("hlz",5)
#	PlayerData.add_dj("doushuaiziyanzzs",500)
#	PlayerData.add_dj("ziyanyujin",500000)
#	PlayerData.add_dj("xuantie",50000000)
#	PlayerData.add_dj("tanmu",5000000)
#	PlayerData.add_dj("sichou",5000000)
#	PlayerData.add_dj("tss",5000000)
#	PlayerData.add_dj("yhs",5000000)
#	PlayerData.add_dj("rls",5000000)
#	PlayerData.add_dj("qhs_1",5000000)
#	PlayerData.add_dj("qhs_2",5000000)
#	PlayerData.add_dj("qhs_3",5000000)
#	PlayerData.add_dj("qhs_4",5000000)
#	PlayerData.add_dj("qlgzzs",50)
#	PlayerData.add_dj("qljzzs",50)
#	PlayerData.add_dj("plzzzs",50)
#	PlayerData.add_dj("plpzzs",50)
#	PlayerData.add_dj("ylfzzs",50)
#	PlayerData.add_dj("ylkzzs",50)
#	PlayerData.add_dj("jlczzs",50)
#	PlayerData.add_dj("jljzzs",50)
#	PlayerData.add_dj("tlqzzs",50)
#	PlayerData.add_dj("tljzzs",50)
#	PlayerData.add_zb("qybd",3,{})
#	PlayerData.add_zb("qyfp",3,{})
#	PlayerData.add_zb("qysz",3,{})
#	PlayerData.add_zb("zjksf",3,{})
#	PlayerData.add_zb("zjbtg",3,{})
#	PlayerData.add_zb("zjqj",3,{})
#	PlayerData.add_zb("xhymk",3,{})
#	PlayerData.add_zb("xhxh",3,{})
#	PlayerData.add_zb("xhmj",3,{})
#	PlayerData.player_data.水帘洞 = 1
#	PlayerData.player_data.桃花源 = 1
#	PlayerData.player_data.蝙蝠窟 = 1
#	PlayerData.player_data.七星洞 = 1
#	PlayerData.player_data.迦楼罗之穴 = 1
#	PlayerData.player_data.浅岸 = 1
#	PlayerData.player_data.东海 = 1
#	PlayerData.player_data.鲨之涡流 = 1
#	PlayerData.player_data.牛魔谷 = 1
#	PlayerData.player_data["地府"] = true
#	PlayerData.player_data.无常巷 = 1
#	PlayerData.player_data.鬼门关 = 1
#	PlayerData.player_data.接引院 = 1
#	PlayerData.player_data.判官府 = 1
#	PlayerData.player_data.阎罗殿 = 1
#	PlayerData.player_data.忘川河 = 1
#	PlayerData.player_data.奈何桥 = 1
#	PlayerData.player_data.望乡台 = 1
#	PlayerData.player_data.转轮殿 = 1
#	PlayerData.player_data["天庭"] = true
#	PlayerData.player_data.天宫道 = 1
#	PlayerData.player_data.南天门 = 1
#	PlayerData.player_data.南天王殿 = 1
#	PlayerData.player_data.西天王殿 = 1
#	PlayerData.player_data.北天王殿 = 1
#	PlayerData.player_data.彩虹楼 = 1
#	PlayerData.player_data.朝会殿 = 1
#	PlayerData.player_data.凌霄宝殿 = 1
#	PlayerData.player_data.玲珑宝塔 = 1
#	PlayerData.player_data.兜率宫 = 1
#	PlayerData.player_data.兜率宫1 = 1
#	PlayerData.player_data.兜率宫2 = 1
#	PlayerData.player_data.兜率宫3 = 1
#	PlayerData.player_data.兜率宫4 = 1
#	PlayerData.player_data["截教天镜"] = true
#	PlayerData.player_data.九龙岛 = 1
#	PlayerData.player_data.龙脊山 = 1
#	PlayerData.player_data.尾妖林 = 1
#	PlayerData.player_data.仙音岛 = 1
#	PlayerData.player_data.仙幻岛 = 1
#	PlayerData.player_data.仙树岛 = 1
#	PlayerData.player_data.蓬莱岛 = 1
#	PlayerData.player_data.蓬莱仙境 = 1
#	PlayerData.player_data["碧游宫"] = true
