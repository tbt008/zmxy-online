extends Node2D
@onready var cl_1: Button = $cl_1
@onready var cl_2: Button = $cl_2
@onready var cl_3: Button = $cl_3
@onready var scw: Button = $scw

var ItemInfo = {
	"cl_1":"",
	"cl_2":"",
	"cl_3":"",
	"scw":"",
	
}

func _ready() -> void:
	cl_1.is_in_ldl_gz = true
	cl_1.is_in_hhgz = true
	cl_1.is_in_hhgz = true
	cl_1.qh_level = 0
	cl_1.wx = []
	cl_2.is_in_ldl_gz = true
	cl_2.is_in_hhgz = true
	cl_2.is_in_hhgz = true
	cl_2.qh_level = 0
	cl_2.wx = []
	cl_3.is_in_ldl_gz = true
	cl_3.is_in_hhgz = true
	cl_3.is_in_hhgz = true
	cl_3.qh_level = 0
	cl_3.wx = []
	scw.is_in_ldl_gz = true
	scw.is_in_hhgz = true
	scw.is_in_hhgz = true
	scw.qh_level = 0
	scw.wx = []

func _physics_process(delta: float) -> void:
	cl_1.set_button_icon(load_(ItemInfo["cl_1"]))
	cl_2.set_button_icon(load_(ItemInfo["cl_2"]))
	cl_3.set_button_icon(load_(ItemInfo["cl_3"]))
	scw.set_button_icon(load_(ItemInfo["scw"]))
	cl_1.EQ_prop = AE.AllEquipment_[ItemInfo["cl_1"]]
	cl_2.EQ_prop = AE.AllEquipment_[ItemInfo["cl_2"]]
	cl_3.EQ_prop = AE.AllEquipment_[ItemInfo["cl_3"]]
	scw.EQ_prop = AE.AllEquipment_[ItemInfo["scw"]]
	set_physics_process(false)
func load_(name_):
	var abc = load("res://Art/BackPack/AllItems/" + str(name_) + ".png")
	return abc
	
	
	
