@waystone = array(
    name: 'BREWING_STAND',
    qty: 2,
    meta: array(
        display: colorize('&e차원석'),
        lore: array(
            colorize('&7차원 여행의 이정표가 되는 돌'),
            colorize('&7한번 상호작용한 이에게 길을'),
            colorize('&7알려준다'),
            '',
            colorize('&a&l[우클릭] &f차원석을 설치합니다')
        ),
        enchants: array(
            fortune: 1
        ),
        flags: array('HIDE_ENCHANTS')
    )
)
export('item.waystone', @waystone)
add_recipe(array(
    key: 'waystone',
    type: 'SHAPED',
    result: @waystone,
    shape: array(
        ' S ',
        'LEL',
        'CTC'
    ),
    ingredients: array(
        S: 'SHULKER_SHELL',
        L: 'SOUL_LANTERN',
        E: 'ENDER_EYE',
        C: 'WAXED_OXIDIZED_COPPER',
        T: 'ENCHANTMENT_TABLE',
    )
))
bind('item_pickup', null, array(itemname: 'SHULKER_SHELL'), @event) {
    @player = player()
    runas('~console', "/recipe give @player commandhelper:waystone")
}