require 'spec_helper'

describe Customer do
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:merchant_number)}
end