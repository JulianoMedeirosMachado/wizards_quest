extends State

class_name EnemyFollow

@export var enemy : CharacterBody2D
@export var move_speed := 180.0
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group('main_character')
	
func Physics_Update(delta: float):
	var direction = player.global_position.x - enemy.global_position.x
	var direction_global = player.global_position - enemy.global_position


	if direction_global.length() < 200:
		enemy.velocity.x = sign(direction) * move_speed
	else:
		enemy.velocity.x = 0
		
	if direction_global.length() > 200:
		Transitioned.emit(self, 'idle')
		
	if direction_global.length() < 40:
		Transitioned.emit(self, 'Attack')
		
