extends Marker2D

const PLAYER = preload("uid://dfa7acfcvc3yy")

func _ready() -> void:      # Do zmiany, spawnuje to playera (4 takie markery na mapie) - Felipe
	PLAYER.instantiate()    # Ale nie ma rozróżniena kto jest którym graczem (?) - Felipe
