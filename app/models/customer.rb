class Customer < ApplicationRecord

    # after_create :manage_dropbox
    has_many :leads
    # belongs_to :lead, optional: true
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings

end
