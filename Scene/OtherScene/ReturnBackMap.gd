extends Node2D
@onready var stage_info: Label = $Hdgqbg/StageInfo
var LastTime: int
var TargetMap: String
var IniText = "搜遍了整个天庭，都找不到玉帝。唯一的可能就是玉帝被人挟持，通过混沌之门传送到另一个世界里了。而要进入那个世界必须拥有通天令牌和足够强的实力。斩妖除魔，找到罪魁祸首，加油挑战自我吧！"
var TextList = {
	"nmg":"通过混沌之门穿越回造一时代的牛魔谷，夺取牛魔王的怒吼，与此同时被黑白无常救下的牛魔王也穿越回造一时代，以第四形态出现！掉落物：牛魔王1,2,3：一定数量牛魔王的怒吼残片,牛魔王4：牛魔王的怒吼制作书，牛魔王精华（法宝暂未制作，可以先收集材料！）",
	"zld":"通过混沌之门穿越回造二时代的转轮殿，夺取转轮王的哀嚎，与此同时六道轮回后的转轮王也穿越回造二时代，以第四形态出现！掉落物：转轮王1：转轮王的哀嚎碎片1，2，转轮王2：转轮王的哀嚎碎片1，2，转轮王3：转轮王的哀嚎制作书，转轮王的哀嚎碎片3！（法宝暂未制作，可以先收集材料！）",
	"sssl":"通过混沌之门穿越回饕餮吞噬五毒灵魄时候的青龙之森。击败饕餮，夺回五毒灵魄！（暂未制作）"
}
func _ready() -> void:
	stage_info.text = IniText


func _on_return_nmg_pressed() -> void:
	TargetMap = "nmg"
	stage_info.text = TextList[TargetMap]

func _on_return_zld_pressed() -> void:
	TargetMap = "zld"
	stage_info.text = TextList[TargetMap]


func _on_return_sssl_pressed() -> void:
	TargetMap = "sssl"
	stage_info.text = TextList[TargetMap]


func _on_close_pressed() -> void:
	queue_free()


func _on_challenge_pressed() -> void:
	if TargetMap == null or TargetMap == "":
		Global.AddMessageShow(Global.Windows_,"请先选择穿越地点！！",1.5,Vector2(500,305))
		return
	match TargetMap:
		"nmg":
			Global.change_secen("res://Scene/Level/Level_hdgqnmg.tscn")
		"zld":
			Global.change_secen("res://Scene/Level/Level_hdgqzld.tscn")
		"sssl":Global.AddMessageShow(Global.Windows_,"青龙之森暂未开放！！",1.5,Vector2(500,305))
