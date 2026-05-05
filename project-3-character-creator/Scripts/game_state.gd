extends Node

var hatIndex = 0
var shirtIndex = 0
var pantsIndex = 0

var hats = [
	null,
	preload("res://Assets/Hats/Hat1.webp"),
	preload("res://Assets/Hats/Hat2.webp")
]
var shirts = [
	null,
	preload	("res://Assets/Shirts/Shirt1.webp"),
	preload("res://Assets/Shirts/Shirt2.webp")
]
var pants = [
	null,
	preload("res://Assets/Pants/Pants1.webp"),
	preload("res://Assets/Pants/Pants2.webp")
]

signal hat_changed
signal shirt_changed
signal pants_changed

var head_color: Color = Color.WHITE
var skin_color: Color = Color.WHITE

signal head_color_changed(color)
signal skin_color_changed(color)

func set_head_color(color: Color):
	head_color = color
	print("New head color: ", color)
	head_color_changed.emit(color)

func set_skin_color(color: Color):
	skin_color = color
	print("New body color: ", color)
	skin_color_changed.emit(color)

func change_hat(direction):
	hatIndex = (hatIndex + direction) % hats.size()
	if hatIndex < 0:
		hatIndex = hats.size() - 1
	print("Current Hat: ", hatIndex)
	hat_changed.emit(hatIndex)

func change_shirt(direction):
	shirtIndex = (shirtIndex + direction) % shirts.size()
	if shirtIndex < 0:
		shirtIndex = shirts.size() - 1
	print("Current Shirt: ", shirtIndex)
	shirt_changed.emit(shirtIndex)

func change_pants(direction):
	pantsIndex = (pantsIndex + direction) % pants.size()
	if pantsIndex < 0:
		pantsIndex = pants.size() - 1
	print("Current Pants: ", pantsIndex)
	pants_changed.emit(pantsIndex)
