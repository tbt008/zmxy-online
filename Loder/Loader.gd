extends Node

func _ready() -> void:
	var dir = DirAccess.open("res://")
	
	if dir:
		var files = dir.get_files()
		for file in files:
			if file.get_extension() == "pck":
				ProjectSettings.load_resource_pack(file)
	get_tree().change_scene_to_file("res://Scene/Main_menu/Main_Menu.tscn")
