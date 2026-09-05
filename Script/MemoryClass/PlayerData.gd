extends Node

var All_Equipment = ["ryjgb","xhmj","xhxh"]
var Initialized_Data:Dictionary = {
	"玩家等级": 1,
	"玩家当前经验":0,
	"装备列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"道具列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"消耗品列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"幻化列表":{"武器" :"","防具":"","时装":"","翅膀": "","头衔":""},
	"实战法宝":"",
	"武器": [],
	"防具": [],
	"饰品": [],
	"翅膀": [],
	"头衔": [],
	"时装": [],
	"法宝": [],
	"关卡评价":{"花果山":0,"水帘洞":0,"桃花源":0,"蝙蝠窟": 0,"七星洞": 0,"迦楼罗之穴": 0,"浅岸": 0,"东海": 0,"鲨之涡流": 0,"牛魔谷": 0,"火焰山":0,
	"鬼城" :0,"无常巷":0,"鬼门关":0,"接引院": 0,"判官府": 0,"阎罗殿": 0,"忘川河": 0,"奈何桥": 0,"望乡台": 0,"转轮殿": 0,"螺旋地狱":0,
	"九重天" :0,"天宫道":0,"南天门":0,"南天王殿": 0,"西天王殿": 0,"北天王殿": 0,"彩虹楼": 0,"朝会殿": 0,"凌霄宝殿": 0,"玲珑宝塔": 0,"兜率宫":0,"火龙岛":0
	,"九龙岛":0,"龙脊山":0,"尾妖林":0,"仙音岛":0,"仙幻岛":0,"仙树岛":0,"蓬莱岛":0,"蓬莱仙境":0,"绝仙门":0,"陷仙门":0,"戮仙门":0,"紫晶门":0,"指景宫":0
	,"绝境宫":0,"罹乱浩劫":0},
	"幻化拥有列表":[],
	"可进入天庭":false,
	"可进入截教":false,
	"可进入碧游宫":false,
	"玲珑宝塔层数":0,
	"兜率宫层数":0,
	"花果山" :1,
	"水帘洞":0,
	"桃花源":0,
	"蝙蝠窟": 0,
	"七星洞": 0,
	"迦楼罗之穴": 0,
	"浅岸": 0,
	"东海": 0,
	"鲨之涡流": 0,
	"牛魔谷": 0,
	"zyforever":false,
	"地府": false,
	"天庭": false,
	"截教天镜": false,
	"碧游宫": false,
	"Map_num": 1,
	"鬼城" :1,
	"无常巷":0,
	"鬼门关":0,
	"接引院": 0,
	"判官府": 0,
	"阎罗殿": 0,
	"忘川河": 0,
	"奈何桥": 0,
	"望乡台": 0,
	"转轮殿": 0,
	"九重天" :0,
	"天宫道":0,
	"南天门":0,
	"南天王殿": 0,
	"西天王殿": 0,
	"北天王殿": 0,
	"彩虹楼": 0,
	"朝会殿": 0,
	"凌霄宝殿": 0,
	"玲珑宝塔": 0,
	"兜率宫": 0,
	"兜率宫1": 0,
	"兜率宫2": 0,
	"兜率宫3": 0,
	"兜率宫4": 0,
	"兜率宫5": 0,
	"神兽森林": 0,
	"火龙岛": 0,
	"九龙岛": 0,
	"龙脊山": 0,
	"尾妖林": 0,
	"仙音岛": 0,
	"仙幻岛": 0,
	"仙树岛": 0,
	"蓬莱岛": 0,
	"蓬莱仙境": 0,
	"coin_num": 0,
	"放入列表":{"物品1": [],"物品2":[],"物品3":[]},
	"镶嵌列表":[],
	"分解列表":[],
	"Myself":0,
	"购买次数":0,
	"技能学习":
	{"技能1":{"学习" : 0,"等级": 0},"技能2": {"学习" : 0,"等级": 0},"技能3": {"学习" : 0,"等级": 0},"技能4": {"学习" : 0,"等级": 0},
	 "技能5":{"学习" : 0,"等级": 0},"技能6": {"学习" : 0,"等级": 0},"技能7": {"学习" : 0,"等级": 0},"技能8": {"学习" : 0,"等级": 0},
	 "技能9":{"学习" : 0,"等级": 0},"技能10":{"学习" : 0,"等级": 0},"技能键位":{"Y":"","U":"","I":"","O":"","L":""}},
	"被动技能": {"热血": 0, "魔泉": 0, "狂暴": 0, "永恒": 0, "辉煌": 0, "敏锐": 0},
	"翅膀显示":true,
	"头衔显示":true,
	"时装显示":true,
	"zubi":false,
	"截教":false,
	"成长礼包1":false,
	"成长礼包2":false,
	"成长礼包3":false,
	"成长礼包4":false,
	"天庭之证":false,
	"小有所藏":false,
	"业余收藏家":false,
	"专业收藏家":false,
	"痴迷收藏家":false,
	"强迫症收藏家":false,
	"骨灰级收藏家":false,
	"行走博物馆":false,
	"勇闯八荒":false,
	"初始Buff":[],
	"ieho":false,
	"猕猴王":0,"水帘洞天":false,
	"禺狨王":0,"桃花深谷":false,
	"蝙蝠石像":0,"身陷蝙蝠窟":false,
	"狮驼王":0,"密探七星洞":false,
	"鹏魔王":0,"金翅大鹏":false,
	"龟丞相":0,"东海浅岸":false,
	"蛟魔王":0,"东海龙宫":false,
	"鲨魔王":0,"嗜血鲨鱼涡流":false,
	"牛魔王·鬼":0,"决战平天大圣":false,
	"魔·红孩儿":0,"炽焰火焰山":false,
	"守夜人":0,"诡异城镇":false,
	"黑无常":0,"白无常":0,"阴魂巷":false,
	"傀儡王":0,"诡异石像":false,
	"秦广王":0,"一殿阎罗":false,
	"判官":0,"末日审判":false,
	"阎罗王":0,"冥府阎罗殿":false,
	"宋帝王":0,"凶险冥河":false,
	"夜叉":0,"三生惘然":false,
	"孟婆":0,"永别思乡岭":false,
	"转轮·真法":0,"浩瀚星河":false,
	"刑天":0,"十八层地狱":false,
	"楚江王":0,"活大地狱":false,
	"龙王·低":0,"龙王·高":0,"水晶宫1":false,"水晶宫2":false,
	"白骨精·精":0,"白骨精·妖":0,"白骨精·魔":0,"三打白骨精1":false,"三打白骨精2":false,
	"沙华":0,"曼珠":0,"彼岸双生":false,
	"青蛇":0,"冥河蛇妖":false,
	"河童":0,"诡异河童":false,
	"战神刑天":0,"不灭战神":false,"无首神":false,
	"生命丹1":0,"生命丹2":0,"生命丹3":0,"生命丹4":0,"生命丹5":0,
	"魔法丹1":0,"魔法丹2":0,"魔法丹3":0,"魔法丹4":0,"魔法丹5":0,
	"攻击丹1":0,"攻击丹2":0,"攻击丹3":0,"攻击丹4":0,"攻击丹5":0,
	"暴击丹1":0,"暴击丹2":0,"暴击丹3":0,"暴击丹4":0,"暴击丹5":0,
	"幸运丹1":0,"幸运丹2":0,"幸运丹3":0,"幸运丹4":0,"幸运丹5":0,
	"回魔丹1":0,"回魔丹2":0,"回魔丹3":0,"回魔丹4":0,"回魔丹5":0,
	"特殊Buff":[],
	"宝珠列表":[],
	"MyTime":{},
	"MyId": 0,
	"已佩戴阵法": "",
	"拥有阵法": {},
	"落魄阵":{"1":{"Name": "幽","Level":0,"InName":"lpzyou"},"2":{"Name": "冥","Level":0,"InName":"lpzming"}
	,"3":{"Name": "鬼","Level":0,"InName":"lpzgui"},"Level": 0},
	"森罗阵":{"1":{"Name": "天","Level":0,"InName":"lslztian"},"2":{"Name": "地","Level":0,"InName":"lslzdi"}
	,"3":{"Name": "人","Level":0,"InName":"ren"},"Level": 0},
	"腾蛇阵":{"1":{"Name": "天枢","Level":0,"InName":"tsztianshu"}
	,"2":{"Name": "天璇","Level":0,"InName":"tsztianxuan"},"3":{"Name": "天玑","Level":0,"InName":"tsztianji"}
	,"4":{"Name": "天权","Level":0,"InName":"tsztianquan"},"Level": 0},
	"太清阵":{"1":{"Name": "青龙","Level":0,"InName":"tqzqinglong"},"2":{"Name": "白虎","Level":0,"InName":"tqzbaihu"}
	,"3":{"Name": "朱雀","Level":0,"InName":"tqzzhuque"}
	,"4":{"Name": "玄武","Level":0,"InName":"tqzxuanwu"},"Level": 0},
	"FileValue": 1.0,
	"FristJiejiao": true
}
var player_data:Dictionary = {
	"玩家等级": 1,
	"玩家当前经验":0,
	"装备列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"道具列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"消耗品列表": {"页码1": [],"页码2": [],"页码3": [],"页码4": [],"页码5": [],"页码6": [],"页码7": [],"页码8": [],"页码9": [],"页码10": []},
	"幻化列表":{"武器" :"","防具":"","时装":"","翅膀": "","头衔":""},
	"实战法宝":"",
	"武器": [],
	"防具": [],
	"饰品": [],
	"翅膀": [],
	"头衔": [],
	"时装": [],
	"法宝": [],
	"关卡评价":{"花果山":0,"水帘洞":0,"桃花源":0,"蝙蝠窟": 0,"七星洞": 0,"迦楼罗之穴": 0,"浅岸": 0,"东海": 0,"鲨之涡流": 0,"牛魔谷": 0,"火焰山":0,
	"鬼城" :0,"无常巷":0,"鬼门关":0,"接引院": 0,"判官府": 0,"阎罗殿": 0,"忘川河": 0,"奈何桥": 0,"望乡台": 0,"转轮殿": 0,"螺旋地狱":0,
	"九重天" :0,"天宫道":0,"南天门":0,"南天王殿": 0,"西天王殿": 0,"北天王殿": 0,"彩虹楼": 0,"朝会殿": 0,"凌霄宝殿": 0,"玲珑宝塔": 0,"兜率宫":0,"火龙岛":0
	,"九龙岛":0,"龙脊山":0,"尾妖林":0,"仙音岛":0,"仙幻岛":0,"仙树岛":0,"蓬莱岛":0,"蓬莱仙境":0,"绝仙门":0,"陷仙门":0,"戮仙门":0,"紫晶门":0,"指景宫":0
	,"绝境宫":0,"罹乱浩劫":0},
	"幻化拥有列表":[],
	"可进入天庭":false,
	"可进入截教":false,
	"可进入碧游宫":false,
	"玲珑宝塔层数":0,
	"兜率宫层数":0,
	"花果山" :1,
	"水帘洞":0,
	"桃花源":0,
	"蝙蝠窟": 0,
	"七星洞": 0,
	"迦楼罗之穴": 0,
	"浅岸": 0,
	"东海": 0,
	"鲨之涡流": 0,
	"牛魔谷": 0,
	"zyforever":false,
	"地府": false,
	"天庭": false,
	"截教天镜": false,
	"碧游宫": false,
	"Map_num": 1,
	"鬼城" :1,
	"无常巷":0,
	"鬼门关":0,
	"接引院": 0,
	"判官府": 0,
	"阎罗殿": 0,
	"忘川河": 0,
	"奈何桥": 0,
	"望乡台": 0,
	"转轮殿": 0,
	"九重天" :0,
	"天宫道":0,
	"南天门":0,
	"南天王殿": 0,
	"西天王殿": 0,
	"北天王殿": 0,
	"彩虹楼": 0,
	"朝会殿": 0,
	"凌霄宝殿": 0,
	"玲珑宝塔": 0,
	"兜率宫": 0,
	"兜率宫1": 0,
	"兜率宫2": 0,
	"兜率宫3": 0,
	"兜率宫4": 0,
	"兜率宫5": 0,
	"神兽森林": 0,
	"火龙岛": 0,
	"九龙岛": 0,
	"龙脊山": 0,
	"尾妖林": 0,
	"仙音岛": 0,
	"仙幻岛": 0,
	"仙树岛": 0,
	"蓬莱岛": 0,
	"蓬莱仙境": 0,
	"coin_num": 0,
	"放入列表":{"物品1": [],"物品2":[],"物品3":[]},
	"镶嵌列表":[],
	"分解列表":[],
	"Myself":0,
	"购买次数":0,
	"技能学习":
	{"技能1":{"学习" : 0,"等级": 0},"技能2": {"学习" : 0,"等级": 0},"技能3": {"学习" : 0,"等级": 0},"技能4": {"学习" : 0,"等级": 0},
	 "技能5":{"学习" : 0,"等级": 0},"技能6": {"学习" : 0,"等级": 0},"技能7": {"学习" : 0,"等级": 0},"技能8": {"学习" : 0,"等级": 0},
	 "技能9":{"学习" : 0,"等级": 0},"技能10":{"学习" : 0,"等级": 0},"技能键位":{"Y":"","U":"","I":"","O":"","L":""}},
	"被动技能": {"热血": 0, "魔泉": 0, "狂暴": 0, "永恒": 0, "辉煌": 0, "敏锐": 0},
	"翅膀显示":true,
	"头衔显示":true,
	"时装显示":true,
	"zubi":false,
	"截教":false,
	"成长礼包1":false,
	"成长礼包2":false,
	"成长礼包3":false,
	"成长礼包4":false,
	"天庭之证":false,
	"小有所藏":false,
	"业余收藏家":false,
	"专业收藏家":false,
	"痴迷收藏家":false,
	"强迫症收藏家":false,
	"骨灰级收藏家":false,
	"行走博物馆":false,
	"勇闯八荒":false,
	"初始Buff":[],
	"ieho":false,
	"猕猴王":0,"水帘洞天":false,
	"禺狨王":0,"桃花深谷":false,
	"蝙蝠石像":0,"身陷蝙蝠窟":false,
	"狮驼王":0,"密探七星洞":false,
	"鹏魔王":0,"金翅大鹏":false,
	"龟丞相":0,"东海浅岸":false,
	"蛟魔王":0,"东海龙宫":false,
	"鲨魔王":0,"嗜血鲨鱼涡流":false,
	"牛魔王·鬼":0,"决战平天大圣":false,
	"魔·红孩儿":0,"炽焰火焰山":false,
	"守夜人":0,"诡异城镇":false,
	"黑无常":0,"白无常":0,"阴魂巷":false,
	"傀儡王":0,"诡异石像":false,
	"秦广王":0,"一殿阎罗":false,
	"判官":0,"末日审判":false,
	"阎罗王":0,"冥府阎罗殿":false,
	"宋帝王":0,"凶险冥河":false,
	"夜叉":0,"三生惘然":false,
	"孟婆":0,"永别思乡岭":false,
	"转轮·真法":0,"浩瀚星河":false,
	"刑天":0,"十八层地狱":false,
	"楚江王":0,"活大地狱":false,
	"龙王·低":0,"龙王·高":0,"水晶宫1":false,"水晶宫2":false,
	"白骨精·精":0,"白骨精·妖":0,"白骨精·魔":0,"三打白骨精1":false,"三打白骨精2":false,
	"沙华":0,"曼珠":0,"彼岸双生":false,
	"青蛇":0,"冥河蛇妖":false,
	"河童":0,"诡异河童":false,
	"战神刑天":0,"不灭战神":false,"无首神":false,
	"生命丹1":0,"生命丹2":0,"生命丹3":0,"生命丹4":0,"生命丹5":0,
	"魔法丹1":0,"魔法丹2":0,"魔法丹3":0,"魔法丹4":0,"魔法丹5":0,
	"攻击丹1":0,"攻击丹2":0,"攻击丹3":0,"攻击丹4":0,"攻击丹5":0,
	"暴击丹1":0,"暴击丹2":0,"暴击丹3":0,"暴击丹4":0,"暴击丹5":0,
	"幸运丹1":0,"幸运丹2":0,"幸运丹3":0,"幸运丹4":0,"幸运丹5":0,
	"回魔丹1":0,"回魔丹2":0,"回魔丹3":0,"回魔丹4":0,"回魔丹5":0,
	"特殊Buff":[],
	"宝珠列表":[],
	"MyTime":{},
	"MyId": 0,
	"已佩戴阵法": "",
	"拥有阵法": {},
	"落魄阵":{"1":{"Name": "幽","Level":0,"InName":"lpzyou"},"2":{"Name": "冥","Level":0,"InName":"lpzming"}
	,"3":{"Name": "鬼","Level":0,"InName":"lpzgui"},"Level": 0},
	"森罗阵":{"1":{"Name": "天","Level":0,"InName":"lslztian"},"2":{"Name": "地","Level":0,"InName":"lslzdi"}
	,"3":{"Name": "人","Level":0,"InName":"ren"},"Level": 0},
	"腾蛇阵":{"1":{"Name": "天枢","Level":0,"InName":"tsztianshu"}
	,"2":{"Name": "天璇","Level":0,"InName":"tsztianxuan"},"3":{"Name": "天玑","Level":0,"InName":"tsztianji"}
	,"4":{"Name": "天权","Level":0,"InName":"tsztianquan"},"Level": 0},
	"太清阵":{"1":{"Name": "青龙","Level":0,"InName":"tqzqinglong"},"2":{"Name": "白虎","Level":0,"InName":"tqzbaihu"}
	,"3":{"Name": "朱雀","Level":0,"InName":"tqzzhuque"}
	,"4":{"Name": "玄武","Level":0,"InName":"tqzxuanwu"},"Level": 0},
	"FileValue": 1.0,
	"FristJiejiao": true
}

