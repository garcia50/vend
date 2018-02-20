require 'rails_helper'

describe "As a user" do
  describe "When I visit a specific vending machine page" do
    it "I see snack info associated wth machine" do
      owner = Owner.create!(name: "Jeff")
      machine = Machine.create!(location: "Denver", owner: owner)
      snacks_1 = Snack.create!(name: "Skittle", price: 3.00)
      snacks_2 = Snack.create!(name: "PopRocks", price: 6.00)

      machine.snacks << snacks_1
      machine.snacks << snacks_2

      visit machine_path(machine)
save_and_open_page
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
# When I visit a specific vending machine page
# I also see an average price for all of the snacks in that machine