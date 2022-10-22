bind('player_move', null, null, @event) {
    @player = player()
    @initial_pos = import("home.@player.initial_pos")
    if (@initial_pos == null) {
        return
    }
    
    if (distance(@initial_pos, ploc()) > 0.3) {
        msg(colorize("움직여서 순간이동이 &c취소&r됩니다."))
        clear_task(import("home.@player.id"))
        execute(false, import("home.@player.callback"))
        export("home.@player.initial_pos", null)
        play_sound(
            @event['to'],
            array(
                sound: 'ITEM_SHIELD_BREAK',
                volume: 2.0,
                pitch: 0.5
            ),
            player()
        )
        spawn_particle(
            location_shift(@event['to'], 'UP', 1),
            array(
                particle: 'LANDING_OBSIDIAN_TEAR',
                count: 400,
                speed: 1,
                xoffset: 2.0,
                yoffset: 2.0,
                zoffset: 2.0
            )
        )
    }
}
