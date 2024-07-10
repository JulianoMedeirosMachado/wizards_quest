extends Node2D

class_name level

@export var villager_counter = 0
@export var herbs_counter = 0
@export var artifact_counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_counter(value):
	herbs_counter += value
