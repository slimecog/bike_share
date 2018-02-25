require 'rails_helper'

context 'As an admin' do
  describe 'when I visit admin bike-shop path and click retire next to an item' do
    before(:each) do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      @active = create(:item)
      @retired = create(:item, status: 1)
    end
    scenario 'I can retire that item' do
      visit admin_items_path
      expect(@active.status).to eq('active')

      within(".item-#{@active.slug}") do
        click_link('Retire')
      end

      within(".item-#{@active.slug}") do
        expect(page).to have_content('retired')
        expect(page).to have_link('Reactivate')
      end
    end
  end
end
