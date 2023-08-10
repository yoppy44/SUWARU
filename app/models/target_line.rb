class TargetLine
  include ActiveModel::Model 
  attr_accessor :targets_name, :clothes, :age, :resemble, :user_id, :line_name, :station, :ride_time, :target_id
    
  with_options presence: true do
    validates :targets_name
    validates :clothes
    validates :resemble
    validates :user_id
    validates :line_name
    validates :station
  end  
    validates :age, numericality: { other_than: 1 , message: "は未選択では登録できません"}
    validates :line_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }
    validates :station, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" }
    validates :ride_time, numericality: { other_than: 1 , message: "は未選択では登録できません"}

  def save
    target = Target.create(targets_name: targets_name, clothes: clothes, age: age, resemble: resemble, user_id: user_id)
    Line.create(line_name: line_name, station: station, ride_time: ride_time, target_id: target.id)
  end  
  
end  