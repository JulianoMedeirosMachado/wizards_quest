extends CharacterBody2D

class_name Light_mage

@onready var sprite = $AnimatedSprite2D

var dmg = 0

signal healthChanged

@onready var attack1_col = $Area2D/attack_collision1
@onready var attack2_col = $Area2D/attack_collision2
@onready var arrow = $Area2D/arrow
@onready var sphere = $Area2D/sphere
@onready var compound_attack = $AnimatedSprite2D2
@onready var area_2d = $Area2D
@onready var collision_character = $CollisionShape2D
@onready var label_health = $TextureProgressBar
@export var max_health = 100
@onready var currentHealth: int = max_health
var dmg_taken = false
var death = false
var attack = false
var SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -190.0

# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth -=50 #Testing if the health bar is working by setting half of HP
	healthChanged.emit() #Emit signal to update health bar
	compound_attack.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.x == 0 and attack == false and dmg_taken == false and death == false:
		sprite.animation = 'idle'
		
	if velocity.x > 0 and velocity.y == 0 and attack == false and dmg_taken == false and death == false:
		compound_attack.position.x = 7
		area_2d.position.x = 0
		compound_attack.flip_h = false
		sprite.flip_h = false
		sprite.animation = 'walk'
		
	if velocity.x < 0 and velocity.y == 0 and attack == false and dmg_taken == false and death == false:
		compound_attack.position.x = -37
		area_2d.position.x = -66
		compound_attack.flip_h = true
		sprite.flip_h = true
		sprite.animation = 'walk'
	
	if (velocity.y < 0 || velocity.y > 0):
		sprite.animation = 'jump'

	

	move_and_slide()

func attack1():
	dmg = 10
	attack = true
	attack1_col.disabled = false
	sprite.animation = 'attack_1'
	await get_tree().create_timer(1.0).timeout
	attack = false
	attack1_col.disabled = true
	pass

func attack2():	
	dmg = 10
	attack = true
	attack2_col.disabled = false
	sprite.animation = 'attack_2'
	await get_tree().create_timer(1.0).timeout
	attack = false
	attack2_col.disabled = true
	pass

func attack3():
	dmg = 20
	attack = true
	arrow.disabled = false
	sprite.animation = 'magic_arrow'
	compound_attack.show()
	compound_attack.play("magic_arrow")
	await get_tree().create_timer(1).timeout
	compound_attack.hide()
	attack = false
	arrow.disabled = true
	pass
	
func attack4():
	dmg = 20
	attack = true
	arrow.disabled = false
	sprite.animation = 'magic_sphere'
	compound_attack.show()
	compound_attack.play("magic_sphere")
	await get_tree().create_timer(1).timeout
	compound_attack.hide()
	attack = false
	arrow.disabled = true
	pass

func _on_area_2d_body_entered(body):
	print('contact')
	body.health_update(dmg)
	pass # Replace with function body.
	
func health_update(dmg):
	dmg_taken = true
	sprite.play('dmg_taken')
	await get_tree().create_timer(1).timeout
	dmg_taken = false
	currentHealth -= dmg
	healthChanged.emit()
	print('health change')
	print(dmg)
	print(currentHealth)
	if currentHealth < 0:
		var castle_level = get_tree().get_first_node_in_group("CastleLevel")
		if castle_level and "CastleLevel" in castle_level.get_groups():
			castle_level.enemies -= 1
		death = true
		sprite.play('death')
		await get_tree().create_timer(1).timeout
		queue_free()
