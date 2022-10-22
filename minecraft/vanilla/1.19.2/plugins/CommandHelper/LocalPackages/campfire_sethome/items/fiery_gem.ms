@fiery_gem = array(
    name: 'POPPED_CHORUS_FRUIT',
    qty: 1,
    meta: array(
        display: colorize('&e불꽃이 깃든 보석'),
        lore: array(
            colorize('&7불꽃으로 마법의 힘을 깨운 자수정'),
            colorize('&7강인한 열기는 당신이 깨우기를 기다린다'),
            colorize('&7모닥불로 몇번이고 당신을 데러가 줄 것이다'),
            '',
            colorize('&a&l[우클릭] &6600&f초 쿨타임, 3초간 가만히 있으면 집으로 귀환합니다')
        ),
        enchants: array(
            fortune: 1
        ),
        flags: array('HIDE_ENCHANTS')
    )
)
export('item.fiery_gem', @fiery_gem)
add_recipe(array(
    key: 'fiery_gem',
    type: 'SHAPED',
    result: @fiery_gem,
    shape: array(
        'BCN',
        'PAP',
        'NCB'
    ),
    ingredients: array(
        A: 'AMETHYST_SHARD',
        B: 'BRICK',
        C: 'COPPER_BLOCK',
        N: 'NETHER_BRICK',
        P: 'BLAZE_POWDER',
    )
))
bind('item_pickup', null, array(itemname: 'AMETHYST_SHARD'), @event) {
    @player = player()
    runas('~console', "/recipe give @player commandhelper:fiery_gem")
}

bind('player_interact', null, array(button: 'right'), @event) {
    @player = player()
    if (_is_delayed(@player, 'fiery_gem')) {
        return
    }
    _set_delayed(@player, 'fiery_gem')
    @item = @event['item']
    if (@item == null) {
        _unset_delayed(@player, 'fiery_gem')
        return
    }
    @meta = @item['meta']
    if (@meta == null) {
        _unset_delayed(@player, 'fiery_gem')
        return
    }
    if (_eq_item(@item, import('item.fiery_gem'))) {
        if (_is_cooldown(@player, 'fiery_gem')) {
            @cooldown = _get_cooldown(@player, 'fiery_gem')
            @cooldown = string(@cooldown)
            @dot = string_position(@cooldown, '.')
            if (@dot != -1) {
                @cooldown = substr(@cooldown, 0, @dot + 2)
            } else {
                @cooldown = @cooldown . '.0'
            }
            action_msg(colorize("&6@cooldown&f 초 후에 다시 사용할 수 있습니다."))
            _unset_delayed(@player, 'fiery_gem')
            return
        }
        _home(3, closure(@ok) {
            if (@ok) {
                _apply_cooldown(@player, 'fiery_gem', 600)
            }
            _unset_delayed(@player, 'fiery_gem')
        })
    } else {
        _unset_delayed(@player, 'fiery_gem')
    }
}
