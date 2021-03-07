require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { category }

  let(:category) { build(:category) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to be_valid }
end
