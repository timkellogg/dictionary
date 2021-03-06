require 'rspec'
require 'definition'

describe Definition do

  before do
    @definition = Definition.new({text: 'a unit of language', part_of_speech: 'noun', example: 'The word of the day is bacon.'})
  end

  describe '#text' do
    it 'should return the text of the definition' do
      expect(@definition.text).to eq 'a unit of language'
    end
  end

  describe '#part_of_speech' do
    it 'should return the part of speech of the definition' do
      expect(@definition.part_of_speech).to eq 'noun'
    end
  end

  describe '#example' do
    it 'should return the example of the word being used in the definition' do
      expect(@definition.example).to eq 'The word of the day is bacon.'
    end
  end

  describe '#id' do
    it 'should return the id of the definition' do
      expect(@definition.id).to eq 1
    end
  end

  describe '#created_at' do
    it 'should return the year that the definition was created' do
      expect(@definition.created_at).to eq Time.now.year
    end
  end
end
