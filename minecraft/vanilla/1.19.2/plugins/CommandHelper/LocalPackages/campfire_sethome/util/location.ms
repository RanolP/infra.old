proc _hash_location(@location) {
    @world = @location['world']
    @x = double(@location['x'])
    @y = double(@location['y'])
    @z = double(@location['z'])
    return replace("@{world}.@{x}_@{y}_@{z}", '-', 'm')
}

proc _make_block_location(@location) {
    @location = location_shift(@location, 'EAST', 0.5)
    @location = location_shift(@location, 'SOUTH', 0.5)
    return @location
}
