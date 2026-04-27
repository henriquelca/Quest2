extends CanvasLayer

@onready var lives_label = $VBoxContainer/LivesLabel

func _ready():
	if GameManager:
		lives_label.text = str(GameManager.lives)
		GameManager.lives_changed.connect(_on_lives_changed)

func _on_lives_changed(new_lives: int):
	lives_label.text = str(new_lives)
