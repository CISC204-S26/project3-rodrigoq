extends Node

var hatIndex = 0
var shirtIndex = 0
var pantsIndex = 0

var hats = [
	null,
	preload("res://Assets/Hats/Hat1.webp"),
	preload("res://Assets/Hats/Hat2.webp"),
	preload("res://Assets/Hats/Hat3.webp")
]
var shirts = [
	null,
	preload	("res://Assets/Shirts/Shirt1.webp"),
	preload("res://Assets/Shirts/Shirt2.webp"),
	preload("res://Assets/Shirts/Shirt3.webp")
]
var pants = [
	null,
	preload("res://Assets/Pants/Pants1.webp"),
	preload("res://Assets/Pants/Pants2.webp"),
	preload("res://Assets/Pants/Pants3.png")
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

func load_outfit_code(code: String):
	#Checks if code is exactly 3 characters long
	if code.length() != 3:
		print("Invalid code length")
		return
	
	#Checks if all characters are numbers
	if !code.is_valid_int():
		print("Code must contain only numbers")
		return
	
	#Convert each digit into an int
	var hat = int(code[0])
	var shirt = int(code[1])
	var pant = int(code[2])
	
	#Checks if numbers are within a valid range
	if hat >= hats.size():
		print("Invalid hat index")
		return
	
	if shirt >= shirts.size():
		print("Invalid shirt index")
		return
	
	if pant >= pants.size():
		print("Invalid pants index")
		return
	
	#Change/apply outfit
	hatIndex = hat
	shirtIndex = shirt
	pantsIndex = pant
	
	#Update Visuals
	hat_changed.emit(hatIndex)
	shirt_changed.emit(shirtIndex)
	pants_changed.emit(pantsIndex)
	
	print("Loaded outfit code: ", code)

func get_outfit_code() -> String:
	return str(hatIndex) + str(shirtIndex) + str(pantsIndex)
