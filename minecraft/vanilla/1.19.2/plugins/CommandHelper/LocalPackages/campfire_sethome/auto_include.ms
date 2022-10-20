include('util/location.ms')
include('util/item.ms')

proc _erase_campfire(@location) {
    @hash = _hash_location(@location)
    @rev_lut_key = "home.reverse_lookup_table.@hash"
    @rev_lut = get_value(@rev_lut_key) ||| array()
    if (array_size(@rev_lut) > 0) {
        @x = @location['x']
        @y = @location['y']
        @z = @location['z']
        broadcast(colorize("오버월드 &e@x&r, &e@y&r, &e@z&r 위치 모닥불이 망가져 영혼들이 &c길&r을 잃습니다."))
        broadcast(colorize("다음 플레이어들이 집을 찾지 못하게 됩니다: " .  array_implode(@rev_lut)))
        play_sound(
            @location,
            array(
                sound: 'ENTITY_GENERIC_EXTINGUISH_FIRE',
                pitch: 0.5
            )
        )
        spawn_particle(
            _make_block_location(location_shift(@location, 'UP', 1)),
            array(
                particle: 'SOUL',
                count: 250,
                speed: 0.01,
                xoffset: 4.0,
                yoffset: 4.0,
                zoffset: 4.0
            )
        )
    }
    foreach (@player in @rev_lut) {
        @key = "home.@player.location"
        clear_value(@key)
    }
    clear_value(@rev_lut_key)
}

proc _is_campfire_valid(@location) {
    @block = get_block(@location)
    @lit = get_blockdata(@location)['lit']
    return @block == 'CAMPFIRE' && @lit
}

proc _home(@delay, @callback) {
    @player = player()
    if (@player == '~console') {
        msg(colorize('Console never have home.'))
        return
    }
    
    @key = "home.@player.location"
    if (!has_value(@key)) {
        msg(colorize('지금은 &a&l집&r이 설정되어 있지 않습니다.'))
        msg(colorize('오버월드에서 &b모닥불&r에 시프트 우클릭하여 설정할 수 있습니다.'))
        msg(colorize('&b모닥불&r의 불이 꺼지거나, 파괴되거나, 폭발하는 등 블록이 손상된 경우'))
        msg(colorize('&a&l집&r 설정은 자동 &c해제&r되니 주의하십시오.'))
        return
    }
    
    @location = get_value(@key)
    
    if (!_is_campfire_valid(@location)) {
        msg(colorize('알 수 없는 이유로 &a&l집&r 모닥불이 손상되었습니다.'))
        return
    }

    export("home.@player.initial_pos", ploc())
    @ref = array(delay: @delay)
    @id = set_interval(1000, 0, closure() {
        if (@delay > 0 && @ref['delay'] > 0) {
            @ref['delay'] -= 1
            @current_delay = @ref['delay'] + 1
            action_msg(player(), colorize("&6@current_delay&r 초 후 모닥불 위로 순간이동합니다."))
            return
        }
        action_msg(player(), colorize("&a&l집&r 모닥불 위로 순간이동했습니다!"))
        clear_task(@ref['id'])
    
        set_peffect(@player, 'FIRE_RESISTANCE', 0, 10, true, false)
        
        @location = _make_block_location(@location)
        @location['pitch'] = 90
        set_ploc(@location)
        execute(true, @callback)
        export("home.@player.initial_pos", null)
    })
    export("home.@player.id", @id)
    export("home.@player.callback", @callback)
    @ref['id'] = @id
}
