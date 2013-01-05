require 'spec_helper'

describe 'product show page' do
  before do
    @taxon = FactoryGirl.create :taxon, name: "Kategorie",
      taxonomy: FactoryGirl.create(:taxonomy, name: "Kategorie")

    @product = FactoryGirl.create :custom_product, name: "Dexter", taxons: [@taxon]

    Spree::Product.stub(:best_selling_variants).and_return(
      [[@product, 5]])

  end

  describe 'best selling products' do
    it 'should show products', :driver => :selenium do
      visit '/'
      visit spree.product_path(@product)
      sleep 5
      within("#best_selling") do
        page.should have_content('Dexter (5)')
      end
    end
  end
end
