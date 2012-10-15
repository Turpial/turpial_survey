keys = YAML.load(File.open(Rails.root.join('config', 'captchakeys.yml')))
Recaptcha.configure do |config|
  config.public_key  = keys['config']['public']
  config.private_key = keys['config']['private']
  config.proxy = ''
end
