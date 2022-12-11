extends Spatial

# Attacks are queued
#
# Between the selected enemy and player, one attack is performed at a time. "Turn based"

# An attack has a:
#    - start of attack...
#    - animation ( move player toward enemy, away from enemy, perform physical combat animation, etc)
#    - damage toward oponent
#    - end of attack.


export var attack_animation = 'test'
export var attack_name = 'Punch'

signal attack_finished

var enemy

func start_attack_move (owner, enemy):
    self.enemy = enemy
    # I need to know who is 'my owner' of this attack.
    # So I can ...
    #       - perform my animation for this attack move
    #       - move my pawn to location
    emit_signal('attack_finished')
