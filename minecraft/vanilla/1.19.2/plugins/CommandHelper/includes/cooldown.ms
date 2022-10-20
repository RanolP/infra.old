proc _set_delayed(@player, @name){
	export("cooldown.@{player}.@{name}", 0)
}
proc _is_delayed(@player, @name){
	return(_get_cooldown(@player, @name) == -1)
}

proc _apply_cooldown(@player, @name, @cooldown){
	export("cooldown.@{player}.@{name}",
		time() + (@cooldown * 1000))
}
proc _get_cooldown(@player, @name){
	@cool = import("cooldown.@{player}.@{name}")
	if(@cool == 0) {
		return(-1)
	} else if(@cool == null) {
		return(0)
	} else {
		return((@cool - time()) / 1000)
	}
}

proc _is_cooldown(@player, @name){
	return(_get_cooldown(@player, @name) > 0)
}
