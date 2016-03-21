FactoryGirl.define do
  factory :vehicle do
    model { Faker::Vehicle.model }
    make  { |vehicle| make_for_model(vehicle.model)  }
  end
end