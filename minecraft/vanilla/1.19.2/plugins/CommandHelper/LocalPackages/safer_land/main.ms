bind('entity_explode', null, array(type: 'CREEPER'), @event) {
    cancel(@event)
    play_sound(@event['location'], array(
        sound: 'ENTITY_GENERIC_EXPLODE',
        pitch: 0.8
    ))
    launch_firework(@event['location'], array(
        strength: -1,
        type: 'BALL_LARGE',
        trail: false,
        colors: 'YELLOW',
        fade: array('WHITE')
    ))
}