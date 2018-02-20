require 'rails_helper'

describe "As a user" do
  describe "When I visit a specific vending machine page" do
    it "I see snack info associated wth machine" do
      owner = Owner.create!(name: "Jeff")
      machine = Machine.create!(location: "Denver", owner: owner)
      snacks_1 = Snack.create!(name: "Skittle", price: 3.00)
      snacks_2 = Snack.create!(name: "PopRocks", price: 6.00)

      visit machine_path(machine)

      expect(page).to have_content("Snacks")
      expect(page).to have_content("Skittles")
      expect(page).to have_content("$3.00")
      expect(page).to have_content("PopRocks")
      expect(page).to have_content("$6.00")
    
    end
  end
end


# As a user
# When I visit a specific vending machine page
# I see the name of all of the snacks associated with that vending machine along with their price