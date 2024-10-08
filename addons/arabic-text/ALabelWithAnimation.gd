tool
extends Label
class_name ALabelWithAnimation 

const arabic = preload("res://addons/arabic-text/arabic.gd")
const wordwrap = preload("res://addons/arabic-text/wordwrap/wordwrap.gd")

var prev_text = ""
# Use this for input rather than `text`
export(String, MULTILINE) var arabic_input = '' setget _set_arabic_input
export var running = true
export(float,0,1) var typing_speed = 0.1

signal arabic_input_changed

func _ready():
	display()
	connect("draw", self, "_on_ALabel_draw")
	connect("draw", self, "display")
	connect("item_rect_changed",self,"_on_ALabel_draw")
	connect("item_rect_changed",self,"display")

	
	
func _set_arabic_input(s):
	arabic_input = s
	_on_ALabel_draw()

func _set_arabic_animation(value : String):
	$Animation.text = value
	$Animation.chars = $Animation.text.length()
	$Animation.current_chars = $Animation.chars - 1
	arabic_input = " "

func _on_ALabel_draw():
	if arabic_input != prev_text:
		display()
		prev_text = arabic_input

func display():
	var temptext = wrap_text(arabic_input) if autowrap else arabic_input
	text = arabic.process_text(temptext)

func wrap_text(input):
	return wordwrap.wrap_text(input, get_font("font"), get_rect().size)

