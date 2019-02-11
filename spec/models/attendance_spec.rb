require 'rails_helper'


RSpec.describe Attendance, type: :model do

  before(:each) do 
    @attendance = FactoryBot.create(:attendance)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:attendance)).to be_valid
  end

  context "validation" do

 it "Price should return an integer" do
        expect(@attendance.stripe_customer_id).to be_a(String)
      end

  end


  context "associations" do

    describe "attendance" do
      it { expect(@attendance).to belong_to(:event) }
    end

     describe "attendance" do
      it { expect(@attendance).to belong_to(:user) }
    end

  end


  

end
