extends Label
var Font_: Font
var ShowText: String
var FontColor: Color
var OutLineSize: int
var OutLineColor: Color
var FontSize: int

func _physics_process(delta: float) -> void:
	self.add_theme_color_override("font_color",FontColor)
	self.add_theme_color_override("font_outline_color",OutLineColor)
	self.add_theme_constant_override("outline_size",OutLineSize)
	self.add_theme_font_override("font",Font_)
	self.add_theme_font_size_override("font_size",FontSize)
	self.text = ShowText
	set_physics_process(false)
