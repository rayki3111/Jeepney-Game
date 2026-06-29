extends Node

@onready var main_menu: Control = $UILayer/MainMenu
@onready var game_menu: Control = $UILayer/GameMenu
@onready var view_manager: Node2D = $ViewManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.show()
	game_menu.hide()
	GameManager.game_started.connect(_on_game_started)
	view_manager.process_mode = PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_game_started() -> void:
	main_menu.queue_free() 
	game_menu.show()
	view_manager.process_mode = PROCESS_MODE_INHERIT


func _on_game_menu_change_view(current_view: String) -> void:
	view_manager.switch_view(current_view)
