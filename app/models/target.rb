class Target < ApplicationRecord
  
  belongs_to :user
  
  with_options presence: true do
    validates :targets_name
    validates :clothes
    validates :resemble
    validates :user_id
    validates :line_name
    validates :station
    validates :ride_time
  end  
    validates :age, numericality: { other_than: 1 , message: "は未選択では登録できません"}
    validates :line_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }
    validates :station, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }

  def save
    target = Target.create(targets_name: targets_name, clothes: clothes, age: age, resemble: resemble, user_id: user_id, line_name: line_name, station: station, ride_time: ride_time)
  end  

  def strftime
    save ride_time
  end  

  def self.search(search)
    if search != ""
      Line.where('text LIKE(?)', "%#{search}%")
    else
      Line.all
    end
  end
end
