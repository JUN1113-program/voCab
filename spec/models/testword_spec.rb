require 'rails_helper'
describe Testword do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      testword = build(:testword)
      expect(testword).to be_valid
    end

  end

  context "登録できない場合" do

    it "wordがない" do
      testword = build(:testword, word: "")
      testword.valid?
      expect(testword.errors[:word]).to include("を入力してください")
    end

    it "correctがない" do
      testword = build(:testword, correct: "")
      testword.valid?
      expect(testword.errors[:correct]).to include("を入力してください")
    end

    it "correctが0,1以外" do
      testword = build(:testword, correct: 10)
      testword.valid?
      expect(testword.errors[:correct]).to include("は一覧にありません")
    end

    it "question_idがない" do
      testword = build(:testword, question_id: "")
      testword.valid?
      expect(testword.errors[:question]).to include("を入力してください")
    end

  end

end