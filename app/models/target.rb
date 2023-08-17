class Target < ApplicationRecord
  
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age, class_name: 'Age'
  
  with_options presence: true do
    validates :target_name
    validates :clothes
    validates :resemble
    validates :user_id
    validates :line_name
    validates :station
    validates :ride_time
  end  
    validates :age_id, numericality: { other_than: 1 , message: "は未選択では登録できません"}
    validates :line_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }
    validates :station, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }

  # def save
  #   target = Target.create(target_name: target_name, clothes: clothes, age: age, resemble: resemble, user_id: user_id, line_name: line_name, station: station, ride_time: ride_time)
  # end  

  def strftime
    save ride_time
  end  

  def self.search(search)
    if search != ""
      Target.where('line_name LIKE(?)', "%#{search}%")
    else
      Target.all
    end
  end
end
