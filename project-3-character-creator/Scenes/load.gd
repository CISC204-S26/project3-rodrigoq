extends CanvasLayer

@onready var load_textbox = $LoadTextbox



func _on_load_button_pressed() -> void:
	var code = load_textbox.text
	GameState.load_outfit_code(code)
