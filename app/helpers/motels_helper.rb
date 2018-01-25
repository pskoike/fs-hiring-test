module MotelsHelper

  def calc_book_revenue(book)
    amount = book.amount_centavos/100.00
    fee =  (amount * book.fee_percentage)/100.00
    revenue = amount - fee
  end
end
