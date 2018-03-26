require ('pg')


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save
    sql = "INSERT INTO customers
    (name, funds)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE customers SET name = $1, funds = $2
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    customer_objects = customer_hashes.map{|customer| Customer.new(customer)}
    return customer_objects
  end

  def show_films
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run( sql, values )
    result = films.map{ |film| Film.new(film) }
    return result
  end

  def show_all_tickets
    sql = "SELECT tickets.* FROM tickets
          INNER JOIN customers
          ON  tickets.customer_id = customers.id
          WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    result = tickets.map{ |ticket| Ticket.new(ticket)}
    return result
  end




















end
