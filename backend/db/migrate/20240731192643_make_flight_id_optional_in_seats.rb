class MakeFlightIdOptionalInSeats < ActiveRecord::Migration[7.0]
  def change
    change_column_null :seats, :flight_id, true
  end
end

