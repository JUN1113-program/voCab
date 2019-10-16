require 'rails_helper'
describe User do

  context "登録できる場合" do
    it "nickname, emailが入力されており、password, password_confirmationが一致している" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "パスワードが6文字入力されている" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "ニックネームが8文字入力されている" do
      user = build(:user, nickname: "12345678")
      expect(user).to be_valid
    end
  end

  context "登録できない場合" do
    it "nicknameが未入力である" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが8文字を超える" do
      user = build(:user, nickname: "123456789")
      user.valid?
      expect(user.errors[:nickname]).to include("は8文字以内で入力してください")
    end

    it "emailが未入力である" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが入力された" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが未入力である" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordとpassword_confirmationが不一致である" do
      user = build(:user, password: "123456", password_confirmation: "654321")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "パスワードが5文字入力されている" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

  end
end