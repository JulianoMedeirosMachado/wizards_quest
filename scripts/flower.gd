extends CharacterBody2D

@export var level_var : Node2D
var entered = false

func _ready():
	level_var.herbs_counter += 1
	print(entered)
	pass	

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("accept"):
			found()

func found():
	level_var.herbs_counter -= 1
	queue_free()
	
func _on_area_2d_body_entered(body):
	entered = true
	pass # Replace with function body.
	
func _on_area_2d_body_exited(body):
	entered = false
	pass # Replace with function body.
	
