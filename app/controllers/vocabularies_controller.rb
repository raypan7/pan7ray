# frozen_string_literal: true

class VocabulariesController < ApplicationController
 
  def index
    @vocabs = Vocabulary.all
  end
end
