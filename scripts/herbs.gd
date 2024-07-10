extends Label

@onready var level = get_tree().get_first_node_in_group("herbs")

func _ready():
	if level and "level_1" in level.get_groups():
		self.show()
	else:
		self.hide()

func _process(delta):
	if level and "level_1" in level.get_groups():
		self.text = "Herbs Left: " + str(level.herbs_counter) + " \nVillagers Left: " + str(level.villager_counter)
		if level.herbs_counter == 0 and level.villager_counter == 0:
			self.text = "You made it!!"
	else:
		self.hide()
