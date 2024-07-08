extends CharacterBody2D

class_name Player

@onready var sprite = $AnimatedSprite2D

signal healthChanged

@export var max_health = 100
@onready var currentHealth: int = max_health
var SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -190.0

# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth -=50 #Testing if the health bar is working by setting half of HP
	healthChanged.emit() #Emit signal to update health bar
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY * 3

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x == 0:
		sprite.animation = 'idle'
		
	if velocity.x > 0 && velocity.y == 0:
		sprite.flip_h = false
		sprite.animation = 'walk'
		
	if velocity.x < 0 && velocity.y == 0:
		sprite.flip_h = true
		sprite.animation = 'walk'
	
	if (velocity.y < 0 || velocity.y > 0):
		sprite.animation = 'jump'

	move_and_slide()
