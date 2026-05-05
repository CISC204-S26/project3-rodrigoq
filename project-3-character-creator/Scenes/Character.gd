extends Node2D

@onready var hat_sprite = $Visuals/Clothes/Hats/Hat1
@onready var shirt_sprite = $Visuals/Clothes/Shirts/Shirt1
@onready var pants_sprite = $Visuals/Clothes/Pants/Pants1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	GameState.hat_changed.connect(update_hat)
	update_hat(GameState.hatIndex)
	
	GameState.shirt_changed.connect(update_shirt)
	update_shirt(GameState.shirtIndex)
	
	GameState.pants_changed.connect(update_pants)
	update_pants(GameState.pantsIndex)
	

func update_hat(index):
	var tex = GameState.hats[index]
	
	if tex == null:
		hat_sprite.visible = false
	else:
		hat_sprite.visible = true
		hat_sprite.texture = tex

func update_shirt(index):
	var tex = GameState.shirts[index]
	
	if tex == null:
		shirt_sprite.visible = false
	else:
		shirt_sprite.visible = true
		shirt_sprite.texture = tex

func update_pants(index):
	var tex = GameState.pants[index]
	
	if tex == null:
		pants_sprite.visible = false
	else:
		pants_sprite.visible = true
		pants_sprite.texture = tex
