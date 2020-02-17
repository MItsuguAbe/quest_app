class Brave
    attr_accessor :name, :hp, :offense, :defense
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end

    def attack(monster)
        puts "#{@name}の攻撃"
    
        damage = @offense - monster.defense
    
        # 自己代入：monster.hpからdamageを引いた値をmonster.hpに代入
        monster.hp -= damage
    
        puts "#{monster.name}は#{damage}のダメージを受けた"
        puts "#{monster.name}の残りHPは#{monster.hp}だ"
    end
  
end
  


class Monster
    attr_accessor :name, :hp, :offense, :defense
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end
  
end