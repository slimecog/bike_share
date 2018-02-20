require "rails_helper"

describe "as a registered user or admin" do
  before :each do
    @admin = create(:admin)
    @user = create(:user)
    @trip1 = create(:trip, duration: 10)
    @trip2 = create(:trip, duration: 20, zip_code: 95113)
    @trip3 = create(:trip, duration: 3, bike_id: 10, subscription_type: "Customer", zip_code: 94041)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "when i visit the trips_dashboard_path" do
    it "shows the average duration of a ride" do
      visit trips_dashboard_path

      expect(page).to have_content("Average Trip Duration: 11")
    end

    it "shows the longest ride" do
      visit trips_dashboard_path

      expect(page).to have_content("Longest Trip Duration: 20")
    end

    it "shows the shortest ride" do
      visit trips_dashboard_path

      expect(page).to have_content("Shortest Trip Duration: 3")
    end
  end
end









# I see the Longest ride,
# I see the Shortest ride,
# I see the Station with the most rides as a starting place,
# I see the Station with the most rides as an ending place,
# I see Month by Month breakdown of number of rides with subtotals for each year,
# I see the Most ridden bike with total number of rides for that bike,
# I see the Least ridden bike with total number of rides for that bike,
# I see the User subscription type breakout with both count and percentage,
# I see the Single date with the highest number of trips with a count of those trips,
# I see the Single date with the lowest number of trips with a count of those trips.