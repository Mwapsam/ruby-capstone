require_relative '../app/label'
require 'json'

def load_labels
  label_json = File.read('./data/labels.json')
  label_data = []
  if label_json.empty?
    label_data
  else
    JSON.parse(label_json).map do |label|
      label_data.push(Label.new(label['name'], label['color'], label['id']))
    end
  end
  label_data
end
