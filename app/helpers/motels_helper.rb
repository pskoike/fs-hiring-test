module MotelsHelper

  # Calculates total revenue for a single booking
  def calc_book_revenue(book)
    amount = book.amount_centavos/100.00
    fee =  (amount * book.fee_percentage)/100.00
    revenue = amount - fee
    revenue.round(2)
  end

  # Calculates total revenue for a lista of bookings
  def calc_total_revenue(bookings)
    total = 0.0
    bookings.each do |book|
      amount = book.amount_centavos/100.00
      fee =  (amount * book.fee_percentage)/100.00
      revenue = amount - fee
      total += revenue
    end
    total.round(2)
  end

  # Calculates total revenue for the last X days
  def calc_revenue_for_period(bookings, period)
    total = 0.0
    bookings = bookings.all.select { |b| b.created_at > Time.now - period.day}
    bookings.each do |book|
      amount = book.amount_centavos/100.00
      fee =  (amount * book.fee_percentage)/100.00
      revenue = amount - fee
      total += revenue
    end
    total.round(2)
  end
end
