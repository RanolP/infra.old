proc _location_eq(@a, @b) {
    return (
        @a['x'] == @b['x'] &&
        @a['y'] == @b['y'] &&
        @a['z'] == @b['z'] &&
        @a['world'] == @b['world']
    )
}
