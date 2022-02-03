# frozen_string_literal: true

class Api::V1::VocabulariesController < ApplicationController
  before_action :set_vocab, only: %i[show edit update destroy]

  def index
    @vocabs = Vocabulary.all
    render(json: @vocabs)
  end

  def show
    if @vocab
      render(json: @vocab)
    else
      render(json: @vocab.errors)
    end
  end

  def new
    @vocabs = Vocabulary.new
  end

  def edit; end

  def create
    @vocab = Vocabulary.new(vocab_params)

    if @vacab.save
      render(json: @vocab)
    else
      render(json: @vacab.errors)
    end
  end

  def update; end

  def destroy
    @vocab.destroy!

    render(json: { notice: "#{@vocab.english} was successfully removed." })
  end

  private

  def set_vocab
    @vocab = Vocabulary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def beer_params
    params.permit(:english, :chinese, :error_times)
  end
end
