class Product < ApplicationRecord

  def is_discounted?
    if price.to_f >= 2
      return false
    else 
      return true
    end
  end


  def tax
    return price.to_f * 0.09
  end

  def total
    return price.to_f + tax
  end

  def as_json
    {
      title: title,
      description: description, 
      price: price,
      tax: tax,
      total_price: total
    }
  end



end
