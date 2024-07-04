extends CharacterBody2D

class_name Player

signal healthChanged

@export var max_health = 100
@onready var currentHealth: int = max_health



# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth -=50 #Testing if the health bar is working by setting half of HP
	healthChanged.emit() #Emit signal to update health bar
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
