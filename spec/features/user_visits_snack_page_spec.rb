require 'rails_helper'

describe "As a user" do
  describe "When I visit a specific snack page" do
    it "I see snack info" do
      owner = Owner.create!(name: "Jeff")
      machine = Machine.create!(location: "Denver", owner: owner)
      machine = Machine.create!(location: "Miami", owner: owner)
      snacks_1 = Snack.create!(name: "Skittle", price: 3.00)

      machine.snacks << snacks_1

      visit snack_path(snacks_1)

      expect(page).to have_content("Snacks")
      expect(page).to have_content("Skittle")
      expect(page).to have_content("$3.00")
      expect(page).to have_content("PopRocks")
      expect(page).to have_content("$6.00")
      expect(page).to have_content("Average Snack Price: $4.50")
    
    end
  end
end

# As a user
# When I visit a specific snack page
# I see the name of that snack
# I see the price for that snack
# I see a list of locations with vending machines that carry that snack
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.