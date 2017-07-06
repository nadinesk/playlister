# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  cart_id    :integer
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Showline < ActiveRecord::Base
  belongs_to :tvshow
  belongs_to :playlist

  #def total
  #  item.price * quantity
  #end
end
