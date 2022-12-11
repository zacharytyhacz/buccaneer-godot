extends Node

var player

var combat_queue = []
export var max_queue_moves = 10

var time = 0
const TIME_BETWEEN_MOVES = 3 # seconds
var wait_for_next_attack = false

# wait for TIME_BETWEEN_MOVES....
#   start next attack
#   wait for attack to be over...
#   back to start.

func _ready():
    player = get_parent()

func _process(delta):
    if (wait_for_next_attack):
        if (combat_queue.size() === 0):
            wait_for_next_attack = false
        else:
            time += delta
            if time > TIME_BETWEEN_MOVES:
                # execute attack in combat_queue[0]
                wait_for_next_attack = false
                time = 0;


func append_new_move(combat_move):
    if (combat_queue.size() > max_queue_moves):
        return

    if (combat_queue.size() === 0):
        wait_for_next_attack = true

    combat_queue.append(combat_move)

func get_current_queue():
    return combat_queue
