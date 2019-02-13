


require 'rails_helper'

RSpec.describe "events/index", type: :view do

  context 'it says welcome' do
  it "displays 'welcome'" do
    # génére la page
    render

    # le contenu "Bievenue" doit être dans la page
    expect(rendered).to have_content 'Coming events'
  end
end



  context 'other context' do  
    it 'should display something' do
      # ton test
    end
  end

end