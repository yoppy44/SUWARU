require 'rails_helper'

RSpec.describe TargetLine, type: :model do
  describe '目標投稿ページ' do
    before do
      user = FactoryBot.create(:user)
      @target_line = FactoryBot.build(:target_line, user_id: user.id)
    end
    
    context '登録できる場合' do
      it 'ニックネーム、服装、年齢、誰に似てる？、路線名、降車駅、降車時刻が存在すれば登録できる' do
        expect(@target_line).to be_valid
      end
    end
    context '登録できない場合' do
      it 'ニックネームが空だと登録できない' do
        @target_line.targets_name = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('ニックネームを入力してください')
      end
      it '服装が空だと登録できない' do
        @target_line.clothes = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('服装を入力してください')
      end
      it '年齢が空だと登録できない' do
        @target_line.age = 1
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('年齢は未選択では登録できません')
      end
      it '誰に似てる？が空だと登録できない' do
        @target_line.resemble = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('誰に似てる？を入力してください')
      end
      it '路線名が空だと登録できない' do
        @target_line.line_name = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('路線名を入力してください')
      end
      it '路線名は全角でないと登録できない' do
        @target_line.line_name = 'shinjuku'
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('路線名は全角で入力してください')
      end
      it '降車駅が空だと登録できない' do
        @target_line.station = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('降車駅を入力してください')
      end
      it '降車駅は全角でないと登録できない' do
        @target_line.station = 'shinjuku'
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('降車駅は全角で入力してください')
      end
      it '降車時間は空だと登録できない' do
        @target_line.ride_time = ''
        @target_line.valid?
        expect(@target_line.errors.full_messages).to include('降車時刻を入力してください')
      end
    end
  end
end