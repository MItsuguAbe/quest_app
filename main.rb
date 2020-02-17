class Brave
    attr_accessor :name, :hp, :offense, :defense
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end
  
end
  
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
  
brave.hp -= 30
  
puts "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"