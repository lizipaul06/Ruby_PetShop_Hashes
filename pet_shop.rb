
def pet_shop_name(petshop)
return @pet_shop[:name]
end

def total_cash(petshop)
 return @pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(petshop, money)
 @pet_shop[:admin][:total_cash] += money.to_i

end

def pets_sold(petshop)
return  @pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(petshop, number_sold)
 return  @pet_shop[:admin][:pets_sold] += number_sold.to_i
end

def stock_count(petshop)
  return @pet_shop[:pets].count
end

def pets_by_breed(petshop, breed)
   counter = []
  for pet in petshop[:pets]
  if pet[:breed] == breed
   counter.push(pet)
  end
end
 return counter
end

def find_pet_by_name(petshop, name)
  for pet in petshop[:pets]
    return pet if name == pet[:name]
  end
  return nil
end




def remove_pet_by_name(petshop, name)
  # return pet_shop(find_pet_by_name.delete(name))
  for pet in petshop[:pets]
    return pet.delete(:name) if name == pet[:name]
  end
end


def test_add_pet_to_stock
  add_pet_to_stock(@pet_shop, @new_pet)
  count = stock_count(@pet_shop)
  assert_equal(7, count)
end

def add_pet_to_stock(petshop, new_pet)
    @pet_shop[:pets].push(new_pet)
  end


def customer_cash(customer)
return customer[:cash]
end

def remove_customer_cash(customer, cash)
return  customer[:cash] -= cash
end

def customer_pet_count (customer)
return  customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
return customer[:pets].count
end

def customer_can_afford_pet(customer, new_pet)
     for cash in customer
  return true if customer[:cash] >= new_pet[:price]

  end
  return false
end

def sell_pet_to_customer(petshop, pet, customer)
     if pet.nil?
       return nil
    elsif customer_can_afford_pet(customer, pet)
      increase_pets_sold(petshop, 1)
    add_or_remove_cash(petshop, pet[:price])
      remove_customer_cash(customer, pet[:price])
    return customer[:pets].push(pet)

  end

end
