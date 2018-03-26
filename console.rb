require( 'pry-byebug' )
require ('pg')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require_relative('db/sql_runner.rb')

customer1 = Customer.new({'name' => 'Hugh Mungus', 'funds' => 150})
customer2 = Customer.new({'name' => 'Dennis Tissington', 'funds' => 100})
customer3 = Customer.new({'name' => 'Robert Paulson', 'funds' => 200})
customer4 = Customer.new({'name' => 'Eddie Mansfield', 'funds' => 50})

customer1.save()
customer2.save()
customer3.save()
customer4.save()



p customer1

film1 = Film.new({'title' => 'The Lost City of Z', 'price' => 10})
film2 = Film.new({'title' => 'Get Out', 'price' => 15})
film3 = Film.new({'title' => 'Blade Runner 2049', 'price' => 13})

film1.save()
film2.save()
film3.save()

customer3.name = 'John'
customer3.update


ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket1.save()
ticket2.save()
ticket3.save()

ticket1.film_id = film3.id

binding.pry


p film1
