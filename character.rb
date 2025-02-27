require './message_dialog'

class Character
    include MessageDialog

    attr_accessor :name, :hp, :offense, :defense
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end
end