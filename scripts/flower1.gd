extends CharacterBody2D

@export var level_var : Node2D
var entered = false

func _ready():
	level_var.herbs_counter += 1
	print(entered)
	pass	

func _process(delta):
	if entered == true:
		print('found 1')
		if Input.is_action_just_pressed("ui_accept"):
			found()

func found():
	level_var.herbs_counter -= 1
	queue_free()
	print('found')




func _on_area_2d_body_entered(body):
	entered = true
	pass # Replace with function body.

func _on_area_2d_body_exited(body):
	entered = false
	pass # Replace with function body.
