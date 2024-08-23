tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ALabel", "Label", preload("res://addons/arabic-text/ALabel.gd"), load("res://addons/arabic-text/arabic_icon.png"))
	add_custom_type("AnimatedALabel", "Label", preload("res://addons/arabic-text/ALabelWithAnimation.gd"), load("res://addons/arabic-text/arabic_icon.png"))

func _exit_tree():
	remove_custom_type("ALabel")
	remove_custom_type("AnimatedLabelALabel")
