require 'rspec'
require 'term'

describe Term do
  it 'should initialize Term' do
    Term.clear
    new_term = Term.new('carrot', 'A not so delicious vegetable unless its cake')
    new_term.should be_an_instance_of Term
  end
  it 'should create a new word in Term' do
    Term.clear
    new_term = Term.new('carrot', 'A not so delicious vegetable unless its cake')
    new_term.word.should eq 'carrot'
  end
  it 'should create a new word and definition in Term' do
    Term.clear
    new_term = Term.new('carrot', 'A not so delicious vegetable unless its cake')
    new_term.definition.should eq 'A not so delicious vegetable unless its cake'
  end
  describe 'create' do
    it 'should create an Term object' do
      Term.clear
      new_term = Term.create('carrot', 'A not so delicious vegetable unless its cake')
      Term.get_definition('carrot').should eq 'A not so delicious vegetable unless its cake'
    end
    it 'should create an Term object' do
      Term.clear
      new_term = Term.create('carrot', 'A not so delicious vegetable unless its cake')
      Term.get_definition('celery').should eq false
    end
  end
  describe 'define' do
    it 'should return a term from the dictionary' do
      Term.clear
      Term.create('carrot', "A not so delicious vegetable unless its cake.")
      Term.create('celery', 'A great addition to bloddy marys.')
      Term.create('onion', 'It makes my eyes rain.')
      Term.get_definition('carrot').should eq "A not so delicious vegetable unless its cake."
    end
  end
  describe 'list_words' do
    it 'should list all the words' do
      Term.clear
      new_list = []
      new_list << Term.create('carrot', 'A not so delicious vegetable unless its cake.')
      new_list << Term.create('celery', 'A great addition to bloddy marys.')
      new_list << Term.create('onion', 'It makes my eyes rain.')
      Term.all.should eql new_list
    end
  end
  # describe 'define_words' do
  #   it 'should list all the definitions' do
  #     Term.clear
  #     new_definition = []
  #     new_definition << Term.create('carrot', 'A not so delicious vegetable unless its cake.')
  #     new_definition << Term.create('celery', 'A great addition to bloddy marys.')
  #     new_definition << Term.create('onion', 'It makes my eyes rain.')
  #     Term.display_definitions.should eql ['A not so delicious vegetable unless its cake.', 'A great addition to bloddy marys.', 'It makes my eyes rain.']
  #   end
  # end
end
