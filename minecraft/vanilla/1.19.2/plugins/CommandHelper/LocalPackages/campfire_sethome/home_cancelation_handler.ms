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
    }
}
