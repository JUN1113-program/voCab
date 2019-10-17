require 'rails_helper'
describe Question do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      question = build(:question)
      expect(question).to be_valid
    end

  end

  context "登録できない場合" do

    it "word_idがない" do
      question = build(:question, word_id: "")
      question.valid?
      expect(question.errors[:word]).to include("を入力してください")
    end

    it "test_idがない" do
      question = build(:question, test_id: "")
      question.valid?
      expect(question.errors[:test]).to include("を入力してください")
    end

  end

end