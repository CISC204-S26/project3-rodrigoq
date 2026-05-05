extends Node

var hatIndex = 0
var shirtIndex = 0
var pantsIndex = 0

var hats = [
	null,
	preload("res://Assets/Hats/Hat1.webp")
]
var shirts = [
	null,
	preload	("res://Assets/Shirts/Shirt1.webp")
]
var pants = [
	null,
	preload("res://Assets/Pants/Pants1.webp")
]

signal hat_changed
signal shirt_changed
signal pants_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
