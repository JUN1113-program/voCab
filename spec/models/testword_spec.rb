require 'rails_helper'
describe Testword do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      testword = build(:testword)
      expect(testword).to be_valid
    end

  end

end