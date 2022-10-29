bind('block_place', null, array(block: 'BREWING_STAND'), @event) {
    @location = @event['location']
    if (
        @event['oldblock'] != 'AIR' ||
        get_block(location_shift(@location, 'UP', 1)) != 'AIR' ||
        get_block(location_shift(@location, 'UP', 2)) != 'AIR'
    ) {
        cancel()
        msg(colorize(' &c[!] &r차원석은 3 블록 높이 구조물이며, 안전을 위해 공기 중에서 초기화해야 합니다.'))
        return
    }
    set_block(@location, 'INFESTED_CHISELED_STONE_BRICKS')
    set_block(location_shift(@location, 'UP', 1), 'STONE_BRICK_WALL')
    set_block(location_shift(@location, 'UP', 2), 'SMOOTH_STONE_SLAB')
    
    @waystone_list = array()
    if (has_value('waystone.list')) {
        @waystone_list = get_value('waystone.list')
    }
    array_push(@waystone_list, @location)
    store_value('waystone.list', @waystone_list)
}
