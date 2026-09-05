extends Node2D
@onready var loading_bar: TextureProgressBar = $loading_bar
@onready var loading_text: Label = $loading_bar/loading_text
@onready var MessageTips: Label = $bg/Tips
var tips_textlist = [
	"每个小怪都有概率掉落强化石哦~~",
	"打不过关卡时，可以试试去强化装备！",
	"批量出售装备时不会自动整理背包！",
	"更换装备并不会改变角色外观哦！！",
	"部分怪物的攻击附带负面效果，要小心应对！！",
	"不知道合成公式时，可以去合成界面的合成帮助看看~",
	"与蛟魔王朝向相同时攻击他，不会造成伤害并且还会给他会恢复一定量的生命值。",
	"法宝五行最多同时存在三个。",
	"火五行会增加法宝升级时的生命值。",
	"水五行会增加法宝升级时的法力值。",
	"木五行会增强法宝能力。",
	"土五行会增加法宝升级时的双抗。",
	"金五行会增加法宝升级时的攻击力。",
	"某些关卡存在隐藏副本哦~",
	"合成的法宝属性与其合成的部件属性有关。"
]
func _ready() -> void:
	ResourceLoader.load_threaded_request(Global.target_scene)
	MessageTips.text = "Tips：" + str(tips_textlist[randi_range(0,tips_textlist.size() - 1)])
	
func _process(_delta: float) -> void:
	var progress = []
	ResourceLoader.load_threaded_get_status(Global.target_scene,progress)
	loading_bar.value = progress[0]
	loading_text.text = str(snapped(progress[0],0.01) * 100) + "%"
	if progress[0] == 1:
		var _packed_sscene = ResourceLoader.load_threaded_get(Global.target_scene)
		get_tree().change_scene_to_file(Global.target_scene)


func _on_tips_change_timeout() -> void:
	randomize()
	var Tips_count = randi_range(0,tips_textlist.size() - 1)
	MessageTips.text = "Tips：" + str(tips_textlist[Tips_count])
