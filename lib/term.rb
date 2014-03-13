require './definitions'

class Term

  @@dictionary = []

  def initialize(dictionary_word, definitions)
    @word = dictionary_word
    @definitions = []
    definitions.each do |definition|
      @definitions << Definition.new(definition)
    end
  end

  def Term.create(dictionary_word, definition)
    new_word = Term.new(dictionary_word, definition)
    new_word.save
    new_word
  end

  def save
    @@dictionary << self
  end

  def full_term
    self
  end

  def Term.clear
    @@dictionary = []
  end

  def Term.all
    @@dictionary
  end

  def Term.search(word)
    @@dictionary.index do |s|
      if s.word == search_word
        s
      end
    end
    false
  end

  def word
    @word
  end

  def definitions
    @definitions
  end

  def Term.get_definition(word)
    @@dictionary.each_with_index do |obj, index|
      if obj.word == word
        return obj.definition
      end
    end
    false
  end

  # def edit_definition(new_definition)
  #   @definitions = new_definition
  # end

  def Term.add_new_term(word, definition)
    Term.create(word, [definition])
  end

  def add_new_definition(definition)
    @definitions << Definition.new(definition)
  end
end
