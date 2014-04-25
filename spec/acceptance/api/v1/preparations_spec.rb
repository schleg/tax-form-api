require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Preparations' do

  get '/api/preparations' do

    before do
      10.times.map do |i|
        FactoryGirl.create :preparation, year: i
      end
    end

    example 'Get all preparations' do
      do_request
      status.should == 200
      json = JSON.parse(response_body)
      json.length.should eq(10)
    end
  end

  post '/api/preparations' do

    example 'Create new preparation' do
      do_request preparation: [ year: 1 ]
      status.should == 200
      json = JSON.parse(response_body).first
      json["created"].should_not be_nil
    end
  end
end

