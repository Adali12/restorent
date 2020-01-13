class Resto < ApplicationRecord
    has_many :lunches, dependent: :destroy
    has_many :break_fasts, dependent: :destroy
    accepts_nested_attributes_for :lunches, reject_if: :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :break_fasts, reject_if: :all_blank, :allow_destroy => true
    mount_uploader :image, ImageUploader
    has_many :comments, dependent: :destroy
end
