add_recipe(array(
    key: 'bundle',
    type: 'SHAPED',
    result: array(
        name: 'BUNDLE'
    ),
    shape: array(
        'SLS',
        'L L',
        'LLL'
    ),
    ingredients: array(
        L: 'LEATHER',
        S: 'STRING'
    )
))

bind('item_pickup', null, array(itemname: 'LEATHER'), @event) {
    @player = player()
    runas('~console', "/recipe give @player commandhelper:bundle")
}
