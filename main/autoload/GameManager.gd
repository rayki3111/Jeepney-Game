extends Node

signal game_started
signal game_over(score: int)

var current_view: String = "driver"
var money: int = 50
var day: int = 1
var stress_level: float = 1
var passenger_satisfaction: float = 0.5
var day_count: int = 1
var passenger_count: int = 0
var money_goal: int = 100
var is_game_paused: bool = false

func _initialize_game() -> void:
	money = 0
	day = 1
	stress_level = 1
	passenger_satisfaction = 0.5
	day_count = 0
	passenger_count = 0
	money_goal = 100

func _ready() -> void:
	# Keep singleton active even when scene tree pauses
	process_mode = Node.PROCESS_MODE_ALWAYS
	_initialize_game()

func update_money(amount: int) -> void:
	money += amount
