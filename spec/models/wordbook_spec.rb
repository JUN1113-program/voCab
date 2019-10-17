require 'rails_helper'
describe Wordbook do

  context "登録できる場合" do

    it "すべての値が適切に入力されている" do
      wordbook = build(:wordbook)
      expect(wordbook).to be_valid
    end

    it "titleが13文字入力されている" do
      wordbook = build(:wordbook, title: Faker::Alphanumeric.alpha(number: 13))
      expect(wordbook).to be_valid
    end

    it "referenceが未入力の場合" do
      wordbook = build(:wordbook, reference: "")
      expect(wordbook).to be_valid
    end

    it "referenceが20文字入力されている" do
      wordbook = build(:wordbook, reference: Faker::Alphanumeric.alpha(number: 20))
      expect(wordbook).to be_valid
    end

    it "shareがtrueの場合" do
      wordbook = build(:wordbook, share: true)
      expect(wordbook).to be_valid
    end

    it "shareがfalseの場合" do
      wordbook = build(:wordbook, share: false)
      expect(wordbook).to be_valid
    end

  end

  context "登録できない場合" do

    it "titleが未入力である" do
      wordbook = build(:wordbook, title: "")
      wordbook.valid?
      expect(wordbook.errors[:title]).to include("を入力してください")
    end

    it "titleが13文字を超える" do
      wordbook = build(:wordbook, title: Faker::Alphanumeric.alpha(number: 14))
      wordbook.valid?
      expect(wordbook.errors[:title]).to include("は13文字以内で入力してください")
    end

    it "referenceが20文字を超える" do
      wordbook = build(:wordbook, reference: Faker::Alphanumeric.alpha(number: 21))
      wordbook.valid?
      expect(wordbook.errors[:reference]).to include("は20文字以内で入力してください")
    end

    it "shareが未入力" do
      wordbook = build(:wordbook, share: "")
      wordbook.valid?
      expect(wordbook.errors[:share]).to include("は一覧にありません")
    end

  end
end