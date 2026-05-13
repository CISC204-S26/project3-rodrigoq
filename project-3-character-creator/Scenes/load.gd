extends CanvasLayer

@onready var load_textbox = $LoadTextbox
@onready var outfit_number = $OutfitNumber

func _ready():
	GameState.hat_changed.connect(update_outfit_text)
	GameState.shirt_changed.connect(update_outfit_text)
	GameState.pants_changed.connect(update_outfit_text)

func _on_load_button_pressed() -> void:
	var code = load_textbox.text
	GameState.load_outfit_code(code)

func update_outfit_text(_value = null):
	outfit_number.text = "Current Outfit: " + GameState.get_outfit_code()
