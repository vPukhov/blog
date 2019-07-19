require 'rails_helper'

describe Comment do
  it { should belong_to :article }

  describe "Validate of length" do
    it { should validate_length_of(:body).is_at_most(4000) }
  end

end