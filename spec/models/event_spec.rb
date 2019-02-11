require 'rails_helper'


RSpec.describe Event, type: :model do

  before(:each) do 
    @event= FactoryBot.create(:event)  
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:event)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end


 	 describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }
    end

  	 it "Duration should return an integer" do
        expect(@event.duration).to be_a(Integer)
      end

  	 it "Price should return an integer" do
        expect(@event.price).to be_a(Integer)
      end


  end



 context "validation minimum length" do

   describe "#title" do
      it { expect(@event).to validate_length_of(:title).is_at_least(5) }
    end

     describe "#description" do
      it { expect(@event).to validate_length_of(:description).is_at_least(20) }
    end

end




  context "associations" do

    describe "events" do
      it { expect(@event).to have_many(:attendances) }
    end

  end


  

end
