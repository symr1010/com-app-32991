require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる時' do
      it '全ての値が問題なければ登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'sample10103'
        @user.password_confirmation = 'sample10103'
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは、@を含まない場合は登録できないこと' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'sam10'
        @user.password_confirmation = 'sam10'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'passwordは、数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英数字混合文字を使用してください')
      end

      it 'passwordは、英文字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英数字混合文字を使用してください')
      end

      it 'passwordは、全角では登録できないこと' do
        @user.password = 'ABCDEF'
        @user.password_confirmation = 'ABCDEF'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英数字混合文字を使用してください')
      end
      
      it 'passwordは、確認用を含めて2回入力しないと登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword（確認用）、値の不一致では登録ができないこと' do
        @user.password_confirmation = 'sample10103'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'ageが空では登録できないこと' do
        @user.age_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Age Select")
      end

      it 'sexが空では登録できないこと' do
        @user.sex_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex Select")
      end

      
      it 'professionが空では登録できないこと' do
        @user.profession = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Profession can't be blank")
      end
    end  
  end  
end
