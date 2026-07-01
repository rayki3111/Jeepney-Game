extends Node

@onready var main_menu: Control = $UILayer/MainMenu
@onready var game_menu: Control = $UILayer/GameMenu
@onready var end_day_screen: Control = $UILayer/EndDayScreen
@onready var pause_menu: Control = $UILayer/PauseMenu
@onready var timer: Timer = $Timer

@onready var view_manager: Node2D = $ViewManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.show()
	game_menu.hide()
	end_day_screen.hide()
	pause_menu.hide()
	GameManager.game_started.connect(_on_game_started)
	GameManager.back_to_main_menu.connect(_on_main_menu)
	view_manager.process_mode = PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_game_started() -> void:
	main_menu.hide() 
	game_menu.show()
	view_manager.process_mode = PROCESS_MODE_INHERIT
	timer.wait_time = GameManager.time_remaining
	timer.start()

func _on_main_menu(pressed_from: Control) -> void:
	timer.paused = false
	timer.stop()
	view_manager.process_mode = PROCESS_MODE_DISABLED
	pressed_from.hide()
	game_menu.hide()
	main_menu.show()

func _on_game_menu_change_view(current_view: String) -> void:
	view_manager.switch_view(current_view)


func _on_timer_timeout() -> void:
	view_manager.process_mode = PROCESS_MODE_DISABLED
	game_menu.hide()
	end_day_screen.show()


func _on_end_day_screen_next_day() -> void:
	end_day_screen.hide()
	view_manager._ready()
	GameManager._next_day()
	GameManager.game_started.emit()


func _on_pause_button() -> void:
	view_manager.process_mode = Node.PROCESS_MODE_DISABLED
	timer.paused = true
	pause_menu.show()


func _on_unpause_pressed() -> void:
	view_manager.process_mode = Node.PROCESS_MODE_INHERIT
	pause_menu.hide()
	timer.paused = false
