#Story: {
	name: string
	description: string
	state: "Open" | "InProgress" | "InReview" | "Closed"
	points: int & >0
}

[...#Story]
