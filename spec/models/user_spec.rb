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
  end

  end
end