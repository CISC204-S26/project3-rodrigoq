extends Button
@onready var color_picker = $"../ColorPicker"

func _pressed() -> void:
	GameState.set_skin_color(color_picker.color)
