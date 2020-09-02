require 'rails_helper'
RSpec.describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context '新規登録ができる' do
      it '全ての情報が入っていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない' do
      it 'nicknameが空欄で登録不可' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空欄で登録不可' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複する場合は登録不可' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.email = user1.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まなければ登録不可' do
        @user.email = 'hogehogeco.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空欄で登録不可' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下なら登録不可' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが両方存在しないと登録不可' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数字でないと登録不可' do
        @user.password = 'あa12345'
        @user.password_confirmation = 'あa12345'
      end
      it 'firstname_hiraが空欄で登録不可' do
        @user.firstname_hira = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname hira can't be blank", 'Firstname hira is invalid')
      end
      it 'firstname_hiraが全角の漢字、カタカナ、ひらがな以外では登録不可' do
        @user.firstname_hira = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname hira is invalid')
      end
      it 'lastname_hiraが空欄で登録不可' do
        @user.lastname_hira = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname hira can't be blank", 'Lastname hira is invalid')
      end
      it 'lastname_hiraが全角の漢字、カタカナ、ひらがな以外では登録不可' do
        @user.lastname_hira = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname hira is invalid')
      end
      it 'firstname_kanaが空欄で登録不可' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank", 'Firstname kana is invalid')
      end
      it 'firstname_kanaが全角カタカナ以外では登録不可' do
        @user.firstname_kana = 'cccccc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it 'lastname_kanaが空欄で登録不可' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank", 'Lastname kana is invalid')
      end
      it 'lastname_kanaが全角カタカナ以外では登録不可' do
        @user.lastname_kana = 'dddddd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid')
      end
      it 'birthdayが空欄で登録不可' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
