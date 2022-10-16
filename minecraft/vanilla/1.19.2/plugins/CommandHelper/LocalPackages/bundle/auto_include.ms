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

bind(item_pickup, array(itemname: 'LEATHER'), null, @event) {
    @player = player()
    runas('~console', "recipe give @player bundle")
}
