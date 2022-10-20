bind('player_interact', null, array(button: 'right', hand: 'main_hand', block: 'CAMPFIRE'), @event) {
    if (!psneaking()) {
        return
    }

    @location = @event['location']
    @world = @location['world']
    @x = @location['x']
    @y = @location['y']
    @z = @location['z']
    
    if (!_is_campfire_valid(@location)) {
        return
    }
    
    if (@world != 'world') {
        action_msg(player(), colorize("&b오버월드&r에서만 모닥불을 &a&l집&r으로 삼을 수 있습니다."))
        return
    }
    
    @player = player()
    @key = "home.@player.location"
    
    if (has_value(@key)) {
        @old_home = get_value(@key)
        @hash = _hash_location(@old_home)
        @rev_lut_key = "home.reverse_lookup_table.@hash"
        @rev_lut = get_value(@rev_lut_key) ||| array()
        array_remove_values(@rev_lut, @player)
        store_value(@rev_lut_key, @rev_lut)
    }
    
    store_value(@key, @location)
    
    @hash = _hash_location(@location)
    @rev_lut_key = "home.reverse_lookup_table.@hash"
    @rev_lut = get_value(@rev_lut_key) ||| array()
    array_push(@rev_lut, player())
    store_value(@rev_lut_key, @rev_lut)

    action_msg(@player, colorize("오버월드 &e@x&r, &e@y&r, &e@z&r 위치 모닥불을 &a&l집&r으로 삼습니다."))
    play_sound(
        ploc(),
        array(
            sound: 'ITEM_FIRECHARGE_USE',
            pitch: 0.5
        ),
        @player
    )
    spawn_particle(
        _make_block_location(@location),
        array(
            particle: 'FLAME',
            count: 75,
            speed: 0.01,
            xoffset: 2.8,
            yoffset: 2.0,
            zoffset: 2.8
        ),
        @player
    )
    spawn_particle(
        _make_block_location(@location),
        array(
            particle: 'REDSTONE',
            count: 100,
            speed: 1,
            xoffset: 2.8,
            yoffset: 2.0,
            zoffset: 2.8
        ),
        @player
    )
}
