APP_CONFIG = YAML.load_file("#{Rails.root}/config/instance.yml")['instance']
TASK_STATUS = Array.new
APP_CONFIG["task_status"].each_pair { |key, value| TASK_STATUS[key] = value }
