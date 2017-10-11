class Car < ApplicationRecord
    mount_uploader :image, ImageCarUploader
end
