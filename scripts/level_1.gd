extends Node2D

class_name level
@onready var portal = $Sprite_Portal/CollisionShape2D
@onready var potal_sprite = $Sprite_Portal/AnimatedSprite2D

@export var villager_counter = 0
@export var herbs_counter = 0
@export var artifact_counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if villager_counter == 0 and herbs_counter == 0 and artifact_counter == 0:
		portal.disabled = false
		potal_sprite.visible = true
	pass
	
func update_counter(value):
	herbs_counter += value
