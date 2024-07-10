extends Label

@onready var level = get_tree().get_first_node_in_group("herbs")
@onready var castle_level = get_tree().get_first_node_in_group("CastleLevel")
@onready var village_level = get_tree().get_first_node_in_group("village")

func _ready():
	print("Label _ready() called")
	if level and "level_1" in level.get_groups():
		print("Level 1 detected")
		self.show()
	elif castle_level and "CastleLevel" in castle_level.get_groups():
		print("Castle level detected")
		self.show()
	elif village_level and "village" in village_level.get_groups():
		print("Village level detected")
		self.show()
	else:
		print("No level detected")
		self.hide()

func _process(delta):
	if level and "level_1" in level.get_groups():
		self.text = "Herbs Left: " + str(level.herbs_counter) + "\nVillagers Left: " + str(level.villager_counter) + "\nArtifacts to rescue: " + str(level.artifact_counter)
		if level.herbs_counter == 0 and level.villager_counter == 0 and level.artifact_counter == 0:
			self.text = "You made it!!"
	elif castle_level and "CastleLevel" in castle_level.get_groups():
		self.text = "Enemies Left: " + str(castle_level.enemies)
		if castle_level.enemies == 0:
			self.text = "Castle cleared!!"
	elif village_level and "village" in village_level.get_groups():
		self.text = "Enemies Left: " + str(village_level.enemies)
		if village_level.enemies == 0:
			self.text = "Village cleared!!"
	else:
		self.hide()
