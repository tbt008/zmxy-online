extends Node2D
@onready var bg: Sprite2D = $bg
@onready var bg_2: Sprite2D = $bg/bg2
@onready var main_backpack: Control = $Main_Backpack
@onready var lh: Label = $bg/bg2/lh
var Synthesis_: Synthesis
var Strength_: Strength
var Mosaic_: Mosaic
var Decompose_: Decompose
var Forge_: Forge
func _physics_process(_delta: float) -> void:
	lh.text = str(PlayerData.player_data["coin_num"])
func _ready() -> void:#进炼丹炉为true，强化界面为true，
	Global.is_in_ldl = true
	add_qh_jm()
func _on_hc_pressed() -> void:#添加上合成的添加，其他的清理
	#if PlayerData.player_data["鲨之涡流"] == 1:
		MLdl.loc_ = "合成"
		remove_xq_jm()
		remove_qh_jm()
		remove_fj_jm()
		remove_dz_jm()
		add_hc_jm()
	#else:
		#Global.AddMessageShow(Global.Windows_,"通关东海后开启合成功能！",1.5,Vector2(470,285))
func _on_qh_pressed() -> void:#添加上强化的添加，其他的清理

	MLdl.loc_ = "强化"
	remove_xq_jm()
	remove_hc_jm()
	remove_fj_jm()
	remove_dz_jm()
	add_qh_jm()

func _on_xq_pressed() -> void:
	if PlayerData.player_data["南天王殿"] == 1:
		MLdl.loc_ = "镶嵌"
		remove_qh_jm()
		remove_hc_jm()
		remove_fj_jm()
		remove_dz_jm()
		add_xq_jm()
	else:
		Global.AddMessageShow(Global.Windows_,"通关南天门后开启镶嵌功能！",1.5,Vector2(470,285))

func _on_return_pressed() -> void:#添加上每一个界面的清理
	MLdl.loc_ = "强化"
	remove_qh_jm()#清理强化数据
	remove_hc_jm()#清理合成数据
	remove_xq_jm()
	remove_fj_jm()
	remove_dz_jm()
	Global.is_in_ldl = false
	queue_free()
func add_qh_jm():
	MLdl.loc_ = "强化"
	if Strength_ == null:
		Strength_ = Global.add_strength(bg_2,Vector2(-315,-205))
		MemoryClass.保存游戏(Global.cd_path)
		Strength_.remove_infomation()
func remove_qh_jm():
	if Strength_ != null:
		Strength_.remove_infomation()
		MemoryClass.保存游戏(Global.cd_path)
		Strength_.queue_free()
func add_hc_jm():
	MLdl.loc_ = "合成"
	if Synthesis_ == null:
		Synthesis_ = Global.add_Synthesis(bg_2,Vector2(-315,-205))
func remove_hc_jm():
	if Synthesis_ != null:
		Synthesis_.remove_infomation()
		MemoryClass.保存游戏(Global.cd_path)
		Synthesis_.queue_free()

func add_xq_jm():
	MLdl.loc_ = "镶嵌"
	if Mosaic_ == null:
		Mosaic_ = Global.Add_Mosaic_(bg_2,Vector2(-315,-205))
func remove_xq_jm():
	if Mosaic_ != null:
		Mosaic_.remove_infomation()
		MemoryClass.保存游戏(Global.cd_path)
		Mosaic_.queue_free()



func _on_hh_pressed() -> void:
	Global.addHHjm(self,Vector2(0,0))

#==========分解============
func _on_fj_pressed() -> void:
	MLdl.loc_ = "分解"
	add_fj_jm()
func add_fj_jm():
	MLdl.loc_ = "分解"
	remove_qh_jm()
	remove_hc_jm()
	remove_xq_jm()
	remove_dz_jm()
	#add_fj_jm()
	if Decompose_ == null:
		Decompose_ = Global.Add_Decompose_(bg_2,Vector2(-305,-200))
func remove_fj_jm():
	if Decompose_ != null:
		Decompose_.remove_infomation()
		MemoryClass.保存游戏(Global.cd_path)
		Decompose_.queue_free()


func _on_dz_pressed() -> void:
	MLdl.loc_ = "打造"
	add_dz_jm()
	
func add_dz_jm():
	MLdl.loc_ = "打造"
	remove_qh_jm()
	remove_hc_jm()
	remove_xq_jm()
	remove_fj_jm()
	if Forge_ == null:
		Forge_ = Global.AddForges(bg_2,Vector2(-340,-200))
func remove_dz_jm():
	if Forge_ != null:
		Forge_.remove_infomation()
		MemoryClass.保存游戏(Global.cd_path)
		Forge_.queue_free()
