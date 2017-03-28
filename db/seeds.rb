# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

harry= User.new()
harry.name="Harry Potter"
harry.email="harry@hogwarts.edu"
harry.password="password"
harry.save

hermoine= User.new()
hermoine.name="Hermione Granger"
hermoine.email="hermione@hogwarts.edu"
hermoine.password="password"
hermoine.save

ron= User.new()
ron.name="Ron Weasley"
ron.email="ron@hogwarts.edu"
ron.password="password"
ron.save

luna= User.new()
luna.name="Luna Lovegood"
luna.email="luna@hogwarts.edu"
luna.password="password"
luna.save

post=Post.new()
post.user_id=1
post.title="Welcome"
post.body="Welcome to Dumbledore's Army. No one else can see who we are."
post.save

post=Post.new()
post.user_id=3
post.title="Malfoy's a Mangy Git"
post.body="Ha. This is hilarious."
post.save

post=Post.new()
post.user_id=2
post.title="This is serious business"
post.body="Be more careful! We shouldn't let our posts have any identifying information."
post.save

post=Post.new()
post.user_id=3
post.title="He's a git and everyone knows it"
post.body="Oh, come on. Everyone at Hogwarts knows he's scum. Anyone could have written that."
post.save

post=Post.new()
post.user_id=4
post.title="This is nice"
post.body="I like having friends."
post.save


example= User.new()
example.name="Example User"
example.email="example@example.com"
example.password="password"
example.save