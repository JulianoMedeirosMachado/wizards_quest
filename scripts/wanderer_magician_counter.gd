extends Node2D

@export var level: Node2D
@export var enemie: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	level.enemies += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
