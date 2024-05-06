require 'faker'

puts "Destroy everything..."
User.destroy_all

puts 'Creating 2 fake users...'
user =
  User.new(
    email: 'amir@mourali.com',
    password: 'password',
    admin: false, 
  )
user.save!
user =
  User.new(
    email: 'amir@fake.com',
    password: 'password',
    admin: true, 
  )
user.save!
puts 'Finished with the users!'
 
puts "Experiment with UUIDs..."
bucketlist = 
 Bucketlist.new(
  user_id: User.first.id
 )