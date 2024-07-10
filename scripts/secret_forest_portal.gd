extends Area2D

@export var level = Node2D
@onready var sprite = $AnimatedSprite2D
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("accept"):
			get_tree().change_scene_to_file("res://scenarios/tower_level.tscn")
	if (entered == false || entered == true):
		sprite.animation = 'portal'
	pass





func _on_body_exited(body):
	entered = false
	pass # Replace with function body.
