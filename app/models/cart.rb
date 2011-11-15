class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

 def total_amount
   total_amount = Smart.joins(:line_items)
   .where(:line_items => {:cart_id => self.id})
   .sum(:price)
   total_amount.to_f
 end
end
