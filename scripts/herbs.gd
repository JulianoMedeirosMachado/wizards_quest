extends Label

@onready var level = get_tree().get_first_node_in_group("herbs")

func _ready(): 
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str("Herbs Left: ") + str(level.herbs_counter)
	
