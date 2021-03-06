Review.destroy_all
Hiker.destroy_all
Trail.destroy_all

trail1 = Trail.create(name: "Grand Canyon - South Rim", location: "Arizona", difficulty: 9, length: 10, elevation: 5000, route: "Loop")
trail2 = Trail.create(name: "ABQ Walk in the Park", location: "New Mexico", difficulty: 6, length: 5, elevation: 2000, route: "Out-and-back")
trail3 = Trail.create(name: "Black Canyon", location: "Colorado", difficulty: 7, length: 2, elevation: 1000, route: "Loop")
trail4 = Trail.create(name: "Mt. Evans", location: "Colorado", difficulty: 9, length: 3, elevation: 5000, route: "Loop")
trail5 = Trail.create(name: "Longs Peak", location: "Colorado", difficulty: 4, length: 5, elevation: 2000, route: "Out-and-back")
trail6 = Trail.create(name: "Moab Loop", location: "Utah", difficulty: 5, length: 5, elevation: 400, route: "Loop")
trail7 = Trail.create(name: "Arches Monument", location: "Utah", difficulty: 9, length: 4, elevation: 900, route: "Loop")
trail8 = Trail.create(name: "Great Salt Lake", location: "Utah", difficulty: 10, length: 11, elevation: 1500, route: "Out-and-back")
trail9 = Trail.create(name: "Toas Loop", location: "New Mexico", difficulty: 2, length: 5, elevation: 3000, route: "Loop")
trail10 = Trail.create(name: "Grand Canyon - North Rim", location: "Arizona", difficulty: 8, length: 4, elevation: 1000, route: "Loop")
trail11 = Trail.create(name: "Santa Fe Tour", location: "New Mexico", difficulty: 4, length: 2, elevation: 4000, route: "Out-and-back")
trail12 = Trail.create(name: "Hope Falls", location: "Arizona", difficulty: 6, length: 3, elevation: 5000, route: "Loop")

hiker1 = Hiker.create(name: "Bob", age: 45, experience: "novice")
hiker2 = Hiker.create(name: "Sam", age: 15, experience: "expert")
hiker3 = Hiker.create(name: "Jim", age: 22, experience: "moderate")
hiker4 = Hiker.create(name: "Don", age: 45, experience: "novice")
hiker5 = Hiker.create(name: "Alex", age: 15, experience: "expert")
hiker6 = Hiker.create(name: "Barbara", age: 30, experience: "moderate")
hiker7 = Hiker.create(name: "Tim", age: 39, experience: "novice")
hiker8 = Hiker.create(name: "Reinhard", age: 50, experience: "expert")
hiker9 = Hiker.create(name: "Sanjeev", age: 40, experience: "novice")
hiker10 = Hiker.create(name: "Elliott", age: 31, experience: "moderate")
hiker11 = Hiker.create(name: "Jason", age: 32, experience: "expert")
hiker12 = Hiker.create(name: "Damon", age: 22, experience: "novice")

Review.create(rating: 4, review: "Great hike!", hiker_id: hiker1.id, trail_id: trail1.id)
Review.create(rating: 5, review: "Amazing!", hiker_id: hiker2.id, trail_id: trail1.id)
Review.create(rating: 3, review: "Boring", hiker_id: hiker3.id, trail_id: trail1.id)
Review.create(rating: 3, review: "Nice views, okay", hiker_id: hiker1.id, trail_id: trail2.id)
Review.create(rating: 1, review: "Too flat", hiker_id: hiker2.id, trail_id: trail3.id)
Review.create(rating: 4, review: "nice!", hiker_id: hiker3.id, trail_id: trail3.id)
Review.create(rating: 5, review: "loved it", hiker_id: hiker2.id, trail_id: trail3.id)
Review.create(rating: 5, review: "Would love to do it again!", hiker_id: hiker1.id, trail_id: trail4.id)
Review.create(rating: 4, review: "okay", hiker_id: hiker2.id, trail_id: trail4.id)
Review.create(rating: 3, review: "very sunny", hiker_id: hiker3.id, trail_id: trail4.id)
Review.create(rating: 2, review: "pleseant", hiker_id: hiker4.id, trail_id: trail4.id)
Review.create(rating: 1, review: "awful", hiker_id: hiker4.id, trail_id: trail4.id)
Review.create(rating: 5, review: "nice", hiker_id: hiker4.id, trail_id: trail5.id)
Review.create(rating: 5, review: "lovely", hiker_id: hiker4.id, trail_id: trail6.id)
Review.create(rating: 4, review: "very strenous", hiker_id: hiker4.id, trail_id: trail7.id)
Review.create(rating: 4, review: "so pretty", hiker_id: hiker4.id, trail_id: trail8.id)
Review.create(rating: 5, review: "what a great hike!", hiker_id: hiker4.id, trail_id: trail9.id)
Review.create(rating: 3, review: "great experience", hiker_id: hiker4.id, trail_id: trail10.id)
Review.create(rating: 2, review: "Would love to do it again!", hiker_id: hiker4.id, trail_id: trail11.id)
Review.create(rating: 1, review: "deplorable", hiker_id: hiker4.id, trail_id: trail12.id)
Review.create(rating: 4, review: "great scents and smells", hiker_id: hiker4.id, trail_id: trail5.id)
Review.create(rating: 5, review: "great, great hike!", hiker_id: hiker4.id, trail_id: trail6.id)