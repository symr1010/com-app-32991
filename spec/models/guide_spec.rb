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
    it 'titleが空では登録できないこと' do
      @guide.title = nil
      @guide.valid?
      expect(@guide.errors.full_messages).to include("Title can't be blank")
    end

    it 'contentが空では登録できないこと' do
      @guide.content = nil
      @guide.valid?
      expect(@guide.errors.full_messages).to include("Content can't be blank")
    end

    it '画像が空では登録できないこと' do
      @guide.image = nil
      @guide.valid?
      binding.pry
      expect(@guide.errors.full_messages).to include("Image can't be blank")
    end
  end
end
