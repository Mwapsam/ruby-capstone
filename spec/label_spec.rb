require_relative '../app/label'

describe Label do
  before :each do
    @label = Label.new('Gift', Time.new(2021, 0o5, 16), true)
  end

  context 'When testing the Label class' do
    it 'should have an object with the instance of Label' do
      label_class = @label.class

      expect(label_class).to be Label
    end
  end
  describe '#new' do
    it 'has items as an empty array' do
      expect(@label.items).to be_empty
    end
    it 'is an instance of Label' do
      expect(@label).to be_an_instance_of(Label)
    end
  end
end
