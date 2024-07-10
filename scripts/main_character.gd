extends CharacterBody2D

class_name Player

@onready var sprite = $AnimatedSprite2D

signal healthChanged

@onready var attack1_col = $Area2D/sword_collision1
@onready var attack2_col = $Area2D/sword_collision2
@onready var flame_jet = $Area2D/flame_jet
@onready var fireball = $Area2D/fireball
@onready var fireball_sprite = $AnimatedSprite2D2
@onready var area_2d = $Area2D
@onready var collision_character = $CollisionShape2D
@onready var label_health = $TextureProgressBar
@export var max_health = 100
@onready var currentHealth: int = max_health
var attack = false
var SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -190.0

# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth -=50 #Testing if the health bar is working by setting half of HP
	healthChanged.emit() #Emit signal to update health bar
	fireball_sprite.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("attack1") and is_on_floor():
		attack = true
		attack1_col.disabled = false
		sprite.animation = 'attack_1'
		await get_tree().create_timer(1.0).timeout
		attack = false
		attack1_col.disabled = true
		pass
	
	if Input.is_action_just_pressed("attack2") and is_on_floor():
		attack = true
		attack2_col.disabled = false
		sprite.animation = 'attack_2'
		await get_tree().create_timer(1.0).timeout
		attack = false
		attack2_col.disabled = true
		pass
		
	if Input.is_action_just_pressed("flame_jet") and is_on_floor():
		attack = true
		flame_jet.disabled = false
		sprite.animation = 'flame_jet'
		await get_tree().create_timer(3.0).timeout
		attack = false
		flame_jet.disabled = true
		pass
		
	if Input.is_action_just_pressed("fireball") and is_on_floor():
		attack = true
		fireball.disabled = false
		sprite.animation = 'fireball'
		await get_tree().create_timer(1.5).timeout
		sprite.animation = 'idle'
		fireball_sprite.show()
		fireball_sprite.play("fireball")
		await get_tree().create_timer(2).timeout
		fireball_sprite.hide()
		attack = false
		fireball.disabled = true
		pass
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY * 3

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x == 0 and attack == false:
		sprite.animation = 'idle'
		
	if velocity.x > 0 and velocity.y == 0 and attack == false:
		label_health.position.x = -42
		collision_character.position.x = -15
		area_2d.scale.x = 1
		fireball_sprite.flip_h = false
		sprite.flip_h = false
		sprite.animation = 'walk'
		
	if velocity.x < 0 and velocity.y == 0 and attack == false:
		label_health.position.x = -25
		collision_character.position.x = 7
		collision_character.scale.x = -1
		area_2d.scale.x = -1
		fireball_sprite.flip_h = true
		sprite.flip_h = true
		sprite.animation = 'walk'
	
	if (velocity.y < 0 || velocity.y > 0):
		sprite.animation = 'jump'

	move_and_slide()
