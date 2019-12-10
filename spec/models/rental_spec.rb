=begin
require 'rails_helper'

RSpec.describe Rental, type: :model do

  rental = Rental.new(start_date: nil, end_date: '10/12/2019', client: client, 
                        car_category: category: category)

  rental.valid?
end

=end