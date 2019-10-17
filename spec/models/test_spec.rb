require 'rails_helper'
describe Test do

  context "登録できる場合" do
    it "すべての値が適切に入力されている" do
      test = build(:test)
      expect(test).to be_valid
    end
  end

  context "登録できない場合" do
    it "wordbook_idがない" do
      test = build(:test, wordbook_id: "")
      test.valid?
      expect(test.errors[:wordbook]).to include("を入力してください")
    end
  end

end