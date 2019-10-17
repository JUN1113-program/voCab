require 'rails_helper'
describe Testresult do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      testresult = build(:testresult)
      expect(testresult).to be_valid
    end

  end

  context "登録できない場合" do

    it "scoreが入力されていない" do
      testresult = build(:testresult, score: "")
      testresult.valid?
      expect(testresult.errors[:score]).to include("を入力してください")
    end

    it "scoreが文字列" do
      testresult = build(:testresult, score: "aaa")
      testresult.valid?
      expect(testresult.errors[:score]).to include("は数値で入力してください")
    end

    it "scoreが0を下回る" do
      testresult = build(:testresult, score: -1)
      testresult.valid?
      expect(testresult.errors[:score]).to include("は0以上の値にしてください")
    end

    it "scoreが100を上回る" do
      testresult = build(:testresult, score: 101)
      testresult.valid?
      expect(testresult.errors[:score]).to include("は100以下の値にしてください")
    end

    it "user_idがない" do
      testresult = build(:testresult, user_id: "")
      testresult.valid?
      expect(testresult.errors[:user]).to include("を入力してください")
    end

    it "test_idがない" do
      testresult = build(:testresult, test_id: "")
      testresult.valid?
      expect(testresult.errors[:test]).to include("を入力してください")
    end
  end
end