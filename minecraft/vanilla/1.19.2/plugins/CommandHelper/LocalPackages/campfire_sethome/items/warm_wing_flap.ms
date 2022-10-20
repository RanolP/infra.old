@warm_wing_flap = array(
    name: 'FEATHER',
    qty: 2,
    meta: array(
        display: colorize('&b따스한 날갯짓'),
        lore: array(
            colorize('&7숯검댕에 그을은 깃털'),
            colorize('&7은은하게 남은 열기가 모닥불과 이어져 있다'),
            colorize('&7한번 사용하면 바스라질 것 같다'),
            '',
            colorize('&a&l[우클릭] &f아이템을 소모해 집으로 귀환합니다')
        ),
        enchants: array(
            fortune: 1
        ),
        flags: array('HIDE_ENCHANTS')
    )
)
export('item.warm_wing_flap', @warm_wing_flap)
add_recipe(array(
    key: 'warm_wing_flap',
    type: 'SHAPED',
    result: @warm_wing_flap,
    shape: array(
        'CSC',
        'FCF',
        'CSC'
    ),
    ingredients: array(
        C: 'CHARCOAL',
        S: 'STRING',
        F: 'FEATHER',
    )
))
bind('item_pickup', null, array(itemname: 'FEATHER'), @event) {
    @player = player()
    runas('~console', "/recipe give @player commandhelper:warm_wing_flap")
}

bind('player_interact', null, array(button: 'right'), @event) {
    @player = player()
    if (_is_cooldown(@player, 'warm_wing_flap')) {
        return
    }
    _apply_cooldown(@player, 'warm_wing_flap', 1)
    @item = @event['item']
    if (@item == null) {
        return
    }
    @meta = @item['meta']
    if (@meta == null) {
        return
    }
    if (_eq_item(@item, import('item.warm_wing_flap'))) {
        _home(0, closure(@ok) {
            if (@ok) {
                @item['qty'] = 1
                ptake_item(@item)
            }
        })
    }
}
