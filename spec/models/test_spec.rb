require 'rails_helper'
describe Test do

  context "登録できる場合" do
    it "すべての値が適切に入力されている" do
      test = build(:test)
      expect(test).to be_valid
    end
  end

end