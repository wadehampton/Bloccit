CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:                'AWS',
    aws_access_key_id:       'AWS_ACCESS_KEY_ID',
    aws_secret_access_key:   'AWS_SECRET_ACCESS_KEY' 
  }
  config.fog_directory  = 'AWS_BUCKET'
  config.fog_public     = true
end

#Ref:
#https://support.cloud.engineyard.com/entries/20996881-Use-CarrierWave-and-Optionally-Fog-to-Upload-and-Store-Files#update3
#https://stackoverflow.com/questions/7946819/carrierwave-and-amazon-s3