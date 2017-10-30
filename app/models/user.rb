class User < ApplicationRecord
  has_many :histories
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end
end
