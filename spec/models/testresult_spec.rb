require 'rails_helper'
describe Testresult do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      testresult = build(:testresult)
      expect(testresult).to be_valid
    end

  end

end