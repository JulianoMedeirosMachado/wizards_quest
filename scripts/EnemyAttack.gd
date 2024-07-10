extends State

class_name EnemyAttack

@export var enemy : CharacterBody2D
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group('main_character')
	
func Physics_Update(delta: float):
	var direction_global = player.global_position - enemy.global_position


	while direction_global.length() > 10 and enemy.attack == false and enemy.dmg_taken == false and enemy.death == false:
		enemy.velocity.x = 0
		enemy.attack1()
		
	if direction_global.length() > 20:
		Transitioned.emit(self, 'idle')	
	

		

