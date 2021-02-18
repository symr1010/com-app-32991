require 'rails_helper'

RSpec.describe Guide, type: :model do
  before do
    @guide = FactoryBot.build(:guide)
  end

  context '新規投稿ができる時' do
    it '全ての値が問題なければ登録できること' do
      expect(@guide).to be_valid
    end
  end

  context '新規投稿ができない時' do
    it '案内板の名称が空では登録できないこと' do
      @guide.title = nil
      @guide.valid?
      expect(@guide.errors.full_messages).to include("案内板の名称を入力してください")
    end

    it '内容が空では登録できないこと' do
      @guide.content = nil
      @guide.valid?
      expect(@guide.errors.full_messages).to include("内容を入力してください")
    end

    it '画像が空では登録できないこと' do
      @guide.image = nil
      @guide.valid?
      expect(@guide.errors.full_messages).to include("画像を入力してください")
    end
  end
end
