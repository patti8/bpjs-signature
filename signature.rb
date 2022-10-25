require 'openssl'
require 'base64'

class Signature
    
    def self.generate(cons_id, secretkey)
        data = "#{cons_id}&#{Time.now.to_i}"

        signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secretkey, data)).strip()

        {signature: signature, timestamp: Time.now.to_i}
    end
    
end