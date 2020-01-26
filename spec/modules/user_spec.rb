require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "苗字", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "is invalid without a email" do
      user = User.new(nickname: "名前", email: "", password: "", password_confirmation: "00000000", family_name: "苗字", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without a password" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "", password_confirmation: "", family_name: "苗字", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "is invalid without a family_name" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it "is invalid without a first_name" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "苗字", first_name: "", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "is invalid without a family_name_kana" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "苗字", first_name: "名前", family_name_kana: "", first_name_kana: "ナマエ", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it "is invalid without a first_name_kana" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "苗字", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "", birthday: 2000-01-01)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "is invalid without a birthday" do
      user = User.new(nickname: "名前", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "苗字", first_name: "名前", family_name_kana: "ミョウジ", first_name_kana: "ナマエ", birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end