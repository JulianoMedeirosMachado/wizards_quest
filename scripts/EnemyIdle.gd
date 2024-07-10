extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed := 100.0
var player : CharacterBody2D
var move_direction : Vector2
var wander_timer : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(0,0)).normalized()
	wander_timer = randf_range(1, 3)
	
func Enter():
	player = get_tree().get_first_node_in_group('main_character')
	randomize_wander()
	
func Update(delta: float):
	if wander_timer > 0:
		wander_timer -= delta
		
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed
		
	var direction = player.global_position.x - enemy.global_position.x
	var direction_global = player.global_position - enemy.global_position
	
	if direction_global.length() < 120:
		Transitioned.emit(self, 'Follow')
	
