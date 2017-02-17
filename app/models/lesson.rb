class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  
  has_many :results, dependent: :destroy
  has_many :words, through: :results
  has_many :answers, through: :results

  before_update :change_status

  def change_status
    self.is_completed = self.is_completed.present?
  end
end
