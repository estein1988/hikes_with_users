Review.destroy_all
Hiker.destroy_all
Trail.destroy_all

trail1 = Trail.create(name: "Grand Canyon", location: "Arizona", difficulty: 9, length: 10, elevation: 5000, route: "Loop")
trail2 = Trail.create(name: "Old Faithful", location: "Wyoming", difficulty: 6, length: 5, elevation: 2000, route: "out-and-back")
trail3 = Trail.create(name: "Black Canyon", location: "Colorado", difficulty: 7, length: 2, elevation: 1000, route: "Loop")
trail4 = Trail.create(name: "Mt. Evans", location: "Colorado", difficulty: 9, length: 3, elevation: 5000, route: "Loop")
trail5 = Trail.create(name: "Longs Peak", location: "Colorado", difficulty: 6, length: 5, elevation: 2000, route: "out-and-back")
trail6 = Trail.create(name: "Mammoth Falls", location: "Wyoming", difficulty: 8, length: 5, elevation: 1000, route: "Loop")

hiker1 = Hiker.create(name: "Bob", age: 45, experience: "novice")
hiker2 = Hiker.create(name: "Sam", age: 15, experience: "expert")
hiker3 = Hiker.create(name: "Jim", age: 22, experience: "medium")
hiker4 = Hiker.create(name: "Don", age: 45, experience: "novice")
hiker5 = Hiker.create(name: "Alex", age: 15, experience: "expert")
hiker6 = Hiker.create(name: "Barbara", age: 22, experience: "medium")

Review.create(rating: 4, review: "Great hike!", hiker_id: hiker1.id, trail_id: trail1.id)
Review.create(rating: 5, review: "Amazing!", hiker_id: hiker2.id, trail_id: trail2.id)
Review.create(rating: 1, review: "Boring", hiker_id: hiker3.id, trail_id: trail3.id)
Review.create(rating: 3, review: "Nice views, okay", hiker_id: hiker4.id, trail_id: trail4.id)
Review.create(rating: 2, review: "Too flat", hiker_id: hiker5.id, trail_id: trail5.id)
Review.create(rating: 5, review: "Would love to do it again!", hiker_id: hiker6.id, trail_id: trail6.id)