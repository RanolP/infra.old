proc _eq_item(@item_a, @item_b) {
    if ((@item_a == null) && (@item_b == null)) {
        return true
    }
    if ((@item_a == null) || (@item_b == null)) {
        return false
    }
    if (@item_a['name'] != @item_b['name']) {
        return false
    }
    if ((@item_a['meta'] == null) && (@item_b['meta'] == null)) {
        return true
    }
    if ((@item_a['meta'] == null) || (@item_b['meta'] == null)) {
        return false
    }
    if (@item_a['meta']['display'] != @item_b['meta']['display']) {
        return false
    }
    if (@item_a['meta']['lore'] != @item_b['meta']['lore']) {
        return false
    }
    return true
}
