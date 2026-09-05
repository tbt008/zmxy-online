extends Node
var	AllEquipment_ = {}
var PropListName = ["SHp","SMp","power","Def","Mdef","Crit","Miss","R_hp","R_mp","vampirism","Lucky","Toughness","Htarget","CritReduce","ar","sp"]
func _ready() -> void:
	All_equ()
func _physics_process(_delta: float) -> void:
	randomize()
	All_equ()
func All_equ():
	AllEquipment_ = {
	#===========================悟空装备
	"ptxzg": {"名字": "普通的行者棍","所属": "悟空","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": randi_range(2,6), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普通的铁棍","售价": 20,"强化属性":{},"宝石":[]},
	
	"yxxzg": {"名字": "优秀的行者棍","所属": "悟空","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 15, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"一把看起来还不错的武器。","售价": 40,"强化属性":{
		"power": 2, "Crit": 0.5},"宝石":[]},
		
	"whg": {"名字": "尾火棍","所属": "悟空","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 18, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 3,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"诸法因缘生，我说是因缘；因缘尽故灭，我作如是说。","售价": 40,"强化属性":{
		"power": 1},"宝石":[]},
	
	"jcbj": {"名字": "家传宝剑","所属": "悟空","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 30, "Def": 0, "Mdef": 0, "Crit": 3, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 3,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"看似普通的宝剑，蕴藏有神秘的力量，只有凑齐家传装备才能释放出这股力量。","售价": 40,"强化属性":{
		"power": 2, "Crit": 0.5},"宝石":[]},

	"qld": {"名字": "青龙刀","所属": "悟空","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 45, "Def": 0, "Mdef": 0, "Crit": 3, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 5,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由青龙的尖牙锻铸的大刀，挥舞间雷声贯耳，宛如青龙咆哮。","售价": 40,"强化属性":{
		"power": 3,"Crit": 0.5,"Htarget": 1},"宝石":[]},
		
	"ryjgb": {"名字": "如意金箍棒","所属": "悟空","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 75, "Def": 0, "Mdef": 0, "Crit": 6, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 6,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"东海龙宫之定海神针，一万三千五百斤，浩劫之际，元归齐天。","售价": 80,"强化属性":{
		"power": 15,"Crit": 1,"Htarget": 1},"宝石":[]},

	"gtq": {"名字": "古藤枪","所属": "悟空","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 95, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"马面的古藤枪，坚韧无比，破巨岩，轻而易举。","售价": 80,"强化属性":{
		"power": 15,"Crit": 1,"Htarget": 1},"宝石":[]},
		
	"tsyj": {"名字": "天煞月戟","所属": "悟空","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 110, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"tsgj","描述":"由月石经三味真火精炼而成，闪耀着黄金般的光芒，此光堪比皓月之明。","售价": 80,"强化属性":{
		"power": 20,"Crit": 1,"Htarget": 1},"宝石":[]},

	"gwj": {"名字": "鬼王剑","所属": "悟空","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 135, "Def": 0, "Mdef": 0, "Crit": 12, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 10,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"解封后的鬼王剑，斩妖除魔，也只是一念之间。","售价": 80,"强化属性":{
		"power": 24,"Crit": 0.8,"Htarget": 0.5},"宝石":[]},
		
	"qtz": {"名字": "擎天柱","所属": "悟空","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 170, "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 12,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"撑天之柱，刑天与帝争神，大闹天庭时，坠入地狱。","售价": 160,"强化属性":{
		"power": 27,"Crit": 1,"Htarget": 1},"宝石":[]},
		
	"nyd": {"名字": "凝月刀","所属": "悟空","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 190, "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"灭烛怜光满，披衣觉露滋。不堪盈手赠，还寝梦佳期。","售价": 160,"强化属性":{
		"power": 30,"Crit": 2,"Htarget": 1},"宝石":[]},
		
	"qybd": {"名字": "青云冰刀","所属": "悟空","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 225, "Def": 0, "Mdef": 0, "Crit": 18, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"qyj","描述":"凝霜夜，幽香梦，枕边人赴烽火，吹起一帘牵挂。","售价": 160,"强化属性":{
		"power": 32,"Crit": 2,"Htarget": 1},"宝石":[]},
		
	"zjbtg": {"名字": "紫金镔铁棍","所属": "悟空","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 260, "Def": 0, "Mdef": 0, "Crit": 22, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 18,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"zjhl","描述":"人间道，路远茫，相逢终有期。","售价": 160,"强化属性":{
		"power": 35,"Crit": 2,"Htarget": 1},"宝石":[]},
		
	"th": {"名字": "天荒","所属": "悟空","品质": "邪灵","类型": "武器","颜色": "656565","SHp": 0, "SMp": 0, "power": 290, "Def": 0, "Mdef": 0, "Crit": 25, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 22,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 28,"Crit": 2,"Htarget": 1},"宝石":[]},
		
	"qlg": {"名字": "虬龙棍","所属": "悟空","品质": "魂器","类型": "武器","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 350, "Def": 0, "Mdef": 0, "Crit": 28, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 24,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幽竹啸鬼神,楚铁生虬龙。","售价": 640,"强化属性":{
		"power": 30,"Crit": 2,"Htarget": 1},"宝石":[]},
		
	"wkjdyhwq": {"名字": "经典原画·木棍","所属": "悟空","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"悟空经典原画之木棍！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"lemhg": {"名字": "随心铁杆兵","所属": "悟空","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"悟空六耳猕猴皮肤！。","售价": 20,"强化属性":{},"宝石":[]},
	
	"qs": {"名字": "祁水","所属": "悟空","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 500, "Def": 0, "Mdef": 0, "Crit": 35, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 25,"CritReduce": 0,"ar": 20,"sp": 10,"描述":"无支祁现于淮水，骇风奇袭，惊浪翻涌，大禹治水时，锁其四肢，压其龟山脚。","售价": 1280,"强化属性":{
		"power": 50,"Crit": 2,"Htarget": 2,"ar":3,"sp":1},"宝石":[]},

	"slshg": {"名字": "释罗四海棍","所属": "悟空","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 650, "Def": 0, "Mdef": 0, "Crit": 40, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 35,"CritReduce": 0,"ar": 50,"sp": 0,"描述":"。","售价": 1280,"强化属性":{
		"power": 50,"Crit": 2,"Htarget": 1,"ar":2},"宝石":[]},

	"zxstg": {"名字": "诛邪弑天棍","所属": "悟空","品质": "神器","类型": "武器","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 1200, "Def": 0, "Mdef": 0, "Crit": 75, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 60,"CritReduce": 0,"ar": 100,"sp": 0,"描述":"骁勇斩奸邪，浩荡弑天惊。","售价": 2560,"强化属性":{
		"power": 80,"Crit": 2,"Htarget": 2,"ar":3},"宝石":[]},

	"pftyg": {"名字": "破风天宇棍","所属": "悟空","品质": "神器","类型": "武器","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 1200, "Def": 0, "Mdef": 0, "Crit": 75, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 60,"CritReduce": 0,"ar": 100,"sp": 0,"描述":"骁勇斩奸邪，浩荡弑天惊。","售价": 2560,"强化属性":{
		"power": 80,"Crit": 2,"Htarget": 2,"ar":3},"宝石":[]},
		
	"fgwxg": {"名字": "梵骨无相棍","所属": "悟空","品质": "神器","类型": "武器","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 850, "Def": 0, "Mdef": 0, "Crit": 60, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 50,"CritReduce": 0,"ar": 80,"sp": 0,"描述":"契阔死生君莫问，行云流水一孤僧。","售价": 2560,"强化属性":{
		"power": 60,"Crit": 2,"Htarget": 2,"ar":3},"宝石":[]},


	"ptxzf": {"名字": "普通的行者服","所属": "悟空","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": randi_range(35,40), "SMp": 0, "power": 0, "Def": 2, "Mdef": 2, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"粗布缝制而成的衣物。","售价": 20,"强化属性":{
		"SHp": 2},"宝石":[]},

	"dsyj": {"名字": "地煞猿甲","所属": "悟空","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(50,65), "SMp": 0, "power": 0, "Def": 5, "Mdef": 5, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"据说是通臂猿猴的战甲，染上了无法褪去的血迹和被遗忘的记忆。","售价": 40,"强化属性":{
		"SHp": 3},"宝石":[]},

	"xwj": {"名字": "玄武甲","所属": "悟空","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(120,135), "SMp": 0, "power": 0, "Def": randi_range(8,10), "Mdef": randi_range(8,10), "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": randi_range(3,5), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由玄武的鳞片打造的战甲，装备后坚不可摧，呈现玄武防御之势。","售价": 40,"强化属性":{
		"SHp": 20,"Lucky": 1, "Def": 2, "Mdef": 2},"宝石":[]},

	"yhj": {"名字": "翼火甲","所属": "悟空","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(220,240), "SMp": 0, "power": 0, "Def": randi_range(10,12), "Mdef": randi_range(10,12), "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": randi_range(5,7), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"汝修三昧，本出尘劳。淫心不除，尘不可出。","售价": 40,"强化属性":{
		"SHp": 22,"Lucky": 1, "Def": 2, "Mdef": 2},"宝石":[]},

	"bsxj": {"名字": "白霜胸甲","所属": "悟空","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(330,350), "SMp": 0, "power": 0, "Def": randi_range(15,18), "Mdef": randi_range(15,18), "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": randi_range(7,9), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"bsyj","描述":"极寒之地的千年冰魄，锻造的胸甲，散发出无法靠近的寒气。","售价": 80,"强化属性":{
		"SHp": 45, "Def": 2, "Mdef": 2,"Lucky": 2},"宝石":[]},
		
	"xhmj": {"名字": "血海魔甲","所属": "悟空","品质": "精良","类型": "防具","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(70,80), "Def": -10, "Mdef": -10, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": randi_range(12,15), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"聚集了无数怨魂的怨气，闪烁着胆寒的光芒，给人撕心裂肺的绝望。","售价": 80,"强化属性":{
		"power": 10,"Crit": 3,"Def": -5, "Mdef": -5, "Lucky": 2},"宝石":[]},

	"dszk": {"名字": "大圣战铠","所属": "悟空","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(500,550), "SMp": 0, "power": 0, "Def": 35, "Mdef": 35, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"龙王为齐天大圣定制的战铠，斩妖除魔所向披靡。","售价": 160,"强化属性":{
		"SHp": 80, "Def": 3, "Mdef": 3,"Lucky": 2},"宝石":[]},
		
	"kys": {"名字": "枯叶衫","所属": "悟空","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(650,700), "SMp": 0, "power": 0, "Def": 35, "Mdef": 35, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"落黄昏，三更雨，临行密密缝，离愁丝丝苦。","售价": 160,"强化属性":{
		"SHp": 100, "Def": 3, "Mdef": 3,"Lucky": 2},"宝石":[]},
		
	"zjqj": {"名字": "紫金轻甲","所属": "悟空","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(800,850), "SMp": 0, "power": 0, "Def": 35, "Mdef": 35, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 4, 
	"vampirism": 0, "Lucky": 18, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"zjhl","描述":"恨悠悠，几时休。爱轻轻，随风行。","售价": 160,"强化属性":{
		"SHp": 140, "Def": 3, "Mdef": 3,"Lucky": 1},"宝石":[]},
		
	"ey": {"名字": "厄夜","所属": "悟空","品质": "邪灵","类型": "防具","颜色": "656565","SHp": 0, "SMp": 0, "power": randi_range(110,125), "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": -2, "R_mp": 4, 
	"vampirism": 0, "Lucky": randi_range(20,24), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 17,"Crit": 2,"R_hp": -1, "Lucky": 2},"宝石":[]},

	"qlj": {"名字": "虬龙甲","所属": "悟空","品质": "魂器","类型": "防具","颜色": "00ffff","SHp": 1000, "SMp": 0, "power": 50, "Def": 30, "Mdef": 30, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 20, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"虬龙一掬波,洗荡千万春。","售价": 640,"强化属性":{
		"SHp": 100, "power": 10,"Def": 4, "Mdef": 4,"Lucky": 1},"宝石":[]},

	"wkjdyhyf": {"名字": "经典原画·草衣","所属": "悟空","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"悟空经典原画之草衣。","售价": 20,"强化属性":{},"宝石":[]},

	"lemhz": {"名字": "六耳猕猴装","所属": "悟空","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"悟空六耳猕猴皮肤。","售价": 20,"强化属性":{},"宝石":[]},

	"dz": {"名字": "斗战","所属": "悟空","品质": "传说","类型": "防具","颜色": "FFA500","SHp": 4250, "SMp": 0, "power": 225, "Def": 105, "Mdef": 105, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 30, "Toughness": 28,"Htarget": 0,"CritReduce": 28,"ar": 0,"sp": 0,"描述":"战无不胜。","售价": 2500,"强化属性":{
		"SHp": 580, "Def": 4, "Mdef": 4,"Lucky": 2},"宝石":[]},

	"slshj": {"名字": "释罗四海甲","所属": "悟空","品质": "传说","类型": "防具","颜色": "FFA50","SHp": 2280, "SMp": 0, "power": 0, "Def": 40, "Mdef": 40, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 16, "Toughness": 11,"Htarget": 0,"CritReduce": 12,"ar": 0,"sp": 0,"描述":"战无不胜。","售价": 2500,"强化属性":{
		"SHp": 100, "Def": 4, "Mdef": 4,"Lucky": 1},"宝石":[]},

	"zxstj": {"名字": "诛邪弑天甲","所属": "悟空","品质": "神器","类型": "防具","颜色": "ff2d00","SHp": 4250, "SMp": 0, "power": 225, "Def": 105, "Mdef": 105, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 30, "Toughness": 28,"Htarget": 0,"CritReduce": 28,"ar": 0,"sp": 0,"描述":"黄沙百战穿金甲,不破楼兰终不还。","售价": 2500,"强化属性":{
		"SHp": 580, "Def": 4, "Mdef": 4,"Lucky": 2},"宝石":[]},
		
	"pftyj": {"名字": "破风天宇甲","所属": "悟空","品质": "神器","类型": "防具","颜色": "ff2d00","SHp": 4250, "SMp": 0, "power": 225, "Def": 105, "Mdef": 105, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 30, "Toughness": 28,"Htarget": 0,"CritReduce": 28,"ar": 0,"sp": 0,"描述":"黄沙百战穿金甲,不破楼兰终不还。","售价": 2500,"强化属性":{
		"SHp": 580, "Def": 4, "Mdef": 4,"Lucky": 2},"宝石":[]},
		
	"fgwxj": {"名字": "梵骨无相甲","所属": "悟空","品质": "神器","类型": "防具","颜色": "ff2d00","SHp": 4250, "SMp": 0, "power": 225, "Def": 105, "Mdef": 105, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 30, "Toughness": 28,"Htarget": 0,"CritReduce": 28,"ar": 0,"sp": 0,"描述":"何须更问浮生事？只此浮生是梦中.","售价": 2500,"强化属性":{
		"SHp": 580, "Def": 4, "Mdef": 4,"Lucky": 2},"宝石":[]},


	#===========================唐僧装备
	"ptsmz": {"名字": "普通松木杖","所属": "唐僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": randi_range(6,10), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"松木制成的法杖。","售价": 20,"强化属性":{
		"power": 1},"宝石":[]},

	"dsqz": {"名字": "地煞权杖","所属": "唐僧","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 60, "power": randi_range(16,18), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"权杖捆绑着上古遗骸，蕴藏驱神之力，挥舞间，兴云起雾，电闪雷鸣。","售价": 40,"强化属性":{
		"power": 1,"SMp" :3},"宝石":[]},
		
	"bhz": {"名字": "白虎杖","所属": "唐僧","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 120, "power": randi_range(35,40), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 5,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由白虎的肋骨打制的法杖，施法时其疾如风，只见白虎之影。","售价": 40,"强化属性":{
		"power": 6,"SMp" :35,"Htarget": 2},"宝石":[]},
		
	"jhcz": {"名字": "九环禅杖","所属": "唐僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 210, "power": randi_range(60,70), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"渡劫之日，三界俱灭，九环圣光，万物复苏。","售价": 80,"强化属性":{
		"power": 10,"SMp" :20,"Htarget": 1},"宝石":[]},

	"bsyz": {"名字": "白霜妖杖","所属": "唐僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 240, "power": randi_range(85,95), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(8,12),"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"bsyj","描述":"寒气逼人，毛骨俱悚，狂飙刮地，人马俱惊。","售价": 80,"强化属性":{
		"power": 11,"SMp" :20,"Htarget": 2},"宝石":[]},
		
	"xhxh": {"名字": "血海邪皇","所属": "唐僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 350, "power": randi_range(115,125), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 4, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(10,14),"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"取了血海里无数鲜血和冤魂妖化而成，诡异的妖杖散发着死亡的气息。","售价": 80,"强化属性":{
		"power": 15,"SMp" :20,"Htarget": 2},"宝石":[]},

	"lhz": {"名字": "轮回杖","所属": "唐僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 450, "power": randi_range(145,155), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5 ,
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(16,18),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"禁锢刑天于十八层地狱之中，六道轮回，生生世世，永无止境。","售价": 160,"强化属性":{
		"power": 20,"SMp" :68,"Htarget": 2},"宝石":[]},
		
	"myz": {"名字": "明月杖","所属": "唐僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 550, "power": randi_range(165,175), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,22),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"兔苑词才去不还,兰亭水石空明月。","售价": 160,"强化属性":{
		"power": 22,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"kyz": {"名字": "枯叶杖","所属": "唐僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 700, "power": randi_range(195,210), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,22),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"求不得，放不下，梧桐化成杖，孤走枯苍道。","售价": 160,"强化属性":{
		"power": 25,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"hylz": {"名字": "混元灵杖","所属": "唐僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 800, "power": randi_range(220,240), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,24),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"损愁眉，哭断肠，待到佳期如梦。","售价": 160,"强化属性":{
		"power": 30,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"smz": {"名字": "嗜魔杖","所属": "唐僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 850, "power": randi_range(260,270), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,24),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"魔非魔，念人间，怎知情愁滋味。","售价": 160,"强化属性":{
		"power": 30,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"tc": {"名字": "天残","所属": "唐僧","品质": "邪灵","类型": "武器","颜色": "656565","SHp": 0, "SMp": 1000, "power": randi_range(300,310), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 7, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,24),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 30,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"plz": {"名字": "蟠龙杖","所属": "唐僧","品质": "魂器","类型": "武器","颜色": "00ffff","SHp": 0, "SMp": 1200, "power": 350, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(20,24),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"power": 30,"SMp" :110,"Htarget": 3},"宝石":[]},
		
	"rc": {"名字": "若禅","所属": "唐僧","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 0, "SMp": 1500, "power": 500, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 25,"CritReduce": 0,"ar": 0,"sp": 30,"描述":"达摩驾一叶扁舟，东来传佛法，招嫉妒，七遭毒，手携只履，翩翩独逝。","售价": 1280,"强化属性":{
		"power": 50,"SMp" :110,"Htarget": 2,"sp": 3},"宝石":[]},
		
	"ptjs": {"名字": "普通的袈裟","所属": "唐僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": randi_range(10,35), "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"粗布缝制成的袈裟。","售价": 20,"强化属性":{
		"SHp": 7},"宝石":[]},
		
	"bsp": {"名字": "壁水袍","所属": "唐僧","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(75,90), "SMp": 0, "power": 0, "Def": 4, "Mdef": 4, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"一切有为法。如梦幻泡影，如露亦如电。应作如是观。","售价": 40,"强化属性":{
		"SHp": 10},"宝石":[]},
		
	"jcjs": {"名字": "家传袈裟","所属": "唐僧","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(175,205), "SMp": 0, "power": 0, "Def": 8, "Mdef": 8, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0.0, "Lucky": 7, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"看似普通的衣裳，蕴藏有神秘的力量，只有凑齐家传装备才能释放出这股力量。","售价": 40,"强化属性":{
		"SHp": 27,"Lucky": 1},"宝石":[]},	
		
	"qlp": {"名字": "麒麟袍","所属": "唐僧","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(220,240), "SMp": 0, "power": 0, "Def": 16, "Mdef": 16, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 4, 
	"vampirism": 0.0, "Lucky": 7, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由麒麟的绒毛编织的法袍，法力源源不绝，犹如麒麟附体。","售价": 40,"强化属性":{
		"SHp": 35,"Lucky": 1},"宝石":[]},

	"lzp": {"名字": "老者袍","所属": "唐僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(260,280), "SMp": 0, "power": 0, "Def": 20, "Mdef": 20, "Crit": 0, "Miss": randi_range(6,8), "R_hp": 0, "R_mp": 5, 
	"vampirism": 0.0, "Lucky": randi_range(10,12), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"窃以暮景残光，步履蹒跚，能余几日，魂聚长袍，方今生不朽。","售价": 80,"强化属性":{
		"SHp": 55,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"tsyp": {"名字": "天煞羽袍","所属": "唐僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(310,340), "SMp": 0, "power": 0, "Def": 22, "Mdef": 22, "Crit": 0, "Miss": randi_range(6,8), "R_hp": 0, "R_mp": 5, 
	"vampirism": 0.0, "Lucky": randi_range(10,12), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"tsgj","描述":"传说由鲲鹏羽毛编织成的法袍，藏有无限的法力，穿上后腾云驾雾，翱翔云端。","售价": 80,"强化属性":{
		"SHp": 68,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"qcp": {"名字": "七彩袍","所属": "唐僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(370,400), "SMp": 0, "power": 0, "Def": 24, "Mdef": 24, "Crit": 0, "Miss": randi_range(8,10), "R_hp": 0, "R_mp": 5, 
	"vampirism": 0.0, "Lucky": randi_range(10,14), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"彼岸花，有花无叶，生生世世，永不相见。幻七彩，无生无死，无苦无悲，无欲无求。","售价": 80,"强化属性":{
		"SHp": 70,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"jljs": {"名字": "锦镧袈裟","所属": "唐僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(430,450), "SMp": 0, "power": 0, "Def": 30, "Mdef": 30, "Crit": 0, "Miss": randi_range(12,14), "R_hp": 0, "R_mp": 6, 
	"vampirism": 0.0, "Lucky": randi_range(16,18), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"观音菩萨交给取经人的袈裟，镶嵌七宝，水火不侵，蕴藏无尽的法力。","售价":160,"强化属性":{
		"SHp": 75,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"qyfp": {"名字": "青云法袍","所属": "唐僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(555,600), "SMp": 0, "power": 0, "Def": 30, "Mdef": 30, "Crit": 0, "Miss": randi_range(12,14), "R_hp": 0, "R_mp": 6, 
	"vampirism": 0.0, "Lucky": randi_range(18,20), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"qyj","描述":"碧天阔，白云散，百万里无硝烟，大雁向南飞去。","售价":160,"强化属性":{
		"SHp": 105,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"hljh": {"名字": "红莲教皇","所属": "唐僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(700,740), "SMp": 0, "power": 0, "Def": 50, "Mdef": 50, "Crit": 0, "Miss": randi_range(15,18), "R_hp": 0, "R_mp": 6, 
	"vampirism": 0.0, "Lucky": randi_range(18,20), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"一种相思，两处闲愁，火焰化红莲，此情自消衍。","售价":160,"强化属性":{
		"SHp": 115,"Lucky": 1,"Miss": 1},"宝石":[]},
		
	"cz": {"名字": "残昼","所属": "唐僧","品质": "邪灵","类型": "防具","颜色": "656565","SHp": -200, "SMp": 0, "power": randi_range(260,270), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": randi_range(24,30), "R_hp": 0, "R_mp": 6, 
	"vampirism": 0.0, "Lucky": randi_range(24,30), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价":320,"强化属性":{
		"power":30,"Lucky": 2,"Miss": 2},"宝石":[]},
		
	"plp": {"名字": "蟠龙袍","所属": "唐僧","品质": "魂器","类型": "防具","颜色": "00ffff","SHp": 900, "SMp": 0, "power": 120, "Def": 40, "Mdef": 40, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 8, 
	"vampirism": 0.0, "Lucky": 25, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价":640,"强化属性":{
		"SHp": 90,"Lucky": 2,"power":30,},"宝石":[]},
		
	"tsjdyhwq": {"名字": "经典原画·木杖","所属": "唐僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"唐僧经典原画之木杖！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"tsjdyhyf": {"名字": "经典原画·布衣","所属": "唐僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"唐僧经典原画之布衣！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"dmysz": {"名字": "枯萎法杖","所属": "唐僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"唐僧道明妖僧装！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"dmyszh": {"名字": "道明妖僧装","所属": "唐僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"唐僧道明妖僧装！。","售价": 20,"强化属性":{},"宝石":[]},
	
	#===========================八戒装备
	"ptdp": {"名字": "普通的钉耙","所属": "八戒","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": randi_range(5,7), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"一把普通的钉耙。","售价": 20,"强化属性":{
		"power": 1},"宝石":[]},

	"wtp": {"名字": "胃土耙","所属": "八戒","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": randi_range(10,15), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 2,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"当舍于懈怠，远离诸愦闹；寂静常知足，是人当解脱。","售价": 40,"强化属性":{
		"power": 2},"宝石":[]},
		
	"jcjp": {"名字": "家传金耙","所属": "八戒","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": randi_range(20,25), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"	一点浩然气，千里快哉风。","售价": 40,"强化属性":{
		"power": 4},"宝石":[]},
	
	"zhp": {"名字": "诸怀耙","所属": "八戒","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": randi_range(35,40), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 4,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由诸怀的血肉熔铸的金耙，挥舞时，其声如鸣雁，万物俱寂。","售价": 40,"强化属性":{
		"power": 6,"Htarget": 1},"宝石":[]},

	"jcdp": {"名字": "九齿钉耙","所属": "八戒","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(60,65), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 6,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"太上老君用神冰铁亲自锤炼，借五方五帝、六丁六甲之力锻造而成，重量有一藏之数，连柄五千零四十八斤。","售价": 80,"强化属性":{
		"power": 15,"Htarget": 2},"宝石":[]},
		
	"gtb": {"名字": "古藤棒","所属": "八戒","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(80,85), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"牛头的古藤棒，重达千斤，碎大石，易如反掌。","售价": 80,"强化属性":{
		"power": 17,"Htarget": 2},"宝石":[]},
		
	"bjjdyhwq": {"名字": "经典原画·石斧","所属": "八戒","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"八戒经典原画之石斧！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"lgdwc": {"名字": "九瓣赤铜锤","所属": "八戒","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"八戒灵感大王装！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"lcld": {"名字": "罗刹镰刀","所属": "八戒","品质": "精良","类型": "武器","颜色": "008aff","SHp": randi_range(25,35), "SMp": 0, "power": randi_range(100,105), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 3, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 10,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"lsys","描述":"死神遗落的镰刀，一但被砍伤，将留下永远无法愈合的伤口。","售价": 80,"强化属性":{
		"power": 22},"宝石":[]},
			
	"ssc": {"名字": "三生锤","所属": "八戒","品质": "精良","类型": "武器","颜色": "008aff","SHp": randi_range(55,65), "SMp": 0, "power": randi_range(115,120), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 3, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 12,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"前世的因，今生的果，宿命轮回，缘起缘灭，三生锤下，瓦解冰消。","售价": 80,"强化属性":{
		"SHp": 10,"power": 20,"Htarget": 2},"宝石":[]},
		
	"tpltp": {"名字": "天蓬裂天耙","所属": "八戒","品质": "史诗","类型": "武器","颜色": "800080","SHp": randi_range(90,100), "SMp": 0, "power": randi_range(140,150), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 4, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 12,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"执志挺身与命抗,浴血奋斗不畏殇。","售价": 160,"强化属性":{
		"SHp": 20,"power": 25,"Htarget": 2},"宝石":[]},
		
	"syc": {"名字": "殇月锤","所属": "八戒","品质": "史诗","类型": "武器","颜色": "800080","SHp": randi_range(135,145), "SMp": 0, "power": randi_range(175,180), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(12,14),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"绝景良时难再并，他年此日应惆怅。","售价": 160,"强化属性":{
		"SHp": 25,"power": 28,"Htarget": 2},"宝石":[]},		
		
	"xhc": {"名字": "萱花锤","所属": "八戒","品质": "史诗","类型": "武器","颜色": "800080","SHp": randi_range(175,185), "SMp": 0, "power": randi_range(200,205), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(12,14),"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhhl","描述":"街喧闹，人过往，且记曾相识，不为少年留。","售价": 160,"强化属性":{
		"SHp": 25,"power": 30,"Htarget": 2},"宝石":[]},	
		
	"zjksf": {"名字": "紫金开山斧","所属": "八戒","品质": "史诗","类型": "武器","颜色": "800080","SHp": randi_range(200,215), "SMp": 0, "power": randi_range(230,235), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"zjhl","描述":"人间如梦，红尘万丈，劈不断相思情。","售价": 160,"强化属性":{
		"SHp": 30,"power": 32,"Htarget": 2},"宝石":[]},	
		
	"tz": {"名字": "天罪","所属": "八戒","品质": "邪灵","类型": "武器","颜色": "656565","SHp": randi_range(240,265), "SMp": 0, "power": randi_range(255,265), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(9,12),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"SHp": 20,"power": 28,"Htarget": 2},"宝石":[]},	
		
	"ylf": {"名字": "应龙斧","所属": "八戒","品质": "魂器","类型": "武器","颜色": "00ffff","SHp": randi_range(350,375), "SMp": 0, "power": 350, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 10, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 20,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"SHp": 30,"power": 30,"Htarget": 2},"宝石":[]},	
		
	"yt": {"名字": "夷图","所属": "八戒","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 600, "SMp": 0, "power": 500, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 10, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 25,"CritReduce": 0,"ar": 20,"sp": 10,"描述":"河伯寻琴音而去，见宓妃厌九隆，发大水抢妻，百年守护，只为美人笑，终而生情。","售价": 1280,"强化属性":{
		"SHp": 50,"power": 50,"Htarget": 2,"ar": 3,"sp": 2},"宝石":[]},	
		
	"ptcs": {"名字": "普通的长衫","所属": "八戒","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": randi_range(45,55), "SMp": 0, "power": 0, "Def": 3, "Mdef": 3, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"粗糙的布料制成的长衫。","售价": 20,"强化属性":{
		"SHp": 10},"宝石":[]},
		
	"bjjdyhyf": {"名字": "经典原画·布衫","所属": "八戒","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"八戒经典原画之布衫！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"lgdwz": {"名字": "灵感大王装","所属": "八戒","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"八戒灵感大王装！。","售价": 20,"强化属性":{},"宝石":[]},
	
	"dszy": {"名字": "地煞战衣","所属": "八戒","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(70,85), "SMp": 0, "power": 0, "Def": 5, "Mdef": 5, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"跋扈千里行，疏狂袍飞扬。","售价": 40,"强化属性":{
		"SHp": 15,"Def": 1,"Mdef": 1},"宝石":[]},
		
	"pxk": {"名字": "貔貅铠","所属": "八戒","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(125,135), "SMp": 0, "power": 0, "Def": 7, "Mdef": 7, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由貔貅的绒毛打造而成的铠甲，金光灿灿，百毒不侵。","售价": 40,"强化属性":{
		"SHp": 45,"Def": 1,"Mdef": 1},"宝石":[]},

	"jgj": {"名字": "金刚甲","所属": "八戒","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(200,220), "SMp": 0, "power": 0, "Def": 16, "Mdef": 16, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"地狱炎岩经三味真火灼烧四十九日而成的战甲，故金刚不灭。","售价": 80,"强化属性":{
		"SHp": 50,"Def": 1,"Mdef": 1},"宝石":[]},
	
	"lcgy": {"名字": "罗刹鬼衣","所属": "八戒","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(270,300), "SMp": 0, "power": 0, "Def": 12, "Mdef": 12, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"lsys","描述":"恶鬼之衣，怨气重重。","售价": 80,"强化属性":{
		"SHp": 60,"Def": 1,"Mdef": 1},"宝石":[]},
		
	"bszj": {"名字": "白霜重甲","所属": "八戒","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(400,420), "SMp": 0, "power": 0, "Def": 20, "Mdef": 20, "Crit": 0, "Miss": 0, "R_hp": 4, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"bsyj","描述":"极寒之地的千年冰魄，锻造的重铠，犹如千年寒冰那般坚固。","售价": 80,"强化属性":{
		"SHp": 70,"Def": 3,"Mdef": 3},"宝石":[]},
		
	"xhymk": {"名字": "血海幽冥铠","所属": "八戒","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(500,520), "SMp": 0, "power": 0, "Def": 30, "Mdef": 30, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"传闻遗失在血海中的铠甲，历经千载，弥漫着死亡的气息。","售价": 80,"强化属性":{
		"SHp": 90,"Def": 3,"Mdef": 3},"宝石":[]},

	"tpzy": {"名字": "天蓬战衣","所属": "八戒","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(700,750), "SMp": 0, "power": 0, "Def": 40, "Mdef": 40, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"泥丸九宫中的天蓬战衣，在妖邪之间散发一股仙气。","售价": 160,"强化属性":{
		"SHp": 110,"Def": 3,"Mdef": 3},"宝石":[]},
		
	"hylk": {"名字": "混元龙凯","所属": "八戒","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(850,900), "SMp": 0, "power": 0, "Def": 45, "Mdef": 45, "Crit": 0, "Miss": 0, "R_hp": 5, "R_mp": 2, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"龙吟恨，且回首，却在灯火阑珊。","售价": 160,"强化属性":{
		"SHp": 150,"Def": 4,"Mdef": 4},"宝石":[]},
		
	"wsjg": {"名字": "顽石金刚","所属": "八戒","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(1000,1050), "SMp": 0, "power": 0, "Def": 45, "Mdef": 45, "Crit": 0, "Miss": 0, "R_hp": 6, "R_mp": 2, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"心若顽石，不生多情，多情空于恨，此恨无绝期。","售价": 160,"强化属性":{
		"SHp": 150,"Def": 4,"Mdef": 4},"宝石":[]},
		
	"ry": {"名字": "如狱","所属": "八戒","品质": "邪灵","类型": "防具","颜色": "656565","SHp": randi_range(1200,1300), "SMp": - 150, "power": 0, "Def": 40, "Mdef": 40, "Crit": 0, "Miss": 0, "R_hp": 6, "R_mp": 3, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 15,"Htarget": 0,"CritReduce": 15,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"SHp": 140,"Def": 4,"Mdef": 4},"宝石":[]},
		
	"ylk": {"名字": "应龙铠","所属": "八戒","品质": "魂器","类型": "防具","颜色": "00ffff","SHp": randi_range(1500,1600), "SMp": 0, "power": 0, "Def": 50, "Mdef": 50, "Crit": 0, "Miss": 0, "R_hp": 10, "R_mp": 5, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 22,"Htarget": 0,"CritReduce": 22,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"SHp": 160,"Def": 5,"Mdef": 5},"宝石":[]},
	#===========================沙僧装备
	"ptyyc": {"名字": "普通的月牙铲","所属": "沙僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": randi_range(4,7), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普通的月牙铲.","售价": 20,"强化属性":{},"宝石":[]},
	
	"ssjdyhwq": {"名字": "经典原画·木铲","所属": "沙僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"沙僧经典原画之木铲！.","售价": 20,"强化属性":{},"宝石":[]},
	
	"mlhfg": {"名字": "降魔棍","所属": "沙僧","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"沙僧闵老护法装！.","售价": 20,"强化属性":{},"宝石":[]},
	
	"jmc": {"名字": "角木铲","所属": "沙僧","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 18, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"若人造重罪，作已深自责；忏悔更不造，能拔根本业。","售价": 40,
	"强化属性":{"power": 4},"宝石":[]},
	
	"jcmc": {"名字": "家传明铲","所属": "沙僧","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 26, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 3, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"恶湮于野，魔隐于暗，天道恢恢。","售价": 40,
	"强化属性":{"power": 5},"宝石":[]},
	
	"hdc": {"名字": "混沌铲","所属": "沙僧","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": randi_range(40,45), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 5, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"醉卧枕天下，谈笑弄乾坤。","售价": 40,
	"强化属性":{"power": 7},"宝石":[]},
	
	"jlxmc": {"名字": "卷帘降魔铲","所属": "沙僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(75,85), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 8, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"醉卧枕天下，谈笑弄乾坤。","售价": 80,
	"强化属性":{"power": 13, "Lucky": 1},"宝石":[]},
	
	"bsbc": {"名字": "白霜冰铲","所属": "沙僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(95,105), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 12, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"bsyj","描述":"阵解星芒尽，营空海雾消。","售价": 80,
	"强化属性":{"power": 22, "Lucky": 1},"宝石":[]},
	
	"gtc": {"名字": "古藤铲","所属": "沙僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(115,125), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 8, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"坚韧无比，碎大石，轻而易举。","售价": 80,
	"强化属性":{"power": 24, "Lucky": 1},"宝石":[]},
	
	"xhxc": {"名字": "血海邪铲","所属": "沙僧","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(135,145), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"邪念所至，万魂俱寂。","售价": 80,
	"强化属性":{"power": 25, "Lucky": 1},"宝石":[]},
	
	"jlfyc": {"名字": "卷帘伏妖铲","所属": "沙僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(175,180), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金汤既失险，玉石乃同焚。","售价": 160,
	"强化属性":{"power": 27, "Lucky": 1},"宝石":[]},
	
	"shyc": {"名字": "朔月铲","所属": "沙僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(200,205), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"朔月盈亏已可疑,随泉上下更难知。","售价": 160,
	"强化属性":{"power": 29, "Lucky": 1},"宝石":[]},
	
	"kyc": {"名字": "枯叶铲","所属": "沙僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(215,220), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"落红，一枯叶，落红离弦去，从此两难聚。","售价": 160,
	"强化属性":{"power": 35, "Lucky": 1},"宝石":[]},
	
	"hylc": {"名字": "混元雷叉","所属": "沙僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(235,245), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 17, "Toughness": 0,"Htarget": randi_range(9,12),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"倾盆雨，惊天雷，众里寻他而去。","售价": 160,"强化属性":{
		"power": 42,"Htarget": 2, "Lucky": 2},"宝石":[]},	
	
	"zjxmc": {"名字": "紫金降魔铲","所属": "沙僧","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(265,270), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 19, "Toughness": 0,"Htarget": randi_range(9,12),"CritReduce": 0,"FBTYPE":"zjhl","ar": 0,"sp": 0,"描述":"倾盆雨，惊天雷，众里寻他而去。","售价": 160,"强化属性":{
		"power": 43,"Htarget": 2, "Lucky": 2},"宝石":[]},	

	"ts": {"名字": "天殇","所属": "沙僧","品质": "邪灵","类型": "武器","颜色": "656565","SHp": 0, "SMp": 0, "power": randi_range(305,315), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 21, "Toughness": 0,"Htarget": randi_range(12,14),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 32,"Htarget": 2, "Lucky": 2},"宝石":[]},

	"jlc": {"名字": "蛟龙铲","所属": "沙僧","品质": "魂器","类型": "武器","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 350, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 23, "Toughness": 0,"Htarget": randi_range(12,14),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"power": 35,"Htarget": 2, "Lucky": 2},"宝石":[]},

	"ll": {"名字": "琉璃","所属": "沙僧","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 500, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 30, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 15,"sp": 15,"描述":"琉璃光可照三界之暗。","售价": 1280,"强化属性":{
		"power": 50,"Htarget": 2, "Lucky": 2,"ar": 5,"sp": 5},"宝石":[]},

	"ptcp": {"名字": "普通的长袍","所属": "沙僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": randi_range(25,35), "SMp": 0, "power": 0, "Def": 2, "Mdef": 2, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"粗糙的布料制成的长袍。","售价": 20,"强化属性":{
		"SHp": 6},"宝石":[]},

	"ssjdyhyf": {"名字": "经典原画·草袍","所属": "沙僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"沙僧经典原画之草袍！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"mlhfz": {"名字": "闵老护法装","所属": "沙僧","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"沙僧闵老护法装！。","售价": 20,"强化属性":{},"宝石":[]},
		
	"dshp": {"名字": "地煞虎袍","所属": "沙僧","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(70,85), "SMp": 0, "power": 0, "Def": 4, "Mdef": 4, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"玄丝织就，坚韧无匹，其声如虎啸。","售价": 40,"强化属性":{
		"SHp": 12},"宝石":[]},
		
	"bxp": {"名字": "赑屃袍","所属": "沙僧","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(165,185), "SMp": 0, "power": 0, "Def": 10, "Mdef": 10, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"九曲黄河万里沙，浪淘风簸自天涯。","售价": 40,"强化属性":{
		"SHp": 35},"宝石":[]},
		
	"jmy": {"名字": "井木衣","所属": "沙僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(265,285), "SMp": 0, "power": 0, "Def": 12, "Mdef": 12, "Crit": 0, "Miss": 5, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"菩提本无树，明镜亦非台。本来无一物，何处惹尘埃。","售价": 80,"强化属性":{
		"SHp": 45, "Miss": 1},"宝石":[]},
		
	"lchp": {"名字": "罗刹魂袍","所属": "沙僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(365,385), "SMp": 0, "power": 0, "Def": 16, "Mdef": 16, "Crit": 0, "Miss": 9, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"lsys","描述":"人朴情虑肃，境闲视听空。","售价": 80,"强化属性":{
		"SHp": 55, "Miss": 1},"宝石":[]},
		
	"bap": {"名字": "彼岸袍","所属": "沙僧","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(465,485), "SMp": randi_range(185,205), "power": 0, "Def": 25, "Mdef": 25, "Crit": 0, "Miss": 12, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"困骥犹在辕，沉珠尚隐精。","售价": 80,"强化属性":{
		"SHp": 45, "SMp": 25,"Miss": 1},"宝石":[]},
		
	"jlfyj": {"名字": "卷帘伏妖甲","所属": "沙僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(565,585), "SMp": randi_range(245,285), "power": 0, "Def": 35, "Mdef": 35, "Crit": 0, "Miss": 15, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"浮生速流电，倏忽变光彩。","售价": 160,"强化属性":{
		"SHp": 50, "SMp": 25, "Miss": 1},"宝石":[]},
		
	"xhp": {"名字": "萱花袍","所属": "沙僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(650,670), "SMp": randi_range(300,335), "power": 0, "Def": randi_range(30,35), "Mdef": randi_range(30,35), "Crit": 0, "Miss": 18, "R_hp": 2, "R_mp": 2, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhhl","描述":"人离合，月圆缺，花开又花谢，不愿再相逢。","售价": 160,"强化属性":{
		"SHp": 50,"SMp": 30,"Def": 3,"Mdef": 3},"宝石":[]},
		
	"jllm": {"名字": "卷帘绿魔","所属": "沙僧","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(700,740), "SMp": randi_range(360,365), "power": 0, "Def": 35, "Mdef": 35, "Crit": 0, "Miss": 21, "R_hp": 4, "R_mp": 4, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"风卷云残，俱消往昔，既然无缘，何立誓言。","售价": 160,"强化属性":{
		"SHp": 120,"SMp": 40,"Def": 4,"Mdef": 4},"宝石":[]},
		
	"yj": {"名字": "犹绝","所属": "沙僧","品质": "邪灵","类型": "防具","颜色": "656565","SHp": randi_range(850,900), "SMp": randi_range(400,435), "power": 0, "Def": -40, "Mdef": -40, "Crit": 25, "Miss": 28, "R_hp": 6, "R_mp": 6, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"SHp": 90,"SMp": 40,"Def": -4,"Mdef": -4},"宝石":[]},
		
	"jlj": {"名字": "蛟龙甲","所属": "沙僧","品质": "魂器","类型": "防具","颜色": "00ffff","SHp": randi_range(1000,1050), "SMp": randi_range(500,585), "power": 0, "Def": 50, "Mdef": 50, "Crit": 0, "Miss": 24, "R_hp": 8, "R_mp": 8, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"SHp": 120,"SMp": 50,"Def": 4,"Mdef": 4},"宝石":[]},
		
	#===========================白龙装备
	"bljdyhwq": {"名字": "经典原画·长枪","所属": "白龙","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"白龙经典原画长枪.","售价": 20,"强化属性":{},"宝石":[]},

	"lxhjq": {"名字": "螺旋火尖枪","所属": "白龙","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"白龙红孩儿武器皮肤.","售价": 20,"强化属性":{},"宝石":[]},

	"pttq": {"名字": "普通的铁枪","所属": "白龙","品质": "普通","类型": "武器","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": randi_range(2,8), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普通的铁枪.","售价": 20,"强化属性":{},"宝石":[]},

	"dslq": {"名字": "地煞龙枪","所属": "白龙","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 18, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"刑天舞干戚，猛志固常在。","售价": 40,"强化属性":{
	"power": 5},"宝石":[]},

	"twq": {"名字": "梼杌枪","所属": "白龙","品质": "优秀","类型": "武器","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 45, "Def": 0, "Mdef": 0, "Crit": 3, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 5,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"野风结阴兵，千里鸣刀枪。","售价": 40,"强化属性":{
	"power": 10,"Crit": 1},"宝石":[]},

	"qthbq": {"名字": "擎天华宝枪","所属": "白龙","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 80, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 5,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"擎天长枪出神州，天地悠然定乾坤。","售价": 80,"强化属性":{
		"power": 15,"Crit": 1},"宝石":[]},

	"bshq": {"名字": "白霜寒枪","所属": "白龙","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 100, "Def": 0, "Mdef": 0, "Crit": 6, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 6,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"bsyj","描述":"曾经沧海难为水，除却巫山不是云。","售价": 80,"强化属性":{
		"power": 22,"Crit": 1},"宝石":[]},

	"mwq": {"名字": "冥王枪","所属": "白龙","品质": "精良","类型": "武器","颜色": "008aff","SHp": 0, "SMp": 0, "power": 135, "Def": 0, "Mdef": 0, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"影孤别离月，衣破道路风。","售价": 80,"强化属性":{
		"power": 30,"Crit": 1},"宝石":[]},

	"ylhq": {"名字": "玉龙皇枪","所属": "白龙","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 170, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 10,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"游龙一掷乾坤破，孤枪九连国境绝。","售价": 160,"强化属性":{
		"power": 40,"Crit": 1},"宝石":[]},

	"xyq": {"名字": "新月枪","所属": "白龙","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 190, "Def": 0, "Mdef": 0, "Crit": 12, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 10,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"游龙一掷乾坤破，孤枪九连国境绝。","售价": 160,"强化属性":{
		"power": 50,"Crit": 1},"宝石":[]},

	"qysq": {"名字": "青云霜枪","所属": "白龙","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 220, "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 10,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"qyj","描述":"古枪寒黯黯，铸来几千秋。","售价": 160,"强化属性":{
		"power": 50,"Crit": 1},"宝石":[]},

	"blmq": {"名字": "百裂冥枪","所属": "白龙","品质": "史诗","类型": "武器","颜色": "800080","SHp": 0, "SMp": 0, "power": 260, "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"梦付千秋星垂野，月落长河云卷尘。","售价": 160,"强化属性":{
		"power": 50,"Crit": 1},"宝石":[]},

	"tq": {"名字": "天囚","所属": "白龙","品质": "邪灵","类型": "武器","颜色": "656565","SHp": 0, "SMp": 0, "power": 300, "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 15,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 30,"Crit": 1},"宝石":[]},

	"tlq": {"名字": "天龙枪","所属": "白龙","品质": "魂器","类型": "武器","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 350, "Def": 0, "Mdef": 0, "Crit": 25, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 20,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"power": 50,"Crit": 2},"宝石":[]},

	"ld": {"名字": "龙渊","所属": "白龙","品质": "传说","类型": "武器","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 500, "Def": 0, "Mdef": 0, "Crit": 30, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 20,"CritReduce": 0,"ar": 20,"sp": 10,"描述":"龙跃云津风浩荡，渊潜碧海浪无垠。","售价": 1280,"强化属性":{
		"power": 50,"Crit": 2,"ar": 3,"sp": 1},"宝石":[]},

	"zxttq": {"名字": "诛邪托天枪","所属": "白龙","品质": "神器","类型": "武器","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 1200, "Def": 0, "Mdef": 0, "Crit": 75, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 60,"CritReduce": 0,"ar": 100,"sp": 0,"描述":"骁勇斩奸邪，浩荡弑天惊。","售价": 2560,"强化属性":{
		"power": 80,"Crit": 2,"Htarget": 2,"ar":3},"宝石":[]},

	"bljdyhyf": {"名字": "经典原画·绸服","所属": "白龙","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"白龙经典原画绸服。","售价": 20,"强化属性":{},"宝石":[]},
		
	"hhez": {"名字": "红孩儿装","所属": "白龙","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": 10, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"白龙红孩儿外观。","售价": 20,"强化属性":{},"宝石":[]},
		
	"ptcf": {"名字": "普通的绸服","所属": "白龙","品质": "普通","类型": "防具","颜色": "FFFFFF","SHp": randi_range(25,35), "SMp": 0, "power": 0, "Def": 2, "Mdef": 2, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"粗糙的布料制成的绸布衣服。","售价": 20,"强化属性":{
		"SHp": 6},"宝石":[]},
		
	"zhj": {"名字": "觜火甲","所属": "白龙","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(70,80), "SMp": 0, "power": 0, "Def": 4, "Mdef": 4, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"皎佩星连景，飘衣云结庆。","售价": 40,"强化属性":{
		"SHp": 15},"宝石":[]},
		
	"jclj": {"名字": "家传雷甲","所属": "白龙","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(120,130), "SMp": 0, "power": 0, "Def": 5, "Mdef": 5, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"风雷鼓舞三千浪，易象飞龙定在天。","售价": 40,"强化属性":{
		"SHp": 15},"宝石":[]},
		
	"ttj": {"名字": "饕餮甲","所属": "白龙","品质": "优秀","类型": "防具","颜色": "00FF00","SHp": randi_range(170,180), "SMp": 0, "power": 0, "Def": 5, "Mdef": 5, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"好风频借力，送我上青云。","售价": 40,"强化属性":{
		"SHp": 40},"宝石":[]},
		
	"ssj": {"名字": "参水甲","所属": "白龙","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(230,250), "SMp": 0, "power": 0, "Def": 6, "Mdef": 6, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"七八个星天外，两三点雨山前。","售价": 80,"强化属性":{
		"SHp": 50, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"tsgp": {"名字": "天煞骨袍","所属": "白龙","品质": "精良","类型": "防具","颜色": "008aff","SHp": randi_range(350,370), "SMp": 0, "power": 0, "Def": 10, "Mdef": 10, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"tsgj","描述":"且镇寒魂意，掩尽透骨伤。","售价": 80,"强化属性":{
		"SHp": 80, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"xhgp": {"名字": "血海鬼袍","所属": "白龙","品质": "精良","类型": "防具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 70, "Def": -10, "Mdef": -10, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"清气润竹林，白光连虚空。","售价": 80,"强化属性":{
		"power": 10, "Def": -1, "Mdef": -1},"宝石":[]},
		
	"yljj": {"名字": "玉龙金甲","所属": "白龙","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(500,550), "SMp": randi_range(185,205), "power": 0, "Def": 20, "Mdef": 20, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"黑云压城城欲摧，甲光向日金鳞开。","售价": 160,"强化属性":{
		"SHp": 100, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"xhj": {"名字": "萱花甲","所属": "白龙","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(650,670), "SMp": randi_range(300,335), "power": 0, "Def": 20, "Mdef": 20, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhhl","描述":"群叶以覆，片片杀生。","售价": 160,"强化属性":{
		"SHp": 100, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"zjgp": {"名字": "紫金诡袍","所属": "白龙","品质": "史诗","类型": "防具","颜色": "800080","SHp": randi_range(700,740), "SMp": randi_range(360,365), "power": 0, "Def": 28, "Mdef": 28, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"zjhl","描述":"生生相错不相见，世世轮回血色湮。","售价": 160,"强化属性":{
		"SHp": 100, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"ze": {"名字": "灾厄","所属": "白龙","品质": "邪灵","类型": "防具","颜色": "656565","SHp": 0, "SMp": 0, "power": 150, "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0.0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"power": 15, "Crit": 1, "Lucky": 1},"宝石":[]},
		
	"tlj": {"名字": "天龙甲","所属": "白龙","品质": "魂器","类型": "防具","颜色": "00ffff","SHp": randi_range(1000,1050), "SMp": randi_range(440,485), "power": 0, "Def": 35, "Mdef": 35, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0.0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
		"SHp": 100, "Crit": 1, "Lucky": 1},"宝石":[]},

	"zxttp": {"名字": "诛邪托天袍","所属": "白龙","品质": "神器","类型": "防具","颜色": "ff2d00","SHp": 4250, "SMp": 0, "power": 225, "Def": 105, "Mdef": 105, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 10, 
	"vampirism": 0, "Lucky": 30, "Toughness": 28,"Htarget": 0,"CritReduce": 28,"ar": 0,"sp": 0,"描述":"黄沙百战穿金甲,不破楼兰终不还。","售价": 2500,"强化属性":{
		"SHp": 580, "Def": 4, "Mdef": 4,"Lucky": 2},"宝石":[]},
		
	#===========================饰品
	
	"dslj": {"名字": "地煞灵戒","所属": "通用","品质": "优秀","类型": "饰品","颜色": "00FF00","SHp": 40 + randi_range(10,20), "SMp": randi_range(25,45), "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"dshl","描述":"聚万物之灵气，佩戴后来去通风，聆其音，知其前后，万物皆明。","售价": 40,"强化属性":{
		"SHp": 9, "SMp": 6},"宝石":[]},
		
	"jcsz": {"名字": "家传手镯","所属": "通用","品质": "优秀","类型": "饰品","颜色": "00FF00","SHp": 90 + randi_range(20,40), "SMp": randi_range(35,55), "power": 0, "Def": 0, "Mdef": 0, "Crit": 1, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"看似普通的手镯，蕴藏有神秘的力量，只有凑齐家传装备才能释放出这股力量。","售价": 40,"强化属性":{
		"SHp": 15, "SMp": 7,"Crit": 0.3},"宝石":[]},
		
	"zqj": {"名字": "朱雀戒","所属": "通用","品质": "优秀","类型": "饰品","颜色": "00FF00","SHp": 180 + randi_range(20,40), "SMp": randi_range(45,65), "power": 0, "Def": 0, "Mdef": 0, "Crit": 4, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"传说由朱雀的内丹熔炼的戒指，佩戴完如朱雀般华丽。","售价": 40,"强化属性":{
		"SHp": 35, "SMp": 9,"Crit": 0.3},"宝石":[]},
		
	"qxsh": {"名字": "七星守护","所属": "通用","品质": "精良","类型": "饰品","颜色": "008aff","SHp": 0, "SMp": 0, "power": 30 + randi_range(0,5), "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"天枢、天璇、天玑、天权、玉衡、开阳、摇光，七星北斗，七星守护。","售价": 80,"强化属性":{
		"power": 6,"Crit": 1},"宝石":[]},
	
	"tsgl": {"名字": "天煞骨链","所属": "通用","品质": "精良","类型": "饰品","颜色": "008aff","SHp": 350 + randi_range(0,50), "SMp": 95 + randi_range(0,15), "power": 0, "Def": 0, "Mdef": 0, "Crit": 3, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"tsgj","描述":"用无数妖怪的骸骨熔炼的项链，月圆时会发出百兽的悲鸣。","售价": 80,"强化属性":{
		"SHp": 60, "SMp": 6,"Crit": 0.3},"宝石":[]},
	
	"xhyk": {"名字": "血海妖壳","所属": "通用","品质": "精良","类型": "饰品","颜色": "008aff","SHp": 580 + randi_range(0,100), "SMp": 135 + randi_range(0,15), "power": 0, "Def": 0, "Mdef": 0, "Crit": 4, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhmt","描述":"在血池里浸泡数载而出，坚如磐石，固若金汤。","售价": 80,"强化属性":{
		"SHp": 90, "SMp": 6,"Crit": 0.3},"宝石":[]},

	"csgs": {"名字": "苍生挂饰","所属": "通用","品质": "精良","类型": "饰品","颜色": "008aff","SHp": 0, "SMp": 0, "power": randi_range(50,55), "Def": 0, "Mdef": 0, "Crit": 7, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"苍天之下，至于酆都蔫蔫然枯草木，独挂饰盎然，万劫亦重生。","售价": 80,"强化属性":{
		"power": 9,"Crit": 2},"宝石":[]},

	"lczh": {"名字": "罗刹指环","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(60,70), "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"lsys","描述":"传说阿修罗的指环，横行于六道之间，却留下一抹黯然。","售价": 320,"强化属性":{
		"power": 10,"Crit": 2},"宝石":[]},

	"dzj": {"名字": "地藏戒","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 150, "SMp": 150, "power": 15, "Def": 20, "Mdef": 20, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
	 "SHp": 50, "SMp": 50, "power": 15},"宝石":[]},
	
	"dzjj": {"名字": "地藏金戒","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 160,"强化属性":{
		"SHp":30, "SMp":30, "power": 10,"Def": 2, "Mdef": 2},"宝石":[]},
		
	"xhz": {"名字": "萱花坠","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(120,140), "Def": 0, "Mdef": 0, "Crit": 18, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"xhhl","描述":"花映红，春风笑，佳人佩美坠，不知与谁同。","售价": 160,"强化属性":{
		"power": 10,"Crit": 2},"宝石":[]},
		
	"tflj": {"名字": "通风灵戒","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 300, "SMp": 150, "power": 70, "Def": 0, "Mdef": 0, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"风过处，百花残，心有意，爱无伤。","售价": 160,"强化属性":{},"宝石":[]},
		
	"qysz": {"名字": "青云手镯","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(150,160), "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"FBTYPE":"qyj","描述":"珠有泪，玉生烟，稀白头不胜簪，只是当时惘然。","售价": 160,"强化属性":{
		"power": 10,"Crit": 2},"宝石":[]},	
		
	"mgzh": {"名字": "马官指环","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 240, "power": 100, "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"马行处，雪无痕，相见难，别亦难。","售价": 160,"强化属性":{},"宝石":[]},

	"tdlzj": {"名字": "提多罗吒之戒","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": randi_range(500,600), "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"殿可毁，人可亡，恨犹在，何时还。","售价": 160,"强化属性":{},"宝石":[]},
	
	"shsjt": {"名字": "山河社稷图","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 0, "SMp": 0, "power": randi_range(170,180), "Def": 0, "Mdef": 0, "Crit": 16, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"英雄泪，只为江山。万里山河，千里孤城，破国恨，永难忘。","售价": 160,"强化属性":{
		"power": 24},"宝石":[]},
	
	"fybz": {"名字": "伏妖宝珠","所属": "通用","品质": "史诗","类型": "饰品","颜色": "800080","SHp": 500, "SMp": 200, "power": 200, "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 10, "R_hp": 0, "R_mp": 6, 
	"vampirism": 0, "Lucky": 15, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"降妖伏魔不畏殇，虎胆豪杰是枭雄。","售价": 160,"强化属性":{
		"SHp": 70, "SMp": 30,"power": 30},"宝石":[]},
		
	"lly": {"名字": "玲珑玉","所属": "通用","品质": "邪灵","类型": "饰品","颜色": "656565","SHp": 800, "SMp": 400, "power": 260, "Def": 0, "Mdef": 0, "Crit": 25, "Miss": 15, "R_hp": 6, "R_mp": 6, 
	"vampirism": 0, "Lucky": 20, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{
		"SHp":70, "SMp":50, "power": 25},"宝石":[]},

	"doushuaiziyan": {"名字": "兜率紫炎","所属": "通用","品质": "魂器","类型": "饰品","颜色": "00ffff","SHp": 1000, "SMp": 500, "power": 300, "Def": 0, "Mdef": 0, "Crit": 35, "Miss": 18, "R_hp": 0, "R_mp": 7, 
	"vampirism": 0, "Lucky": 28, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 35,"sp": 35,"描述":"","售价": 640,"强化属性":{
		"SHp":100, "SMp":70, "power": 30},"宝石":[]},
		
	"canglongjie": {"名字": "苍龙戒","所属": "通用","品质": "魂器","类型": "饰品","颜色": "00ffff","SHp": 1500, "SMp": 500, "power": 400, "Def": 0, "Mdef": 0, "Crit": 40, "Miss": 25, "R_hp": 0, "R_mp": 7, 
	"vampirism": 0, "Lucky": 28, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 50,"sp": 50,"描述":"穿戴后获得【苍龙加护】，受到致命伤害时在接下来的3s内免疫高于自身当前血量的伤害，每场战斗只可触发一次。","售价": 640,"强化属性":{
		"SHp":120, "SMp":70, "power": 50},"宝石":[]},
	#===========================翅膀
	"xqzy": {"名字": "喜鹊之翼","所属": "通用","品质": "优秀","类型": "翅膀","颜色": "00FF00","SHp": 100, "SMp": 100, "power": 20, "Def": 10, "Mdef": 10, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"喜鹊声唶唶，俗云报喜鸣。","售价": 100,"强化属性":{
		"SHp": 20,"SMp": 10},"宝石":[]},
		
	"bszy": {"名字": "白霜之翼","所属": "通用","品质": "精良","类型": "翅膀","颜色": "008aff","SHp": 180, "SMp": 150, "power": 40, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 5, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"白骨横千霜,嵯峨蔽榛莽。","售价": 200,"强化属性":{
		"SHp": 30,"power": 10},"宝石":[]},
		
	"jmzy": {"名字": "句芒之翼","所属": "通用","品质": "史诗","类型": "翅膀","颜色": "800080","SHp": randi_range(300,320), "SMp": 0, "power": randi_range(70,80), "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 0, "Toughness": 0,"Htarget": 8,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"句芒爱弄春风权,开萌发翠无党偏。","售价": 300,"强化属性":{
		"SHp": 35,"power": 15},"宝石":[]},
		
	"xmzy": {"名字": "刑魔之翼","所属": "通用","品质": "神器","类型": "翅膀","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 240, "Def": 0, "Mdef": 0, "Crit": 15, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 10, "Toughness": 0,"Htarget": 12,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"断首不泯傲长空。 干戚犹锋, 心火犹熊。 丹心碧血尽余忠。","售价": 3000,"强化属性":{
		"Crit": 1,"power": 10,"Lucky": 1,"target": 1},"宝石":[]},
		
	"xtzy": {"名字": "刑天之翼","所属": "通用","品质": "魂器","类型": "翅膀","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 7, "Miss": 7, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0.0, "Lucky": 7, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"刑天舞干戚，猛志固常在。","售价": 2000,"强化属性":{
		"Lucky": 1,"Crit": 1,"Miss": 1},"宝石":[]},
		
	"ttzy": {"名字": "天庭之翼","所属": "通用","品质": "魂器","类型": "翅膀","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 7, "Miss": 7, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 7, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"九天之上凤凰翔，天宫仙乐唱不休。","售价": 2000,"强化属性":{
		"Lucky": 1,"Crit": 1,"Miss": 1},"宝石":[]},

	#======================时装
	
	"putongnmwsz": {"名字": "牛魔王时装·普通","所属": "通用","品质": "普通","类型": "时装","颜色": "FFFFFF","SHp": 100, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普普通通的牛魔王时装，没有什么特殊之处。","售价": 20,
	"强化属性":{"SHp": 50},"宝石":[]},
	
	"youxiunmwsz": {"名字": "牛魔王时装·优秀","所属": "通用","品质": "优秀","类型": "时装","颜色": "00FF00","SHp": 200, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【地狱烈焰】技能，在身旁召唤地狱烈焰对附近怪物造成伤害，并施加【灼烧】。","售价": 40,
	"强化属性":{"SHp": 70},"宝石":[]},
	
	"jingliangnmwsz": {"名字": "牛魔王时装·精良","所属": "通用","品质": "精良","类型": "时装","颜色": "008aff","SHp": 300, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【地狱烈焰】技能，在身旁召唤地狱烈焰对附近怪物造成伤害，并施加【灼烧】。","售价": 80,
	"强化属性":{"SHp": 90},"宝石":[]},
	
	"shishinmwsz": {"名字": "牛魔王时装·史诗","所属": "通用","品质": "史诗","类型": "时装","颜色": "800080","SHp": 500, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 3, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【地狱烈焰】技能，在身旁召唤地狱烈焰对附近怪物造成伤害，并施加【灼烧】。","售价": 160,
	"强化属性":{"SHp": 110},"宝石":[]},

	###
	"putongzlwsz": {"名字": "转轮王时装·普通","所属": "通用","品质": "普通","类型": "时装","颜色": "FFFFFF","SHp": 0, "SMp": 50, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普普通通的转轮王时装，没有什么特殊之处。","售价": 20,
	"强化属性":{"SMp": 10},"宝石":[]},
	
	"youxiuzlwsz": {"名字": "转轮王时装·优秀","所属": "通用","品质": "优秀","类型": "时装","颜色": "00FF00","SHp": 0, "SMp": 100, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【锁轮无双】技能，在身旁召唤魔轮锁链对附近怪物造成伤害，并施加【眩晕】。","售价": 40,
	"强化属性":{"SMp": 20},"宝石":[]},
	
	"jingliangzlwsz": {"名字": "转轮王时装·精良","所属": "通用","品质": "精良","类型": "时装","颜色": "008aff","SHp": 0, "SMp": 150, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【锁轮无双】技能，在身旁召唤魔轮锁链对附近怪物造成伤害，并施加【眩晕】。","售价": 80,
	"强化属性":{"SMp": 30},"宝石":[]},
	
	"shishizlwsz": {"名字": "转轮王时装·史诗","所属": "通用","品质": "史诗","类型": "时装","颜色": "800080","SHp": 0, "SMp": 300, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【锁轮无双】技能，在身旁召唤魔轮锁链对附近怪物造成伤害，并施加【眩晕】。","售价": 160,
	"强化属性":{"SMp": 50},"宝石":[]},
	
	"putongttzssz": {"名字": "天庭战神时装·普通","所属": "通用","品质": "普通","类型": "时装","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 30, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"普普通通的天庭战神时装，没有什么特殊之处。","售价": 20,
	"强化属性":{"power": 10},"宝石":[]},
	
	"youxiuttzssz": {"名字": "天庭战神时装·优秀","所属": "通用","品质": "优秀","类型": "时装","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 60, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【战神审判】技能，对附近怪物造成伤害，并施加【破甲】。","售价": 40,
	"强化属性":{"power": 20},"宝石":[]},
	
	"jingliangttzssz": {"名字": "天庭战神时装·精良","所属": "通用","品质": "精良","类型": "时装","颜色": "008aff","SHp": 0, "SMp": 0, "power": 90, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【战神审判】技能，对附近怪物造成伤害，并施加【破甲】。","售价": 80,
	"强化属性":{"power": 30},"宝石":[]},
	
	"shishittzssz": {"名字": "天庭战神时装·史诗","所属": "通用","品质": "史诗","类型": "时装","颜色": "800080","SHp": 0, "SMp": 0, "power": 150, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【战神审判】技能，对附近怪物造成伤害，并施加【破甲】。","售价": 160,
	"强化属性":{"power": 50},"宝石":[]},
	
	"wklzyf": {"名字": "圣·悟空状元服","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加5%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
	
	"wkhzyf": {"名字": "绝·悟空状元服","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加8%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"blhwdg": {"名字": "黯·白龙五道杠","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"blhowdg": {"名字": "绝·白龙五道杠","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bllzyf": {"名字": "圣·白龙状元服","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加5%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"blhzyf": {"名字": "绝·白龙状元服","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加8%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"blmrz": {"名字": "白龙鸣人装","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"忍术“！！螺旋丸！","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"blbsz": {"名字": "白龙八神装","所属": "白龙","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"KOF八神，只留下疯狂与冷静。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"sslzyf": {"名字": "圣·沙僧状元服","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加5%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
	
	"sshzyf": {"名字": "绝·沙僧状元服","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加8%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"wkbsz": {"名字": "悟空八神装","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"KOF八神，只留下疯狂与冷静。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"wkwdg": {"名字": "黯·悟空五道杠","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"wkhwdg": {"名字": "绝·悟空五道杠","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"wkmrz": {"名字": "悟空鸣人装","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"忍术“！！螺旋丸！","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"ssmrz": {"名字": "沙僧鸣人装","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"忍术“！！螺旋丸！","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"ssbsz": {"名字": "沙僧八神装","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"KOF八神，只留下疯狂与冷静。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"sshwdg": {"名字": "黯·沙僧五道杠","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"sshowdg": {"名字": "绝·沙僧五道杠","所属": "沙僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"wkttzssz": {"名字": "天庭战神","所属": "悟空","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"为战而生，至死方休。\n拥有【破甲无双】开启无双后，释放12支战神剑向四周分散，对命中的敌人造成持续数秒的破防效果。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tslzyf": {"名字": "圣·唐僧状元服","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加5%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tshzyf": {"名字": "绝·唐僧状元服","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加8%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tsbsz": {"名字": "唐僧八神装","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"KOF八神，只留下疯狂与冷静。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tshwdg": {"名字": "黯·唐僧五道杠","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tshowdg": {"名字": "绝·唐僧五道杠","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"tsmrz": {"名字": "唐僧鸣人装","所属": "唐僧","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"忍术“！！螺旋丸！","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjlzyf": {"名字": "圣·八戒状元服","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加5%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjhzyf": {"名字": "绝·八戒状元服","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"金榜题名时，独占鳌头。（最终掉宝率增加8%）","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjbsz": {"名字": "八戒八神装","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"KOF八神，只留下疯狂与冷静。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjhwdg": {"名字": "黯·八戒五道杠","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjhowdg": {"名字": "绝·八戒五道杠","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"我是少先队，我是五道杠。","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
		
	"bjmrz": {"名字": "八戒鸣人装","所属": "八戒","品质": "神器","类型": "时装","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"忍术“！！螺旋丸！","售价": 3000,"强化属性":{
		"SHp": 0},"宝石":[]},
	#===========================头衔======
	"ptsryx": {"名字": "射日英雄","所属": "通用","品质": "普通","类型": "头衔","颜色": "ffffff","SHp": 10, "SMp": 0, "power": 1, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 20,"强化属性":{},"宝石":[]},
	
	"yxsryx": {"名字": "射日英雄","所属": "通用","品质": "优秀","类型": "头衔","颜色": "00FF00","SHp": 100, "SMp": 0, "power": 10, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 40,"强化属性":{},"宝石":[]},
	
	"jlsryx": {"名字": "射日英雄","所属": "通用","品质": "精良","类型": "头衔","颜色": "008aff","SHp": 200, "SMp": 0, "power": 50, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 80,"强化属性":{},"宝石":[]},
	
	"sssryx": {"名字": "射日英雄","所属": "通用","品质": "史诗","类型": "头衔","颜色": "800080","SHp": 400, "SMp": 0, "power": 90, "Def": 0, "Mdef": 0, "Crit": 3, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 3, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 160,"强化属性":{},"宝石":[]},
	
	"xlsryx": {"名字": "射日英雄","所属": "通用","品质": "邪灵","类型": "头衔","颜色": "656565","SHp": 500, "SMp": 0, "power": 150, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 5, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 320,"强化属性":{},"宝石":[]},
	
	"hqsryx": {"名字": "射日英雄","所属": "通用","品质": "魂器","类型": "头衔","颜色": "00ffff","SHp": 800, "SMp": 0, "power": 200, "Def": 0, "Mdef": 0, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 8, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 5,"sp": 5,"描述":"","售价": 640,"强化属性":{},"宝石":[]},
	
	"cssryx": {"名字": "射日英雄","所属": "通用","品质": "传说","类型": "头衔","颜色": "FFA500","SHp": 1000, "SMp": 0, "power": 250, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 10, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 10,"sp": 10,"描述":"","售价": 1280,"强化属性":{},"宝石":[]},
	
	"sqsryx": {"名字": "射日英雄","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 1500, "SMp": 0, "power": 350, "Def": 0, "Mdef": 0, "Crit": 20, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 20, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 20,"sp": 20,"描述":"","售价": 2560,"强化属性":{},"宝石":[]},
	
	"ttzs": {"名字": "天庭战神头衔","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 10, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	"xczg": {"名字": "修成正果头衔","所属": "通用","品质": "无敌","类型": "头衔","颜色": "ff2d00","SHp": 99999999, "SMp": 99999999, "power": 99999999, "Def": 99999999, "Mdef": 99999999, "Crit": 99999999, "Miss": 99999999, "R_hp": 99999999, "R_mp": 99999999, 
	"vampirism": 0, "Lucky": 99999999, "Toughness": 0,"Htarget": 99999999,"CritReduce": 0,"ar": 99999999,"sp": 99999999,"描述":"无需修改，我将助你修成正果，神挡杀神，佛挡杀佛！(变态属性，必定掉落，免疫负面，无视检测(卖了被封别怪我，背包留一个)。)","售价": 99999999,"强化属性":{},"宝石":[]},
	"sxyr": {"名字": "丝血鱼人","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"？？想挑战高难度，那就试试1滴血通关吧！（装备后将受到异常buff影响立刻解除，生命及生命上限降为1，并且本关内永久无法恢复生命）","售价": 0,"强化属性":{},"宝石":[]},
	"xysc": {"名字": "小有所藏","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 30, "SMp": 20, "power": 5, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达5任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"yyscj": {"名字": "业余收藏家","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 50, "SMp": 30, "power": 10, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达10任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"zyscj": {"名字": "专业收藏家","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 70, "SMp": 40, "power": 15, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达15任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"cmscj": {"名字": "痴迷收藏家","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 90, "SMp": 50, "power": 20, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达20任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"qpzscj": {"名字": "强迫症收藏家","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 110, "SMp": 60, "power": 25, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达25任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"ghjscj": {"名字": "骨灰级收藏家","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 130, "SMp": 70, "power": 30, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达30任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"xzbwg": {"名字": "行走博物馆","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 200, "SMp": 100, "power": 50, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"幻化功能中，总收集进度达35任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"hhyx": {"名字": "洪荒英雄","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 100, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 5, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"勇闯八荒任务奖励获得。","售价": 3000,"强化属性":{},"宝石":[]},
	"qtds": {"名字": "齐天大圣","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 100, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 10, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 10,"sp": 10,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	"jcz": {"名字": "金蝉子","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 200, "power": 100, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 20,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	"tpys": {"名字": "天蓬元帅","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 500, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 8,"Htarget": 0,"CritReduce": 8,"ar": 8,"sp": 8,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	"jldj": {"名字": "卷帘大将","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 70, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 5, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 5, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 12,"sp": 12,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	"lwstz": {"名字": "龙王三太子","所属": "通用","品质": "神器","类型": "头衔","颜色": "ff2d00","SHp": 0, "SMp": 0, "power": 100, "Def": 0, "Mdef": 0, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 8, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 10,"sp": 10,"描述":"","售价": 3000,"强化属性":{},"宝石":[]},
	#===========================道具	
	"bsz":{"名字":"避水珠","所属": "避水","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"神奇的宝珠，使用后可以在水中呼吸行动（进入某些副本需要使用，每次消耗一颗。）","售价": 1},
	"tanmu":{"名字":"檀木","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"珍贵稀少的优质木材，阳光的照耀下闪烁着金银般美丽的色彩，现可用于打造物品。","售价": 0},
	"xuantie":{"名字":"玄铁","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"材质特殊极为稀有的陨铁，开锋后削铁如泥，隐隐透出红光，现可用于打造物品。","售价": 0},
	"sichou":{"名字":"丝绸","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"流苏细腻，涟漪如画，现可用于打造物品。","售价": 0},
	"ziyanyujin":{"名字":"紫炎余烬","所属": "基础材料","品质":"魂器","颜色": "00ffff","类型":"道具","描述":"兜率紫炎的余烬，可用于打造兜率紫炎。","售价": 0},
	"rls":{"名字":"熔炼石","所属": "高级合成材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"晶莹剔透的红色宝石，蕴藏着巨大的能量，可用于特殊材料的融合。","售价": 0},
	"tss":{"名字":"天枢石","所属": "高级合成材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"北斗七星之天枢，蕴藏着巨大的能量，可用于特殊材料的融合。","售价": 0},
	"yhs":{"名字":"玉衡石","所属": "高级合成材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"北斗七星之玉衡，蕴藏着巨大的能量，可用于特殊材料的融合。","售价": 0},
	"canglonglingpo":{"名字":"苍龙灵魄","所属": "高级合成材料","品质":"魂器","颜色": "00ffff","类型":"道具","描述":"上古苍龙的灵魄，拥有逆天改命的力量。","售价": 0},
	"nmwjh":{"名字":"牛魔王精华","所属": "高级合成材料","品质":"邪灵","颜色": "656565","类型":"道具","描述":"牛魔王的力量源泉，牛魔王的怒吼需要其精华才能打造。","售价": 0},
	"nmwdnhsp":{"名字":"牛魔王的怒吼残片","所属": "高级合成材料","品质":"邪灵","颜色": "656565","类型":"道具","描述":"牛魔王的怒吼残片，集齐残片可以打造邪灵法宝牛魔王的怒吼，但似乎想要让其可以使用还缺少了某个关键材料？","售价": 0},
	"zlwdahsp1":{"名字":"转轮王的哀嚎残片·壹","所属": "高级合成材料","品质":"邪灵","颜色": "656565","类型":"道具","描述":"转轮王的哀嚎部分残片。","售价": 0},
	"zlwdahsp2":{"名字":"转轮王的哀嚎残片·贰","所属": "高级合成材料","品质":"邪灵","颜色": "656565","类型":"道具","描述":"转轮王的哀嚎部分残片。","售价": 0},
	"zlwdahsp3":{"名字":"转轮王的哀嚎残片·叁","所属": "高级合成材料","品质":"邪灵","颜色": "656565","类型":"道具","描述":"转轮王的哀嚎部分残片。","售价": 0},
	
	"liuhuang":{"名字":"硫磺","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成幸运丹。","售价": 0},
	"xianmao":{"名字":"仙茅","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成魔法丹。","售价": 0},
	"lingli":{"名字":"鲮鲤","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成攻击丹。","售价": 0},
	"renshen":{"名字":"人参","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成生命丹。","售价": 0},
	"shougong":{"名字":"守宫","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成回魔丹。","售价": 0},
	"leizong":{"名字":"雷鬃","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"可参与合成暴击丹。","售价": 0},
	"dudan":{"名字":"毒丹","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"合成高级丹药所需的材料。","售价": 0},
	"yjpysp":{"名字":"玉净瓶阴碎片","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"yjpyasp":{"名字":"玉净瓶阳碎片","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"xianzhilu":{"名字":"仙脂露","所属": "基础材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"qhs_1":{"名字":"1级强化石","所属": "强化石","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"用于强化装备提升属性。","售价": 5},
	"qhs_2":{"名字":"2级强化石","所属": "强化石","品质":"优秀","颜色": "00FF00","类型":"道具","描述":"用于强化装备提升属性。","售价": 10},
	"qhs_3":{"名字":"3级强化石","所属": "强化石","品质":"精良","颜色": "008aff","类型":"道具","描述":"用于强化装备提升属性。","售价": 20},
	"qhs_4":{"名字":"4级强化石","所属": "强化石","品质":"史诗","颜色": "800080","类型":"道具","描述":"用于强化装备提升属性。","售价": 30},
	"mjlp":{"名字":"冥界令牌","所属": "令牌","品质":"玄冥","颜色": "70904d","类型":"道具","描述":"在冥界通行需要的凭证。","售价": 0},
	"ttlp":{"名字":"通天令牌","所属": "令牌","品质":"玄冥","颜色": "70904d","类型":"道具","描述":"通往天界需要的凭证。","售价": 0},
	"ttlp1":{"名字":"通天令牌碎片1","所属": "令牌碎片","品质":"玄冥","颜色": "70904d","类型":"道具","描述":"合成通天令牌的残片。密语（最终决战）","售价": 0},
	"ttlp2":{"名字":"通天令牌碎片2","所属": "令牌碎片","品质":"玄冥","颜色": "70904d","类型":"道具","描述":"合成通天令牌的残片。密语（返璞归真）","售价": 0},
	"ttlp3":{"名字":"通天令牌碎片3","所属": "令牌碎片","品质":"玄冥","颜色": "70904d","类型":"道具","描述":"合成通天令牌的残片。","售价": 0},
	"fygwj":{"名字":"封印鬼王剑","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"被封印的鬼王剑，似乎蕴藏着无穷的力量。","售价": 0},
	"yazfw":{"名字":"阳之符文","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"冥界鬼符，似乎与鬼王剑有着丝丝关联。","售价": 0},
	"yizfw":{"名字":"阴之符文","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"冥界鬼符，似乎与鬼王剑有着丝丝关联。","售价": 0},
	"jssp":{"名字":"今生碎片","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"三生石的今生碎片，拥有神秘的力量。","售价": 0},
	"lssp":{"名字":"来生碎片","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"三生石的来生碎片，拥有神秘的力量。","售价": 0},
	"qssp":{"名字":"前生碎片","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"三生石的前生碎片，拥有神秘的力量。","售价": 0},
	"lshb":{"名字":"绿色花瓣","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"彼岸花散落三片花瓣，集齐了才能释放出彼岸花的魔力。","售价": 0},
	"zshb":{"名字":"紫色花瓣","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"彼岸花散落三片花瓣，集齐了才能释放出彼岸花的魔力。","售价": 0},
	"hshb":{"名字":"红色花瓣","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"彼岸花散落三片花瓣，集齐了才能释放出彼岸花的魔力。","售价": 0},
	"llzsp":{"名字":"雷之宝珠碎片","所属": "宝珠碎片","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"雷灵珠的残片，可以在炼丹炉内合成雷灵珠。","售价": 0},
	"hlzsp":{"名字":"火之宝珠碎片","所属": "宝珠碎片","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"火灵珠的残片，可以在炼丹炉内合成火灵珠。","售价": 0},
	"flzsp":{"名字":"风之宝珠碎片","所属": "宝珠碎片","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"风灵珠的残片，可以在炼丹炉内合成风灵珠。","售价": 0},
	"tlzsp":{"名字":"土之宝珠碎片","所属": "宝珠碎片","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"土灵珠的残片，可以在炼丹炉内合成土灵珠。","售价": 0},	
	"slzsp":{"名字":"水之宝珠碎片","所属": "宝珠碎片","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"水灵珠的残片，可以在炼丹炉内合成水灵珠。","售价": 0},	
	"lpzgui":{"名字":"落魄阵·鬼","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},	
	"lpzming":{"名字":"落魄阵·冥","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"lpzyou":{"名字":"落魄阵·幽","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"ren":{"名字":"森罗阵·人","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"lslzdi":{"名字":"森罗阵·地","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"lslztian":{"名字":"森罗阵·天","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tsztianquan":{"名字":"腾蛇阵阵·天权","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tsztianji":{"名字":"腾蛇阵·天玑","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tsztianxuan":{"名字":"腾蛇阵·天璇","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tsztianshu":{"名字":"腾蛇阵·天枢","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tqzqinglong":{"名字":"太清阵·青龙","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tqzzhuque":{"名字":"太清阵·朱雀","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tqzxuanwu":{"名字":"太清阵·玄武","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"tqzbaihu":{"名字":"太清阵·白虎","所属": "阵眼材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"zftps":{"名字":"阵法突破石","所属": "阵法突破材料","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"","售价": 0},
	"smlp":{"名字":"神秘令牌","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"神秘的令牌，在神秘店铺购买时可作为货币转换为购买次数。","售价": 0},	
	"c":{"名字":"愤怒·嗔","所属": "地藏印","品质":"普通","颜色": "FFFFFF","类型":"道具","SHp": 0, "SMp": 0, "power": randi_range(10,30), "Def": 0, "Mdef": 0, "Crit": randi_range(2,6), "Miss": randi_range(2,6), "R_hp": 0, "R_mp": randi_range(2,3), 
	"vampirism": 0, "Lucky": randi_range(2,6), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"贪嗔痴,妄念起,便是万丈红尘。（只留两个可以刷属性。）","售价": 0,"强化属性":{"SHp":0}},
	"ch":{"名字":"混沌·痴","所属": "地藏印","品质":"普通","颜色": "FFFFFF","类型":"道具","SHp": 0, "SMp": randi_range(20,60), "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": randi_range(2,5), 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"贪嗔痴,妄念起,便是万丈红尘。（只留两个可以刷属性。）","售价": 0,"强化属性":{"SHp":0}},
	"t":{"名字":"欲望·贪","所属": "地藏印","品质":"普通","颜色": "FFFFFF","类型":"道具","SHp": randi_range(50,100), "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": randi_range(2,5), "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"贪嗔痴,妄念起,便是万丈红尘。（只留两个可以刷属性。）","售价": 0,"强化属性":{"SHp":0}},
	
	"zzyj":{"名字":"印记·蜘蛛","所属": "五毒印记","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"都市王之蛛之印记，封印着邪恶的力量。","售价": 0},
	"szyj":{"名字":"印记·毒蛇","所属": "五毒印记","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"五官王之蛇之印记，封印着邪恶的力量。","售价": 0},
	"xzyj":{"名字":"印记·毒蝎","所属": "五毒印记","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"卞城王之蝎之印记，封印着邪恶的力量。","售价": 0},
	"czyj":{"名字":"印记·金蟾","所属": "五毒印记","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"泰山王之蟾之印记，封印着邪恶的力量。","售价": 0},
	"gzyj":{"名字":"印记·蜈蚣","所属": "五毒印记","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"平等王之蚣之印记，封印着邪恶的力量。","售价": 0},
	
	"czlxls":{"名字":"成长率洗炼石","所属": "法宝洗炼","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"用于法宝洗炼重置成长率。","售价": 0},
	"wxxls":{"名字":"五行洗炼石","所属": "法宝洗炼","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"用于法宝洗炼重置五行。","售价": 0},
	"fbxls":{"名字":"法宝洗炼石","所属": "法宝洗炼","品质":"普通","颜色": "FFFFFF","类型":"道具","描述":"用于洗炼法宝，同时重置五行和成长率。","售价": 0},
	#================================消耗品
	"mpyj":{"名字":"孟婆药剂","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"使用后将会重置技能。","售价": 0},
	"xydxq":{"名字":"幸运的喜鹊","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"幸运的喜鹊给你带来好运，使用后2小时内享受双倍掉率。Buff存在期间只能使用一个。","售价": 0},
	"yll":{"名字":"阎罗令","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"使用后将会传送至十八次地狱（需通关奈何桥）。","售价": 0},
	"xlhys":{"名字":"小灵魂药水","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"使用后获得15万灵魂。","售价": 0},
	"dlhys":{"名字":"大灵魂药水","所属": "无","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"使用后获得60万灵魂。","售价": 0},
	"qhsbx":{"名字":"强化石随机宝箱","所属": "宝箱","品质":"普通","颜色": "FFFFFF","类型":"消耗品","描述":"使用后随机获得（1级，2级，3级，4级强化石中的一种 * （3~4个））。","售价": 200},
	"hhbx":{"名字":"神秘宝箱","所属": "宝箱","品质":"魂器","颜色": "00ffff","类型":"消耗品","描述":"宝箱蕴含万物之灵气（使用后可以从所有道具中随机获取一个）。","售价": 0},
	"zxbx_1":{"名字":"强化石自选宝箱","所属": "宝箱","品质":"传说","颜色": "FFA500","类型":"消耗品","描述":"使用后可从（1级，2级，3级，4级强化石）中自选一个物品领取。","售价": 0},
	"zxbx_2":{"名字":"龙王自选宝箱2","所属": "宝箱","品质":"传说","颜色": "FFA500","类型":"消耗品","描述":"使用后可从（如意金箍棒，九环禅杖，七星守护,九齿钉耙）中自选一个装备领取。","售价": 500},
	"zxbx_3":{"名字":"龙王自选宝箱1","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（青龙刀，玄武甲，朱雀戒，白虎杖，麒麟袍,诸怀耙，貔貅铠）中自选一个装备领取。","售价": 500},	
	"mhwbx":{"名字":"猕猴王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（地煞战衣，地煞灵戒）中自选一个装备领取。","售价": 0},	
	"yrwbx":{"名字":"禺狨王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（地煞猿甲，地煞权杖）中自选一个装备领取。","售价": 0},	
	"bfsxbx":{"名字":"蝙蝠石像宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（尾火棍，壁水袍，胃土耙）中自选一个装备领取。","售价": 0},	
	"pmwbx":{"名字":"鹏魔王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（家传袈裟，家传手镯）中自选一个装备领取。","售价": 0},	
	"stwbx":{"名字":"狮驼王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（家传金耙，家传宝剑）中自选一个装备领取。","售价": 0},	
	"jmwbx":{"名字":"蛟魔王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（玄武甲，貔貅铠）中自选一个装备领取。","售价": 0},	
	"smwbx":{"名字":"鲨魔王宝箱","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后可从（麒麟袍，朱雀戒）中自选一个装备领取。","售价": 0},
	"szbx_1":{"名字":"时装礼包1","所属": "宝箱","品质":"神器","颜色": "ff2d00","类型":"消耗品","描述":"使用后可从（圣·悟空状元服，圣·唐僧状元服，圣·八戒状元服，圣·沙僧状元服，圣·白龙状元服）中自选一件时装领取。","售价": 0},
	"szbx_2":{"名字":"时装礼包2","所属": "宝箱","品质":"神器","颜色": "ff2d00","类型":"消耗品","描述":"使用后可从（绝·悟空状元服，绝·唐僧状元服，绝·八戒状元服，绝·沙僧状元服，绝·白龙状元服）中自选一件时装领取。","售价": 0},
	"bsd_1":{"名字":"1级宝石袋","所属": "宝箱","品质":"优秀","颜色": "00FF00","类型":"消耗品","描述":"使用后随机获得一种一级宝石。","售价": 0},
	"bsd_2":{"名字":"2级宝石袋","所属": "宝箱","品质":"精良","颜色": "008aff","类型":"消耗品","描述":"使用后随机获得一种二级宝石。","售价": 0},
	"bsd_3":{"名字":"3级宝石袋","所属": "宝箱","品质":"史诗","颜色": "800080","类型":"消耗品","描述":"使用后随机获得一种三级宝石。","售价": 0},
	"bsd_4":{"名字":"4级宝石袋","所属": "宝箱","品质":"传说","颜色": "FFA500","类型":"消耗品","描述":"使用后随机获得一种四级宝石。","售价": 0},
	"bsd_5":{"名字":"5级宝石袋","所属": "宝箱","品质":"神器","颜色": "ff2d00","类型":"消耗品","描述":"使用后随机获得一种五级宝石。","售价": 0},
	
	#===========================法宝
	"dshl": {"名字": "地煞葫芦","所属": "通用","品质": "优秀","类型": "法宝","成长率":snapped(randf_range(0.6,1),0.1),"五行": [],"颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":" 拥有【烈焰火柱】技能，释放三道火柱，造成多段伤害，并灼烧目标。","售价": 40,"强化属性":{
		"SHp": 18, "SMp": 5, "power": 2, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"tsgj": {"名字": "天煞古剑","所属": "通用","品质": "精良","类型": "法宝","成长率":snapped(randf_range(0.8,1.4),0.1),"五行": [],"颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":" 拥有【万剑归宗】技能，召唤数把巨剑从天而降，造成多段伤害，并概率令其冰冻。","售价": 80,"强化属性":{
		"SHp": 26, "SMp": 7, "power": 2, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"jcld": {"名字": "家传铃铛","所属": "通用","品质": "精良","类型": "法宝","成长率":snapped(randf_range(1,1.8),0.1),"五行": [],"颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"集齐家传装备后熔铸而成，拥有神秘的力量。","售价": 80,"强化属性":{
		"SHp": 24, "SMp": 9, "power": 2, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"bsyj": {"名字": "白霜妖镜","所属": "通用","品质": "精良","类型": "法宝","成长率":snapped(randf_range(0.8,1.4),0.1),"五行": [],"颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【邪灵寄生】技能，附身到怪物身上偷取生命，同时使其减速，一段时间后将偷取到的生命给予玩家。","售价": 80,"强化属性":{
		"SHp": 20, "SMp": 11, "power": 3, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"lsys": {"名字": "罗刹妖伞","所属": "通用","品质": "精良","类型": "法宝","成长率":snapped(randf_range(1,1.6),0.1),"五行": [],"颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【暴雨梨花】技能，散出漫天毒针，命中敌人后会造成少量伤害并令其中毒。","售价": 80,"强化属性":{
		"SHp": 20, "SMp": 11, "power": 3, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"xhmt": {"名字": "血海魔童","所属": "通用","品质": "史诗","类型": "法宝","成长率":snapped(randf_range(1.2,1.8),0.1),"五行": [],"颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【魔童连击,邪灵净化】技能，清除低级负面效果，之后对目标进行多次打击，造成魔法伤害。","售价": 160,"强化属性":{
		"SHp": 18, "SMp": 9, "power": 5, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"kyl": {"名字": "枯叶灵","所属": "通用","品质": "史诗","类型": "法宝","成长率":snapped(randf_range(1.4,2),0.1),"五行": [],"颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 2, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【沐浴回春】技能，每秒为玩家恢复生命,期间免疫击退。","售价": 160,"强化属性":{
		"SHp": 20, "SMp": 9, "power": 5, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"xhhl": {"名字": "萱花葫芦","所属": "通用","品质": "史诗","类型": "法宝","成长率":snapped(randf_range(1.6,2.2),0.1),"五行": [],"颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 2, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【万象天引】技能，将怪物吸引至玩家身边。","售价": 160,"强化属性":{
		"SHp": 22, "SMp": 10, "power": 6, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"qyj": {"名字": "青云剑","所属": "通用","品质": "史诗","类型": "法宝","成长率":snapped(randf_range(1.8,2.4),0.1),"五行": [],"颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 2, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【戮天斩击】技能，释放剑阵，飞向当前生命最高的敌人，对受到伤害所有目标施加破甲。","售价": 160,"强化属性":{
		"SHp": 22, "SMp": 10, "power": 6, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"zjfyd": {"名字": "混元伏妖盾","所属": "通用","品质": "史诗","类型": "法宝","成长率":snapped(randf_range(2,2.5),0.1),"五行": [],"颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【不灭神盾】技能，使用后获得【不灭】效果，一段时间内免疫高于当前生命的伤害。","售价": 160,"强化属性":{
		"SHp": 25, "SMp": 10, "power": 7, "Def": 1, "Mdef": 1},"宝石":[]},

	"zjhl": {"名字": "紫金葫芦","所属": "通用","品质": "邪灵","类型": "法宝","成长率":snapped(randf_range(2,2.5),0.1),"五行": [],"颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"拥有【伏妖神火】技能，朝前方喷出火焰，造成物理伤害,并有10%概率施加一层（灼烧）。","售价": 320,"强化属性":{
		"SHp": 25, "SMp": 12, "power": 10, "Def": 1, "Mdef": 1},"宝石":[]},
		
	"nmwdnh": {"名字": "牛魔王的怒吼","所属": "通用","品质": "邪灵","类型": "法宝","成长率":snapped(randf_range(2.2,2.6),0.1),"五行": [],"颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 15,"sp": 0,"描述":"召唤牛魔王助战。","售价": 320,"强化属性":{
		"SHp": 30, "SMp": 10, "power": 15, "Def": 1, "Mdef": 1},"宝石":[]},

	"zlwdah": {"名字": "转轮王的哀嚎","所属": "通用","品质": "邪灵","类型": "法宝","成长率":snapped(randf_range(2.2,2.6),0.1),"五行": [],"颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 5, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 15,"描述":"召唤转轮王助战。","售价": 320,"强化属性":{
		"SHp": 30, "SMp": 10, "power": 15, "Def": 1, "Mdef": 1},"宝石":[]},
		
#
#	"yjp": {"名字": "玉净瓶","所属": "通用","品质": "魂器","类型": "法宝","成长率":snapped(randf_range(2,2.5),0.1),"五行": [],"颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 10, "Miss": 0, "R_hp": 0, "R_mp": 3, 
#	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"","售价": 640,"强化属性":{
#		"SHp": 25, "SMp": 12, "power": 10, "Def": 1, "Mdef": 1},"宝石":[]},
#==========================宝石=========
	"sms_1": {"名字": "1级生命石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 25, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供25生命，也合成为2级生命石。","售价": 0,"强化属性":{}},

	"sms_2": {"名字": "2级生命石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 60, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供60生命，也合成为3级生命石。","售价": 0,"强化属性":{}},

	"sms_3": {"名字": "3级生命石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 150, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供150生命，也合成为4级生命石。","售价": 0,"强化属性":{}},

	"sms_4": {"名字": "4级生命石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 380, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供300生命，也合成为5级生命石。","售价": 0,"强化属性":{}},
	
	"sms_5": {"名字": "5级生命石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 600, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供600生命。","售价": 0,"强化属性":{}},
	
	"fls_1": {"名字": "1级魔法石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 15, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供15法力，也合成为2级魔法石。","售价": 0,"强化属性":{}},

	"fls_2": {"名字": "2级魔法石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 25, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供25法力，也合成为3级魔法石。","售价": 0,"强化属性":{}},

	"fls_3": {"名字": "3级魔法石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 50, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供50法力，也合成为4级魔法石。","售价": 0,"强化属性":{}},

	"fls_4": {"名字": "4级魔法石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 85, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供85法力，也合成为5级魔法石。","售价": 0,"强化属性":{}},
	
	"fls_5": {"名字": "5级魔法石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 120, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供120法力。","售价": 0,"强化属性":{}},	
	
	"gjs_1": {"名字": "1级攻击石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 5, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5攻击，也合成为2级攻击石。","售价": 0,"强化属性":{}},

	"gjs_2": {"名字": "2级攻击石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 13, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供13攻击，也合成为3级攻击石。","售价": 0,"强化属性":{}},

	"gjs_3": {"名字": "3级攻击石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 30, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供30攻击，也合成为4级攻击石。","售价": 0,"强化属性":{}},

	"gjs_4": {"名字": "4级攻击石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 70, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供70攻击，也合成为5级攻击石。","售价": 0,"强化属性":{}},
	
	"gjs_5": {"名字": "5级攻击石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 120, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供120攻击。","售价": 0,"强化属性":{}},		
	
	"wfs_1": {"名字": "1级物防石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 1, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1物防，也合成为2级物防石。","售价": 0,"强化属性":{}},

	"wfs_2": {"名字": "2级物防石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 3, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3物防，也合成为3级物防石。","售价": 0,"强化属性":{}},

	"wfs_3": {"名字": "3级物防石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 5, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5物防，也合成为4级物防石。","售价": 0,"强化属性":{}},

	"wfs_4": {"名字": "4级物防石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 13, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供13物防，也合成为5级物防石。","售价": 0,"强化属性":{}},
	
	"wfs_5": {"名字": "5级物防石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 21, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供21物防。","售价": 0,"强化属性":{}},	
	
	"mfs_1": {"名字": "1级魔防石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 1, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1魔防，也合成为2级魔防石。","售价": 0,"强化属性":{}},

	"mfs_2": {"名字": "2级魔防石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 3, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3魔防，也合成为3级魔防石。","售价": 0,"强化属性":{}},

	"mfs_3": {"名字": "3级魔防石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 5, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5魔防，也合成为4级魔防石。","售价": 0,"强化属性":{}},

	"mfs_4": {"名字": "4级魔防石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 13, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供13魔防，也合成为5级魔防石。","售价": 0,"强化属性":{}},
	
	"mfs_5": {"名字": "5级魔防石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 21, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供21魔防。","售价": 0,"强化属性":{}},	
	
	"bjs_1": {"名字": "1级暴击石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 1, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1暴击，也合成为2级暴击石。","售价": 0,"强化属性":{}},

	"bjs_2": {"名字": "2级暴击石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 2, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2暴击，也合成为3级暴击石。","售价": 0,"强化属性":{}},

	"bjs_3": {"名字": "3级暴击石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 4, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供4暴击，也合成为4级暴击石。","售价": 0,"强化属性":{}},

	"bjs_4": {"名字": "4级暴击石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 6, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供6暴击，也合成为5级暴击石。","售价": 0,"强化属性":{}},
	
	"bjs_5": {"名字": "5级暴击石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 8, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供8暴击。","售价": 0,"强化属性":{}},	

	"sbs_1": {"名字": "1级闪避石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 1, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1闪避，也合成为2级闪避石。","售价": 0,"强化属性":{}},

	"sbs_2": {"名字": "2级闪避石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 2, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2闪避，也合成为3级闪避石。","售价": 0,"强化属性":{}},

	"sbs_3": {"名字": "3级闪避石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 3, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3闪避，也合成为4级闪避石。","售价": 0,"强化属性":{}},

	"sbs_4": {"名字": "4级闪避石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 5, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5闪避，也合成为5级闪避石。","售价": 0,"强化属性":{}},
	
	"sbs_5": {"名字": "5级闪避石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 7, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供7闪避。","售价": 0,"强化属性":{}},	

	"rxs_1": {"名字": "1级韧性石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 1,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1韧性，也合成为2级韧性石。","售价": 0,"强化属性":{}},

	"rxs_2": {"名字": "2级韧性石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 2,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2韧性，也合成为3级韧性石。","售价": 0,"强化属性":{}},

	"rxs_3": {"名字": "3级韧性石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 3,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3韧性，也合成为4级韧性石。","售价": 0,"强化属性":{}},

	"rxs_4": {"名字": "4级韧性石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 5,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5韧性，也合成为5级韧性石。","售价": 0,"强化属性":{}},
	
	"rxs_5": {"名字": "5级韧性石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 7,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供7韧性。","售价": 0,"强化属性":{}},	
	
	"hxs_1": {"名字": "1级回血石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 1, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1回血，也合成为2级回血石。","售价": 0,"强化属性":{}},

	"hxs_2": {"名字": "2级回血石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 2, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2回血，也合成为3级回血石。","售价": 0,"强化属性":{}},

	"hxs_3": {"名字": "3级回血石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 3, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3回血，也合成为4级回血石。","售价": 0,"强化属性":{}},

	"hxs_4": {"名字": "4级回血石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 7, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供7回血，也合成为5级回血石。","售价": 0,"强化属性":{}},
	
	"hxs_5": {"名字": "5级回血石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 10, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供10回血。","售价": 0,"强化属性":{}},	
	
	"hms_1": {"名字": "1级回魔石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 1, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1回魔，也合成为2级回魔石。","售价": 0,"强化属性":{}},

	"hms_2": {"名字": "2级回魔石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 2, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2回魔，也合成为3级回魔石。","售价": 0,"强化属性":{}},

	"hms_3": {"名字": "3级回魔石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 3, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供3回魔，也合成为4级回魔石。","售价": 0,"强化属性":{}},

	"hms_4": {"名字": "4级回魔石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 4, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供4回魔，也合成为5级回魔石。","售价": 0,"强化属性":{}},
	
	"hms_5": {"名字": "5级回魔石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 5, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供5回魔。","售价": 0,"强化属性":{}},
	
	"xys_1": {"名字": "1级幸运石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 1, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1幸运，也合成为2级幸运石。","售价": 0,"强化属性":{}},

	"xys_2": {"名字": "2级幸运石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 4, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供4幸运，也合成为3级幸运石。","售价": 0,"强化属性":{}},

	"xys_3": {"名字": "3级幸运石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 6, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供6幸运，也合成为4级幸运石。","售价": 0,"强化属性":{}},

	"xys_4": {"名字": "4级幸运石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 10, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供10幸运，也合成为5级幸运石。","售价": 0,"强化属性":{}},
	
	"xys_5": {"名字": "5级幸运石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 18, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供18幸运。","售价": 0,"强化属性":{}},
	
	"mzs_1": {"名字": "1级命中石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 1,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供1命中，也合成为2级命中石。","售价": 0,"强化属性":{}},

	"mzs_2": {"名字": "2级命中石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 2,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供2命中，也合成为3级命中石。","售价": 0,"强化属性":{}},

	"mzs_3": {"名字": "3级命中石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 4,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供4命中，也合成为4级命中石。","售价": 0,"强化属性":{}},

	"mzs_4": {"名字": "4级命中石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 6,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供6命中，也合成为5级命中石。","售价": 0,"强化属性":{}},
	
	"mzs_5": {"名字": "5级命中石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 9,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"镶嵌后提供9命中。","售价": 0,"强化属性":{}},
	
	"bms_1": {"名字": "1级暴免石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 1,"ar": 0,"sp": 0,"描述":"镶嵌后提供1暴免，也合成为2级暴免石。","售价": 0,"强化属性":{}},

	"bms_2": {"名字": "2级暴免石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 2,"ar": 0,"sp": 0,"描述":"镶嵌后提供2暴免，也合成为3级暴免石。","售价": 0,"强化属性":{}},

	"bms_3": {"名字": "3级暴免石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 3,"ar": 0,"sp": 0,"描述":"镶嵌后提供3暴免，也合成为4级暴免石。","售价": 0,"强化属性":{}},

	"bms_4": {"名字": "4级暴免石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 5,"ar": 0,"sp": 0,"描述":"镶嵌后提供5暴免，也合成为5级暴免石。","售价": 0,"强化属性":{}},
	
	"bms_5": {"名字": "5级暴免石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 7,"ar": 0,"sp": 0,"描述":"镶嵌后提供7暴免。","售价": 0,"强化属性":{}},
	
	"pjs_1": {"名字": "1级破甲石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 3,"sp": 0,"描述":"镶嵌后提供3破甲，也合成为2级破甲石。","售价": 0,"强化属性":{}},

	"pjs_2": {"名字": "2级破甲石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 6,"sp": 0,"描述":"镶嵌后提供6破甲，也合成为3级破甲石。","售价": 0,"强化属性":{}},

	"pjs_3": {"名字": "3级破甲石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 10,"sp": 0,"描述":"镶嵌后提供10破甲，也合成为4级破甲石。","售价": 0,"强化属性":{}},

	"pjs_4": {"名字": "4级破甲石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 15,"sp": 0,"描述":"镶嵌后提供15破甲，也合成为5级破甲石。","售价": 0,"强化属性":{}},
	
	"pjs_5": {"名字": "5级破甲石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 21,"sp": 0,"描述":"镶嵌后提供21破甲。","售价": 0,"强化属性":{}},
	
	"pms_1": {"名字": "1级破魔石","所属": "宝石","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 3,"描述":"镶嵌后提供3破魔，也合成为2级破魔石。","售价": 0,"强化属性":{}},

	"pms_2": {"名字": "2级破魔石","所属": "宝石","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 6,"描述":"镶嵌后提供6破魔，也合成为3级破魔石。","售价": 0,"强化属性":{}},

	"pms_3": {"名字": "3级破魔石","所属": "宝石","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 10,"描述":"镶嵌后提供10破魔，也合成为4级破魔石。","售价": 0,"强化属性":{}},

	"pms_4": {"名字": "4级破魔石","所属": "宝石","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 15,"描述":"镶嵌后提供15破魔，也合成为5级破魔石。","售价": 0,"强化属性":{}},
	
	"pms_5": {"名字": "5级破魔石","所属": "宝石","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 21,"描述":"镶嵌后提供21破魔。","售价": 0,"强化属性":{}},
	#============================丹药=============================
	"smd_1": {"名字": "一品生命丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供生命值。","售价": 0,"强化属性":{}},

	"smd_2": {"名字": "二品生命丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供生命值。","售价": 0,"强化属性":{}},

	"smd_3": {"名字": "三品生命丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供生命值。","售价": 0,"强化属性":{}},

	"smd_4": {"名字": "四品生命丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供生命值。","售价": 0,"强化属性":{}},
	
	"smd_5": {"名字": "五品生命丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供生命值。","售价": 0,"强化属性":{}},

	"fld_1": {"名字": "一品魔法丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供法力值。","售价": 0,"强化属性":{}},

	"fld_2": {"名字": "二品魔法丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供法力值。","售价": 0,"强化属性":{}},

	"fld_3": {"名字": "三品魔法丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供法力值。","售价": 0,"强化属性":{}},

	"fld_4": {"名字": "四品魔法丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供法力值。","售价": 0,"强化属性":{}},
	
	"fld_5": {"名字": "五品魔法丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供法力值。","售价": 0,"强化属性":{}},
	
	"gjd_1": {"名字": "一品攻击丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供攻击。","售价": 0,"强化属性":{}},

	"gjd_2": {"名字": "二品攻击丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供攻击。","售价": 0,"强化属性":{}},

	"gjd_3": {"名字": "三品攻击丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供攻击。","售价": 0,"强化属性":{}},

	"gjd_4": {"名字": "四品攻击丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供攻击。","售价": 0,"强化属性":{}},
	
	"gjd_5": {"名字": "五品攻击丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供攻击。","售价": 0,"强化属性":{}},
	
	"bjd_1": {"名字": "一品暴击丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供暴击值。","售价": 0,"强化属性":{}},

	"bjd_2": {"名字": "二品暴击丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供暴击值。","售价": 0,"强化属性":{}},

	"bjd_3": {"名字": "三品暴击丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供暴击值。","售价": 0,"强化属性":{}},

	"bjd_4": {"名字": "四品暴击丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供暴击值。","售价": 0,"强化属性":{}},
	
	"bjd_5": {"名字": "五品暴击丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供暴击值。","售价": 0,"强化属性":{}},
	
	"xyd_1": {"名字": "一品幸运丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供幸运值。","售价": 0,"强化属性":{}},

	"xyd_2": {"名字": "二品幸运丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供幸运值。","售价": 0,"强化属性":{}},

	"xyd_3": {"名字": "三品幸运丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供幸运值。","售价": 0,"强化属性":{}},

	"xyd_4": {"名字": "四品幸运丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供幸运值。","售价": 0,"强化属性":{}},
	
	"xyd_5": {"名字": "五品幸运丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供幸运值。","售价": 0,"强化属性":{}},
	
	"hmd_1": {"名字": "一品回魔丹","所属": "丹药","品质": "普通","类型": "道具","颜色": "FFFFFF","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供回魔值。","售价": 0,"强化属性":{}},

	"hmd_2": {"名字": "二品回魔丹","所属": "丹药","品质": "优秀","类型": "道具","颜色": "00FF00","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供回魔值。","售价": 0,"强化属性":{}},

	"hmd_3": {"名字": "三品回魔丹","所属": "丹药","品质": "精良","类型": "道具","颜色": "008aff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供回魔值。","售价": 0,"强化属性":{}},

	"hmd_4": {"名字": "四品回魔丹","所属": "丹药","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供回魔值。","售价": 0,"强化属性":{}},
	
	"hmd_5": {"名字": "五品回魔丹","所属": "丹药","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"神秘的丹药，服用后可以提供回魔值。","售价": 0,"强化属性":{}},
	#====================宝珠===========
	"llz": {"名字": "雷之宝珠","所属": "宝珠","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": randi_range(5,7), "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": randi_range(5,7), "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"打造时添加，提供5~7的幸运和暴击。","售价": 0,"强化属性":{}},
	"slz": {"名字": "水之宝珠","所属": "宝珠","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": randi_range(100,150), "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": randi_range(1,2), 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"打造时添加，提供100~150魔法和1~2的回魔。","售价": 0,"强化属性":{}},
	"hlz": {"名字": "火之宝珠","所属": "宝珠","品质": "传说","类型": "道具","颜色": "FFA500","SHp": randi_range(150,250), "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": randi_range(1,3), "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"打造时添加，提供150~250生命和1~3的回血。","售价": 0,"强化属性":{}},
	"flz": {"名字": "风之宝珠","所属": "宝珠","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": randi_range(3,5), "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": randi_range(3,5),"CritReduce": 0,"ar": 0,"sp": 0,"描述":"打造时添加，提供3~5的命中和闪避。","售价": 0,"强化属性":{}},
	"tlz": {"名字": "土之宝珠","所属": "宝珠","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": randi_range(12,15), "Mdef": randi_range(12,15), "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"打造时添加，提供12~15的物防和魔防。","售价": 0,"强化属性":{}},
	
	#========================制作书
	
	"hljhzzs": {"名字": "红莲教皇制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧史诗防具红莲教皇。","售价": 0,"强化属性":{}},
	
	"wsjgzzs": {"名字": "顽石金刚制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造八戒史诗防具顽石金刚。","售价": 0,"强化属性":{}},
	
	"zjbtgzzs": {"名字": "紫金镔铁棍制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空史诗武器紫金镔铁棍。","售价": 0,"强化属性":{}},
	
	"zjxmczzs": {"名字": "紫金降魔铲制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造沙僧史诗武器紫金降魔铲。","售价": 0,"强化属性":{}},
	
	"blmqzzs": {"名字": "百裂冥枪制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造白龙史诗武器百裂冥枪。","售价": 0,"强化属性":{}},
	
	"tfljzzs": {"名字": "通风灵戒制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造史诗饰品通风灵戒。","售价": 0,"强化属性":{}},
	
	"mgzhzzs": {"名字": "马官指环制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造史诗饰品马官指环。","售价": 0,"强化属性":{}},
	
	"tdlzjzzs": {"名字": "提多罗吒之戒制作书","所属": "制作书","品质": "史诗","类型": "道具","颜色": "800080","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造史诗饰品提多罗吒之戒。","售价": 0,"强化属性":{}},

	"eyzzs": {"名字": "厄夜制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空邪灵防具厄夜。","售价": 0,"强化属性":{}},
	
	"thzzs": {"名字": "天荒制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空邪灵武器天荒。","售价": 0,"强化属性":{}},
	
	"tczzs": {"名字": "天残制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧邪灵武器天残。","售价": 0,"强化属性":{}},
	
	"czzzs": {"名字": "残昼制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧邪灵防具残昼。","售价": 0,"强化属性":{}},
	
	"tzzzs": {"名字": "天罪制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造八戒邪灵武器天罪。","售价": 0,"强化属性":{}},
	
	"ryzzs": {"名字": "如狱制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造八戒邪灵防具如狱。","售价": 0,"强化属性":{}},
	
	"tszzs": {"名字": "天殇制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造沙僧邪灵武器天殇。","售价": 0,"强化属性":{}},
	
	"yjzzs": {"名字": "犹绝制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造沙僧邪灵防具犹绝。","售价": 0,"强化属性":{}},
	
	"tqzzs": {"名字": "天囚制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造白龙邪灵武器天囚。","售价": 0,"强化属性":{}},
	
	"zezzs": {"名字": "灾厄制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造白龙邪灵防具灾厄。","售价": 0,"强化属性":{}},
	
	"llyzzs": {"名字": "玲珑玉制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造邪灵饰品玲珑玉。","售价": 0,"强化属性":{}},
	
	"qlgzzs": {"名字": "虬龙棍制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空魂器武器虬龙棍。","售价": 0,"强化属性":{}},
	
	"qljzzs": {"名字": "虬龙甲制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空魂器防具虬龙甲。","售价": 0,"强化属性":{}},
	
	"plzzzs": {"名字": "蟠龙杖制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧魂器武器蟠龙杖。","售价": 0,"强化属性":{}},
	
	"plpzzs": {"名字": "蟠龙袍制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧魂器防具蟠龙袍。","售价": 0,"强化属性":{}},
	
	"ylfzzs": {"名字": "应龙斧制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造八戒魂器武器应龙斧。","售价": 0,"强化属性":{}},
	
	"ylkzzs": {"名字": "应龙铠制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造八戒魂器防具应龙铠。","售价": 0,"强化属性":{}},
	
	"jlczzs": {"名字": "蛟龙铲制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造沙僧魂器武器蛟龙铲。","售价": 0,"强化属性":{}},
	
	"jljzzs": {"名字": "蛟龙甲制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造沙僧魂器防具蛟龙甲。","售价": 0,"强化属性":{}},
	
	"tlqzzs": {"名字": "天龙枪制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造白龙魂器武器天龙铲。","售价": 0,"强化属性":{}},
	
	"tljzzs": {"名字": "天龙甲制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造白龙魂器防具天龙甲。","售价": 0,"强化属性":{}},
	
	"doushuaiziyanzzs": {"名字": "兜率紫炎制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造魂器饰品兜率紫炎。","售价": 0,"强化属性":{}},
	
	"canglongjiezzs": {"名字": "苍龙戒制作书","所属": "制作书","品质": "魂器","类型": "道具","颜色": "00ffff","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造魂器饰品苍龙戒。","售价": 0,"强化属性":{}},
	
	"qszzs": {"名字": "祁水制作书","所属": "制作书","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造悟空传说武器祁水。","售价": 0,"强化属性":{}},
	
	"ytzzs": {"名字": "夷图制作书","所属": "制作书","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打八戒传说武器夷图。","售价": 0,"强化属性":{}},
	
	"rczzs": {"名字": "若禅制作书","所属": "制作书","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造唐僧传说武器若禅。","售价": 0,"强化属性":{}},
	
	"llzzs": {"名字": "琉璃制作书","所属": "制作书","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打沙僧传说武器琉璃。","售价": 0,"强化属性":{}},
	
	"ldzzs": {"名字": "龙渊制作书","所属": "制作书","品质": "传说","类型": "道具","颜色": "FFA500","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打白龙传说武器龙渊。","售价": 0,"强化属性":{}},
	
	"nmwdnhzzs": {"名字": "牛魔王的怒吼制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造邪灵法宝牛魔王的怒吼。","售价": 0,"强化属性":{}},
	
	"zlwdahzzs": {"名字": "转轮王的哀嚎制作书","所属": "制作书","品质": "邪灵","类型": "道具","颜色": "656565","SHp": 0, "SMp": 0, "power": 0, "Def": 0, "Mdef": 0, "Crit": 0, "Miss": 0, "R_hp": 0, "R_mp": 0, 
	"vampirism": 0, "Lucky": 0, "Toughness": 0,"Htarget": 0,"CritReduce": 0,"ar": 0,"sp": 0,"描述":"在炼丹炉中消耗指定材料可以打造邪灵法宝转轮王的哀嚎。","售价": 0,"强化属性":{}},


}
func get_last_equ_pro(name_,qh_level,Data):
	var MY_EQdata = Data.duplicate()
	if AllEquipment_[name_]["类型"] == "道具":
		return MY_EQdata
	for i in MY_EQdata.size():
		if MY_EQdata["强化属性"].has(MY_EQdata.keys()[i]):
			MY_EQdata[MY_EQdata.keys()[i]] = MY_EQdata["强化属性"][MY_EQdata.keys()[i]] * qh_level + Data[MY_EQdata.keys()[i]]
	return MY_EQdata
func get_fb_last_equ_pro(name_,qh_level,wxlist,Data):
	var czl = Data["成长率"]
	var hhp = czl
	var smp = czl
	var jpow = czl
	var tdef = czl
	if wxlist.has("火"):
		hhp = czl + 1
	if wxlist.has("水"):
		smp = czl + 1
	if wxlist.has("金"):
		jpow = czl + 1
	if wxlist.has("土"):
		tdef = czl + 1	
	var list = Data.duplicate()
	for i in list.size():
		if list["强化属性"].has(list.keys()[i]):
			if list.keys()[i] == "SHp":
				list[list.keys()[i]] = hhp * list["强化属性"][list.keys()[i]] * qh_level + Data[list.keys()[i]]
			if list.keys()[i] == "SMp":
				list[list.keys()[i]] = smp * list["强化属性"][list.keys()[i]] * qh_level + Data[list.keys()[i]]
			if list.keys()[i] == "power":
				list[list.keys()[i]] = jpow * list["强化属性"][list.keys()[i]] * qh_level + Data[list.keys()[i]]
			if list.keys()[i] == "Def":
				list[list.keys()[i]] = tdef * list["强化属性"][list.keys()[i]] * qh_level + Data[list.keys()[i]]
			if list.keys()[i] == "Mdef":
				list[list.keys()[i]] = tdef * list["强化属性"][list.keys()[i]] * qh_level + Data[list.keys()[i]]
	return list

func get_wx():
	randomize()
	var wx = {"金":false,"木":false,"水":false,"火":false,"土":false}
	var rr = randi_range(0,100)
	if rr <= 10:
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		var wx_1 = wx_lst[aa]
		wx_lst.erase(wx_1)
		var bb = randi_range(0,3) 
		var wx_2 = wx_lst[bb]
		wx_lst.erase(wx_2)
		var cc = randi_range(0,2) 
		var wx_3 = wx_lst[cc]
		wx[wx_1] = true
		wx[wx_2] = true
		wx[wx_3] = true
		var new_list = []
		for i in wx:
			if wx[i]:
				new_list.push_back(i)
		return new_list
	elif rr > 10 and rr < 30 :
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		var wx_1 = wx_lst[aa]
		wx_lst.erase(wx_1)
		var bb = randi_range(0,3) 
		var wx_2 = wx_lst[bb]
		wx[wx_1] = true
		wx[wx_2] = true
		var new_list = []
		for i in wx:
			if wx[i]:
				new_list.push_back(i)
		return new_list
	else:
		var new_list = []
		var wx_lst = ["金","木","水","火","土"]
		var aa = randi_range(0,4)
		new_list.push_back(wx_lst[aa])
		return new_list


