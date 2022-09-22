function addCasts() {
	var cast = document.getElementById("create-cast");

	console.log(cast);

	if (!!cast) {
		AsciinemaPlayer.create('/casts/create.cast', cast);
	}
}

addCasts()
