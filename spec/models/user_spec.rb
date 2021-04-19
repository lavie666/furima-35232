require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てが正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上なら登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end

      it 'last_nameとfirst_nameが全角ならば登録できる' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it 'last_name_katakanaとfirst_name_katakanaが全角カタカナであれば登録できる' do
        @user.last_name_katakana = 'ヤマダ'
        @user.first_name_katakana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@がなければ登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      

      it 'passwordが5文字以下なら登録できない' do
        @user.password ='11aaa' 
        @user.password_confirmation = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_name_katakanaが全角カタカナでなければ登録できない' do
        @user.last_name_katakana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end

      it 'first_name_katakanaが全角カタカナでなければ登録できない' do
        @user.first_name_katakana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb