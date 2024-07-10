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
		var attack_rand = randi_range(1,4)
		match attack_rand:
			1:
				enemy.attack1()
				print('1')
			2:
				enemy.attack2()
				print('2')
			3:
				enemy.attack3()
				print('3')
			4:
				enemy.attack4()
				print('4')
				
	if direction_global.length() > 20:
		Transitioned.emit(self, 'idle')	
	

		

