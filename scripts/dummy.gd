extends CharacterBody2D

class_name dummy

@onready var sprite = $AnimatedSprite2D

signal healthChanged

@export var max_health = 100000
@onready var currentHealth: int = max_health

# Called when the node enters the scene tree for the first time.
func _ready():
	healthChanged.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass

func health_update(dmg):
	dmg -= currentHealth
	healthChanged.emit()
	print('health change')
