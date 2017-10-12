class Car < ApplicationRecord
    mount_uploader :image, ImageCarUploader
    belongs_to :user
end
