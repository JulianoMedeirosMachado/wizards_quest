extends Node2D

class_name CastleLevel

@onready var sprite_portal = $Sprite_Portal/AnimatedSprite2D
@onready var portal = $Sprite_Portal/CollisionShape2D

@export var enemies = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	print (enemies)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemies == 0:
		get_tree().change_scene_to_file("res://scenarios/ending.tscn")
		pass
	pass
