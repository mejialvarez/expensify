# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Category do
  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }

end
