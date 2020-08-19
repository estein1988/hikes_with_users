trail1 = Trail.create(name: "Full Grand Canyon hike", location: "Arizona", difficulty: 9, length: 10, elevation: 5000, route: "Loop")
trail2 = Trail.create(name: "Old Faithful", location: "Wyoming", difficulty: 6, length: 5, elevation: 2000, route: "out-and-back")
trail3 = Trail.create(name: "Black Canyon", location: "Colorado", difficulty: 2, length: 4, elevation: 1000, route: "Loop")

hiker1 = Hiker.create(name: "Bob", age: 45, experience: "novice")
hiker2 = Hiker.create(name: "Sam", age: 15, experience: "expert")
hiker3 = Hiker.create(name: "Jim", age: 22, experience: "medium")

Review.create(rating: 4, review: "Great hike!", hiker_id: hiker1.id, trail_id: trail1.id)
Review.create(rating: 5, review: "Amazing!", hiker_id: hiker2.id, trail_id: trail2.id)
Review.create(rating: 1, review: "Boring", hiker_id: hiker3.id, trail_id: trail3.id)