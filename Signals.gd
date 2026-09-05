extends Node
signal _on_Choose_pressed

func ConnectChooseBoxSignal(Obj: Object,funcName: String):
	for i in _on_Choose_pressed.get_connections():
		var RemoveCallable = i["callable"]
		disconnect("_on_Choose_pressed",RemoveCallable)
	connect("_on_Choose_pressed",Callable(Obj,funcName))
