extends CanvasLayer


@onready var score_label = $Label_Points
@onready var timer_label = $Label_Timer
@onready var game_timer = $Game_Timer

var total_score = 0
var time_left = 300

func _ready():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.points_scored.connect(_on_points_scored)

func _on_points_scored(points: int):
	total_score += points
	if score_label:
		score_label.text = str(total_score)

	update_timer_display()
	game_timer.timeout.connect(_on_game_timer_timeout)

func _on_game_timer_timeout():
	if time_left > 0:
		time_left -= 1
		update_timer_display()
	else:
		game_timer.stop()
		on_time_up()

func update_timer_display():
	if timer_label:
		timer_label.text = "Tempo: " + str(time_left)
		
func on_time_up():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.die()
