Topic.create(name: "Computer Science")
Topic.create(name: "Cars")
Topic.create(name: "Women")
Topic.create(name: "Science")

User.create(email: "beznosa@yahoo.com", password: "smt8798536116")
User.create(email: "alex@yahoo.com", password: "smt8798536116")
User.create(email: "beznos@yahoo.com", password: "smt8798536116")
User.create(email: "alex_beznos@yahoo.com", password: "smt8798536116")


Topic.all.each do |topic|
  User.find(1).topics << topic
end 

Topic.all.each do |topic|
  User.find(3).topics << topic
end 

User.find(1).topics.find(1).messages.create(body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.")
User.find(1).topics.find(2).messages.create(body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.")
User.find(1).topics.find(3).messages.create(body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.")
User.find(3).topics.find(3).messages.create(body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.")
User.find(3).topics.find(2).messages.create(body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.")