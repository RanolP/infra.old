bind('player_interact', null, array(button: 'right', hand: 'main_hand', block: 'CAMPFIRE'), @event) {
    set_timeout(0, closure() {
        @location = @event['location']
        if (_is_campfire_valid(@location)) {
            return
        }
        _erase_campfire(@location)
    })
}

bind('block_break', null, array(block: 'CAMPFIRE'), @event) {
    _erase_campfire(@event['location'])
}

bind('block_explode', null, null, @event) {
    foreach (@location in @event['blocks']) {
        _erase_campfire(@location)
    }
}

bind('entity_explode', null, null, @event) {
    foreach (@location in @event['blocks']) {
        _erase_campfire(@location)
    }
}

bind('block_dispense', null, array(itemname: 'WATER_BUCKET'), @event) {
    @loc = @event['velocity']
    @loc['world'] = @event['location']['world']
    _erase_campfire(@loc)
}
