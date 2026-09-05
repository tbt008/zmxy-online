extends Node2D
var need_name:String
@onready var label: Label = $BG/Label

var NameList = {
	"slz": "升龙斩",
	"lys": "烈焰闪",
	"hytj": "火炎突击",
	"lyfb": "烈焰风暴",
	"qsez": "七十二斩",
	"zz": "重斩",
	"hmz": "火魔斩",
	"jdy": "筋斗云",
	"hyjj": "火眼金睛",
	"blb": "冰龙波",
	"xbz": "玄冰阵",
	"shy": "水幻影",
	"tjgl": "天降甘露",
	"smb": "水魔爆",
	"myhc": "沐浴回春",
	"sgq": "圣光球",
	"jhsj": "九环圣经",
	"jgz": "紧箍咒",
	"ssp": "碎石破",
	"dj": "盾击",
	"jsp": "巨石破",
	"sd": "圣盾",
	"dgq": "地滚球",
	"xgq": "旋滚球",
	"syzq": "圣域之墙",
	"tmc": "土魔刺",
	"zznh": "战争怒吼",
	"qlj": "强力击",
	"dcj": "多重击",
	"wdzt": "万毒加护",
	"tkj": "腾空击",
	"mmw": "木魔舞",
	"jdz": "剧毒阵",
	"lhsq": "灵魂摄取",
	"zq": "瘴气",
	"wdww": "巫毒娃娃",
	"xyq": "心眼枪",
	"blq": "奔雷枪",
	"slq": "升龙枪",
	"cxq": "穿心枪",
	"fhf": "覆海翻",
	"ygth": "银钩铁画",
	"tllz": "天龙雷阵",
	"lljy": "雷龙极影",
	"llrd": "雷龙入地",
	
	
}
func _physics_process(delta: float) -> void:
	label.text = "设置技能 “" + str(NameList[need_name]) + "” 按键"
func _on_y_pressed() -> void:
	PlayerData.player_data["技能学习"]["技能键位"]["Y"] = str(need_name)
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()

func _on_u_pressed() -> void:
	PlayerData.player_data["技能学习"]["技能键位"]["U"] = str(need_name)
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()

func _on_i_pressed() -> void:
	PlayerData.player_data["技能学习"]["技能键位"]["I"] = str(need_name)
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()

func _on_o_pressed() -> void:
	PlayerData.player_data["技能学习"]["技能键位"]["O"] = str(need_name)
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()

func _on_l_pressed() -> void:
	PlayerData.player_data["技能学习"]["技能键位"]["L"] = str(need_name)
	MemoryClass.保存游戏(Global.cd_path)
	queue_free()

func _on_close_pressed() -> void:
	queue_free()
