extends Node2D
@onready var total_hit_count: Label = $HBoxContainer/VBoxContainer/TotalHitCount
@onready var total_hit: Label = $HBoxContainer/VBoxContainer/TotalHit
@onready var totalphyhit: Label = $HBoxContainer/VBoxContainer/Totalphyhit
@onready var totalmaghit: Label = $HBoxContainer/VBoxContainer/Totalmaghit
@onready var total_real_hit: Label = $HBoxContainer/VBoxContainer/TotalRealHit
@onready var total_crit_count: Label = $HBoxContainer/VBoxContainer/TotalCritCount
@onready var total_hurt_count: Label = $HBoxContainer/VBoxContainer2/TotalHurtCount
@onready var total_hurt: Label = $HBoxContainer/VBoxContainer2/TotalHurt
@onready var total_phy_hurt: Label = $HBoxContainer/VBoxContainer2/TotalPhyHurt
@onready var total_mag_hurt: Label = $HBoxContainer/VBoxContainer2/TotalMagHurt
@onready var total_real_hurt: Label = $HBoxContainer/VBoxContainer2/TotalRealHurt
@onready var total_miss_count: Label = $HBoxContainer/VBoxContainer2/TotalMissCount
@onready var total_cure: Label = $HBoxContainer/VBoxContainer3/TotalCure



func _ready() -> void:
	total_cure.text = "累计治疗数值：" + str(Global.TotalCureHp)
	total_hurt.text = "累计受到伤害：" + str(Global.TotalRoleHurt)
	total_hit_count.text = "累计攻击次数：" + str(Global.TotalHitCount)
	total_hurt_count.text = "累计受伤次数：" + str(Global.TotalHurtCount)
	total_phy_hurt.text = "累计受到物伤：" + str(Global.TotalPhyHurt)
	total_mag_hurt.text = "累计受到魔伤：" + str(Global.TotalMagHurt)
	total_real_hurt.text = "累计受到真伤：" + str(Global.TotalRealHurt)
	total_hit.text = "累计造成伤害：" + str(Global.TotalRoleHit)
	totalphyhit.text = "累计造成物伤：" + str(Global.TotalPhyHit)
	totalmaghit.text = "累计造成魔伤：" + str(Global.TotalMagHit)
	total_real_hit.text = "累计造成真伤：" + str(Global.TotalRealHit)
	total_crit_count.text = "累计暴击次数：" + str(Global.TotalCritCount)
	total_miss_count.text = "累计闪避次数：" + str(Global.TotalMissCount)


func _on_glose_pressed() -> void:
	queue_free()
