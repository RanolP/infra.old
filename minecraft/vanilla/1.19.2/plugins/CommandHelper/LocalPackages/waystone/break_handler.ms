bind('block_break', null, null, @event) {
    @waystone_list = array()
    if (has_value('waystone.list')) {
        @waystone_list = get_value('waystone.list')
    }
    foreach(@waystone in @waystone_list) {
        if (
            !_location_eq(@event['location'], @waystone) &&
            !_location_eq(@event['location'], location_shift(@waystone, 'UP', 1)) &&
            !_location_eq(@event['location'], location_shift(@waystone, 'UP', 2))
        ) {
            continue
        }
        
        set_block(@waystone, 'AIR')
        set_block(location_shift(@waystone, 'UP', 1), 'AIR')
        set_block(location_shift(@waystone, 'UP', 2), 'AIR')

        array_remove_values(@waystone_list, @waystone)
        store_value('waystone.list', @waystone_list)

        break
    }
}