func aa():
	var na
	player_data[na]["Target"]
	pass
var SynList = {
	"放入列表":{
	"物品1": [],
	"物品2":[],
	"物品3":[]},
}

###===================以下为添加装备时调用！++======================

func get_total_zb_list():
	var list = []
	for i in range(player_data["装备列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["装备列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
	return list
	
func add_zb(name_,qh_level,Data_):
#	if Global.zb_packisfull:
#		return
	if CheckCanUsePage("装备列表") == 0:
		return
	if Data_ == {}:
		Data_ = AE.AllEquipment_[name_]
	player_data["装备列表"]["页码" + str(CheckCanUsePage("装备列表"))].push_back({"名字": name_,"强化等级":qh_level,"Data":Data_})
func add_fb(name_,qh_level,wx,Data_):
#	if Global.zb_packisfull:
#		return
	if Data_ == {}:
		Data_ = AE.AllEquipment_[name_]
	player_data["装备列表"]["页码" + str(CheckCanUsePage("装备列表"))].push_back({"名字": name_,"强化等级":qh_level,"五行":wx,"Data":Data_})
func remove_zb(page,local):
	if page <= 0:
		return
#	if local <= 0:
#		return
	if local >= player_data["装备列表"]["页码" + str(page)].size():
		return
	var name_ = player_data["装备列表"]["页码" + str(page)][local]["名字"]
	var qh_level = player_data["装备列表"]["页码" + str(page)][local]["强化等级"]
	var Data = player_data["装备列表"]["页码" + str(page)][local]["Data"]
	var wx = []
	if player_data["装备列表"]["页码" + str(page)][local].has("五行"):
		wx = player_data["装备列表"]["页码" + str(page)][local]["五行"]
	var list = {"名字": name_,"强化等级":qh_level,"五行":wx,"Data":Data }
	player_data["装备列表"]["页码" + str(page)].remove_at(local)
	return list
func GetzbData(page,local):
	if local >= player_data["装备列表"]["页码" + str(page)].size():
		return 
	var name_ = player_data["装备列表"]["页码" + str(page)][local]["名字"]
	var qh_level = player_data["装备列表"]["页码" + str(page)][local]["强化等级"]
	var Data = player_data["装备列表"]["页码" + str(page)][local]["Data"]
	var wx = []
	if player_data["装备列表"]["页码" + str(page)][local].has("五行"):
		wx = player_data["装备列表"]["页码" + str(page)][local]["五行"]
	var list = {"名字": name_,"强化等级":qh_level,"五行":wx,"Data":Data }
	return list	
func zl_zb():
	var list = []
	for i in range(player_data["装备列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["装备列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
		player_data["装备列表"]["页码" + str(u)].clear()
	for i in list:
		#print("000")
		var lx = AE.AllEquipment_[i.名字]["类型"]
		if lx != "法宝":
			add_zb(i.名字,i.强化等级,i.Data)
		else:
			add_fb(i.名字,i.强化等级,i.五行,i.Data)
	#MemoryClass.保存游戏(Global.cd_path)
func ChekEqzb(Type,need_):
	var list = []
	if player_data[Type].size() != 0:
		var name_ = player_data[Type][0]["名字"]
		if str(name_) == str(need_):
			return true
	return false
func check_zb(need_):#查找是否含有某装备，有则返回这个装备的各项数据，否则返回空的数组
	var list = []
	var get_infor = []
	for i in range(player_data["装备列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["装备列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
	if player_data["武器"].size() != 0:
		list.push_back(player_data["武器"][0])
	if player_data["防具"].size() != 0:
		list.push_back(player_data["防具"][0])
	if player_data["饰品"].size() != 0:
		list.push_back(player_data["饰品"][0])
	if player_data["法宝"].size() != 0:
		list.push_back(player_data["法宝"][0])
	if player_data["时装"].size() != 0:
		list.push_back(player_data["时装"][0])
	if player_data["头衔"].size() != 0:
		list.push_back(player_data["头衔"][0])
	if player_data["翅膀"].size() != 0:
		list.push_back(player_data["翅膀"][0])
	for i in list:
		var name_ = i["名字"]
		if str(name_) == str(need_):
			get_infor.push_back({"data":i})
	return get_infor
func checkHaveZB(need_):#查找是否拥有某装备
	var list = []
	var get_infor = []
	for i in range(player_data["装备列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["装备列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
	if player_data["武器"].size() != 0:
		list.push_back(player_data["武器"][0])
	if player_data["防具"].size() != 0:
		list.push_back(player_data["防具"][0])
	if player_data["饰品"].size() != 0:
		list.push_back(player_data["饰品"][0])
	if player_data["法宝"].size() != 0:
		list.push_back(player_data["法宝"][0])
	if player_data["时装"].size() != 0:
		list.push_back(player_data["时装"][0])
	if player_data["头衔"].size() != 0:
		list.push_back(player_data["头衔"][0])
	if player_data["翅膀"].size() != 0:
		list.push_back(player_data["翅膀"][0])
	var num: int = 0
	for i in list:
		var name_ = i["名字"]
		if str(name_) == str(need_):
			num += 1
	if num > 0:
		return [true,num]
	return [false,0]
func CheckHaveWX(need_,wx):#判断背包中是否有一个包含目标五行的法宝
	var list = check_zb(need_)
	var new_list = []
	if list == []:
		return false
	else:
		for i in list:
			var get_data = i["data"]
			var get_wx = get_data["五行"]
			if get_wx.has(wx):
				return true
	return false
func GetAllItem():
	var list = []
	for i in range(player_data["装备列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["装备列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据

	if player_data["武器"].size() != 0:
		list.push_back(player_data["武器"][0])
	if player_data["防具"].size() != 0:
		list.push_back(player_data["防具"][0])
	if player_data["饰品"].size() != 0:
		list.push_back(player_data["饰品"][0])
	if player_data["法宝"].size() != 0:
		list.push_back(player_data["法宝"][0])
	if player_data["时装"].size() != 0:
		list.push_back(player_data["时装"][0])
	if player_data["头衔"].size() != 0:
		list.push_back(player_data["头衔"][0])
	if player_data["翅膀"].size() != 0:
		list.push_back(player_data["翅膀"][0])
	return list
func CheckWXNUM():#判断背包中所有法宝五行数量
	var list = GetAllItem()
	if list == []:
		return false
	else:
		for i in list:
			var get_data = i["Data"]
			var get_wx
			#print(get_data)
			#return
			if get_data["类型"] == "法宝":
				get_wx = get_data["五行"]
#				print(get_wx)
#			if get_wx.size() > 3:
#				return true
	return false
func get_mostLevel(need_):
#	var list = check_zb(need_)
	var LevelList = []
	if PlayerData.check_zb(need_).size() != 0:
		for i in PlayerData.check_zb(need_):
			var get_data = i["data"]
			var get_level = get_data["强化等级"]
			LevelList.push_back(get_level)		
		LevelList.sort()
		LevelList.reverse()
		return LevelList[0]
	return 0
###===================以上为添加装备时调用！++======================	
func get_item_data(need_name):
	if need_name == "empty":
		return 0
	var is_empty_ = true
	var get_number:int
	var x = 1
	for i in player_data["道具列表"]:
		if player_data["道具列表"][i].size() == 0:
			continue
		else:
			is_empty_ = false
			break
	if is_empty_ == true:
		return 0
	while x < 10:
		for i in player_data["道具列表"]["页码" + str(x)]:
			if i["名字"] == need_name:
				get_number = i["数量"]
				return get_number
		x += 1
	return 0
func get_xhp_data(need_name):
	if need_name == "empty":
		return 0
	var is_empty_ = true
	var get_number:int
	var x = 1
	for i in player_data["消耗品列表"]:
		if player_data["消耗品列表"][i].size() == 0:
			continue
		else:
			is_empty_ = false
			break
	if is_empty_ == true:
		return 0
	while x < 10:
		for i in player_data["消耗品列表"]["页码" + str(x)]:
			if i["名字"] == need_name:
				get_number = i["数量"]
				return get_number
		x += 1
	return 0
func get_dj_page(need_name):
	if need_name == "empty":
		return 0
	var get_number:int
	for i in player_data["道具列表"]:
		for u in player_data["道具列表"][i]:
			if u["名字"] == need_name:
				get_number = int(str(i).split("码")[1])
				return get_number
	return 0
func get_total_dj_list():
	var list = []
	for i in range(player_data["道具列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["道具列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
	return list
func add_dj(name_,number):
	var is_not_same = true
#	if Global.dj_packisfull:
#		return
	if CheckCanUsePage("道具列表") == 0:
		return
	var Data_ = AE.AllEquipment_[name_]
	var list

	if get_dj_page(name_) != 0:
		list = player_data["道具列表"]["页码" + str(get_dj_page(name_))]
	else:

		list = player_data["道具列表"]["页码" + str(CheckCanUsePage("道具列表"))]
	for i in list:
		if name_ ==  i["名字"]:
			i["数量"] += number
			is_not_same = false
	if is_not_same:
#		if get_dj_page(name_) == 0:
		player_data["道具列表"]["页码" + str(CheckCanUsePage("道具列表"))].push_back({"名字": name_,"数量":number,"Data": Data_})
#		else:
#			player_data["道具列表"]["页码" + str(get_dj_page(name_))].push_back({"名字": name_,"数量":number,"Data": Data_})
func zl_dj():
	var list = []
	for i in range(player_data["道具列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["道具列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
		player_data["道具列表"]["页码" + str(u)].clear()
	for i in list:
		add_dj(i.名字,i.数量)
func zl_xhp():
	var list = []
	for i in range(player_data["消耗品列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["消耗品列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
		player_data["消耗品列表"]["页码" + str(u)]	.clear()
	for i in list:
		add_xhp(i.名字,i.数量)

func remove_dj(name_,page,num):
	if num <= 0:
		return
	if page == 0:
		return
	var get_name_ = ""
	var x = -1
	var all_coin: int
	while name_ != get_name_:
		x += 1
		if x > player_data["道具列表"]["页码" + str(page)].size() - 1:
			return {"名字": name_,"数量":0,"获得灵魂":0,"卖出数量": 0}
		get_name_ = player_data["道具列表"]["页码" + str(page)][x]["名字"]
	if player_data["道具列表"]["页码" + str(page)][x]["数量"] <= num:
		num = player_data["道具列表"]["页码" + str(page)][x]["数量"]
	var last_num = player_data["道具列表"]["页码" + str(page)][x]["数量"] - num

	player_data["道具列表"]["页码" + str(page)][x]["数量"] -= num
	if last_num <= 0:
		player_data["道具列表"]["页码" + str(page)].remove_at(x)
	if not Global.is_in_ldl:
		all_coin = AE.AllEquipment_[name_]["售价"] * num
		player_data["coin_num"] += all_coin
	var list = {"名字": name_,"数量":last_num,"获得灵魂":all_coin,"卖出数量": num}#剩余物品名字和数量
	return list
#====================以上为处理道具=======================
func get_total_xhp_list():
	var list = []
	for i in range(player_data["消耗品列表"].size()):#从0遍历直到这个字典最后
		var u = i + 1#页码从1开始
		for z in player_data["消耗品列表"]["页码" + str(u)]:#从某页码开始获取内部信息
			list.push_back(z)#列表填入该数据
	return list
func add_xhp(name_,number):
	var is_not_same = true
#	if Global.xhp_packisfull:
#		return
	if CheckCanUsePage("消耗品列表") == 0:
		return
	var list
	if get_xhp_page(name_) != 0:
		list = player_data["消耗品列表"]["页码" + str(get_xhp_page(name_))]
	else:
		list = player_data["消耗品列表"]["页码" + str(CheckCanUsePage("消耗品列表"))]
	for i in list:
		if name_ ==  i["名字"]:
			i["数量"] += number
			is_not_same = false
	if is_not_same:
		player_data["消耗品列表"]["页码" + str(CheckCanUsePage("消耗品列表"))].push_back({"名字": name_,"数量":number})

func get_xhp_page(need_name):
	if need_name == "empty":
		return 0
	var get_number:int
	for i in player_data["消耗品列表"]:
		for u in player_data["消耗品列表"][i]:
			if u["名字"] == need_name:
				get_number = int(str(i).split("码")[1])
				return get_number
	return 0
func remove_xhp(name_,page,num):
	if num <= 0:
		return
	var get_name_ = ""
	var x = -1
	var all_coin: int
	while name_ != get_name_:
		x += 1
		get_name_ = player_data["消耗品列表"]["页码" + str(page)][x]["名字"]
	if player_data["消耗品列表"]["页码" + str(page)][x]["数量"] <= num:
		num = player_data["消耗品列表"]["页码" + str(page)][x]["数量"]
	var last_num = player_data["消耗品列表"]["页码" + str(page)][x]["数量"] - num
	player_data["消耗品列表"]["页码" + str(page)][x]["数量"] -= num
	if last_num <= 0:
		player_data["消耗品列表"]["页码" + str(page)].remove_at(x)
	if not Global.is_in_ldl:
		all_coin = AE.AllEquipment_[name_]["售价"] * num
		player_data["coin_num"] += all_coin
	var list = {"名字": name_,"数量":last_num,"获得灵魂":all_coin,"卖出数量": num}#剩余物品名字和数量
	return list
#========================以上为处理消耗品==========================
func CheckCanUsePage(Target):#检测可用页码
	for i in range(player_data[Target].size()):
		var u = i + 1
		if player_data[Target]["页码" + str(u)].size() < 35:
			return u
	return 0
func CheckFashionClothes(NeedName: String):
	if player_data["时装"].size() <= 0:return false
	if PlayerData.player_data["时装"][0]["名字"] == NeedName:return true
	return false
func _process(_delta: float) -> void:
	if MainSet.set_data.has("FileValue"):
		if float(MainSet.set_data["FileValue"]) < float(Global.FileNum):
			MainSet.set_data["FileValue"] = Global.FileNum
	if MainSet.set_data["xg"]:
		Global.AddMessageShow(Global.Windows_,"数据不正常哦，我退出啦~",4,Vector2(485,295))
		await get_tree().create_timer(2,false).timeout
		get_tree().quit()
	if PlayerData.ChekEqzb("头衔","xczg"):
		PlayerData.player_data["ieho"] = true
#			if Global.cd_path != null and Global.cd_path != "":
#				MemoryClass.保存游戏(Global.cd_path)
	if player_data["实战法宝"] != "":
		if check_zb(player_data["实战法宝"]) == []:
			player_data["实战法宝"] = ""
func removedata():
	MemoryClass.Remove()
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")

func CheckNextDay():
	var Dic = Time.get_datetime_dict_from_system()
	var MyDic = PlayerData.player_data["MyTime"]#最后储存的时间
	if MyDic == {}:
		return
	if int(Dic["year"]) < int(MyDic["year"]):
		return false
	elif int(Dic["year"]) > int(MyDic["year"]):
		return true
	else:
		if int(Dic["month"]) < int(MyDic["month"]):
			return false
		elif int(Dic["month"]) > int(MyDic["month"]):
			return true
		else:
			if int(Dic["day"]) < int(MyDic["day"]):
				return false
			elif int(Dic["day"]) > int(MyDic["day"]):
				return true
			else:
				return false
func ADDIniBuff():
	if player_data["初始Buff"].size() != 0:
		for i in player_data["初始Buff"]:
			Global.AddBuff(RoleProp.SourcePlayer.buff,i)

func CheckSameIniBuff(Need):
	if player_data["初始Buff"].size() != 0:
		for i in player_data["初始Buff"]:
			if i["Name"] == Need:
				return true

	return false
func CheckPass(Local):
	match Local:
		"天庭":
			if player_data["转轮殿"] == 1 and get_item_data("ttlp") != 0 and player_data["天庭"]:
				return true
		"截教":
			if player_data["玩家等级"] >= 50 and get_item_data("ttlp") != 0 and player_data["截教天镜"]:
				return true
		"碧游宫":
			if player_data["玩家等级"] >= 80 and get_item_data("tthl") != 0 and player_data["碧游宫"]:
				return true
	return false
