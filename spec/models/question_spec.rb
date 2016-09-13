require 'rails_helper'

describe Question do
  # it { should validate_presence_of :user_id }
  it { should validate_presence_of :content }
  it { should have_many :answers }

end
