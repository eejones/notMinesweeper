class GametypesController < ApplicationController

#from irb I'll need to run something with this template "Gametype.new(title: "Minesweeper", type:1)"
  attr_accessor :title, :type

  def initialize(attributes = {})
    @title = attributes[:title]
    @type = attributes[:type]
  end

end
