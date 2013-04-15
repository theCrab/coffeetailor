# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  config.site_name = "Coffee Tailors"

  # Amazon S3 Storage
  config.use_s3 = true if Rails.env.production?
  config.s3_bucket = 'coffeetailor'
  config.s3_access_key = "AKIAJDCQ7GM3NVVL3ILA"
  config.s3_secret = "6vdkds+NVfV1tWptBXJraNExMl4LB5p3l7lA5/Z"
  config.attachment_url = ":s3_eu_url"
  config.s3_host_alias = "coffeetailor.s3.amazonaws.com"
end

Spree.user_class = "Spree::User"

if Rails.env.production?
  Paperclip.interpolates(:s3_eu_url) do |attachment, style|
    "#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.path(style).gsub(%r{^/}, "")}"
  end
end
